<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库创建表</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$.messager.confirm('确认创建项', '创建数据库表将覆盖表数据，是否创建?', function(result){
			if (result){
				$('#editForm').submit();
			}
		});
		return false;
		
	}
	
	function back() {
		window.location.href='<%=request.getContextPath()%>/app/system/easyform/table/show.jsp';
		return false;
		
	}
	
	$(function() {
		$('#sql').focus();
		
		<%
		Object result = request.getParameter("result");
		if (result != null && "true".equals(result)) {
		%>
			$(function() {
				$.messager.show({
					title:'信息',
					msg:'创建成功',
					showType:'show'
				});
			});
		<%
		}
		%>
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="数据库创建表"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/system/easyform/table/createTable.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right">Sql语句:</td>
					<td><textarea id="sql" name="sql" cols="80" rows="20">${sql}</textarea></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
								onclick="edit()">确定</a> <a href="#"
								class="easyui-linkbutton" iconCls="icon-cancel" onclick="back()">取消</a>
						</div>
					</td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="${table.id}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});
	});
</script>
</html>