<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function deal() {
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
		window.location.href='<%=request.getContextPath() %>/app/quarantine/admin/deal.jsp';
	}
	
	$(function() {
		$('#license').focus();
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="动物A证"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">
		<form id="editForm"
			action="<%=request.getContextPath()%>/app/medication/updateMedication.action"
			method="post">
			<input id="id" name="id" type="hidden" value="${medication.id}"></input>
			<input type="hidden" id="createTime" name="createTime" value="<%=DateUtils.getSystemTime() %>" />
			<table class="table-form">
				<tr>
					<td style="text-align:right">货主:</td>
					<td>张三</td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">联系方式:</td>
					<td>13211112222</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">动物种类:</td>
					<td>猪</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">数量及单位:</td>
					<td>100</td>
					<td><div id="numberTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">启动地点:</td>
					<td>吉林省长春市朝阳县<br>(市、区)新民乡(镇)<br>
						山西村(养殖场、屠宰场、交易市场)
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">达到达地点:</td>
					<td>吉林省长春市朝阳县<br>(市、区)新民乡(镇)<br>
						山西村(养殖场、屠宰场、交易市场)
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">用途:</td>
					<td>销售</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">承运人:</td>
					<td>李四</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">联系电话:</td>
					<td>13211112211</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载方式:</td>
					<td><input style="width:30px" type="checkbox" checked="checked" name="fruit" value ="apple" >公路
						<input style="width:30px" type="checkbox"  checked="checked" name="fruit" value ="orange">铁路
						<input style="width:30px" type="checkbox" name="fruit" value ="orange">水路
						<input style="width:30px" type="checkbox" name="fruit" value ="mango">航空</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载工具牌号:</td>
					<td>J00909</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">运载工具消毒情况转运前经:</td>
					<td>高温消毒</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">本批动物检验合格,应于:</td>
					<td>2天内到达有效</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">官方兽医签字:</td>
					<td>宋江</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">签发日期:</td>
					<td>2012-04-15</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">牲畜耳标号:</td>
					<td>00909922</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">备注:</td>
					<td>无</td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;margin-left:80px;">
							<a href="#" onclick="deal()" class="easyui-linkbutton"
								iconCls="icon-add">监管结果</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-back">返回</a>
						</div></td>
						<td></td>
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