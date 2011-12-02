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
	String tableId = request.getParameter("tableId");
	String tableName = Table.get(tableId).getShowName();
	String formType = request.getParameter("formType");
%>
<title>添加<%=tableName%></title>
<script type="text/javascript">
	function add() {
		$('#addForm').submit();
	}
	
	$(function() {
		<%
			List items = FormItem.getNotHiddenItem(tableId, formType);
			int size = items.size();
			for (int i = 0; i < size; ++i) {
				FormItem item = (FormItem) items.get(i);
				
				String name = item.getName();
				String title = item.getShowName();
				String defaultValue = item.getDefaultValue();
				String render = item.getRender();
				
				if (i == 0) {
		%>
		$('#<%=name%>').focus();
		<%
				}
				
				if ("form.type.combox".equals(item.getType())) {
		%>
		$('#<%=name%>').combobox({
			width : 256,
			value : "<%=defaultValue%>",
			onHidePanel : function() {
				$("#<%=name%>").focus();
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
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加<%=tableName%>" icon="icon-add-form"
		collapsible="true" style="padding: 10px;">
		<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/system/easyform/add.action"
			method="post">
			<table>
				<%
					items = FormItem.getNotHiddenItem(tableId, formType);
					size = items.size();
					for (int i = 0; i < size; ++i) {
						FormItem item = (FormItem) items.get(i);
						
						String name = item.getName();
						String title = item.getShowName();
						String defaultValue = item.getDefaultValue();
						String dict = item.getDict();
						String required = ("boolean.true".equals(item.getRequired()))?"<span style=\"color: red\">*</span>" : "";
						String readonly = ("boolean.true".equals(item.getReadonly()))?"readonly=\"readonly\"" : "";
						String type = item.getType();
				%>
				<tr>
					<td style="text-align:right"><%=required%><%=title %>:</td>
					<td align="left">
					<% 
						if ("form.type.input".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" type="text" value="<%=defaultValue%>" <%=readonly%> style="width: 250px;"></input>
					<%
						} else if ("form.type.combox".equals(type)) {
					%>
					<select id="<%=name %>" class="easyui-combobox"
						name="<%=name %>" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=<%=dict %>" valueField="id"
						textField="text" mode="remote" <%=readonly%> editable="false" ></select>
					<%
						} else if ("form.type.textarea".equals(type)) {
					%>
					<textarea id="<%=name %>" name="<%=name %>" cols="70" rows="10" <%=readonly%>><%=defaultValue%></textarea>
					<%
						} else if ("form.type.datebox".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" class="easyui-datebox" editable="false" type="text" style="width: 256px;" <%=readonly%> value="<%="current".equals(defaultValue)?DateUtils.getSystemDate(): defaultValue%>"></input>
					<%
						} else if ("form.type.datetime".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" class="easyui-datetimebox" editable="false" type="text" style="width: 256px;" <%=readonly%> value="<%="current".equals(defaultValue)?DateUtils.getSystemTime(): defaultValue%>"></input>
					<%
						} else  {
					%>
					<input id="<%=name %>" name="<%=name %>" type="text" <%=readonly%> value="<%=defaultValue%>"></input>
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
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
				</tr>
			</table>
			<%
				items = FormItem.getHiddenItem(tableId, formType);
				size = items.size();
				for (int i = 0; i < size; ++i) {
					FormItem item = (FormItem) items.get(i);
					
					String name = item.getName();
					String defaultValue = item.getDefaultValue();
			%>
			<input id="<%=name%>" type="hidden" name="<%=name%>" type="text" value="<%=defaultValue%>"></input>
			<%
				}
			%>
			<input id="tableId" type="hidden" name="tableId" type="text" value="<%=tableId%>"></input>
			<input id="formType" type="hidden" name="formType" type="text" value="<%=formType%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});

		<%
			items = FormItem.getNotHiddenItem(tableId, formType);
			size = items.size();
			for (int i = 0; i < size; ++i) {
				FormItem item = (FormItem) items.get(i);
				if ("boolean.true".equals(item.getReadonly())) {
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
				String required = ("boolean.true".equals(item.getRequired()))?"empty:false," : "empty:true,";
				String type = item.getType();
				String defaultValue = item.getDefaultValue();
				
				if ("form.type.combox".equals(type) || "form.type.datebox".equals(type) || "form.type.datetime".equals(type)) {
					if ("current".equals(defaultValue)) {
						if ("form.type.datebox".equals(type)) {
							defaultValue = DateUtils.getSystemDate();
						} else if ("form.type.datetime".equals(type)) {
							defaultValue = DateUtils.getSystemTime();
						}
					}
		%>
		$.data($("#<%=name%>")[0], 'combo').combo.find('input.combo-text').attr('id', 'combo_<%=name%>').val('<%=defaultValue==null?"":defaultValue%>');
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
			if (regex != null && !"".equals(regex)) {
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
			onerror : "不超过<%=max%>字符"
		}).functionValidator({
			fun : <%=func%>
		});
		<%
			}
		%>
	});
</script>
</html>