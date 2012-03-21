<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Expires" content="-1">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.ph.FormManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Date"%>	
<%@page import="java.text.SimpleDateFormat"%>	
<%@page import="java.text.DateFormat"%>	
<%@page import="com.saturn.tc.utils.DateUtils"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts.src.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">
<%
	
	String type = (String)request.getAttribute("type");
	System.out.println("type = " + type);
	Map form = (Map)request.getAttribute("form");
	
	String title = "";
	String oraganization = "";
	String platformType = "";
	
	if (form != null) {
		title = (String)form.get("fv9PageName");
		oraganization = (String)form.get("fv9Oraganization");
		platformType = (String)form.get("fv9PlatformType");
	}
	
//	String status_left = "VW471 CN-Pilothalle VFF,20.10.2012";
	String status_left = "&nbsp;";
//	String status_right = "STATUS 19.10.2012";
	String status_right = "&nbsp;";
	
	double vff = 0.0;
	double pvs = 0.0;
	double os = 0.0;
	double sop = 0.0;
	
	if (session.getAttribute("vff") != null && 
			(Double)session.getAttribute("vff") != 0.0) {
		vff = (Double)session.getAttribute("vff");
	}
	if (session.getAttribute("pvs") != null &&
			(Double)session.getAttribute("pvs") != 0.0) {
		pvs = (Double)session.getAttribute("pvs");
	}
	if (session.getAttribute("os") != null &&
			(Double)session.getAttribute("os") != 0.0) {
		os = (Double)session.getAttribute("os");
	}
	if (session.getAttribute("sop") != null &&
			(Double)session.getAttribute("sop") != 0.0) {
		sop = (Double)session.getAttribute("sop");
	}
	

	
%>
<%!
	//供3.5 Audit ZP8 – Gewerk: XXX 使用
	public String mergeTableAndNum(String num, String table){
		if (!"".equals(table)) {
			return "{y:" + num + ", table:'" + table + "'}";
		} 
		System.out.println("String = " + "{y:" + num + ", table:'" + table + "'}");
		return "{y:" + num + ", table:'&nbsp;'}";
	}
%>
<%!
	//1.5 Bauprogramm VFF/PVS/0S 使用
	public static String getTime(String oldTime){
		if (!"1900-01-01 00:00:00".equals(oldTime)) {
			return (oldTime + " 00:00");
		}
		return oldTime;
	} 
	
%>


<script>
	function changeChinese() {
		$('#datatable1').css("display", "none");
		$('#german').css("display", "none");
		$('#datatable2').css("display", "");
		$('#china').css("display", "");
	}
	
	function changeGerman() {
		$('#datatable1').css("display", "");
		$('#german').css("display", "");
		$('#datatable2').css("display", "none");
		$('#china').css("display", "none");
	}
	
</script>