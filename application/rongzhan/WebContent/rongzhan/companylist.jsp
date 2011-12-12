<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=WebUtils.getTitle(request) %></title>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/homepage.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="beijing">
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">
	<%@ include file="include/navigate.jsp" %>
    <div class="right">
    	<%
    	%>
    	<div class="ybt">
        <div class="biaoti">公司列表</div>
        <div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;公司列表</div>
        <div class="clear"></div>
        </div>
        <div class="ynr">
        	<div class="xwlb">
        	  <table cellspacing="5" cellpadding="5" width="95%"  height="337px" align="center" border="0">
        	    <tbody>
				 	<tr>
	        	        <td rowspan="3">品牌A(图片、名称等)</td>
	        	        <td>店A（店面图片、名称、地址、电话、网址)</td>
	      	        </tr>
	      	        <tr>
	        	        <td>店B（店面图片、名称、地址、电话、网址)</td>
	      	        </tr>
	      	        <tr>
	        	        <td>店C（店面图片、名称、地址、电话、网址)</td>
	      	        </tr>
	      	        <tr>
	        	        <td rowspan="2">品牌B(图片、名称等)</td>
	        	        <td>店AA（店面图片、名称、地址、电话、网址)</td>
	      	        </tr>
	      	        <tr>
	        	        <td>店BB（店面图片、名称、地址、电话、网址)</td>
	      	        </tr>
	      	      </tbody>
	      	    </table>
        	</div>
        </div>
        <div class="ydi"><img src="images/nr_xia.gif" /></div>
    </div><!--右侧-->
    <div class="clear"></div>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</body>
</html>