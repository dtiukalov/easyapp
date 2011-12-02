<%@page import="com.saturn.workflow.runtime.WorkFlowProcess"%>
<%@page import="com.saturn.auth.User"%>
<%@page import="com.saturn.workflow.FlowFormItem"%>
<%@page import="com.saturn.workflow.WorkFlow"%>
<%@page import="com.saturn.workflow.runtime.WorkFlowInstance"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.system.easyform.FormItem"%>
<%@page import="com.saturn.system.easyform.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/app/includes/header.jsp"%>
<%
	String instanceId = request.getParameter("instanceId");
	String processId = (String)request.getAttribute("processId");
	WorkFlowProcess process = WorkFlowProcess.get(processId);
	String nodeId = process.getNodeId();
	String remark = process.getRemark();
	
	WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
	User user = (User)request.getSession().getAttribute("authUser");
	String userId = user.getId();
	
	
	String flowId = instance.getFlowId();
	WorkFlow workFlow = WorkFlow.get(flowId);
	
	String flowName = workFlow.getShowName();
	Map form = (Map)request.getAttribute("formValue");
	
	String createrName = workFlow.getCreaterName();
	String workFlowTitle = flowName + "(" + workFlow.getCreateTime() + ":" + createrName + ")";
%>
<title><%=workFlowTitle%></title>
<script type="text/javascript">
	function edit() {
		$('#editForm').attr("action", '<%=request.getContextPath()%>/app/workflow/runtime/confirm.action');
		$('#editForm').submit();
	}
	
	function save() {
		$('#editForm').attr("action", '<%=request.getContextPath()%>/app/workflow/runtime/save.action');
		$('#editForm').submit();
	}
	
	function back() {
		window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/user/tobe.jsp';
		return false;
	}
	
	$(function() {
		<%
			List items = FlowFormItem.getNotHiddenItem(flowId, nodeId);
			int size = items.size();
			for (int i = 0; i < size; ++i) {
				FlowFormItem item = (FlowFormItem) items.get(i);
				
				String name = item.getName();
				String title = item.getShowName();
				String render = item.getRender();
				String value = (String)form.get(name);
				
				if (i == 0) {
		%>
		$('#<%=name%>').focus();
		<%
				}
				
				if ("form.type.combox".equals(item.getType())) {
		%>
		$('#<%=name%>').combobox({
			width : 256,
			onHidePanel : function() {
				$("#combo_<%=name%>").focus();
			},
			value : "<%=value%>"
		});
			<%
				}
				
				if ("form.type.datebox".equals(item.getType())) {
					%>
					$('#<%=name%>').datebox({
						width : 256,
						onHidePanel : function() {
							$("#combo_<%=name%>").focus();
						}
					});
			<%
				}
				
				if ("form.type.datetimebox".equals(item.getType())) {
					%>
					$('#<%=name%>').datetimebox({
						width : 256,
						onHidePanel : function() {
							$("#combo_<%=name%>").focus();
						}
					});
			<%
				}
				
				if (render != null && !"".equals(render)) {
			%>
		<%=render%>
		<%
				}
			}
		%>
		
		
		<%
		Object result = request.getParameter("result");
		if (result != null && "true".equals(result)) {
		%>
			$(function() {
				$.messager.show({
					title:'信息',
					msg:'保存成功',
					showType:'show'
				});
			});
		<%
		}
		%>
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="<%=workFlowTitle%>" icon="icon-edit-form"
		collapsible="true" style="padding: 10px;">
		<form id="editForm" name="editForm"
			action="<%=request.getContextPath()%>/app/workflow/runtime/confirm.action"
			method="post">
			<table>
				<%
					items = FlowFormItem.getNotHiddenItem(flowId, nodeId);
					size = items.size();
					for (int i = 0; i < size; ++i) {
						FlowFormItem item = (FlowFormItem) items.get(i);
						
						String name = item.getName();
						String title = item.getShowName();
						String value = (String)form.get(name);
						if (value == null) {
							String defauteValue = item.getDefaultValue();
							if (defauteValue != null && !"".equals(defauteValue)) {
								value = defauteValue;
							} else {
								value = "";
							}
						}
						String dict = item.getDict();
						String state = item.getState();
						String required = ("必填".equals(state))?"<span style=\"color: red\">*</span>" : "";
						String readonly = ("只读".equals(state))?"readonly=\"readonly\"" : "";
						String disable = ("只读".equals(state))?"disabled=\"true\"" : "";
						String type = item.getType();
				%>
				<tr>
					<td style="text-align:right"><%=required%><%=title %>:</td>
					<td align="left">
					<% 
						if ("form.type.input".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" type="text" value="<%=value%>" <%=readonly%> style="width: 250px;"></input>
					<%
						} else if ("form.type.combox".equals(type)) {
					%>
					<select id="<%=name %>" class="easyui-combobox"
						name="<%=name %>" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=<%=dict %>" valueField="id"
						textField="text" mode="remote" <%=readonly%> editable="false" ></select>
					<%
						} else if ("form.type.textarea".equals(type)) {
					%>
					<textarea id="<%=name %>" name="<%=name %>" cols="70" rows="10" <%=readonly%>><%=value%></textarea>
					<%
						} else if ("form.type.datebox".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" class="easyui-datebox" editable="false" type="text" <%=disable%> value="<%="current".equals(value)?DateUtils.getSystemDate(): value%>"></input>
					<%
						} else if ("form.type.datetime".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" class="easyui-datetimebox" editable="false" type="text" <%=disable%> value="<%="current".equals(value)?DateUtils.getSystemTime(): value%>"></input>
					<%
						} else if ("form.type.creater".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" type="text" style="width: 250px;" <%=readonly%> value="<%="creater".equals(value)?createrName : value%>"></input>
					<%
						} else  {
					%>
					<input id="<%=name %>" name="<%=name %>" type="text" <%=readonly%> value="<%=value%>"></input>
					<%
						}
					%>
					</td>
					<%
						if ("form.type.combox".equals(type) || "form.type.datebox".equals(type) || "form.type.datetime".equals(type)) {
					%>
					<td style="text-align:right"><div id="combo_<%=name %>Tip"></div></td>
					<%  } else { %>
					<td style="text-align:right"><div id="<%=name %>Tip"></div></td>
					<%  } %>
				</tr>
				<%
					}
				%>
				<tr>
					<td style="text-align:right">备注:</td>
					<td align="left"><textarea id="__remark" name="__remark" cols="70" rows="10"><%=remark%></textarea></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<%
								String view = request.getParameter("__view");
								
								if (view == null || !"true".equals(view)) {
							%>
							<a href="#" onclick="edit()" class="easyui-linkbutton" iconCls="icon-ok">提交</a> 
							<a href="#" onclick="save()" class="easyui-linkbutton" iconCls="icon-save">保存</a> 
							<a href="#" onclick="back()" class="easyui-linkbutton" iconCls="icon-back">返回</a>
							<%
								} else {
							%>
							<% }%>
						</div></td>
				</tr>
			</table>
			<%
				items = FlowFormItem.getHiddenItem(flowId, nodeId);
				size = items.size();
				for (int i = 0; i < size; ++i) {
					FlowFormItem item = (FlowFormItem) items.get(i);
					
					String name = item.getName();
					String value = (String)form.get(name);
					if (value == null) {
						value = "";
					}
			%>
			<input id="<%=name%>" type="hidden" name="<%=name%>" type="text" value="<%=value%>"></input>
			<%
				}
			%>
			<input id="id" type="hidden" name="id" type="text" value="<%=form.get("id")==null?"":form.get("id")%>"></input>
			<input id="instanceId" type="hidden" name="instanceId" type="text" value="<%=instanceId%>"></input>
			<input id="processId" type="hidden" name="processId" type="text" value="<%=processId%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		<%
			items = FlowFormItem.getNotHiddenItem(flowId, nodeId);
			size = items.size();
			for (int i = 0; i < size; ++i) {
				FlowFormItem item = (FlowFormItem) items.get(i);
				String state = item.getState();
				if ("只读".equals(state)) {
					continue;
				}
				
				String name = item.getName();
				String title = item.getShowName();
				String regex = item.getRegex();
				String min = item.getMin();
				String minStr = (min == null || !"".equals(min))?"min:" + min + ",": "";
				String max = item.getMax();
				String maxStr = (max == null || !"".equals(max))?"max:" + max + ",": "";
				String focusTip = item.getFocusTip();
				String focusTipStr = (focusTip == null || !"".equals(focusTip))?"onfocus :'" + focusTip + "'": "onfocus :'请输入内容'";
				String func = item.getFunc();
				String required = ("必填".equals(state))?"empty:false," : "empty:true,";
				String type = item.getType();
				String value = (String)form.get(name);
				
				if ("form.type.combox".equals(type) || "form.type.datebox".equals(type) || "form.type.datetime".equals(type)) {
					if ("current".equals(value)) {
						if ("form.type.datebox".equals(type)) {
							value = DateUtils.getSystemDate();
						} else if ("form.type.datetime".equals(type)) {
							value = DateUtils.getSystemTime();
						}
					}
		%>
		$.data($("#<%=name%>")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_<%=name%>').val('<%=value==null?"":value%>');
		$("#combo_<%=name%>").formValidator({
		<%
				} else {
		%>
		$("#<%=name%>").formValidator({
		<%
				}
		%>
			<%=required%>
			<%=focusTipStr%>
		})
		<%
			if (regex != null && !"".equals(regex) && !"form.type.combox".equals(item.getType())) {
		%>
		.regexValidator({
			regexp : "<%=regex%>"
		})
		<%
			}
		%>
		.inputValidator({
			<%=minStr%>
			<%=maxStr%>
			onerror : "输入内容在<%=min%>,<%=max%>之间"
		}).functionValidator({
			fun : <%=func%>
		});
		<%
			}
		%>
	});
</script>
</html>