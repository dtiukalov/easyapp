<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		List<String> fv9ThemaNoList = (List<String>)form.get("fv9ThemaNo");  //编号
		List<String> fv9ThemaList = (List<String>)form.get("fv9Thema");//标题

			
		%>
		<script type="text/javascript"></script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<table>
					<%
					if (fv9ThemaNoList != null && fv9ThemaNoList.size() > 0) {
						for (int i=0; i<fv9ThemaNoList.size(); i++) {
					%>
					<tr>
						<td><%=fv9ThemaNoList.get(i) %></td>
						<td><%=fv9ThemaList.get(i) %></td>
					</tr>
					<%		
						}
					} 
					%>
				</table>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
