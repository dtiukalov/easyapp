<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
if("car.yiqivw.suteng".equals(model)){
%>
速腾
<%
}else if("car.yiqivw.jieda".equals(model)){
%>
捷达
<%
}else if("car.yiqivw.maiteng".equals(model)){
%>
迈腾
<%
}else if("car.yiqivw.baolai".equals(model)){
%>
宝来
<%
}else if("car.yiqivw.gaoerfu".equals(model)){
%>
高尔夫
<%
}else if("car.yiqivw.gti".equals(model)){
%>
GTI
<%
}else if("car.yiqivw.cc".equals(model)){
%>
CC
<%
}else{
%>
  <table width="980px" border="0" cellpadding="0" cellspacing="0" class="tablebase" bordercolordark="#FFFFFF">
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
							<td bgcolor="#FFFEE1">LXI AT 两驱都市版</td>
				<td bgcolor="#FFFEE1">LXI MT 两驱都市版</td>
				<td bgcolor="#FFFEE1">EXI AT 经典版自动档</td>
				<td bgcolor="#FFFEE1">VTI AT 豪华版自动档</td>
				<td bgcolor="#FFFEE1">VTISAT尊贵版自动档</td>
							<td bgcolor="#FFFEE1">尊贵导航版自动档</td>
		  </tr>
		 <tr align="center" >
							  <td class="tdtitle">
								市场指导价
							 </td>
							<td bgcolor="#FFFEE1">19.78万元</td>
				<td bgcolor="#FFFEE1">18.98万元</td>
				<td bgcolor="#FFFEE1">21.78万元</td>
				<td bgcolor="#FFFEE1">23.98万元</td>
				<td bgcolor="#FFFEE1">25.28万元</td>
							<td bgcolor="#FFFEE1">26.28万元</td>
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
							<td bgcolor="#FFFEE1">4575X1820X1680</td>
							<td bgcolor="#FFFEE1">4575X1820X1680</td>
							<td bgcolor="#FFFEE1">4575X1820X1680</td>
							<td bgcolor="#FFFEE1">4575X1820X1680</td>
							<td bgcolor="#FFFEE1">4575X1820X1680</td>
							<td bgcolor="#FFFEE1">4575X1820X1680</td>
		  </tr>
		<tr align="center" tabName="cheshen">
							 <td class="tdtitle">
								轴距(mm)
							 </td>
							<td bgcolor="#FFFEE1">2620</td>
							<td bgcolor="#FFFEE1">2620</td>
							<td bgcolor="#FFFEE1">2620</td>
							<td bgcolor="#FFFEE1">2620</td>
							<td bgcolor="#FFFEE1">2620</td>
							<td bgcolor="#FFFEE1">2620</td>
		  </tr>
		  <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								前/后轮距(mm)
							 </td>
							<td bgcolor="#FFFEE1">1565/1565</td>
							<td bgcolor="#FFFEE1">1565/1565</td>
							<td bgcolor="#FFFEE1">1565/1565</td>
							<td bgcolor="#FFFEE1">1565/1565</td>
							<td bgcolor="#FFFEE1">1565/1565</td>
							<td bgcolor="#FFFEE1">1565/1565</td>
		  </tr>
		 <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								最小离地间隙(mm) 空载
							 </td>
							<td bgcolor="#FFFEE1">185</td>
							<td bgcolor="#FFFEE1">185</td>
							<td bgcolor="#FFFEE1">185</td>
							<td bgcolor="#FFFEE1">185</td>
							<td bgcolor="#FFFEE1">185</td>
							<td bgcolor="#FFFEE1">185</td>
		  </tr>
		 <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								最小转弯直径（mm）
							 </td>
							<td bgcolor="#FFFEE1">11000</td>
							<td bgcolor="#FFFEE1">11000</td>
							<td bgcolor="#FFFEE1">11000</td>
							<td bgcolor="#FFFEE1">11000</td>
							<td bgcolor="#FFFEE1">11000</td>
							<td bgcolor="#FFFEE1">11000</td>
		  </tr>
		 
						<tr align="center" tabName="cheshen">
							<td class="tdtitle">
								油箱容量(L)
							 </td>
							<td bgcolor="#FFFEE1">58</td>
							<td bgcolor="#FFFEE1">58</td>
							<td bgcolor="#FFFEE1">58</td>
							<td bgcolor="#FFFEE1">58</td>
							<td bgcolor="#FFFEE1">58</td>
							<td bgcolor="#FFFEE1">58</td>
		  </tr>
		  
						<tr align="center" tabName="cheshen">
							<td class="tdtitle">
								整备质量(Kg) 
							 </td>
							<td bgcolor="#FFFEE1">1510</td>
							<td bgcolor="#FFFEE1">1475</td>
							<td bgcolor="#FFFEE1">1590</td>
							<td bgcolor="#FFFEE1">1625</td>
							<td bgcolor="#FFFEE1">1635</td>
							<td bgcolor="#FFFEE1">1635</td>
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
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test1">
							<td class="tdtitle">
								<span style="font-size:12px;">综合工况油耗（L/100km）</span> 
							 </td>
							<td bgcolor="#FFFEE1">8.6</td>
							<td bgcolor="#FFFEE1">8.4</td>
							<td bgcolor="#FFFEE1">8.8</td>
							<td bgcolor="#FFFEE1">9.8</td>
							<td bgcolor="#FFFEE1">9.8</td>
							<td bgcolor="#FFFEE1">9.8</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								<span style="font-size:12px;">排放标准</span> 
							 </td>
							<td bgcolor="#FFFEE1">国IV</td>
							<td bgcolor="#FFFEE1">国IV</td>
							<td bgcolor="#FFFEE1">国IV</td>
							<td bgcolor="#FFFEE1">国IV</td>
							<td bgcolor="#FFFEE1">国IV</td>
							<td bgcolor="#FFFEE1">国IV</td>
		  </tr>
		 <tr id="t8" align="center" tabName="test1">
							<td class="tdtitle">
								<span style="font-size: 12px;">0-100km/h加速（S）</span> 
							 </td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
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
							<td bgcolor="#FFFEE1">2.0i-VTEC</td>
							<td bgcolor="#FFFEE1">2.0i-VTEC</td>
							<td bgcolor="#FFFEE1">2.0i-VTEC</td>
							<td bgcolor="#FFFEE1">2.4i-VTEC</td>
							<td bgcolor="#FFFEE1">2.4i-VTEC</td>
							<td bgcolor="#FFFEE1">2.4i-VTEC</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								发动机型式
							 </td>
							<td bgcolor="#FFFEE1">直列4缸16气门</td>
							<td bgcolor="#FFFEE1">直列4缸16气门</td>
							<td bgcolor="#FFFEE1">直列4缸16气门</td>
							<td bgcolor="#FFFEE1">直列4缸16气门</td>
							<td bgcolor="#FFFEE1">直列4缸16气门</td>
							<td bgcolor="#FFFEE1">直列4缸16气门</td>
		  </tr>
		 <tr align="center" tabName="test2">
							<td class="tdtitle">
								供油方式
							 </td>
							<td bgcolor="#FFFEE1">程序控制燃油喷射</td>
							<td bgcolor="#FFFEE1">程序控制燃油喷射</td>
							<td bgcolor="#FFFEE1">程序控制燃油喷射</td>
							<td bgcolor="#FFFEE1">程序控制燃油喷射</td>
							<td bgcolor="#FFFEE1">程序控制燃油喷射</td>
							<td bgcolor="#FFFEE1">程序控制燃油喷射</td>
		  </tr>
		 <tr align="center" tabName="test2">
							<td class="tdtitle">
								排量 (L)
							 </td>
							<td bgcolor="#FFFEE1">1.997</td>
							<td bgcolor="#FFFEE1">1.997</td>
							<td bgcolor="#FFFEE1">1.997</td>
							<td bgcolor="#FFFEE1">2.354</td>
							<td bgcolor="#FFFEE1">2.354</td>
							<td bgcolor="#FFFEE1">2.354</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								发动机最大功率(kw/rpm)
							 </td>
							<td bgcolor="#FFFEE1">110/6200</td>
							<td bgcolor="#FFFEE1">110/6200</td>
							<td bgcolor="#FFFEE1">110/6200</td>
							<td bgcolor="#FFFEE1">125/5800</td>
							<td bgcolor="#FFFEE1">125/5800</td>
							<td bgcolor="#FFFEE1">125/5800</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								发动机最大扭矩(N.m/rpm)
							 </td>
							<td bgcolor="#FFFEE1">190/4200</td>
							<td bgcolor="#FFFEE1">190/4200</td>
							<td bgcolor="#FFFEE1">190/4200</td>
							<td bgcolor="#FFFEE1">220/4200</td>
							<td bgcolor="#FFFEE1">220/4200</td>
							<td bgcolor="#FFFEE1">220/4200</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								使用燃油种类
							 </td>
							<td bgcolor="#FFFEE1">93#以上无铅汽油</td>
							<td bgcolor="#FFFEE1">93#以上无铅汽油</td>
							<td bgcolor="#FFFEE1">93#以上无铅汽油</td>
							<td bgcolor="#FFFEE1">93#以上无铅汽油</td>
							<td bgcolor="#FFFEE1">93#以上无铅汽油</td>
							<td bgcolor="#FFFEE1">93#以上无铅汽油</td>
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
							<td bgcolor="#FFFEE1">五速自动</td>
							<td bgcolor="#FFFEE1">五速自动</td>
							<td bgcolor="#FFFEE1">五速自动</td>
							<td bgcolor="#FFFEE1">五速自动</td>
							<td bgcolor="#FFFEE1">五速自动</td>
							<td bgcolor="#FFFEE1">五速自动</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								转向系统
							 </td>
							<td bgcolor="#FFFEE1">电动助力转向</td>
							<td bgcolor="#FFFEE1">电动助力转向</td>
							<td bgcolor="#FFFEE1">电动助力转向</td>
							<td bgcolor="#FFFEE1">液压助力转向</td>
							<td bgcolor="#FFFEE1">液压助力转向</td>
							<td bgcolor="#FFFEE1">液压助力转向</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								前悬架
							 </td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								后悬架
							 </td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
							<td bgcolor="#FFFEE1">麦弗逊式独立悬架</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								前制动器类型
							 </td>
							<td bgcolor="#FFFEE1">通风盘式</td>
							<td bgcolor="#FFFEE1">通风盘式</td>
							<td bgcolor="#FFFEE1">通风盘式</td>
							<td bgcolor="#FFFEE1">通风盘式</td>
							<td bgcolor="#FFFEE1">通风盘式</td>
							<td bgcolor="#FFFEE1">通风盘式</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								后制动器类型
							 </td>
							<td bgcolor="#FFFEE1">带鼓盘式</td>
							<td bgcolor="#FFFEE1">带鼓盘式</td>
							<td bgcolor="#FFFEE1">带鼓盘式</td>
							<td bgcolor="#FFFEE1">带鼓盘式</td>
							<td bgcolor="#FFFEE1">带鼓盘式</td>
							<td bgcolor="#FFFEE1">带鼓盘式</td>
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
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								侧安全气帘
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
			<tr align="center" tabName="test4">
							<td class="tdtitle">
								前座侧安全气囊
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								<span style="font-size:12px;">前座预紧式安全带</span> 
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
			<tr align="center" tabName="test4">
							<td class="tdtitle">
								ABS防抱死制动系统
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		  <tr align="center" tabName="test4">
							<td class="tdtitle">
								VSA车辆稳定性辅助系统
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								驾驶座电动窗防夹功能
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								前座主动式头枕
							 </td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
		  </tr>
		<tr align="center" tabName="test4">
							<td class="tdtitle">
								后车门儿童安全锁
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								倒车雷达
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		  <tr align="center" tabName="test4">
							<td class="tdtitle">
								倒车影像系统
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								全周车身防护设计
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								发动机防盗锁止系统
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test4">
							<td class="tdtitle">
								防盗警报器
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
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
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
		  </tr>
		  <tr align="center" tabName="test5">
							<td class="tdtitle">
								高质感真皮座椅
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								电加热双前排座椅
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		  <tr align="center" tabName="test5">
							<td class="tdtitle">
								电动座椅
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		  <tr align="center" tabName="test5">
							<td class="tdtitle">
								多功能方向盘
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								真皮方向盘
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								定速巡航系统
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		 <tr align="center" tabName="test5">
							<td class="tdtitle">
								方向盘音响控制
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
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
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
		  </tr>
		  <tr align="center" tabName="test6">
				<td class="tdtitle">
								多碟CD
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">-</td>
		  </tr>
		  <tr align="center" tabName="test6">
				<td class="tdtitle">
								DVD 播放器
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		  <tr align="center" tabName="test6">
				<td class="tdtitle">
								杨声器
							 </td>
							<td bgcolor="#FFFEE1">4喇叭高保真</td>
							<td bgcolor="#FFFEE1">4喇叭高保真</td>
							<td bgcolor="#FFFEE1">4喇叭高保真</td>
							<td bgcolor="#FFFEE1">4喇叭高保真</td>
							<td bgcolor="#FFFEE1">4喇叭高保真</td>
							<td bgcolor="#FFFEE1">4喇叭高保真</td>
		  </tr>
		 <tr align="center" tabName="test6">
				<td class="tdtitle">
								中央音源输入插座
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
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
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="test7">
				<td class="tdtitle">
								自动恒温空调系统
							 </td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
		  </tr>
		  <tr align="center" tabName="test7">
				<td class="tdtitle">
								分区独立空调
							 </td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
							<td bgcolor="#FFFEE1">&nbsp;&nbsp;</td>
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
							<td bgcolor="#FFFEE1">四合一晶钻大灯</td>
							<td bgcolor="#FFFEE1">四合一晶钻大灯</td>
							<td bgcolor="#FFFEE1">四合一晶钻大灯</td>
							<td bgcolor="#FFFEE1">四合一晶钻大灯</td>
							<td bgcolor="#FFFEE1">四合一晶钻大灯</td>
							<td bgcolor="#FFFEE1">四合一晶钻大灯</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								雾灯
							 </td>
							<td bgcolor="#FFFEE1">超广角式前雾灯</td>
							<td bgcolor="#FFFEE1">超广角式前雾灯</td>
							<td bgcolor="#FFFEE1">超广角式前雾灯</td>
							<td bgcolor="#FFFEE1">超广角式前雾灯</td>
							<td bgcolor="#FFFEE1">超广角式前雾灯</td>
							<td bgcolor="#FFFEE1">超广角式前雾灯</td>
		  </tr>
			<tr align="center" tabName="test8">
							<td class="tdtitle">
								外后视镜
							 </td>
							<td bgcolor="#FFFEE1">电动调节</td>
							<td bgcolor="#FFFEE1">电动调节</td>
							<td bgcolor="#FFFEE1">电动调节</td>
							<td bgcolor="#FFFEE1">电动调节</td>
							<td bgcolor="#FFFEE1">电动调节</td>
							<td bgcolor="#FFFEE1">电动调节</td>
		  </tr>
		<tr align="center" tabName="test8">
							<td class="tdtitle">
								双开启模式电动天窗
							 </td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">-</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								铝合金轮毂
							 </td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
							<td bgcolor="#FFFEE1">●</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								轮胎型号
							 </td>
							<td bgcolor="#FFFEE1">225/65R17 102T</td>
							<td bgcolor="#FFFEE1">225/65R17 102T</td>
							<td bgcolor="#FFFEE1">225/65R17 102T</td>
							<td bgcolor="#FFFEE1">225/65R17 102T</td>
							<td bgcolor="#FFFEE1">225/65R17 102T</td>
							<td bgcolor="#FFFEE1">225/65R17 102T</td>
		  </tr>
		  <tr align="center" tabName="test8">
							<td class="tdtitle">
								轮毂规格
							 </td>
						<td bgcolor="#FFFEE1">17英寸5辐</td>
						<td bgcolor="#FFFEE1">17英寸 5辐</td>
						<td bgcolor="#FFFEE1">17英寸7辐</td>
						<td bgcolor="#FFFEE1">17英寸双5辐</td>
						<td bgcolor="#FFFEE1">17英寸双5辐</td>
						<td bgcolor="#FFFEE1">17英寸双5辐</td>
		  </tr>
		 <tr align="center" >
							<td class="tdtitle">
								<strong style="font-size:12px; color:#f00;">备 注</strong>
							</td>
			<td bgcolor="#FFFEE1">详细配置请致电咨询</td>
			<td bgcolor="#FFFEE1">详细配置请致电咨询</td>
			<td bgcolor="#FFFEE1">详细配置请致电咨询</td>
			<td bgcolor="#FFFEE1">详细配置请致电咨询</td>
			<td bgcolor="#FFFEE1">详细配置请致电咨询</td>
			<td bgcolor="#FFFEE1">详细配置请致电咨询</td>
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