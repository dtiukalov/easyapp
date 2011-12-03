<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改表</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$('#editForm').submit();
	}
	
	$(function() {
		$('#name').focus();
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改表"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/system/easyform/table/update.action"
			method="post">
			<table class="table-form">
			<tr>
					<td style="text-align:right"><span style="color: red">*</span>表名:</td>
					<td><input id="name" name="name" type="text" value="${table.name}" readonly="readonly"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>中文名:</td>
					<td><input id="showName" name="showName" type="text" value="${table.showName}"></input></td>
					<td><div id="showNameTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
								onclick="edit()">确定</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
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

		$("#showName").formValidator({
			onfocus : "中文名称不能为空,不超过20个字符！"
		}).inputValidator({
			min : 1,
			max : 20
		});
	});
</script>
</html>