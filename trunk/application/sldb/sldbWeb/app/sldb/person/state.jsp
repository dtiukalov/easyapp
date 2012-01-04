<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>低保申请状态</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '已审核低保信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/person/queryPersonByPid.action',
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
					field : 'type',
					title : '类型',
					width : 100,
					align : 'center',
					sortable : true
				},{
					field : 'name',
					title : '户主姓名',
					width : 100,
					align : 'center',
					sortable : true
				}, {
					field : 'identify',
					title : '身份证',
					width : 150,
					align : 'center',
					sortable : true
				}, {
					field : 'createTime',
					title : '时间',
					width : 150,
					align : 'center',
					sortable : true
				}, {
					field : 'gender',
					title : '性别',
					width : 50,
					align : 'center',
					sortable : true
				}, {
					field : 'hukou',
					title : '户口',
					width : 70,
					align : 'center',
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span>&nbsp&nbsp<a href="#" onclick="showVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/query-form.png" width="14" height="14" border="0" /></a>'
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [
				           {
					id : 'btnadd',
					text : '家庭成员',
					iconCls : 'icon-author',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择户主','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/queryPerson.action?id='+rows[0].id; 
						//查询户主信息
						return false;//解决IE6的不跳转的bug
					}
				},{
					id : 'btnadd',
					text : '查看家庭信息',
					iconCls : 'icon-query-form',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择户主','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						window.location.href='<%=request.getContextPath()%>/app/sldb/person/sub/queryPersonTab.action?id='+rows[0].id; 
						//带参数传入下一个jsp页面
						return false;//解决IE6的不跳转的bug
					}
				}]
			});
			
			$('#gender').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					identify : $('#identify').val(),
					name : $('#name').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function showVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/person/showState.jsp?pid='+ id;
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
					<td>姓名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>身份证:</td>
					<td><input id="identify" name="identify" type="text"></input></td>
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




