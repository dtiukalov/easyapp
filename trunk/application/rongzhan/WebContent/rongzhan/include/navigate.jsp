<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="navigate">
	<p>二级导航 ：
	<%
		String __cid = request.getParameter("cid");
		String __aid = request.getParameter("aid");
		List __children = Content.getChildren(__cid);
	
		if (!__children.isEmpty()) {
			for (int i = 0; i < __children.size(); ++i) {
				Content child = (Content)__children.get(i);
				if ("显示".equals(child.getHasShowName())) {
					if (__aid == null) {
						__aid = child.getId();
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
				%>
				<a href="<%=path+"?cid=" + __cid + "&aid=" + child.getId()%>"><%out.print(child.getName());%></a><%=__aid.equals(child.getId()) ? "(当前页)" : ""%> | 
				<% 
				}
			}
		} else {
			__aid = __cid;
		}
	%>
	</p>
</div>
