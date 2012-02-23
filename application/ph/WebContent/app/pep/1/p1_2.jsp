
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<%@page import="java.util.Date"%>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<style type="text/css">
		
	</style>
	<%
		String uid = (String)request.getAttribute("uid");
	%>
</head>
<body>	
	<div id="container" style="margin:0 20px;">
		<div id="nr">
		<div id="top"><h1><%=title %></h1></div>
		<div id="content" style="height:400px;margin:100px 10px">
			<iframe id="ff" name= "ff" frameborder="0" 
				    src="<%=request.getContextPath() %>/app/pep/1/GanttChart1.jsp?uid=<%=uid %>" 
				    style="width:100%;height:280px;">
			</iframe>
		</div>
		</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>