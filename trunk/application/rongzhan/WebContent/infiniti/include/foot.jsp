<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="footer">
	<ul class="ksdh">
	<%
		List __contents_foot = Content.getChildren(WebUtils.getRootCid(request));
		String __id_foot = request.getParameter("cid");
		
		if (!__contents_foot.isEmpty()) {
			for (int i = 0; i < __contents_foot.size(); ++i) {
				Content content = (Content)__contents_foot.get(i);
				if ("显示".equals(content.getHasShowName())) {
					if (__id_foot == null) {
						__id_foot = ((Content)(__contents_foot.get(i))).getId();
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
					if(__id_foot.equals(content.getId())){
						css = "style=\"color:#F00\"";
					}
				%>
				<li><a href="<%=path+"?cid=" + content.getId()%>"><%=content.getName()%></a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<% 
				}
			}
		}
	%>
  	</ul>
    <div class="bq">
<p>版权所有吉林省融展兴盛汽车销售服务有限公司</p>
<p>地址:吉林省长春市西新区长沈路3999号</p>
<p>电话:0431-81971888/85971555</p>
    </div>

</div><!--底部-->
<div class="clear"></div>
