<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>信息列表</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '屠宰检疫信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/quarantine/admin/json/animalADemo.json',
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
					field : 'name',
					title : '货主',
					width : 120,
					sortable : true
				}, {
					field : 'contact',
					title : '联系电话',
					width : 100,
					sortable : true
				}, {
					field : 'type',
					title : '动物种类',
					width : 100,
					sortable : true
				}, {
					field : 'number',
					title : '数量及单位',
					width : 100,
					sortable : true
				}, {
					field : 'dateTime',
					title : '签发日期',
					width : 100,
					sortable : true
				},{
					field : 'opt',
					title : '操作',
					width : 70,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="viewVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/query-form.png" width="14" height="14" border="0" />'
						'&nbsp;&nbsp;<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnadd',
					text : '添加产品A证',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/product/addA.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}, {
					id : 'btnadd',
					text : '添加产品B证',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/product/addB.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}, {
					id : 'btndelete',
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择删除项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						$.messager.confirm('确认删除项', '确认删除该选项', function(result){
							if (result){
								window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/productA/show.jsp';
							}
						});
						return false;
					}
				}]
			});
			
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					number : $('#number').val(),
					title : $('#title').val(),
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
					window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/productA/show.jsp';
				}
			});
			return false;
		}
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/productA/edit.jsp';
			return false;
		}
		
		function viewVO(id){
			window.location.href='<%=request.getContextPath()%>/app/quarantine/admin/product/view.jsp';
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
					<td>货主:</td>
					<td align="left"><input id="name" name="name" type="text"></input></td>
					<td>动物种类:</td>
					<td align="left"><input id="num" name="num" type="text"></input></td>
					<td>签发日期:</td>
					<td align="left"><input id="mnum" name="mnum" class="easyui-datebox" type="text"></input></td>
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




