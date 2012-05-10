<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Map __form = (Map)request.getAttribute("form");
out.print(Web.getFormState(__form));	

	String oraganization1 = "";
	String projectInfo1 = "";
	String platformType1 = "";
	
	if (__form != null) {
		oraganization1 = (String)__form.get("fv9Oraganization");
	}
	if (session.getAttribute("fv9ProjectCode") != null) {
		projectInfo1 = (String)session.getAttribute("fv9ProjectCode");
	}
	if (session.getAttribute("platformType") != null) {
		platformType1 = (String)session.getAttribute("platformType");
	}

	List indexes = (List)request.getSession().getAttribute("indexes"); 
	String current = (String)request.getAttribute("current");
	String pageNo = (String)request.getAttribute("pageNo");
	
	if (request.getAttribute("pageNo") != null) {
		current = pageNo;
	} else {
		if (current == null) {
			current = "1";
		} 
	}
	
	int cur = Integer.parseInt(current);
	
	/* String next = "<img src=\"/ph/app/pep/images/n.jpg\" width=\"40\" height=\"70\">";
	String prev = "<img src=\"/ph/app/pep/images/p.jpg\" width=\"40\" height=\"70\">"; */
	String next = "&nbsp;>&nbsp;";
//	String next = "<img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"10\">";
	String prev = "&nbsp;<&nbsp;";
//	String prev = "<img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"10\">";
	if (indexes != null) {
		int pageSize = indexes.size();
		
		if (cur > 1) {
	//		prev = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur-1) + "'><img src=\"/ph/app/pep/images/p1.jpg\" width=\"19\" height=\"10\" style=\"border:none\"></a>";
			prev = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur-1) + "'>&nbsp;<&nbsp;</a>";
		}
		
		if (cur < pageSize) {
//			next = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur+1) + "'><img src=\"/ph/app/pep/images/n2.jpg\" width=\"19\" height=\"10\" style=\"border:none\"></a>";
			next = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur+1) + "'>&nbsp;>&nbsp;</a>";
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
		
		<%
		if (request.getSession().getAttribute("indexes") != null &&
				!"".equals(oraganization1)) {
		%>
		<div class="lanstk">
			<a href="<%=request.getContextPath() %>/app/pep/print.jsp" target="_blank" style="color: white;">
				<%=oraganization1 %>
			</a>
		</div>
		<%
		}
		%>
		
		
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
		    <%=prev %>Seite&nbsp;<%=current %><%=next %>
	    </div>
	    
	    <div style="WIDTH: 250px; DISPLAY: inline; FLOAT: left;margin-left:100px;margin-top:5px; padding-top: 10px; font-size: 14px;">
	    	<%=projectInfo1 %>
	    </div>
	    
	    <div class="ylogo">
		    <%
		    if ("fawvw".equalsIgnoreCase(platformType1)) {
		    	%>
		    	<a href="<%=request.getContextPath() %>/app/pep/logout.do" >
		 	    	<img src="<%=request.getContextPath() %>/app/pep/images/FAWVW-logo.jpg" width="120px" height="41px" border="0"/>
		 	    </a>
		 	    <%		
		    }
		    
		    if ("audi".equalsIgnoreCase(platformType1)) {
			    %>
			    <a href="<%=request.getContextPath() %>/app/pep/logout.do" class="link">
			   		<img src="<%=request.getContextPath() %>/app/pep/images/Audi-logo.jpg" width="120px" height="41px"  border="0"/>
			   	</a>
			    <%	
		    }
		    %>
	    </div>
	    <!--  <div class="clear" style="background-color: green;"></div> -->
	   
    </div>
</div>
<!-- <div class="clear" style="background-color: red;"></div> -->
