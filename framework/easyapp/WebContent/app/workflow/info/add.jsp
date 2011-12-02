<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加工作流</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function add() {
		$('#addForm').submit();
	}
	
	$(function() {
		$('#name').focus();
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加工作流"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/workflow/info/add.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>名称:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>中文名称:</td>
					<td><input id="showName" name="showName" type="text"></input></td>
					<td><div id="showNameTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
						<td></td>
				</tr>
			</table>
			<input id="creater" type="hidden" name="creater" type="text" value="${authUser.id}"></input>
			<input id="createrName" type="hidden" name="createrName" type="text" value="${authUser.name}"></input>
			<input id="createTime" type="hidden" name="createTime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		
		$("#name").formValidator({
			onfocus : "请正确填写工作名称"
		}).regexValidator({
			regexp : "loginId"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "工作流不超过50字符"
		}).ajaxValidator({
			url : "<%=request.getContextPath()%>/app/workflow/info/isRepeat.action",
			data : $('#name').val(),
			success : function(data) {
				return data == "false";
			},
			onerror : "工作流名已经存在"
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






