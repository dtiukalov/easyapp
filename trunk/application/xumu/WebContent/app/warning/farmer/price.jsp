<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerPig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生猪价格</title>
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
<%
	Map pigs = (Map)session.getAttribute(FarmerPig.SESSION_PRICE);
	
	if (pigs == null) {
		pigs = new HashMap();
		pigs.put("育肥猪", new FarmerPig(null, null, "市场价格", "育肥猪", "", "", "", null, null));
		pigs.put("育肥猪", new FarmerPig(null, null, "企业价格", "育肥猪", "", "", "", null, null));
		session.setAttribute(FarmerPig.SESSION_PRICE, pigs);
	}
	
	FarmerPig p2 = (FarmerPig)pigs.get("育肥猪");
	FarmerPig p3 = (FarmerPig)pigs.get("育肥猪");
%>
<body>
<center>
<div id="main">
<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/price.do"
			method="post">
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px" style="font-weight:bold">
<tr bgcolor="#ffffff"><td style="font-size:35px;line-height:80px;" colspan=3>生猪价格</td></tr>
<tr bgcolor="#ffffff" height="100px">
<td colspan="2" style="font-size:25px;">类别</td>
<td colspan="2" style="font-size:25px;">价格（元/斤）</td></tr>
<tr bgcolor="#ffffff" height="80px">
<td style="font-size:25px;">生猪交易市场交易价格</td>
<td width="150px;" style="font-size:25px;">育肥猪</td>
<td width="200px;"><input id="num1" name="num1" type="text" style="width:200px;" value="<%=p2.getNum()%>"/></td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">生猪屠宰加工企业收购价</td>
<td width="150px;" style="font-size:25px;">育肥猪</td>
<td width="200px;"><input id="num2" name="num2" type="text" style="width:200px;" value="<%=p3.getNum() %>"/></td>
</tr>
</table>
<table width="800px">
<tr>
<td align="left" width="50%">
<input type="button" value="保存" onclick="add()" src="" alt="保存" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
<td align="right" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/warning/farmer/main.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>