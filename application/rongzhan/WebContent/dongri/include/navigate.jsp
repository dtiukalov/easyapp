<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

 	<%
		String __cid = request.getParameter("cid");
		String __aid = request.getParameter("aid");
		List __children = Content.getChildren(__cid);
	
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
	<div class="xl">
  	<div class="bt"><h1><%=__cname %></h1>
  	</div>
  		<%
  	if (!__children.isEmpty()) {
			for (int i = 0; i < __children.size(); ++i) {
				Content child = (Content)__children.get(i);
				if ("显示".equals(child.getHasShowName())) {
					if (__aid == null) {
						__aid = child.getId();
						__aname = child.getName();
					}
					
					String path = child.getPath();
					
					if (path == null || "".equals(path.trim())) {
						String mode = child.getMode();
						if ("content.mode.more".equals(mode)) {
							path = "list.jsp";
						} else {
							path = "content.jsp";
						}
					}
					String css="";
					if(__aid.equals(child.getId())){
						css="color:#9b714b";
					}
				%>
				<div class="xlmc"><div class="xlmcbt"><h2><a href="<%=path+"?cid=" + __cid + "&aid=" + child.getId()%>" style="<%=css%>"><%out.print(child.getName());%></a></h2></div></div>
				<% 
				}
			}
		} else {
			__aid = __cid;
		}
		%>
 	</div>
	<%@ include file="contact.jsp" %>
</div><!--左铡-->