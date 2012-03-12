<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>导入表格信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '可选核对列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/info/list.action',
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
					width : 40,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'name',
					title : '名称',
					width : 150,
					sortable : true
				}, {
					field : 'tableName',
					title : '表名',
					width : 150,
					sortable : true
				}, {
					field : 'lastImportDate',
					title : '最新导入时间',
					width : 100,
					sortable : true
				}, {
					field : 'desc',
					title : '描述',
					width : 200,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				onClickRow: function(rowIndex){
					if (lastIndex != rowIndex){
						$('#queryTable').datagrid('endEdit', lastIndex);
						$('#queryTable').datagrid('beginEdit', rowIndex);
					}
					lastIndex = rowIndex;
				},
				onAfterEdit : function (rowIndex, rowData, changes) {
					var rows = $('#queryTable').datagrid('getChanges');
					if (rows.length > 0) {
						$('#queryTable').datagrid('acceptChanges');
					}
				},
				toolbar : [ {
					id : 'btnItem',
					text : '城镇低保批量核对',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作 项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id+":"+rows[i].tableName+":"+rows[i].lastImportDate+":"+rows[i].name);
						}

						$.messager.confirm('确认核对项', '确认核对该选项', function(result){
							window.location.href='<%=request.getContextPath()%>/app/sldb/check/tobeCheck.jsp?type=8&ids='+ ids;
						});
						return false;
					}
				},'-',
				{
					id : 'btnItem',
					text : '农村低保批量核对',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作 项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id+":"+rows[i].tableName+":"+rows[i].lastImportDate+":"+rows[i].name);
						}

						$.messager.confirm('确认核对项', '确认核对该选项', function(result){
							window.location.href='<%=request.getContextPath()%>/app/sldb/check/tobeCheck.jsp?type=9&ids='+ ids;
						});
						return false;
					}
				},'-',
				{
					id : 'btnItem',
					text : '廉租房保障人员',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作 项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id+":"+rows[i].tableName+":"+rows[i].lastImportDate+":"+rows[i].name);
						}

						$.messager.confirm('确认核对项', '确认核对该选项', function(result){
							window.location.href='<%=request.getContextPath()%>/app/sldb/check/tobeCheck.jsp?type=22&ids='+ ids;
						});
						return false;
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					name : $('#name').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/info/delete.action?ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/info/query.action?id='+ id;
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
					<td>名称:</td>
					<td><input id="name" name="name" type="text"></input></td>
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




