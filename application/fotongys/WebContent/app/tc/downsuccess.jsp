<%@page import="com.saturn.tc.utils.International"%>
<%@page import="com.saturn.tc.foton.gys.Attachment"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=International.get(request, "mail.detail") %></title>
<%@ include file="/app/includes/header.jsp"%>

</head>
<body>
	<div id="panel" class="easyui-panel" title="<%=International.get(request, "mail.detail") %>"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">
		<%
			String hrefstr = (String)request.getAttribute("zipPath");
			Boolean download = (Boolean)request.getAttribute("download");
			
			System.out.println(hrefstr);
			hrefstr = hrefstr.replace("\\", "/");
			
			if(download == true  && hrefstr.contains("zip")){
			%>
		<center>
			<a href="<%=request.getContextPath() + hrefstr%>"><%=International.get(request, "attachment.detail") %></a>
		</center>
			<% 
			} else if(download == false ){
				//hrefstr =  hrefstr.replace("/", File.separator);
			%>
		<center>
			没有可以下载的数据 !
		</center>
			<%	
			} else {
		%>
		<center>
			Error!Please login!
		</center>
		<%		
			}
		%>
	
		
		<!--<div style="padding: 10px;">
			 <a href="javascript:history.back(-1)"
				class="easyui-linkbutton" iconCls="icon-back">返回</a>
		</div>
	--></div>
</body>

</html>