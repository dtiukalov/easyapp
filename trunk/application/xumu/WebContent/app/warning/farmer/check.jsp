<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.warning.date.farmer.FarmerPig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生猪检疫</title>
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
	height:60px;
	font-size: 40px;
	line-height: 80px;
	/* direction:rtl; */
	border-width:0px;
	/* cursor: pointer; */
	text-align:center;
}
</style>
<script type="text/javascript">
	function check() {
		$('#checkForm').submit();
	}
</script>
</head>
<%
	Map pigs = (Map)session.getAttribute(FarmerPig.SESSION_CHECK);
	
	if (pigs == null) {
		pigs = new HashMap();
		pigs.put("出省境仔猪", new FarmerPig(null, null, "检疫", "出省境仔猪", "", "", "", null, null));
		pigs.put("出省境育肥猪", new FarmerPig(null, null, "检疫", "育肥猪", "", "", "", null, null));
		pigs.put("省内仔猪", new FarmerPig(null, null, "检疫", "省内仔猪", "", "", "", null, null));
		pigs.put("省内育肥猪", new FarmerPig(null, null, "检疫", "省内育肥猪", "", "", "", null, null));
		pigs.put("屠宰育肥猪", new FarmerPig(null, null, "检疫", "屠宰育肥猪", "", "", "", null, null));
		session.setAttribute(FarmerPig.SESSION_CHECK, pigs);
	}
	
	FarmerPig p1 = (FarmerPig)pigs.get("出省境仔猪");
	FarmerPig p2 = (FarmerPig)pigs.get("出省境育肥猪");
	FarmerPig p3 = (FarmerPig)pigs.get("省内仔猪");
	FarmerPig p4 = (FarmerPig)pigs.get("省内育肥猪");
	FarmerPig p5 = (FarmerPig)pigs.get("屠宰育肥猪");
%>
<body>
<center>
<div id="main">
<form id="checkForm" name="checkForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/check.do"
			method="post">
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px" style="font-weight:bold">
<tr bgcolor="#ffffff"><td style="font-size:35px;line-height:80px;" colspan=4>生猪检疫</td></tr>
<tr bgcolor="#ffffff" height="80px">
<td colspan="2" style="font-size:25px;">类别</td>
<td colspan="2" style="font-size:25px;">数量</td></tr>
<tr bgcolor="#ffffff" height="80px">
<td style="font-size:25px;" rowspan=2>出省境生猪(生猪销往省外)</td>
<td width="150px;" style="font-size:25px;">仔猪</td>
<td width="200px;"><input id="num1" name="num1" type="text" style="width:200px;" value="<%=p1.getNum()%>"/></td><td width="50px;" style="font-size:30px;">头</td>
</tr>
<tr bgcolor="#ffffff" height="80px">
<td width="150px;" style="font-size:25px;">育肥猪</td>
<td width="200px;"><input id="num2" name="num2" type="text" style="width:200px;" value="<%=p2.getNum()%>"/></td><td width="50px;" style="font-size:30px;">头</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;" colspan=2>出省境猪产品</td>
<td width="200px;"><input id="total2" name="total2" type="text" style="width:200px;" value=""/></td><td width="50px;" style="font-size:30px;">吨</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;" rowspan=2>省内产地检疫</td>
<td width="150px;" style="font-size:25px;">仔猪</td>
<td width="200px;"><input id="num3" name="num3" type="text" style="width:200px;" value="<%=p3.getNum()%>"/></td><td width="50px;" style="font-size:30px;">头</td>
</tr>
<tr bgcolor="#ffffff">
<td width="150px;" style="font-size:25px;">育肥猪</td>
<td width="200px;"><input id="num4" name="num4" type="text" style="width:200px;" value="<%=p4.getNum()%>"/></td><td width="50px;" style="font-size:30px;">头</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">屠宰检疫</td>
<td width="150px;" style="font-size:25px;">育肥猪</td>
<td width="200px;"><input id="num5" name="num5" type="text" style="width:200px;" value="<%=p5.getNum()%>"/></td><td width="50px;" style="font-size:30px;">头</td>
</tr>
</table>
<table width="800px">
<tr>
<td align="left" width="50%">
<input type="button" value="保存" onclick="check()" src="" alt="保存" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
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