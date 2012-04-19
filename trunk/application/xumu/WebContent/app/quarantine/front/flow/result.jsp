<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerPig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>兽药查询</title>
<%@ include file="/app/includes/header.jsp"%>
<style type="text/css">
* {
	margin:0;
	padding:0;
	list-style:none;
	color:#000;
}
</style>
<script type="text/javascript">
	function add() {
		alert("保存成功！");
		window.location.href='<%=request.getContextPath() %>/app/animal/drug/show.jsp';
	}
</script>
</head>
<body>
<div id="main">
<form id="addForm" name="addForm"
			action=""
			method="post">
<center>
<div style="font-size:30px">监管结果</div><br><br>
<table cellpadding="0px" cellspacing="0px" bgcolor="#000000" width="800px" style="border:none">
<tr bgcolor="#ffffff" height="70px">
	<td style="font-size:25px;text-align:right;">耳标信息码:</td>
	<td style="text-align:left;font-size:20px;">&nbsp;&nbsp;<input style="width:30px" type="radio" id="num" name="num"/>&nbsp;证物相符<br>&nbsp;&nbsp;<input style="width:30px" type="radio" id="num" name="num"/>&nbsp;证物不符<input style="width:30px" type="radio" id="num" name="num"/>&nbsp;销毁&nbsp;&nbsp;<input style="width:30px" type="radio" id="num" name="num"/>&nbsp;补检</td>
</tr>
<tr bgcolor="#ffffff" height="70px">
	<td style="font-size:25px;text-align:right;">备注:</td>
	<td style="text-align:left;">&nbsp;&nbsp;<textarea id="num" name="num" style="height:100px;width:350px"></textarea></td>
</tr>
</table><br><br>
<table width="400px">
<tr>
<td align="right" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/quarantine/front/flow/list.jsp'" src="" alt="返回" style="direction:rtl;border-width:0px;font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</center>
</form>
</div>
</body>
</html>