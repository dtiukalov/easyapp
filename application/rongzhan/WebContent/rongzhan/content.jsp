<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/app/includes/kindEditor.jsp" %>
<%
	String cname = "首页";

	String contentId = request.getParameter("cid");
	if (contentId != null) {
		Content content = Content.get(contentId);
		
		if (content != null) {
			cname = content.getName();
		}
	}
%>
<title><%=cname%></title>
</head>
<body>
	<%@ include file="include/top.jsp" %>
	<%@ include file="include/navigate.jsp" %>
	<%
		Article article = Article.getOneByCid(__aid);
		String title = "";
		String text = "";
		String indexStr = request.getParameter("index");
		
		if (article != null) {
			title = article.getTitle();
			text = article.getText();
		}
	%>
	<div id="center">
		<p>目录名称：<%=cname%></p>
		<p>题目：<%=title%></p>
		<p>内容：</p>
		<div><%=PaginationUtils.getPageText(text, indexStr)%></div>
		<div>
		<%=PaginationUtils.getPagination("content.jsp?cid=" + contentId, indexStr, text) %>
		</div>
	</div>
	<%@ include file="include/foot.jsp" %>
</body>
</html>