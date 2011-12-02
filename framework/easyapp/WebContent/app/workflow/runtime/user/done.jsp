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
	
	<title>已办事宜</title>
	<script type="text/javascript">
		$(function() {
			$('#type').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
			
			$('#queryTable').datagrid({
				title : '已办事宜',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/workflow/runtime/user/done.action',
				idField : 'id',//唯一标识列
				sortName : 'confirmTime',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}] ],
				columns : [ [ {
					field : 'name',
					title : '标题',
					width : 240,
					formatter : function(value, rec) {
						return '<span>' + rec.workflowNameStr + '(' + rec.createTime + ':' + rec.createrStr +')</span>';
					}
				}, {
					field : 'workflowNameStr',
					title : '流程名称',
					width : 80,
					sortable : true
				}, {
					field : 'createrStr',
					title : '创建人',
					width : 80,
					sortable : true
				}, {
					field : 'nodeNameStr',
					title : '步骤名称',
					width : 150,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 150,
					sortable : true
				}, {
					field : 'confirmTime',
					title : '确认时间',
					width : 150,
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
				rownumbers : true
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					confirmTime : $('#confirmTime').datebox('getValue'),
					createTime : $('#createTime').datebox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function editVO(id, pId){
//			window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/view.action?instanceId='+ id + '&id=' + pId;
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
					<td>创建时间:</td>
					<td><input id="createTime" name="confirmTime" class="easyui-datebox" type="text"></input></td>
					<td>确认时间:</td>
					<td><input id="confirmTime" name="confirmTime" class="easyui-datebox" type="text"></input></td>
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




