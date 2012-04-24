<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerPig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仓储追溯信息</title>
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
	/* direction:rtl; */
	border-width:0px;
	/* cursor: pointer; */
	text-align:center;
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
			action="<%=request.getContextPath()%>/app/warning/farmer/add.do"
			method="post">
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px" style="font-weight:bold">
<tr bgcolor="#ffffff"><td style="font-size:35px;line-height:80px;" colspan=4>仓储追溯信息</td></tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:25px;text-align:left;background-color:#F0F0F0" colspan=4;>仓储入库信息</td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:25px;" width="200px;">入库单</td>
<td width="150px;">12020208204367323514</td><td width="200px;" style="font-size:25px;">送货人</td>
<td width="150px;">王琦</td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:25px;" width="200px;">入库时间</td>
<td width="150px;">2012-02-02 08:445:50</td><td width="200px;" style="font-size:25px;">接收人</td>
<td width="150px;">李响</td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:25px;" width="200px;">存放仓库</td>
<td width="150px;">榆树市冷冻库</td><td width="200px;" style="font-size:25px;">库位</td>
<td width="150px;">1号库位</td>
</tr>
</table>
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px" style="font-weight:bold;margin-top:20px;">
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:25px;text-align:left;background-color:#F0F0F0"" colspan=4;>仓储出库信息</td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:25px;" width="200px;">出库单</td>
<td width="150px;">12020209051143856296</td><td width="200px;" style="font-size:25px;">送货人</td>
<td width="150px;">王琦</td>
</tr>
<tr bgcolor="#ffffff" height="50px">
<td style="font-size:25px;" width="200px;">出库日期</td>
<td width="150px;">2012-02-02 09：05：11</td><td width="200px;" style="font-size:25px;">接收人</td>
<td width="150px;">李响</td>
</tr>
</table>
<table width="800px">
<tr>
<td align="right" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/recall/back/message/show.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>