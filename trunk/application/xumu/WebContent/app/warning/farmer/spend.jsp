<%@page import="com.saturn.warning.date.farmer.FarmerSpend"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerSpend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>费用支出</title>
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
	Map spends = (Map)session.getAttribute(FarmerSpend.SESSION_SPEND);
	
	if (spends == null) {
		spends = new HashMap();
		spends.put("人员工资", new FarmerSpend(null, null, "人员工资", "", null, null));
		spends.put("疫苗、治疗、劁猪费", new FarmerSpend(null, null, "疫苗、治疗、劁猪费", "", null, null));
		spends.put("水、电、燃料费", new FarmerSpend(null, null, "水、电、燃料费", "", null, null));
		session.setAttribute(FarmerSpend.SESSION_SPEND, spends);
	}
	
	FarmerSpend p1 = (FarmerSpend)spends.get("人员工资");
	FarmerSpend p2 = (FarmerSpend)spends.get("疫苗、治疗、劁猪费");
	FarmerSpend p3 = (FarmerSpend)spends.get("水、电、燃料费");
%>
<body>
<center>
<div id="main">
<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/spend.do"
			method="post">
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px" style="font-weight:bold">
<tr bgcolor="#ffffff"><td style="font-size:35px;line-height:80px;" colspan=3>费用支出</td></tr>
<tr bgcolor="#ffffff" height="100px">
<td style="font-size:25px;">支出类别</td>
<td colspan="2" style="font-size:25px;">本次实际支出（元）</td>
<tr bgcolor="#ffffff" height="80px">
<td style="font-size:25px;">人员工资</td>
<td width="350px;"><input id="price1" name="price1" type="text" value="<%=p1.getPrice()%>"/></td><td width="50px;" style="font-size:30px;">元</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">疫苗、治疗、劁猪费</td>
<td width="350px;"><input id="price2" name="price2" type="text" value="<%=p2.getPrice()%>"/></td><td width="50px;" style="font-size:30px;">元</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">水、电、燃料费</td>
<td width="350px;"><input id="price3" name="price3" type="text" value="<%=p3.getPrice()%>"/></td><td width="50px;" style="font-size:30px;">元</td>
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