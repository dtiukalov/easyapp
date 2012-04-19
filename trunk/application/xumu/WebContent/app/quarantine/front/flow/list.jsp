<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerPig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>兽药查询</title>
<%@ include file="/app/includes/header.jsp"%>
<style type="text/css">
* {
	margin:0;
	padding:0;
	list-style:none;
	color:#000;
}
input {
	width:180px;
	height:80px;
	font-size: 40px;
	line-height: 80px;
	direction:rtl;
	border-width:0px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function add() {
		$('#addForm').submit();
	}
</script>
</head>
<body>
<center>
<div id="main">
<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/price.do"
			method="post">
<label style="font-size:35px;margin-right:860px;">检疫信息列表：</label>
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="1100px">
<tr bgcolor="#ffffff" height="70px">
<td style="font-size:25px;font-weight:bold;width:170px">检疫证书类型</td>
<td style="font-size:25px;font-weight:bold;width:150px">货主</td>
<td style="font-size:25px;font-weight:bold;width:120px">联系电话</td>
<td style="font-size:25px;font-weight:bold;width:120px">动物种类</td>
<td style="font-size:25px;font-weight:bold;width:150px">数量及单位</td>
<td style="font-size:25px;font-weight:bold;width:150px">签发日期</td>
<td style="font-size:25px;font-weight:bold;width:200px">操作</td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px;">动物A证</td>
<td style="font-size:20px;">王乐乐</td>
<td style="font-size:20px;">13854129652</td>
<td style="font-size:20px;">长白猪</td>
<td style="font-size:20px;">100</td>
<td style="font-size:20px;">2012-04-14</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/quarantine/front/flow/show.jsp">查看</a>&nbsp;<a href="<%=request.getContextPath() %>/app/quarantine/front/flow/result.jsp">监管结果</a></td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px;">动物B证</td>
<td style="font-size:20px;">王乐乐</td>
<td style="font-size:20px;">13854129652</td>
<td style="font-size:20px;">长白猪</td>
<td style="font-size:20px;">100</td>
<td style="font-size:20px;">2012-04-14</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/quarantine/front/flow/show.jsp">查看</a>&nbsp;<a href="<%=request.getContextPath() %>/app/quarantine/front/flow/result.jsp">监管结果</a></td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px;">产品A证</td>
<td style="font-size:20px;">王乐乐</td>
<td style="font-size:20px;">13854129652</td>
<td style="font-size:20px;">长白猪</td>
<td style="font-size:20px;">100</td>
<td style="font-size:20px;">2012-04-14</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/quarantine/front/flow/show.jsp">查看</a>&nbsp;<a href="<%=request.getContextPath() %>/app/quarantine/front/flow/result.jsp">监管结果</a></td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px;">产品B证</td>
<td style="font-size:20px;">王乐乐</td>
<td style="font-size:20px;">13854129652</td>
<td style="font-size:20px;">长白猪</td>
<td style="font-size:20px;">100</td>
<td style="font-size:20px;">2012-04-14</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/quarantine/front/flow/show.jsp">查看</a>&nbsp;<a href="<%=request.getContextPath() %>/app/quarantine/front/flow/result.jsp">监管结果</a></td>
</tr>
</table>
<table width="1100px">
<tr>
<td align="right" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/quarantine/front/index.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>