<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
<link href="css/page.css" rel="stylesheet" type="text/css" />
<title><%=WebUtils.getTitle(request) %></title>
</head>
<body style="margin:0px; padding:0px;">
	<%@ include file="include/top.jsp" %>
 <div id="content">
    <%@ include file="include/navigate.jsp" %>
      <div class="right">
      <%
		Article article = Article.getOneByCid(__aid);
  		String indexStr = request.getParameter("index");
		String title = "";
		String text = "";
		
		if (article != null) {
			title = article.getTitle();
			text = article.getText();
		}
	%>
      	<div class="nrbt">
        	<div class="biaoti"><%=__aname %></div>
        	<div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;<%=title%></div>
        	<div class="clear"></div>
        </div>
        <div class="nrzj">
        	<div class="neirong"><%=PaginationUtils.getPageText(text, indexStr)%></div>
       		<div align="right" style="padding-right: 20px">
			<%=PaginationUtils.getPagination("content.jsp?cid=" + __cid, indexStr, text) %>
			</div>
        </div>
        <div class="nrdi"><img src="image/nr_xia.gif" /></div>
      </div><!--右铡-->
      <div class="clear"></div>
</div>
<%@ include file="include/foot.jsp" %>
</body>
</html>