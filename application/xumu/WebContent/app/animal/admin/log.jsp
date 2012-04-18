<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>日志列表</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/animal/admin/demo.json',
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ 
				      /*             [ {//不可被删除的列
					field : 'ck',
					checkbox : false
				}] */ 
				                  ],
				columns : [ [ {
					field : 'time',
					title : '时间',
					width : 100,
					sortable : true
				}, {
					field : 'user',
					title : '监管人员',
					width : 100,
					sortable : true
				}, {
					field : 'unit',
					title : '单位名称',
					width : 120,
					sortable : true
				}, {
					field : 'name',
					title : '兽药店名称',
					width : 100,
					sortable : true
				}, {
					field : 'address',
					title : '地址',
					width : 200,
					sortable : true
				}, {
					field : 'people',
					title : '联系人',
					width : 80,
					sortable : true
				}, {
					field : 'contact',
					title : '联系方式',
					width : 100,
					sortable : true
				} ] ],
				pagination : true,
				rownumbers : true
			});
			
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					userName : $('#user').val(),
					createTime : $('#createTime').datebox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmer.action?ids=' + id;
				}
			});
			return false;
		}
		function itemList(id){
			window.location.href='<%=request.getContextPath()%>/app/warning/farmer/queryFarmer.action?id='+ id;
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
					<td>监管人员:</td>
					<td align="left"><input id="user" name="user" type="text"></input></td>
					<td>时间:</td>
					<td align="left"><input id="createTime" name="createTime" class="easyui-datebox" type="text"></input></td>
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




