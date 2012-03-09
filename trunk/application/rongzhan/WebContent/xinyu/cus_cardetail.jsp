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
if("car.yiqivw.suteng".equals(model)){
%>
<jsp:include flush="true" page="../car/yqdz/st.jsp"/>
<%
}else if("car.yiqivw.jieda".equals(model)){
%>
<jsp:include flush="true" page="../car/yqdz/jd.jsp"/>
<%
}else if("car.yiqivw.maiteng".equals(model)){
%>
<jsp:include flush="true" page="../car/yqdz/mt.jsp"/>
<%
}else if("car.yiqivw.baolai".equals(model)){
%>
<jsp:include flush="true" page="../car/yqdz/bl.jsp"/>
<%
}else if("car.yiqivw.gaoerfu".equals(model)){
%>
<jsp:include flush="true" page="../car/yqdz/gef.jsp"/>
<%
}else if("car.yiqivw.gti".equals(model)){
%>
GTI
<!--<jsp:include flush="true" page="../include/gti.jsp"/>-->
<%
}else if("car.yiqivw.cc".equals(model)){
%>
<jsp:include flush="true" page="../car/yqdz/cc.jsp"/>
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