<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.tc.utils.DatasetUtils"%>
<!DOCTYPE HTML>
<%@ include file="/app/pep/include/header.jsp"%>
<%
	String uid = (String)request.getAttribute("uid");
	String src = DatasetUtils.getDatasetByUid(uid, request);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
				<div class="box">
						<img src = "<%=src%>" />
				</div>
	   	 	<div class="clear"></div>
	   	 	<%@ include file="/app/pep/include/foot.jsp"%>
	    </div>
	</div>
</body>
</html>