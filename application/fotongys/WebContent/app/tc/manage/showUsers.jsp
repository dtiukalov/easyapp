<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.saturn.tc.foton.gys.UserInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#queryTable').datagrid({
			title : '用户列表',
			iconCls : 'icon-datalist',
			nowrap : false,
			striped : true, //数据条纹显示
			collapsible : true,
			singleSelect : false,//只能选一行
			url : '<%=request.getContextPath()%>/app/tc/listUsers.action',
			sortName : 'userid',
			sortOrder : 'desc',
			remoteSort : true,
			idField : 'userid',//唯一标识列
			frozenColumns : [ [ {//不可被删除的列
				field : 'ck',
				checkbox : true
			}, {
				title : '用户名',
				field : 'userid',
				width : 150,
				sortable : true
			} ] ],
			columns : [ [ {
				field : 'userpass',
				title : '密码',
				width : 200,
				sortable : true
			}, {
				field : 'opt',
				title : '操作',
				width : 100,
				align : 'center',
				rowspan : 2,
				formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.userid + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.userid + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
				}
			} ] ],
			pagination : true,
			rownumbers : true,
			toolbar : [{
				id : 'btnedit',
				text : '重置密码',
				iconCls : 'icon-edit',
				handler : function() {
					var rows = $('#queryTable').datagrid('getSelections');
					if (rows.length == 0) {
						$.messager.alert('提示','请选择重置密码项','info');
						return;
					} 
					
					var ids = [];
					for(var i=0;i<rows.length;i++){
						ids.push(rows[i].userid);
					}

					$.messager.confirm('确认重置密码项', '确认重置密码吗?', function(result){
						if (result){
							window.location.href='<%=request.getContextPath()%>/app/tc/editUser.action?ids='+ids.join('__');
						}
					});
				
					return false;
				}
			},{
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
						ids.push(rows[i].userid);
					}

					$.messager.confirm('确认删除项', '确认删除该选项', function(result){
						if (result){
							window.location.href='<%=request.getContextPath()%>/app/tc/deleteUser.action?ids='+ids.join('__');
						}
					});
					return false;
				}
			}]
		});
	});
	
	function deleteVO(id){
		$.messager.confirm('确认删除项', '确认删除该选项', function(result){
			if (result){
				window.location.href='<%=request.getContextPath()%>/app/tc/deleteUser.action?ids=' + id;
			}
		});
		return false;
	}
	
	function editVO(id){
		window.location.href='<%=request.getContextPath()%>/app/tc/editUser.action?ids='+ id;
		return false;
	}
	
	function queryVO() {
		$('#queryTable').datagrid({
			queryParams : {
				userid : $('#userid').val()
			}});
		$('#queryTable').datagrid("load");
	}
	
	function clearQueryForm() {
		$('#queryForm').form('clear');
	}
</script>
</head>
<body>
<%
UserInfo user = (UserInfo) session.getAttribute("authUser");
String date = (String)request.getSession().getAttribute("logintime");
%>
	<div region="north" split="false"
		style="height: 100px; overflow: hidden;">
		<div class="top_img">
			<div class="menu-logo">
				<div class="menu-info"><%=International.get(request, "login_title") %></div>
			</div>
			<div class="cnen-info"><%=International.get(request,"currentUserLoginTime") %> ：[<%=date %>][<a href="<%=request.getContextPath()%>/app/tc/chpass.jsp?userid=<%=user.getUserid()%>"><%=International.get(request, "changepass")%></a>]</div>
	    	<div class="user-info"><%=International.get(request, "username") %>:<%=user.getUserid()%>&nbsp;[<a href="<%=request.getContextPath()%>/app/tc/logout.do"><%=International.get(request, "logout") %></a>] </div>
		</div> 
	</div>

	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true"
		style="padding: 10px;">

		<form id="queryForm" method="post">
			<label for="id">用户名:</label> 
			<input id="userid" type="text" name="userid"></input>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" iconCls="icon-search">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>