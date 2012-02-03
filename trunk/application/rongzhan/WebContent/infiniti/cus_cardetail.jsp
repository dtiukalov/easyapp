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
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
<title><%=WebUtils.getTitle(request) %></title>
</head>
<body>
<div id="container">
<%@ include file="include/top.jsp" %>
<div class="clear"></div>
<div id="content">
	<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="715" border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td height="25px">您所在的位置：<span style="color:#F00">首页</span>&nbsp;|&nbsp;销售服务&nbsp;>&nbsp;新车报价</td>
  </tr>
</table>
<div style="width:980px;">
<%
String model = request.getParameter("model");
if("car.infiniti.gconvertible".equals(model)){
%>
GConvertible
<%
}else if("car.infiniti.gcoupe".equals(model)){
%>
G Coupe
<%
}else if("car.infiniti.gsedan".equals(model)){
%>
G Sedan
<%
}else if("car.infiniti.m".equals(model)){
%>
M
<%
}else if("car.infiniti.ex".equals(model)){
%>
EX
<%
}else if("car.infiniti.fx".equals(model)){
%>
FX
<%
}else if("car.infiniti.qx".equals(model)){
%>
QX
<%
}else{
%>
  <table width="980px" border="1" cellpadding="0" cellspacing="0" class="tablebase" bordercolordark="#FFFFFF">
		 <tr align="center">
			<td width="135.14286px" class="trtitle">
				<strong style="font-size:14px;"> 车型</strong>
			</td>
		   <td width="135.14286px" class="trtitle">
				<strong style="font-size:14px;"> G Convertible</strong> 
			</td>
			 <td width="135.14286px" class="trtitle">
				<strong style="font-size:14px;"> G Coupe</strong> 
			</td>
			 <td width="135.14286px" class="trtitle">
				<strong style="font-size:14px;"> G Sedan</strong> 
			</td>
			 <td width="135.14286px" class="trtitle"><strong>M</strong></td>
			 <td width="135.14286px" class="trtitle">
				<strong style="font-size:14px;"> EX</strong> 
			</td>
			 <td width="135.14286px" class="trtitle">
				<strong style="font-size:14px;"> FX</strong> 
			</td>
		  </tr>
		  <tr align="center" >
							 <td class="tdtitle">
								 型号 
							 </td>
							<td>LXI AT 两驱都市版</td>
							<td>LXI MT 两驱都市版</td>
							<td>EXI AT 经典版自动档</td>
							<td>VTI AT 豪华版自动档</td>
							<td>VTISAT尊贵版自动档</td>
							<td>尊贵导航版自动档</td>
		  </tr>
		 <tr align="center" >
							  <td class="tdtitle">
								市场指导价
							 </td>
							<td>19.78万元</td>
							<td>18.98万元</td>
							<td>21.78万元</td>
							<td>23.98万元</td>
							<td>25.28万元</td>
							<td>26.28万元</td>
		  </tr>
		  <tr align="center">
							<td class="trtitle" onclick="test(this,'cheshen')">
								<strong style="font-size:12px; color:#F00;">车身规格</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								长×宽×高(mm) 
							</td>
							<td>4575X1820X1680</td>
							<td>4575X1820X1680</td>
							<td>4575X1820X1680</td>
							<td>4575X1820X1680</td>
							<td>4575X1820X1680</td>
							<td>4575X1820X1680</td>
		  </tr>
		<tr align="center" tabName="cheshen">
							 <td class="tdtitle">
								轴距(mm)
							 </td>
							<td>2620</td>
							<td>2620</td>
							<td>2620</td>
							<td>2620</td>
							<td>2620</td>
							<td>2620</td>
		  </tr>
		  <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								前/后轮距(mm)
							 </td>
							<td>1565/1565</td>
							<td>1565/1565</td>
							<td>1565/1565</td>
							<td>1565/1565</td>
							<td>1565/1565</td>
							<td>1565/1565</td>
		  </tr>
		 <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								最小离地间隙(mm) 空载
							 </td>
							<td>185</td>
							<td>185</td>
							<td>185</td>
							<td>185</td>
							<td>185</td>
							<td>185</td>
		  </tr>
		 <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								最小转弯直径（mm）
							 </td>
							<td>11000</td>
							<td>11000</td>
							<td>11000</td>
							<td>11000</td>
							<td>11000</td>
							<td>11000</td>
		  </tr>
		 
						<tr align="center" tabName="cheshen">
							<td class="tdtitle">
								油箱容量(L)
							 </td>
							<td>58</td>
							<td>58</td>
							<td>58</td>
							<td>58</td>
							<td>58</td>
							<td>58</td>
		  </tr>
		  
						<tr align="center" tabName="cheshen">
							<td class="tdtitle">
								整备质量(Kg) 
							 </td>
							<td>1510</td>
							<td>1475</td>
							<td>1590</td>
							<td>1625</td>
							<td>1635</td>
							<td>1635</td>
		  </tr>
		 <tr align="center">
							<td class="trtitle" onclick="test(this,'test1')">
								<strong style="font-size:12px; color:#f00;">性能参数</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test1">
							<td class="tdtitle">
								最高车速（km/h）
							 </td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test1">
							<td class="tdtitle">
								<span style="font-size:12px;">综合工况油耗（L/100km）</span> 
							 </td>
							<td>8.6</td>
							<td>8.4</td>
							<td>8.8</td>
							<td>9.8</td>
							<td>9.8</td>
							<td>9.8</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								<span style="font-size:12px;">排放标准</span> 
							 </td>
							<td>国IV</td>
							<td>国IV</td>
							<td>国IV</td>
							<td>国IV</td>
							<td>国IV</td>
							<td>国IV</td>
		  </tr>
		 <tr id="t8" align="center" tabName="test1">
							<td class="tdtitle">
								<span style="font-size: 12px;">0-100km/h加速（S）</span> 
							 </td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
		  </tr>
		<tr align="center">
							<td class="trtitle" onclick="test(this,'test2')">
								<strong style="font-size:12px; color:#f00;">发动机规格</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test2">
							<td class="tdtitle">
								发动机型号
							 </td>
							<td>2.0i-VTEC</td>
							<td>2.0i-VTEC</td>
							<td>2.0i-VTEC</td>
							<td>2.4i-VTEC</td>
							<td>2.4i-VTEC</td>
							<td>2.4i-VTEC</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								发动机型式
							 </td>
							<td>直列4缸16气门</td>
							<td>直列4缸16气门</td>
							<td>直列4缸16气门</td>
							<td>直列4缸16气门</td>
							<td>直列4缸16气门</td>
							<td>直列4缸16气门</td>
		  </tr>
		 <tr align="center" tabName="test2">
							<td class="tdtitle">
								供油方式
							 </td>
							<td>程序控制燃油喷射</td>
							<td>程序控制燃油喷射</td>
							<td>程序控制燃油喷射</td>
							<td>程序控制燃油喷射</td>
							<td>程序控制燃油喷射</td>
							<td>程序控制燃油喷射</td>
		  </tr>
		 <tr align="center" tabName="test2">
							<td class="tdtitle">
								排量 (L)
							 </td>
							<td>1.997</td>
							<td>1.997</td>
							<td>1.997</td>
							<td>2.354</td>
							<td>2.354</td>
							<td>2.354</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								发动机最大功率(kw/rpm)
							 </td>
							<td>110/6200</td>
							<td>110/6200</td>
							<td>110/6200</td>
							<td>125/5800</td>
							<td>125/5800</td>
							<td>125/5800</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								发动机最大扭矩(N.m/rpm)
							 </td>
							<td>190/4200</td>
							<td>190/4200</td>
							<td>190/4200</td>
							<td>220/4200</td>
							<td>220/4200</td>
							<td>220/4200</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								使用燃油种类
							 </td>
							<td>93#以上无铅汽油</td>
							<td>93#以上无铅汽油</td>
							<td>93#以上无铅汽油</td>
							<td>93#以上无铅汽油</td>
							<td>93#以上无铅汽油</td>
							<td>93#以上无铅汽油</td>
		  </tr>
		<tr align="center">
							<td class="trtitle" onclick="test(this,'test3')">
								<strong style="font-size:12px; color:#f00;">系统结构</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
						</tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								变速箱
							 </td>
							<td>五速自动</td>
							<td>五速自动</td>
							<td>五速自动</td>
							<td>五速自动</td>
							<td>五速自动</td>
							<td>五速自动</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								转向系统
							 </td>
							<td>电动助力转向</td>
							<td>电动助力转向</td>
							<td>电动助力转向</td>
							<td>液压助力转向</td>
							<td>液压助力转向</td>
							<td>液压助力转向</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								前悬架
							 </td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								后悬架
							 </td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
							<td>麦弗逊式独立悬架</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								前制动器类型
							 </td>
							<td>通风盘式</td>
							<td>通风盘式</td>
							<td>通风盘式</td>
							<td>通风盘式</td>
							<td>通风盘式</td>
							<td>通风盘式</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								后制动器类型
							 </td>
							<td>带鼓盘式</td>
							<td>带鼓盘式</td>
							<td>带鼓盘式</td>
							<td>带鼓盘式</td>
							<td>带鼓盘式</td>
							<td>带鼓盘式</td>
		  </tr>
		 <tr align="center">
							<td class="trtitle" onclick="test(this,'test4')">
								<strong style="font-size:12px; color:#f00;">安全/防盗</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								前座双安全气囊
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								侧安全气帘
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
		  </tr>
			<tr align="center" tabName="test4">
							<td class="tdtitle">
								前座侧安全气囊
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								<span style="font-size:12px;">前座预紧式安全带</span> 
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
			<tr align="center" tabName="test4">
							<td class="tdtitle">
								ABS防抱死制动系统
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center" tabName="test4">
							<td class="tdtitle">
								VSA车辆稳定性辅助系统
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								驾驶座电动窗防夹功能
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								前座主动式头枕
							 </td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
		  </tr>
		<tr align="center" tabName="test4">
							<td class="tdtitle">
								后车门儿童安全锁
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								倒车雷达
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center" tabName="test4">
							<td class="tdtitle">
								倒车影像系统
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								全周车身防护设计
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								发动机防盗锁止系统
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								防盗警报器
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center">
							<td class="trtitle" onclick="test(this,'test5')">
								<strong style="font-size:12px; color:#f00;">座椅/方向盘</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								经典织物座椅
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
		  </tr>
		  <tr align="center" tabName="test5">
							<td class="tdtitle">
								高质感真皮座椅
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								电加热双前排座椅
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center" tabName="test5">
							<td class="tdtitle">
								电动座椅
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center" tabName="test5">
							<td class="tdtitle">
								多功能方向盘
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								真皮方向盘
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								定速巡航系统
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								方向盘音响控制
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center">
							<td class="trtitle" onclick="test(this,'test6')">
								<strong style="font-size:12px; color:#f00;">音响控制系统</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		  <tr align="center" tabName="test6">
							<td class="tdtitle">
								单碟CD
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
		  </tr>
		  <tr align="center" tabName="test6">
							<td class="tdtitle">
								多碟CD
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>-</td>
		  </tr>
		  <tr align="center" tabName="test6">
							<td class="tdtitle">
								DVD 播放器
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
		  </tr>
		  <tr align="center" tabName="test6">
							<td class="tdtitle">
								杨声器
							 </td>
							<td>4喇叭高保真</td>
							<td>4喇叭高保真</td>
							<td>4喇叭高保真</td>
							<td>4喇叭高保真</td>
							<td>4喇叭高保真</td>
							<td>4喇叭高保真</td>
		  </tr>
		 <tr align="center" tabName="test6">
							<td class="tdtitle">
								中央音源输入插座
							 </td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		 <tr align="center">
							<td class="trtitle" onclick="test(this,'test7')">
								<strong style="font-size:12px; color:#f00;">空调系统</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		  <tr align="center" tabName="test7">
							<td class="tdtitle">
								手动空调
							 </td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test7">
							<td class="tdtitle">
								自动恒温空调系统
							 </td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
		  </tr>
		  <tr align="center" tabName="test7">
							<td class="tdtitle">
								分区独立空调
							 </td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center">
							<td class="trtitle" onclick="test(this,'test8')">
								<strong style="font-size:12px; color:#f00;">外 观</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test8">
							<td class="tdtitle">
								前照灯
							 </td>
							<td>四合一晶钻大灯</td>
							<td>四合一晶钻大灯</td>
							<td>四合一晶钻大灯</td>
							<td>四合一晶钻大灯</td>
							<td>四合一晶钻大灯</td>
							<td>四合一晶钻大灯</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								雾灯
							 </td>
							<td>超广角式前雾灯</td>
							<td>超广角式前雾灯</td>
							<td>超广角式前雾灯</td>
							<td>超广角式前雾灯</td>
							<td>超广角式前雾灯</td>
							<td>超广角式前雾灯</td>
		  </tr>
			<tr align="center" tabName="test8">
							<td class="tdtitle">
								外后视镜
							 </td>
							<td>电动调节</td>
							<td>电动调节</td>
							<td>电动调节</td>
							<td>电动调节</td>
							<td>电动调节</td>
							<td>电动调节</td>
		  </tr>
		<tr align="center" tabName="test8">
							<td class="tdtitle">
								双开启模式电动天窗
							 </td>
							<td>-</td>
							<td>-</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								铝合金轮毂
							 </td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
							<td>●</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								轮胎型号
							 </td>
							<td>225/65R17 102T</td>
							<td>225/65R17 102T</td>
							<td>225/65R17 102T</td>
							<td>225/65R17 102T</td>
							<td>225/65R17 102T</td>
							<td>225/65R17 102T</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								轮毂规格
							 </td>
						<td>17英寸5辐</td>
						<td>17英寸 5辐</td>
						<td>17英寸7辐</td>
						<td>17英寸双5辐</td>
						<td>17英寸双5辐</td>
						<td>17英寸双5辐</td>
		  </tr>
		 <tr align="center" >
							<td class="tdtitle">
								<strong style="font-size:12px; color:#f00;">备 注</strong>
							</td>
			<td>详细配置请致电咨询</td>
			<td>详细配置请致电咨询</td>
			<td>详细配置请致电咨询</td>
			<td>详细配置请致电咨询</td>
			<td>详细配置请致电咨询</td>
			<td>详细配置请致电咨询</td>
		  </tr>
</table>
<%
}
%>
</div>
</td>
  </tr>
</table>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</div>
</body>
</html>