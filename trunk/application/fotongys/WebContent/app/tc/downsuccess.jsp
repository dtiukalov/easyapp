<%@page import="com.saturn.tc.foton.gys.Attachment"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邮件详情</title>
<%@ include file="/app/includes/header.jsp"%>

</head>
<body>
	<div id="panel" class="easyui-panel" title="邮件详情"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">
		<%
			String hrefstr = (String)request.getAttribute("zipPath");
			System.out.println(hrefstr);
			hrefstr = hrefstr.replace("\\", "/");
			
			if(hrefstr.contains("zip")){
			%>
		<center>
			下载打包完毕！请<a href="<%=request.getContextPath() + hrefstr%>">保存</a>
		</center>
			<% 
			} else {
				//hrefstr =  hrefstr.replace("/", File.separator);
			%>
		<center>
			出错了！请重新登陆下载
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