<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    
<html>
<head>
	<title>Teamcenter Login</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">
</head>

<body >
	<%
		List<String> indexes = (List<String>)request.getSession().getAttribute("indexes");
	
	
		for (int i = 0; i < indexes.size(); ++i) {
			String url = (String)indexes.get(i);
			System.out.println(url);     
			%>
				<iframe scrolling="yes" frameborder="<%=i%>" src="<%=request.getContextPath()%><%=url %>" style="width:950px;height:720px;"></iframe>
			<%
		}
	%>

</body>

</html> 