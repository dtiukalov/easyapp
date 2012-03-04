
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
	<%
		String uid = (String)request.getAttribute("uid");
	%>
	
</head>
<body>	
	<div id="container" style="">
	<div id="nr" style="margin:0 35px;width:850px">
			<div id="top" style="border-bottom:#000099 2px solid;height:80px;width:930px;">
				<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
				<div class="fr"> STATUS 19.10.2010</div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<iframe id="ff" name= "ff" frameborder="0" 
					    src="<%=request.getContextPath() %>/app/pep/1/GanttChart1.jsp?uid=<%=uid %>" 
					    style="width:850px;height:280px;margin:50px 10px">
				</iframe> 
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
	</div>
	</div>	
</body>
</html>