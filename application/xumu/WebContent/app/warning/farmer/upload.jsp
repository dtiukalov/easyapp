<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.saturn.warning.WebUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerPig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>录入情况</title>
<%@ include file="/app/includes/header.jsp"%>
<style type="text/css">
* {
	margin:0;
	padding:0;
	list-style:none;
	color:#000;
}
input {
	width:180px;
	height:80px;
	font-size: 40px;
	line-height: 80px;
	direction:rtl;
	border-width:0px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function add() {
		$('#addForm').submit();
	}
</script>
</head>
<body>
<center>
<div id="main" align="left">
<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/upload.action"
			method="post">
			<%=new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒：").format(new Date()) %><br/>
			<%=WebUtils.print(request)%>;

<img onclick="add()" src="" alt="确定" style="width:150px;height:50px;cursor: pointer;" />
</form>
</div>
</center>
</body>
</html>