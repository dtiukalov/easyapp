<%@page import="com.saturn.warning.date.farmer.FarmerForage"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerForage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>饲料购进</title>
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
	Map forages = (Map)session.getAttribute(FarmerForage.SESSION_FORAGE);
	
	if (forages == null) {
		forages = new HashMap();
		forages.put("浓缩料", new FarmerForage(null, null, "浓缩料", "", "", "", null, null));
		forages.put("玉米", new FarmerForage(null, null, "玉米", "", "", "", null, null));
		forages.put("麸皮", new FarmerForage(null, null, "麸皮", "", "", "", null, null));
		forages.put("仔猪全价料", new FarmerForage(null, null, "仔猪全价料", "", "", "", null, null));
		forages.put("育肥猪全价料", new FarmerForage(null, null, "育肥猪全价料", "", "", "", null, null));
		session.setAttribute(FarmerForage.SESSION_FORAGE, forages);
	}
	
	FarmerForage p1 = (FarmerForage)forages.get("浓缩料");
	FarmerForage p2 = (FarmerForage)forages.get("玉米");
	FarmerForage p3 = (FarmerForage)forages.get("麸皮");
	FarmerForage p4 = (FarmerForage)forages.get("仔猪全价料");
	FarmerForage p5 = (FarmerForage)forages.get("育肥猪全价料");
%>
<body>
<center>
<div id="main">
<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/forage.action"
			method="post">
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px">
<tr bgcolor="#ffffff" height="100px">
<td style="font-size:25px;">饲料类别</td>
<td colspan="2" style="font-size:25px;">数量（斤）</td>
<td colspan="2" style="font-size:25px;">单价（元/斤）</td>
<td colspan="2" style="font-size:25px;">本次总购入价格（元）</td></tr>
<tr bgcolor="#ffffff" height="80px">
<td style="font-size:25px;">浓缩料</td>
<td width="150px;"><input id="num1" name="num1" type="text" value="<%=p1.getNum()%>"/></td><td width="50px;" style="font-size:40px;">斤</td>
<td width="120px;"><input id="price1" name="price1" type="text" style="width:120px;" value="<%=p1.getPrice()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
<td width="200px;"><input id="total1" name="total1" type="text" style="width:200px;" value="<%=p1.getTotal()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">玉米</td>
<td width="150px;"><input id="num2" name="num2" type="text" value="<%=p2.getNum()%>"/></td><td width="50px;" style="font-size:40px;">斤</td>
<td width="120px;"><input id="price2" name="price2" type="text" style="width:120px;" value="<%=p2.getPrice()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
<td width="200px;"><input id="total2" name="total2" type="text" style="width:200px;" value="<%=p2.getTotal()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">麸皮</td>
<td width="150px;"><input id="num3" name="num3" type="text" value="<%=p3.getNum()%>"/></td><td width="50px;" style="font-size:40px;">斤</td>
<td width="120px;"><input id="price3" name="price3" type="text" style="width:120px;" value="<%=p3.getPrice()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
<td width="200px;"><input id="total3" name="total3" type="text" style="width:200px;" value="<%=p3.getTotal()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">仔猪全价料</td>
<td width="150px;"><input id="num4" name="num4" type="text" value="<%=p4.getNum()%>"/></td><td width="50px;" style="font-size:40px;">斤</td>
<td width="120px;"><input id="price4" name="price4" type="text" style="width:120px;" value="<%=p4.getPrice()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
<td width="200px;"><input id="total4" name="total4" type="text" style="width:200px;" value="<%=p4.getTotal()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">育肥猪全价料</td>
<td width="150px;"><input id="num5" name="num5" type="text" value="<%=p5.getNum()%>"/></td><td width="50px;" style="font-size:40px;">斤</td>
<td width="120px;"><input id="price5" name="price5" type="text" style="width:120px;" value="<%=p5.getPrice()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
<td width="200px;"><input id="total5" name="total5" type="text" style="width:200px;" value="<%=p5.getTotal()%>"/></td><td width="50px;" style="font-size:40px;">元</td>
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