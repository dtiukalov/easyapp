<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title>test</title>

	<body>
		<div class="containerLeft">
			<%=prev %>
		</div>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
				<div class="fr"> STATUS 19.10.2010</div>
				<h1>test</h1>
			</div>
			</div>
			
			<div id="content">
				<div style="width: 50px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart1" style="width: 260px; height: 400px; margin: 20px auto; float: left;"></div>
				<div id="chart2" style="width: 600px; height: 400px; margin: 0 auto; float: left;margin-top:40px"></div>
			</div>
			
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
		<div class="containerRight">
			<%=next %>
		</div>
	</body>
</html>
