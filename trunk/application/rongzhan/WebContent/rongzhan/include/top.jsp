<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="top">
	一级导航 ：
	<%
		List __contents = Content.getChildren("rongzhan");
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
					if ("content.mode.more".equals(mode)) {
						path = "list.jsp";
					} else {
						path = "content.jsp";
					}
				%>
				<a href="<%=path+"?cid=" + content.getId()%>"><%out.print(content.getName());%></a><%=__id.equals(content.getId()) ? "(当前项)" : "" %> | 
				<% 
				}
			}
		}
	%>
</div>
<p>--------------------顶部------------------------</p>
