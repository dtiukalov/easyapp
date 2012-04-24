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
	width:100px;
	height:60px;
	font-size: 20px;
	line-height: 60px;
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
<body>
<center>
<div id="main">
<form id="checkForm" name="checkForm"
			action="<%=request.getContextPath()%>/app/warning/farmer/check.do"
			method="post">
<table cellpadding="0px" cellspacing="1px" bgcolor="#000000" width="800px" style="font-weight:bold">
<tr bgcolor="#ffffff"><td style="font-size:35px;line-height:45px;" colspan=6>动物检疫合格证明(动物A)<br><label style="font-size:25px;color:red;float:right;">No 2200018514</label></td></tr>
<tr bgcolor="#ffffff" height="60px">
<td style="font-size:25px;">货主</td>
<td style="width:50px;"><input id="num1" name="num1" type="text" value="尚万春"/></td>
<td style="font-size:25px;width:250px;">联系电话</td>
<td style="font-size:25px;" colspan=3><input id="num1" name="num1" type="text" style="width:150px" value="13630991888"/></td>
</tr>
<tr bgcolor="#ffffff" height="60px">
<td style="font-size:25px;width:200px;">动物种类</td>
<td><input id="num1" name="num1" type="text"  value="猪"/></td>
<td style="font-size:25px;">数量及单位</td>
<td style="font-size:25px;" colspan=3><input id="num1" name="num1" type="text" value="一百头"/></td>
</tr>
<tr bgcolor="#ffffff" height="60px">
<td style="font-size:25px;">启动地点</td>
<td width="150px;" style="font-size:25px;" colspan=5><input id="num2" name="num2" type="text" style="width:200px;" value="吉林省 四平市 梨树县"/> </td>
</tr>
<tr bgcolor="#ffffff" height="60px">
<td style="font-size:25px;">到达地点</td>
<td width="150px;" style="font-size:25px;" colspan=5><input id="num2" name="num2" type="text" style="width:200px;" value="浙江省 台市 嫩江县"/></td>
</tr>
<tr bgcolor="#ffffff" height="60px">
<td style="font-size:25px;">用途</td>
<td><input id="num2" name="num2" type="text" value="屠宰"/></td>
<td style="font-size:25px;">承运人</td><td width="50px;" style="font-size:30px;"><input id="num2" name="num2" type="text" style="width:100px;" value="王守忠"/></td>
<td style="font-size:20px;width:130px;">联系电话</td>
<td style="font-size:10px;"><input id="num2" name="num2" type="text" style="width:200px;" value="15886096188"/></td>
</tr>
<tr bgcolor="#ffffff" height="60px">
<td style="font-size:25px;">运载方式</td>
<td style="font-size:25px;"><input id="num1" name="num1" type="text" value="公路 水路"/></td>
<td style="font-size:25px;">运载工具牌号</td>
<td style="font-size:25px;" colspan=3><input id="num1" name="num1" type="text" value="吉A12321"/></td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;" colspan=2>运载工具消毒情况</td>
<td width="200px;" style="font-size:25px;" colspan=4>装运前经<input id="num1" name="num1" type="text" style="width:150px" value="3%来苏儿喷雾"/>消毒</td>
</tr>
<tr bgcolor="#ffffff">
<td width="150px;" style="font-size:25px;" colspan=6>本批动物经加以合格应于<input id="num1" name="num1" type="text" style="width:50px" value="4"/>日内到达有效</td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">牲畜耳标号</td>
<td width="150px;" style="font-size:25px;" colspan=5><input id="num1" name="num1" type="text" style="width:200px"  value="002 003 004 005"/></td>
</tr>
<tr bgcolor="#ffffff">
<td style="font-size:25px;">备注</td>
<td width="150px;" style="font-size:25px;" colspan=5><input id="num1" name="num1" type="text" style="width:200px"  value=""/></td>
</tr>
</table>
<table width="800px">
<tr>
<td align="right" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/quarantine/front/flow/list.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</form>
</div>
</center>
</body>
</html>