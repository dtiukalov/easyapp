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
	
	if ("".equals(oraganization1) || "null".equals(oraganization1) || oraganization1 == null) {
		oraganization1 = (String)request.getAttribute("oraganization");
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
	
	String next = "&nbsp;>&nbsp;";
	String prev = "&nbsp;<&nbsp;";
	if (indexes != null) {
		int pageSize = indexes.size();
		
		if (cur > 1) {
			prev = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur-1) + "'>&nbsp;<&nbsp;</a>";
		}
		
		if (cur < pageSize) {
			next = "<a href='" + request.getContextPath() + "/app/pep/view/view.do?current=" + (cur+1) + "'>&nbsp;>&nbsp;</a>";
		}
	}
%>

<div id="footer">
	<div class="foot">
		
		<%
		if (request.getSession().getAttribute("indexes") != null &&
				!"".equals(oraganization1)) {
		%>
		<div class="lanstk" style="padding-top: 2px;">
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
			<a href="<%=request.getContextPath() %>/app/pep/temp.jsp?type=init" class="link">
				<img src="<%=request.getContextPath() %>/app/pep/images/footerlogo.jpg" width="130px" height="37px" style="border: 0px;"/>
			</a>
		</div>
	    <div class="page">
		    <%=prev %>Seite&nbsp;<%=current %><%=next %>
	    </div>
	    
	    <div style="WIDTH: 250px; DISPLAY: inline; FLOAT: left;margin-left:100px;margin-top:5px; padding-top: 10px; font-size: 14px;">
	    	<%=projectInfo1 %>
	    </div>
	    
	    <div class="ylogo">
		    <%
		    if ("fawvw".equalsIgnoreCase(platformType1)) {
		    	%>
		    	<a href="<%=request.getContextPath() %>/app/pep/temp.jsp?type=logout" >
		 	    	<img src="<%=request.getContextPath() %>/app/pep/images/FAWVW-logo.jpg" width="51px" height="41px" border="0"/>
		 	    </a>
		 	    <%		
		    }
		    
		    if ("audi".equalsIgnoreCase(platformType1)) {
			    %>
			    <a href="<%=request.getContextPath() %>/app/pep/temp.jsp?type=logout" class="link">
			   		<img src="<%=request.getContextPath() %>/app/pep/images/Audi-logo.jpg" width="51px" height="41px"  border="0"/>
			   	</a>
			    <%	
		    }
		    %>
	    </div>
	   
    </div>
</div>
