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
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
<link href="css/page.css" rel="stylesheet" type="text/css" />
<title><%=WebUtils.getTitle(request) %></title>
</head>
<body style="margin:0px; padding:0px;">
	<%@ include file="include/top.jsp" %>
	<div id="content">
      <table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="715" border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td height="25px">您所在的位置：<a href="index.jsp"><span style="color:#F00">首页</span></a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(WebUtils.getRootCid(request)+".sall", null)%>">销售服务</a>&nbsp;>&nbsp;<a href="cus_cars.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&aid=<%=WebUtils.getRootCid(request) %>.sall.new">新车报价</a></td>
  </tr>
</table>
<div style="width:980px;">
<%
String model = request.getParameter("model");
if("car.dongfengnissan.gtr".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/gt-r.jsp"/>
<%
}else if("car.dongfengnissan.tianlai".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/tl.jsp"/>
<%
}else if("car.dongfengnissan.xuanyi".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/xy.jsp"/>
<%
}else if("car.dongfengnissan.qijun".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/qj.jsp"/>
<%
}else if("car.dongfengnissan.xiaoke".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/xk.jsp"/>
<%
}else if("car.dongfengnissan.yida".equals(model)){
%>
颐达
<%
}else if("car.dongfengnissan.qida".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/qd.jsp"/>
<%
}else if("car.dongfengnissan.liwei".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/lw.jsp"/>
<%
}else if("car.dongfengnissan.yangguang".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/yg.jsp"/>
<%
}else if("car.dongfengnissan.machi".equals(model)){
%>
<jsp:include flush="true" page="../car/dfrc/mc.jsp"/>
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
</div>

<%@ include file="include/foot.jsp" %>
</body>
</html>