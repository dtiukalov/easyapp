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
				title : '信息列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/warning/farmer/listFarmerPigWithOpid.action',
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}
				/* , {
					field : 'id',
					title : '标识',
					width : 30,
					sortable : true
				} */
				] ],
				columns : [ [ {
					field : 'opId',
					title : '标识',
					width : 200,
					sortable : true
				}, {
					field : 'opType',
					title : '类型',
					width : 200,
					sortable : true
				}, {
					field : 'type',
					title : '生猪类型',
					width : 200,
					sortable : true
				}, {
					field : 'num',
					title : '数量',
					width : 200,
					sortable : true
				}, {
					field : 'price',
					title : '价格',
					width : 200,
					sortable : true
				}, {
					field : 'total',
					title : '总数',
					width : 200,
					sortable : true
				}, {
					field : 'userName',
					title : '用户名',
					width : 200,
					sortable : true
				}, {
					field : 'createTime',
					title : '创建时间',
					width : 200,
					sortable : true
				}
				] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
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
								window.location.href='<%=request.getContextPath()%>/app/warning/farmer/deleteFarmer.action?ids='+ids.join('__');
							}
						});
						return false;
					}
				}, '-']
			});
			
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					userName : $('#userName').val(),
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
					<td>养殖户:</td>
					<td align="left"><input id="userName" name="userName" type="text"></input></td>
					<td>创建时间:</td>
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




