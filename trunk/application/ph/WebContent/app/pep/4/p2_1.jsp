<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.tc.utils.DatasetUtils"%>
<!DOCTYPE HTML>
<%@ include file="/app/pep/include/header.jsp"%>
<%
	//String uid = (String)request.getAttribute("uid");
	title = "4.2 Teilequalität ZP5 (HT)";//假数据
	String src = "/ph/app/pep/4/zp5_ht.jpg";//DatasetUtils.getDatasetByUid(uid, request);
	//假数据
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %> </title>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto">
						<img src = "<%=src%>" >
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>