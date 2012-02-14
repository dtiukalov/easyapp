
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '邮件列表',
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
					field : 'mailuid',
					title : '标识',
					width : 140
				} ] ],
				columns : [ [ {
					field : 'title',
					title : '主题',
					width : 150,
					sortable : true
				}, {
					field : 'fromUser',
					title : '发件人',
					width : 150,
					sortable : true
				},{
					field : 'userName',
					title : '收件人',
					width : 150,
					sortable : true
				}, {
					field : 'content',
					title : '内容',
					width : 200,
					sortable : true
				}, {
					field : 'datetime',
					title : '时间',
					width : 200,
					sortable : true
				}, {
					field : 'hasDownload',
					title : '操作',
					width : 100,
					rowspan : 2,
					formatter : function(value, rec) {
						if (value == '1') {
							return '<span><a href="#" onclick="editVO(\'' + rec.mailuid + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.mailuid + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
						
						} else if (value == '0'){
							return '<span><a href="#" onclick="editVO(\'' + rec.mailuid + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a></span>';
						
						}
					}
				
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btndelete',
					text : '批量删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择删除项','info');
							return;
						} 

						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].mailuid);
						}
						
						
						$.messager.confirm('确认删除项', '确认删除该选项', function(result){
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
					datetime : $('#datetime').datebox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
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
<div id="panel" class="easyui-panel" title="查询条件"
	icon="icon-query-form" collapsible="true" style="padding: 10px;">

	<form id="queryForm" method="post">
		<table>
			<tr align="right">
				<td>发件人:</td>
				<td><input id="fromUser" name="fromUser" type="text"></input></td>
				<td>主题:</td>
				<td><input id="title" name="title" type="text"></input></td>
				<td>时间:</td>
				<td><input id="datetime" name="datetime" type="text" class="easyui-datebox" ></input></td>
				<td>已下载:</td>
				<td>
					<select id="hasDownload" name="hasDownload">
						<option value="">   全部   </option>
						<option value="0">   否   </option>
						<option value="1" >   是   </option>
					</select>
				</td>
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