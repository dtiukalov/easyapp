<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工作流运行实例</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '工作流运行实例列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/workflow/runtime/instance/list.action',
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					title : '标识',
					width : 30,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'flowName',
					title : '工作流名称',
					width : 150,
					sortable : true
				}, {
					field : 'createrName',
					title : '创建者',
					width : 100,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
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
					width : 70,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.flowId + '\', \'' + rec.id + '\');">查看</a>'+
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
					flowName : $('#flowName').val(),
					createrName : $('#createrName').val(),
					createTime : $('#createTime').datebox('getValue'),
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
					window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/instance/delete.action?ids=' + id;
				}
			});
			return false;
		}
		function editVO(id, pId){
			window.location.href='<%=request.getContextPath()%>/app/workflow/runtime/process/show.jsp?flowId=' + id + '&id=' + pId;
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
					<td>工作流名称:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>创建者:</td>
					<td><input id="createrName" name="createrName" type="text"></input></td>
					<td>创建时间:</td>
					<td><input id="createTime" name="createTime" class="easyui-datebox" type="text"></input></td>
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




