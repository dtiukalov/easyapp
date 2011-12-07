<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="divTop">
    <div id="divMenu"></div>
	<div id="divHeng">
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
					if (path == null || "".equals(path.trim())) {
						if ("content.mode.more".equals(mode)) {
							path = "list.jsp";
						} else  {
							path = "content.jsp";
						}
					}
					String css="";
					String id="divGhds";
					if(__id.equals(content.getId())){
						css = "color:#F00";
					}
					if(i == 0){
						id="divHegu";
					}
				%>
				<div id="<%=id%>"><a href="<%=path+"?cid=" + content.getId()%>" class="aOne"><strong style="<%=__id.equals(content.getId())?css:""%>"><%out.print(content.getName());%></strong></a></div>
				<% 
				}
			}
		}
	%>
</div>
</div>
    
<div id="divFaslh">
  	<%@ include file="banner.jsp" %>
</div>


