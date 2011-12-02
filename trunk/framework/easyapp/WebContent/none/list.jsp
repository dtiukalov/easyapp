<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		List all = Article.getByCid(__aid);
		String indexStr = request.getParameter("index");
		List articles = PaginationUtils.getPaginationList(all, indexStr);
		
		if (articles != null && !articles.isEmpty()) {
			for (int i = 0; i < articles.size(); ++i) {
				Article article = (Article)articles.get(i);
				
				String state = article.getStateName();
				if ("隐藏".equals(state)) {
					continue;
				}
				String title = article.getTitle();
				String type = article.getTypeName();
				String did = article.getId();
	%>
				<div id="oneArticle">
					<p>------------------------------------------</p>
					<p>题目：<a href="detail.jsp?cid=<%=__cid%>&aid=<%=__aid%>&did=<%=did%>"><%=title%></a></p>
					<p>类型：<%=type %></p>
				</div>
	<%
			}
		}
	%>
	<div><%=PaginationUtils.getPagination("list.jsp?cid=" + contentId, indexStr, all) %></div>
	<%@ include file="include/foot.jsp" %>
</body>
</html>