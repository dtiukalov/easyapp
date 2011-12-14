<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="header">
	<div class="logo">
		<img src="images/logo.jpg" />
	</div>
	<div class="ln">
		<img src="images/qxpp.jpg" />
	</div>
	<div class="nav">
		<ul>
			<%
				List __contents = Content.getChildren(WebUtils.getRootCid(request));
				String __id = request.getParameter("cid");

				if (!__contents.isEmpty()) {
					for (int i = 0; i < __contents.size(); ++i) {
						Content content = (Content) __contents.get(i);
						if ("显示".equals(content.getHasShowName())) {
							String id = content.getId();
							if (__id == null) {
								__id = id;
							}

							String css = "";
							if (__id.equals(id)) {
								css = "color:#fff100";
							}
			%>
			<li><a href="<%=WebUtils.getLink(id, null)%>" style="<%=css%>"><%=content.getName()%></a></li>
			<%
						}
					}
				}
			%>
		</ul>

	</div>
	<div class="clear"></div>
</div>
<!--头-->
<div id="banner">
	<%@ include file="banner.jsp"%>
</div>
<!--banner-->

