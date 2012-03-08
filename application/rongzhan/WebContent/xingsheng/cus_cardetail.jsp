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
if("car.buick.kaiyue".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/ky.jsp"/>
<%
}else if("car.buick.junwei".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/jw.jsp"/>
<%
}else if("car.buick.yinglanggt".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/ylGT.jsp"/>
<%
}else if("car.buick.junyue".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/jy.jsp"/>
<%
}else if("car.buick.yinglangxt".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/ylXT.jsp"/>
<%
}else if("car.buick.gl8".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/bkGL8.jsp"/>
<%
}else if("car.buick.linyindadao".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/lydd.jsp"/>
<%
}else if("car.buick.angkelei".equals(model)){
%>
<jsp:include flush="true" page="../car/tybk/akl.jsp"/>
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