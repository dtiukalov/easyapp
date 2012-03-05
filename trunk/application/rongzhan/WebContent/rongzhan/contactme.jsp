<%@page import="java.util.ArrayList"%>
<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/homepage.css" rel="stylesheet" type="text/css" />
<title><%=WebUtils.getTitle(request) %></title>
</head>
<body>
<div id="beijing">
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">

<%
	String __cid = request.getParameter("cid");
	String __aid = request.getParameter("aid");
	
	List __children = new ArrayList();
	if (__cid != null) {
		 __children = Content.getChildren(__cid);
	}
	
	String __cname = "首页";
	String __aname = "";
	
	if (__cid != null) {
		Content content = Content.get(__cid);
		if (content != null) {
			__cname = content.getName();
		}
	}
	
	if (__aid != null) {
		Content content = Content.get(__aid);
		if (content != null) {
			__aname = content.getName();
		}
	}
	%>
	<div class="left">
    	<div class="gsjs" style="display:none;">
        	<div class="bt"><%=__cname %></div>
            <div class="zj">
            	<div class="xl">
					<%
						if (!__children.isEmpty()) {
							for (int i = 0; i < __children.size(); ++i) {
								Content child = (Content)__children.get(i);
								if ("显示".equals(child.getHasShowName())) {
									String id = child.getId();
									if (__aid == null) {
										__aid = id;
										__aname = child.getName();
									}
									String css = "";
									if(__aid.equals(id)){
										css = "dqy";
									}
								%>
								<div class="xltiao"><h1><a href="<%=WebUtils.getLink(__cid, id)%>" class="<%=css%>"><%=child.getName()%></a></h1></div> 
								<% 
								}
							}
						} else {
							__aid = __cid;
						}
					%>
				</div>
            </div>
            <div class="di"><img src="images/qyjs_xia.gif" /></div>
        	</div>
        	<div style="margin-top: 5px;"></div>
    <%@ include file="include/contactDetail.jsp" %>
    <%@ include file="include/brandList.jsp" %>
    </div><!--左侧-->

    <div class="right">
    <%
		Article article = Article.getOneByCid(__aid);
  	  	String indexStr = request.getParameter("index");
		String title = "";
		String text = "";
		
		if (article != null) {
			title = article.getTitle();
			response.setHeader("title", title);
			text = article.getText();
		}
	%>
    	<div class="ybt">
        <div class="biaoti"><%=__aname%></div>
        <div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;<%=__aname%></div>
        <div class="clear"></div>
        </div>
        <div class="ynr">
        	<div class="neirong"><%=PaginationUtils.getPageText(text, indexStr)%></div>
       		<div align="right" style="padding-right: 20px">
			<%=PaginationUtils.getPagination("content.jsp?cid=" + __cid, indexStr, text) %>
			</div>
        </div>
        <div class="ydi"><img src="images/nr_xia.gif" /></div>
    </div><!--右侧-->
    <div class="clear"></div>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</body>
</html>