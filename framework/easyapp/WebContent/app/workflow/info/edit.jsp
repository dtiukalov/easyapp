<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改工作流</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$('#editForm').submit();
	}
	
	$(function() {
		$('#showName').focus();
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改工作流"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">
		<form id="editForm"
			action="<%=request.getContextPath()%>/app/workflow/info/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>名称:</td>
					<td><input id="name" name="name" type="text" value="${info.name }" readonly="readonly"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>中文名称:</td>
					<td><input id="showName" name="showName" type="text" value="${info.showName }" ></input></td>
					<td><div id="showNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>定义者:</td>
					<td><input id="createrName" name="createrName" type="text" value="${info.createrName }" readonly="readonly"></input></td>
					<td><div id="createrNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>创建时间:</td>
					<td><input id="createTime" name="createTime" type="text" value="${info.createTime }" class="easyui-datebox" readonly="readonly"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="edit()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
				</tr>
			</table>
			<input id="id" type="hidden" name="id" type="text" value="${info.id}"></input>
			<input id="creater" type="hidden" name="creater" type="text" value="${info.creater}"></input>
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