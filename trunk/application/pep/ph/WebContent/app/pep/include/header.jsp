<%@page import="com.saturn.ph.PHResource"%>
<%@page import="com.teamcenter.soa.client.model.ModelObject"%>
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Expires" content="-1">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.ph.FormManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="com.saturn.ph.PH"%>
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
	String projectInfo = "";
	
	Object tempUID = request.getAttribute("uid");
	if (tempUID != null) {
		ModelObject model = PH.getDataService().loadModelObjectRefresh(tempUID.toString());	
		PH.getDataService().getProperties(model, "fv9PageName");
		title = model.getProperty("fv9PageName").getStringValue();
	}
	
	if (form != null) {
		oraganization = (String)form.get("fv9Oraganization");
	}
	
	if (session.getAttribute("platformType") != null) {
		platformType = (String)session.getAttribute("platformType");
	}
	
	if (session.getAttribute("fv9ProjectCode") != null) {
		projectInfo = (String)session.getAttribute("fv9ProjectCode");
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

<!-- 右边折叠菜单点击展开  -->
<style>
	#righteject {
		Z-INDEX: 900000000; POSITION: fixed; TOP: 30px; left: 0px; _position: absolute; width: 5px;
	}
	.rightejecttit {
		TEXT-ALIGN: center; BACKGROUND-COLOR: white; WIDTH: 3px; DISPLAY: block; FLOAT: left; HEIGHT: 35px; COLOR: #fff; CURSOR: pointer
	}
	.rightejectcon {
		BACKGROUND-COLOR: #ccc; WIDTH: 0px; FLOAT: left; HEIGHT: 620px; OVERFLOW: scroll; 
	}
	.rightejecttit SPAN {
		Z-INDEX: 910000000; POSITION: relative; DISPLAY: block; TOP: 50%
	}
	.rightejectthis {
		BACKGROUND-COLOR: #930
	}
</style>

<SCRIPT type=text/javascript>
$(document).ready(function(){
	$('#righteject strong').toggle(
		function () {
			$(this).addClass("rightejectthis").next("div").animate({width: '+350px'}, "100");
			$('#rightejectcon').css("display", "");
	  	},
		function () {
			$(this).removeClass("rightejectthis").next("div").animate({width: '-350px'}, "100");
			$('#rightejectcon').css("display", "none");
		}
	);
	/*下面这一句只是为了让标题中的文本垂直居中，如果你使用图片做tit或者你知道span的高度，你可以删除它，在.rightejecttit span写上margin-top:span高度的一半*/
	$('#righteject strong span').css("margin-top",-$('#righteject strong span').height()*0.5);
});
</SCRIPT>

<!--右边折叠菜单html代码--->
<DIV id="righteject">
	<STRONG class="rightejecttit"><SPAN>&nbsp;</SPAN></STRONG> 
	<DIV class="rightejectcon" id="rightejectcon" style="display: none;">
		<ul style="text-align: left; font-size: 12px; font-weight: bold;">
		<%
		List<PHResource> indexLeftList = (List<PHResource>)session.getAttribute("indexList");
		if (indexLeftList != null && indexLeftList.size() > 0) {
			for (PHResource resource : indexLeftList) {
				String text = resource.getText();
				String path = request.getContextPath() + resource.getPath();
		//		System.out.println("indexId = " + indexId + " text = " + text + " path = " + path);
				String li = "<li><a href='" + path + "' style=''>" + text + "</a>";
				out.print(li);
			}
		}
		%>
			
		</ul>
	</DIV>
</DIV>