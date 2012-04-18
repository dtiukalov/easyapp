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
<label style="font-size:35px;margin-left:-560px;">兽药基本信息：</label>
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px">
<tr bgcolor="#ffffff" height="70px">
<td style="font-size:25px; font-weight:bold">批准文号</td>
<td style="font-size:25px; font-weight:bold">兽药名称</td>
<td style="font-size:25px; font-weight:bold">生产厂家</td>
<td style="font-size:25px; font-weight:bold">操作</td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px; color:red">无</td>
<td style="font-size:20px; color:red">无</td>
<td style="font-size:20px; color:red">无</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/animal/drug/false.jsp">假药</a></td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px; color:red">无</td>
<td style="font-size:20px; color:red">无</td>
<td style="font-size:20px; color:red">无</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/animal/drug/false.jsp">假药</a></td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px;">兽药字（2006）160355103</td>
<td style="font-size:20px;">金花平喘散</td>
<td style="font-size:20px;">新乡天桥药业有限公司</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/animal/drug/true.jsp">真药？</a></td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:20px;">兽药字（2006）160355103</td>
<td style="font-size:20px;">金花平喘散</td>
<td style="font-size:20px;">新乡天桥药业有限公司</td>
<td style="font-size:20px;"><a href="<%=request.getContextPath() %>/app/animal/drug/true.jsp">真药？</a></td>
</tr>
</table>
<table width="800px">
<tr>
<td align="left" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/animal/drug/index.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>