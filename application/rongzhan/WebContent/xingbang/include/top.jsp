<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="container">
<div id="divtop">
    <div id="lgmc">
    	<div id="divmenu"></div>
        <div class="rh">哈尔滨融展兴邦专营店</div>
        <div class="rzlogo"><a href="../rongzhan/index.jsp"><img src="../rongzhan/images/fhrz.gif" /></a></div>
        </div>
    <ul class="nav">
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
						css = "style=\"color: #000\"";
					}
				%>
				<li><a href="<%=path+"?cid=" + content.getId()%>" <%=css%>><%=content.getName()%></a></li>
				<% 
				}
			}
		}
	%>
        </ul>
        <div class="clear"></div>
</div>
</div>
    
<div id="divFaslh">
  	<%@ include file="banner.jsp" %>
</div>


