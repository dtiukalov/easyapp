<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.ph.FormManager"%>
<%@page import="com.saturn.tc.utils.DatasetUtils"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/app/pep/include/header.jsp"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><%=title %> </title>
</head>
<%
	String uid = (String)request.getAttribute("uid");
%>
<body>
	<div id="container">
		<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content"  style="margin:60px 60px;height:480px;">
			
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


