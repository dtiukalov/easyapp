<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerPig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘汰</title>
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
<%
	Map pigs = (Map)session.getAttribute(FarmerPig.SESSION_WASHOUT);
	
	if (pigs == null) {
		pigs = new HashMap();
		pigs.put("能繁母猪", new FarmerPig(null, null, "淘汰", "能繁母猪", "", "", "", null, null));
		pigs.put("后备母猪", new FarmerPig(null, null, "淘汰", "后备母猪", "", "", "", null, null));
		session.setAttribute(FarmerPig.SESSION_WASHOUT, pigs);
	}
	
	FarmerPig p1 = (FarmerPig)pigs.get("能繁母猪");
	FarmerPig p2 = (FarmerPig)pigs.get("后备母猪");
%>
<body>
<center>
<div id="main">
<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/washout.action"
			method="post">
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px">
<tr bgcolor="#ffffff" height="100px">
<td style="font-size:25px;">淘汰类别</td>
<td colspan="2" style="font-size:25px;">数量（头）</td>
<td colspan="2" style="font-size:25px;">单价（元/斤）</td>
<td colspan="2" style="font-size:25px;">本次卖出共收入（元）</td></tr>
<tr bgcolor="#ffffff" height="80px">
<td style="font-size:25px;">能繁母猪</td>
<td width="150px;"><input id="num1" name="num1" type="text" value="<%=p1.getNum()%>"/></td><td width="50px;" style="font-size:40px;">头</td>
<td width="120px;"><input id="price1" name="price1" type="text" style="width:120px;" value="<%=p1.getPrice()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
<td width="200px;"><input id="total1" name="total1" type="text" style="width:200px;" value="<%=p1.getTotal()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">后备母猪</td>
<td width="150px;"><input id="num2" name="num2" type="text" value="<%=p2.getNum()%>"/></td><td width="50px;" style="font-size:40px;">头</td>
<td width="120px;"><input id="price2" name="price2" type="text" style="width:120px;" value="<%=p2.getPrice()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
<td width="200px;"><input id="total2" name="total2" type="text" style="width:200px;" value="<%=p2.getTotal()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
</tr>
</table>
<table width="800px">
<tr>
<td align="left" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/warning/farmer/main.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
<td align="right" width="50%">
<input type="button" value="确定" onclick="add()" src="" alt="确定" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>