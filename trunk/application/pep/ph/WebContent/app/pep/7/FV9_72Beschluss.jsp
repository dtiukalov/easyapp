<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.ph.FormManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<%
		String fv9BeschlussPH = ((String)form.get("fv9BeschlussPH")).replaceAll("\n", "<br>");
		String fv9Beschlussantrag = ((String)form.get("fv9Beschlussantrag")).replaceAll("\n", "<br>");
		String fv9BeschlussTitle = (String)form.get("fv9BeschlussTitle");
		String fv9BeschlussStatus = (String)form.get("fv9BeschlussStatus");
		
		List<String> fv9BeschlussDept = (List<String>) form.get("fv9BeschlussDept");
	%>
</head>
<body>
	<div id="container">
		<div id="nr">
		<div id="top">
			<div class="fl"><%=status_left %></div>
			<div class="fr"><%=status_right %></div>
			<h1><%=title %></h1>
		</div>
	    <div id="content" >
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="overflow: hidden;padding-left: 5%; padding-right: 5%;">
		    	<tr>
		    		<td colspan="4" style="height:35px; font-size: 16px; font-weight: bolder; border-bottom: 3px solid;">
		    			Bisherige Pilothallen
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="4" style="height:110px;; font-size: 14px; ">
		    		<%=fv9BeschlussPH %>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="4" style="height:35px; font-size: 16px; font-weight: bolder; border-bottom: 3px solid;">
		    			Beschlussantrag
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="4" style="height:126px; font-size: 14px; ">
		    		<%=fv9Beschlussantrag %>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="4" style="height:35px; font-size: 16px; font-weight: bolder; border-bottom: 3px solid;">
		    			<%=fv9BeschlussTitle %> 
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="4" style="height:38px; font-size: 16px; ">
		    			<%=fv9BeschlussStatus %>
		    		</td>
		    	</tr>
		    	<%!
		    	public static String getDept(List<String> deptList, int index) {
		    		if (deptList != null && deptList.size() > 0 && index < deptList.size()) {
		    			return deptList.get(index);
		    		}
		    		return "&nbsp;";
		    	}
		    	%>
		    	<%
		    	int size = 8; //默认8个部门
		    	if (fv9BeschlussDept != null && fv9BeschlussDept.size() > 8) {
		    		size = fv9BeschlussDept.size();
		    	}
		    	double rows = Math.ceil(size/4.0);
		    	double height = 170.0/rows;
		    	
		    	for (int row=0; row<(int)rows; row++) {
		    		StringBuffer sb = new StringBuffer();
		    		for (int d=row*4; d<(row+1)*4; d++) {
		    			String dept = getDept(fv9BeschlussDept, d);
		    			sb.append("<td style='text-align: center; width: 25%; height: " + height + "px;'>");
		    			if (!"&nbsp;".equals(dept))
		    				sb.append("<div style='margin-left:15%;margin-right:15%;width:70%;height:1px;background-color:#303030;font-size: 14px; '>" + dept + "</div>");
		    			sb.append("</td>");
		    		}
		    		
		    	%>
		    	<tr>
		    		<%=sb.toString() %>
		    	</tr>
		    	<%
		    	}
		    	%>
		    	
			</table>
			
		</div>
	    <%@ include file="/app/pep/include/foot.jsp"%>
	</div>
</body>
</html>
