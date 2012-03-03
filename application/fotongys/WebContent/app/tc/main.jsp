<%@page import="com.saturn.tc.utils.International"%>
<%@page import="com.teamcenter.soa.client.model.strong.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=International.get(request, "mail.list") %></title>
<%@ include file="/app/includes/header.jsp"%>
</head>
<body class="easyui-layout">
	<%
		User user = (User) session.getAttribute("TC_USER");
		String local = (String)session.getAttribute(International.LOCAL);
		
		String localStr = "English";
		if ("en".equals(local)) {
			localStr = "中文";
		}
	%>
	<div region="north" split="false"
		style="height: 100px; overflow: hidden;">
		<div class="top_img">
	    <div class="user-info"><%=International.get(request, "username") %>:<%=user.get_user_name()%> [<a href="<%=request.getContextPath()%>/app/tc/foton/gys/local.action"><%=localStr%></a>]  [<a href="<%=request.getContextPath()%>/app/tc/logout.do"><%=International.get(request, "logout") %></a>] </div>
		<div class="menu-info"></div>	
		</div> 
	</div>
	<div region="center" style="overflow: hidden;">
		<iframe scrolling="yes" frameborder="0"  src="<%=request.getContextPath()%>/app/tc/detail.jsp" style="width:100%;height:100%;"></iframe>
	</div>
</body>
</html>