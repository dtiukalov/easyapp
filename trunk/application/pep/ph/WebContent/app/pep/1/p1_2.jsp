<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		String uid = (String)request.getAttribute("uid");

		Map __form = (Map)request.getAttribute("form");
		out.print(Web.getFormState(__form));	
	
		List indexes = (List)request.getSession().getAttribute("indexes"); 
		String current = (String)request.getAttribute("current");
		
		if (current == null) {
			current = "1";
		} 
		
		int cur = Integer.parseInt(current);
		
		/* String next = "<img src=\"/ph/app/pep/images/n.jpg\" width=\"40\" height=\"70\">";
		String prev = "<img src=\"/ph/app/pep/images/p.jpg\" width=\"40\" height=\"70\">"; */
		String next = "<img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"10\">";
		String prev = "<img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"10\">";
		if (indexes != null) {
			int pageSize = indexes.size();
			
			if (cur > 1) {
				prev = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur-1) + "'><img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"10\" style=\"border:none\"></a>";
			}
			
			if (cur < pageSize) {
				next = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur+1) + "'><img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"10\" style=\"border:none\"></a>";
			}
		}
	%>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top" style="margin-left: 35px;">
					<div class="fl"><%=status_left %></div>
					<div class="fr"><%=status_right %></div>
					<h1><%=title %></h1>
				</div>
				<div id="content" style="padding-left: 65px;">
					<iframe id="ff" name= "ff" frameborder="0" scrolling="no"
					    src="<%=request.getContextPath() %>/app/pep/1/GanttChart1.jsp?uid=<%=uid %>" 
					    style="width:850px;height:280px;margin:50px 10px">
					</iframe> 
				</div>
				<div id="footer" style="margin-left: 35px;">
					<div class="foot">
						<!-- <div class="lanst">&nbsp;</div> -->
						<div class="lanstk"><%=oraganization %></div>
						<div class="clear"></div>
				    </div>
					<div class="ft">
						<div class="ztu">
							<a href="<%=request.getContextPath() %>/app/pep/initworkspace.jsp" class="link">
								<img src="<%=request.getContextPath() %>/app/pep/images/footerlogo.jpg" width="130px" height="37px" style="border: 0px;"/>
							</a>
						</div>
					    <div class="page">
					    <%-- <div id="texiao" height="200px" width="50px">
					    	<div class="P"><%=prev %></div>
							<div class="N"><%=next %></div>
						</div> --%>
						    <P><%=prev %>Seite<%=current %><%=next %></P>
					    </div>
					    <div class="ylogo">
					    <%
					    if ("fawvw".equalsIgnoreCase(platformType)) {
				    	%>
				 	    <img src="<%=request.getContextPath() %>/app/pep/images/FAWVW-logo.jpg" width="120px" height="41px"/>
				 	    <%		
					    }
					    if ("audi".equalsIgnoreCase(platformType)) {
					    %>
					    <img src="<%=request.getContextPath() %>/app/pep/images/Audi-logo.jpg" width="120px" height="41px"/>
					    <%	
					    }
					    %>
					    
					    </div>
					    <div class="clear"></div>
				    </div>
				</div>
				<div class="clear"></div>

			</div>	
		</div>
	</body>
</html>
