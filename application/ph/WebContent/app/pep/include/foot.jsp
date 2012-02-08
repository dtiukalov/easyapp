<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List indexes = (List)session.getAttribute("indexes"); 
	String current = (String)request.getAttribute("current");
	
	if (current == null) {
		current = "1";
	} 
	
	int cur = Integer.parseInt(current);
	
	String next = "下一页";
	String prev = "上一页";
	
	System.out.println(next+prev);
	if (indexes != null) {
		int pageSize = indexes.size();
		
		if (cur > 1) {
			prev = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur-1) + "'>上一页</a>";
		}
		
		if (cur < pageSize) {
			next = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur+1) + "'>下一页</a>";
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
	    	<p>
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seite<%=current %> &nbsp;&nbsp;<%=prev %>&nbsp;|&nbsp;<%=next %>
	    	</p>
	    </div>
	    <div class="ylogo"><img src="/ph/app/pep/images/yiqilogo.jpg" /></div>
	    <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>
