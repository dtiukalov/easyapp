<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<div class="top">
    	<div class="logo"><img src="images/logo.gif" /></div>
		<div class="xs">英菲尼迪长春融展兴盛专营店</div>
		<div class="rzlogo"><a href="../rongzhan/index.jsp"><img src="../rongzhan/images/fhrz.gif" /></a></div>
    </div><!--上部分-->
    <div class="nav">
    <ul>
    <%
		List __contents = Content.getChildren(WebUtils.getRootCid(request));
		String __id = request.getParameter("cid");
		
		if (!__contents.isEmpty()) {
			for (int i = 0; i < __contents.size(); ++i) {
				Content content = (Content)__contents.get(i);
				if ("显示".equals(content.getHasShowName())) {
					if (__id == null) {
						__id = ((Content)(__contents.get(i))).getId();
					}
					
					String path = content.getPath();
					String mode = content.getMode();
					if (path == null || "".equals(path.trim())) {
						if ("content.mode.more".equals(mode)) {
							path = "list.jsp";
						} else  {
							path = "content.jsp";
						}
					}
					String css="";
					if(__id.equals(content.getId())){
						css = "dqy";
					}
				%>
				<li class="<%=css%>"><a href="<%=path+"?cid=" + content.getId()%>"><%=content.getName()%></a></li>
				<% 
				}
			}
		}
	%>
         </ul>
        </div>
    <div class="flash">
    <%@ include file="banner.jsp" %>
    </div>
    <div class="clear"></div>
</div><!--头部-->
<div class="clear"></div>


