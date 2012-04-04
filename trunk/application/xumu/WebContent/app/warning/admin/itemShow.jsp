<%@page import="com.saturn.warning.date.farmer.Farmer"%>
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
			$('#queryTable1').datagrid({
				title : '猪流量信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/warning/farmer/listFarmerPig.action',
				queryParams : {
					'opId' : '${farmer.opId}'
				},
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
					field : 'opType',
					title : '操作类型',
					width : 80,
					sortable : true
				}, {
					field : 'type',
					title : '猪类型',
					width : 200,
					sortable : true
				}, {
					field : 'num',
					title : '数量',
					width : 80,
					sortable : true
				}, {
					field : 'price',
					title : '单价',
					width : 100,
					sortable : true
				}, {
					field : 'total',
					title : '总价',
					width : 100,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 200,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 70,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="deleteVO1(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btndelete',
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#queryTable1').datagrid('getSelections');
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
								window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmerPig.action?ids='+ids.join('__');
							}
						});
						return false;
					}
				}, '-']
			});
			$('#queryTable2').datagrid({
				title : '饲料购进信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/warning/farmer/listFarmerForage.action',
				queryParams : {
					'opId' : '${farmer.opId}'
				},
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
					field : 'type',
					title : '饲料类型',
					width : 200,
					sortable : true
				}, {
					field : 'num',
					title : '数量',
					width : 80,
					sortable : true
				}, {
					field : 'price',
					title : '单价',
					width : 100,
					sortable : true
				}, {
					field : 'total',
					title : '总价',
					width : 100,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 200,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 70,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="deleteVO2(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btndelete',
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#queryTable2').datagrid('getSelections');
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
								window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmerForage.action?ids='+ids.join('__');
							}
						});
						return false;
					}
				}, '-']
			});
			$('#queryTable3').datagrid({
				title : '费用支出信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/warning/farmer/listFarmerSpend.action',
				queryParams : {
					'opId' : '${farmer.opId}'
				},
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
					field : 'type',
					title : '支出类型',
					width : 200,
					sortable : true
				}, {
					field : 'price',
					title : '总价',
					width : 100,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 200,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 70,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="deleteVO3(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btndelete',
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#queryTable3').datagrid('getSelections');
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
								window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmerSpend.action?ids='+ids.join('__');
							}
						});
						return false;
					}
				}, '-']
			});
		});
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		function deleteVO1(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmerPig.action?ids=' + id;
				}
			});
			return false;
		}
		function deleteVO2(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmerForage.action?ids=' + id;
				}
			});
			return false;
		}
		function deleteVO3(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmerSpend.action?ids=' + id;
				}
			});
			return false;
		}
	</script>
</head>
<body>
	<table id="queryTable1"></table>
	<table id="queryTable2"></table>
	<table id="queryTable3"></table>
</body>
</html>




