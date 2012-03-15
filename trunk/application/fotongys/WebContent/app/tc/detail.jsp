
<%@page import="com.saturn.tc.utils.International"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=International.get(request, "mail.list") %></title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '<%=International.get(request, "mail.list") %>',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/tc/foton/gys/list.action',
				idField : 'mailuid',//唯一标识列
				sortName : 'uid',
				sortOrder : 'desc',
				remoteSort : false,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'title',
					title : '<%=International.get(request, "mail.title") %>',
					width : 180,
					sortable : true
				}] ],
				columns : [ [{
					field : 'fromUser',
					title : '<%=International.get(request, "mail.from.user") %>',
					width : 100,
					sortable : true
				},{
					field : 'fromUserDept',
					title : '<%=International.get(request, "mail.from.userdept") %>',
					width : 100,
					sortable : true
				},{
					field : 'userName',
					title : '<%=International.get(request, "mail.receive.user") %>',
					width : 100,
					sortable : true
				}, {
					field : 'content',
					title : '<%=International.get(request, "mail.content") %>',
					width : 240,
					sortable : true
				}, {
					field : 'datetime',
					title : '<%=International.get(request, "mail.send.time") %>',
					width : 120,
					sortable : true
				}, {
					field : 'hasDownload',
					title : '<%=International.get(request, "has.download") %>',
					width : 50,
					rowspan : 2,
					formatter : function(value, rec) {
						if (value == '1') {
							return '<span><%=International.get(request, "yes") %></span>';
						
						} else if (value == '0'){
							return '<span><%=International.get(request, "no") %></span>';
						}
					}
				}, {
					field : 'opt',
					title : '<%=International.get(request, "operation") %>',
					width : 150,
					rowspan : 2,
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.mailuid + '\');"><%=International.get(request, "view") %></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.mailuid + '\');"><%=International.get(request, "delete") %></a></span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btndelete',
					text : '<%=International.get(request, "batch.delete") %>',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('<%=International.get(request, "info") %>','<%=International.get(request, "delete.noselect") %>','info');
							return;
						} 

						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].mailuid);
						}
						
						
						$.messager.confirm('<%=International.get(request, "info") %>', '<%=International.get(request, "delete.info") %>', function(result){
							if (result){
								window.parent.location.href='<%=request.getContextPath()%>/app/tc/foton/gys/delete.action?ids='+ids;
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
					fromUser : $('#fromUser').val(),
					title : $('#title').val(),
					hasDownload : $('#hasDownload').val(),
					content : $('#content').val(),
					datetime : $('#datetime').datebox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('<%=International.get(request, "info") %>', '<%=International.get(request, "delete.info") %>', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/tc/foton/gys/delete.action?ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/tc/foton/gys/query.action?uid='+ id;
			return false;
		}
	</script>
</head>
<body>
<div id="panel" class="easyui-panel" title="<%=International.get(request, "query.condition") %>"
	icon="icon-query-form" collapsible="true" style="padding: 10px;">

	<form id="queryForm" method="post">
		<table>
			<tr align="right">
				<td><%=International.get(request, "mail.title") %>:</td>
				<td><input id="title" name="title" type="text"></input></td>
				<td><%=International.get(request, "mail.from.user") %>:</td>
				<td><input id="fromUser" name="fromUser" type="text"></input></td>
				<td><%=International.get(request, "mail.content") %>:</td>
				<td><input id="content" name="content" type="text"></input></td>
				<td><%=International.get(request, "mail.send.time") %>:</td>
				<td><input id="datetime" name="datetime" type="text" class="easyui-datebox" ></input></td>
				<td><%=International.get(request, "has.download") %>:</td>
				<td>
					<select id="hasDownload" name="hasDownload">
						<option value=""><%=International.get(request, "all") %></option>
						<option value="1"><%=International.get(request, "yes") %></option>
						<option value="0" ><%=International.get(request, "no") %></option>
					</select>
				</td>
			</tr>
		</table>
		<div style="padding: 10px;" >
			<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
				iconCls="icon-search"><%=International.get(request, "ok") %></a>
			<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
				iconCls="icon-cancel"><%=International.get(request, "cancel") %></a>
		</div>
	</form>
</div>
<table id="queryTable"></table>
</body>
</html>