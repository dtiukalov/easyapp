
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
	<div id="container" >
	<div id="nr" style="margin-left:35px;">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content" style="margin:60px 65px;height:480px;">
				<iframe id="ff" name= "ff" frameborder="0" scrolling="no"
					    src="<%=request.getContextPath() %>/app/pep/1/GanttChart1.jsp?uid=<%=uid %>" 
					    style="width:850px;height:280px;margin:50px 10px">
				</iframe> 
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
	</div>
	</div>	
</body>
</html>