<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
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

<!-- <script>
$(document).ready(function(){
	$("#texiao").fadeIn(2000,function(){$("#texiao").fadeOut(3000);});
});

</script> -->
<div id="footer">
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
