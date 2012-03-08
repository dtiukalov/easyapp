<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="java.util.Date"%>	
<%@page import="java.text.SimpleDateFormat"%>	
<%@page import="java.text.DateFormat"%>	
<%@page import="com.saturn.tc.utils.DateUtils"%>	
<%@page import="java.util.ArrayList"%>	
<%@page import="java.util.Arrays"%>	
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/app/pep/include/header.jsp"%>
	<title></title>
<%
	String uid = (String)request.getAttribute("uid");
%>
	<title><%=title %></title>
</head>

<body>
	<div id="container">
		<div id="nr">
		<div id="top">
			<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
			<div class="fr"> STATUS 19.10.2010</div>
			<h1><%=title %></h1>
		</div>
	    <div id="content">
			<iframe id="ff" name= "ff" frameborder="0"  scrolling="no"
				    src="<%=request.getContextPath() %>/app/pep/1/GanttChart4.jsp?uid=<%=uid %>" 
				    style="width:800px;height:400px;margin:50px 50px">
			</iframe>
	   
	    </div>
	    <%@ include file="/app/pep/include/foot.jsp"%>
	     </div>
	</div>
</body>
</html>
