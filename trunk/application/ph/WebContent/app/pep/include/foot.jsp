<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Map __form = (Map)request.getAttribute("form");
	out.print(Web.getFormState(__form));	

	List indexes = (List)session.getAttribute("indexes"); 
	String current = (String)request.getAttribute("current");
	
	if (current == null) {
		current = "1";
	} 
	
	int cur = Integer.parseInt(current);
	
	String next = "<img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"18\">";
	String prev = "<img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"18\">";
	
	if (indexes != null) {
		int pageSize = indexes.size();
		
		if (cur > 1) {
			prev = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur-1) + "'><img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"18\" style=\"border:none\"></a>";
		}
		
		if (cur < pageSize) {
			next = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur+1) + "'><img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"18\" style=\"border:none\"></a>";
		}
	}
%>
<div id="footer">
	<div class="foot">
		<div class="lanst">&nbsp;</div>
		<div class="lanstk">Produkt Management</div>
		<div class="clear"></div>
    </div>
	<div class="ft">
		<div class="ztu"><img src="/ph/app/pep/images/footerlogo.jpg" /></div>
	    <div class="page">
		    <P><%=prev %>&nbsp;&nbsp;Seite<%=current %>&nbsp;&nbsp;<%=next %></P>
	    </div>
	    <div class="ylogo"><img src="/ph/app/pep/images/yiqilogo.jpg" /></div>
	    <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>
