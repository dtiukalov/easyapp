<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		/* var number = $('#number').val();
		if (number == "") {
			alert("编号不能为空!");
			return;
		}
		var title = $('#title').val();
		if (title == "") {
			alert("标签不能为空!");
			return;
		}
		$('#editForm').submit(); */
		alert("保存成功！");
		window.location.href='<%=request.getContextPath() %>/app/quarantine/admin/productA/show.jsp';
	}
	
	$(function() {
		$('#license').focus();
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">
		<form id="editForm"
			action="<%=request.getContextPath()%>/app/medication/updateMedication.action"
			method="post">
			<input id="id" name="id" type="hidden" value="${medication.id}"></input>
			<input type="hidden" id="createTime" name="createTime" value="<%=DateUtils.getSystemTime() %>" />
			<table class="table-form">
				<tr>
					<td style="text-align:right">货主:</td>
					<td><input id="number" name="number" type="text" value="张三"></input></td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">联系方式:</td>
					<td><input id="title" name="title" type="text" value="13211112222"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">动物种类:</td>
					<td><input id="title" name="title" type="text" value="猪"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">数量及单位:</td>
					<td><input id="number" name="number" type="text" value="100"></input></td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">目的地:</td>
					<td><input class="easyui-combobox" value="吉林">省
						<input class="easyui-combobox" 
						name="language" value="长春">市<br>
						<input class="easyui-combobox" 
						name="language" value="朝阳">县(市、区)</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">承运人:</td>
					<td><input id="title" name="title" type="text" value="李四"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">联系电话:</td>
					<td><input id="title" name="title" type="text" value="13211112211"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载方式:</td>
					<td><input style="width:30px" type="checkbox" checked="checked" name="fruit" value ="apple" >公路
						<input style="width:30px" type="checkbox" name="fruit" value ="orange">铁路
						<input style="width:30px" type="checkbox" name="fruit" value ="orange">水路
						<input style="width:30px" type="checkbox" checked="checked" name="fruit" value ="mango">航空</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载工具牌号:</td>
					<td><input id="title" name="title" type="text" value="J090909"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">装运前经:</td>
					<td><input id="title" name="title" type="text" value="高温"></input>消毒</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">本批动物检验合格,应于:</td>
					<td><input id="title" name="title" type="text" value="2天"></input>内到达有效</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">官方兽医签字:</td>
					<td><input id="title" name="title" type="text" value="宋江"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">签发日期:</td>
					<td><input id="title" name="title" type="text" value="2012-04-15"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">备注:</td>
					<td><input id="title" name="title" type="text" value="无"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;margin-left:80px;">
							<a href="#" onclick="edit()" class="easyui-linkbutton"
								iconCls="icon-add">保存</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-back">返回</a>
						</div></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$.formValidator.initConfig({
		formid : "addForm"
	});
	$("#number").formValidator({
		onfocus : "请填写编号"
	}).inputValidator({
		min : 1,
		onerror : "不能为空字符"
	});
	
	$("#title").formValidator({
		onfocus : "请填写标签"
	}).inputValidator({
		min : 1,
		onerror : "不能为空字符"
	});
	
});
</script>
</html>