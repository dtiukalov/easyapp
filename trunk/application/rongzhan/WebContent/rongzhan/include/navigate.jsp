<%@page import="java.util.ArrayList"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
    	<div class="gsjs">
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
    	<%@ include file="contact.jsp" %>
    </div><!--左侧-->
