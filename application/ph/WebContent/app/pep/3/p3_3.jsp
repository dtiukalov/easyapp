<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.tc.utils.DatasetUtils"%>
<!DOCTYPE HTML>
<%@ include file="/app/pep/include/header.jsp"%>
<%
	//String uid = (String)request.getAttribute("uid");
	title = "3.3 Problemblatt";//假数据
	String src = "/ph/app/pep/3/333.jpg";//DatasetUtils.getDatasetByUid(uid, request);
	//假数据
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><%=title %></title>
</head>

<body>
	<div id="container">
		<div id="nr">
			<div id="top"><h1><%=title %></h1></div>
	    	<div id="content">
	    		<img src="<%=src%>" style="width: 1000px; height: 400px"/>
			</div>
	   	 	<div class="clear"></div>
	   	 	<%@ include file="/app/pep/include/foot.jsp"%>
	    </div>
	</div>
</body>
</html>