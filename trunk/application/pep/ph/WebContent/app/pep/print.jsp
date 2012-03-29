
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.ph.FormManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Date"%>	
<%@page import="java.text.SimpleDateFormat"%>	
<%@page import="java.text.DateFormat"%>	
<%@page import="com.saturn.tc.utils.DateUtils"%>    
<html>
<head>
	<title>Pilothallengesprch Print</title>

	<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts.src.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">
</head>

<body>
	<center>
	<%
		List<String> indexes = (List<String>)request.getSession().getAttribute("indexes");
	
	
		for (int i = 0; i < indexes.size(); ++i) {
			
			String url = (String)indexes.get(i);
			System.out.println(url);     
			%>
				<iframe scrolling="no" frameborder="0" src="<%=request.getContextPath()%><%=url %>" style="width:1000px;height:750px;"></iframe>
			<%
		}
	%>
	</center>
</body>

</html> 