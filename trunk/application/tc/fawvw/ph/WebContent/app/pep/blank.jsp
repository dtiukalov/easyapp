<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.teamcenter.soa.client.model.strong.User"%>
<%@page import="com.teamcenter.soa.client.model.strong.Item"%>
<%@page import="com.saturn.ph.PH" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top"><h1>PH汇报</h1></div>
		    	<div id="content">
		    		<div style="width: 800px; height: 500px; margin-top: 50px; text-align: center;">
		    			<h1>此PH汇报项下没有符合条件的数据</h1>
		    			<h3><a href="<%=request.getContextPath()%>/app/pep/initworkspace.jsp">返回首页</a></h3>
					</div>
				</div>
		   	 	<div class="clear"></div>
		   	 	<%@ include file="/app/pep/include/foot.jsp"%>
		    </div>
		</div>
	</body>
</html>
