<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
<title><%=WebUtils.getTitle(request) %></title>
</head>
<body>
<div id="container">
<%@ include file="include/top.jsp" %>
<div class="clear"></div>
<div id="content">
	<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="715" border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td height="25px">您所在的位置：<span style="color:#F00">首页</span>&nbsp;|&nbsp;销售服务&nbsp;>&nbsp;新车报价</td>
  </tr>
</table>
<div style="width:980px;">
<%
String model = request.getParameter("model");
if("car.xuefulan.saiou3".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/so3.jsp"/>
<%
}else if("car.xuefulan.saiou2".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/so2.jsp"/>
<%
}else if("car.xuefulan.keluzi".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/klz.jsp"/>
<%
}else if("car.xuefulan.aiweiou3".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/awo3.jsp"/>
<%
}else if("car.xuefulan.aiweiou2".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/awo2.jsp"/>
<%
}else if("car.xuefulan.mairuibao".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/mrb.jsp"/>
<%
}else if("car.xuefulan.kepaqi".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/kpq.jsp"/>
<%
}else if("car.xuefulan.jingcheng".equals(model)){
%>
<jsp:include flush="true" page="../car/xfl/so.jsp"/>
<%
}else{
%>
无
<%
}
%>
</div>
</td>
  </tr>
</table>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</div>
</body>
</html>