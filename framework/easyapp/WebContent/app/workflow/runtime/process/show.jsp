<%@page import="com.saturn.workflow.WorkFlow"%>
<%@page import="com.saturn.system.Dict"%>
<%@page import="com.saturn.system.easyform.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/app/includes/header.jsp"%>
	
	<% 
		String flowId = request.getParameter("flowId");
		String instanceId = request.getParameter("id");
		WorkFlow workFlow = WorkFlow.get(flowId);
		
		String flowName = workFlow.getName();
		String flowShowName = workFlow.getShowName();
		
		String name = flowShowName + "(" + flowName + ")";
	%>
	<title>实例过程信息</title>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '工作流：<%=name%>, 节点信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/workflow/runtime/process/list.action',
				queryParams : {
					flowId : '<%=flowId%>',
					instanceId : '<%=instanceId%>'
				},
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'asc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}] ],
				columns : [ [ {
					field : 'instanceId',
					title : '实例ID',
					width : 50,
					sortable : true
				}, {
					field : 'nodeNameStr',
					title : '节点名称',
					width : 150,
					sortable : true
				}, {
					field : 'operaterName',
					title : '操作人',
					width : 150,
					sortable : true
				}, {
					field : 'sign',
					title : '会签',
					width : 50,
					sortable : true
				}, {
					field : 'confirmTime',
					title : '确认时间',
					width : 200,
					sortable : true
				}, {
					field : 'endTime',
					title : '结束时间',
					width : 200,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.instanceId + '\', \'' + rec.id + '\');">查看</a>'+
						'</span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						<%
							String back = request.getParameter("back");
							
							if ("over".equals(back)) {
						%>
						window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/user/over.jsp';
						<%  } else {%>
						window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/instance/show.jsp';
						<% }%>
					
						return false;
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					flowId : '<%=flowId%>',
					instanceId : '<%=instanceId%>',
					operaterName : $('#operaterName').val(),
					confirmTime : $('#confirmTime').datebox('getValue'),
					endTime : $('#endTime').datebox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/process/delete.action?flowId=<%=flowId%>&ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id, pId){
			//window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/view.action?instanceId='+ id + '&id=' + pId;
			window.open('<%=request.getContextPath()%>/app/workflow/runtime/view.action?instanceId='+ id + '&id=' + pId, '查看流程');
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>操作人:</td>
					<td><input id="operaterName" name="operaterName" type="text"></input></td>
					<td>确认时间:</td>
					<td><input id="confirmTime" name="confirmTime" class="easyui-datebox" type="text"></input></td>
					<td>结束时间:</td>
					<td><input id="endTime" name="endTime" class="easyui-datebox" type="text"></input></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>




