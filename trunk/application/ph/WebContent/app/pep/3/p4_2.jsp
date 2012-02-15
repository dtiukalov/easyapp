<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
	Map form = (Map)request.getAttribute("form");
	
	List<String> stylePoint = new ArrayList<String>();
		stylePoint.add("2");  stylePoint.add("5"); stylePoint.add("5");  stylePoint.add("5");
		stylePoint.add("5");  stylePoint.add("3"); stylePoint.add("5");  stylePoint.add("2");
		stylePoint.add("1");  stylePoint.add("3"); stylePoint.add("2");  stylePoint.add("1");
	List<String> aK = new ArrayList<String>();
		aK.add("2");  aK.add("2"); aK.add("5");  aK.add("4");
		aK.add("2");  aK.add("6"); aK.add("2");  aK.add("4");
		aK.add("3");  aK.add("4"); aK.add("4");  aK.add("5");
	List<String> bK = new ArrayList<String>();
		bK.add("10");  bK.add("4"); bK.add("5");  bK.add("2");
		bK.add("5");  bK.add("4"); bK.add("4");  bK.add("4");
		bK.add("6");  bK.add("5"); bK.add("5");  bK.add("2");
	List<String> iO = new ArrayList<String>();
		iO.add("110");  iO.add("91"); iO.add("19");  iO.add("23");
		iO.add("15");  iO.add("17"); iO.add("16");  iO.add("17");
		iO.add("8");  iO.add("16"); iO.add("8");  iO.add("13");
	List<String> functionStyle =  new ArrayList<String>();
		functionStyle.add("Aufbau");  functionStyle.add("Unterbau"); functionStyle.add("Seitenteil li.");  functionStyle.add("Seitenteil re.");
		functionStyle.add("Tür vo. li.");  functionStyle.add("Tür vo. re."); functionStyle.add("Tür hi. li.");  functionStyle.add("Tür hi. re.");
		functionStyle.add("Frontklappe");  functionStyle.add("Rückwandklappe"); functionStyle.add("SAD Dach");  functionStyle.add("ZP5 Karo.");
	
	List<String> functionStylelist = new ArrayList<String>();
	List<String> sum = Web.SumList(aK,bK,iO);
	
	for(int i=0; i<stylePoint.size(); i++){
		StringBuffer value = new StringBuffer();
		value.append(functionStyle.get(i)).append("(");
		value.append(sum.get(i));
		value.append("/");
		value.append(stylePoint.get(i)).append(")");
		functionStylelist.add(value.toString());
	}
		
	String fv9FunctionStyle = Web.getStrListStr(functionStylelist);//"['Aufbau (122/2)', 'Unterbau (98/5)', 'Seitenteil li. (24/5)', 'Seitenteil re. (24/5)', 'Tür vo. li. (21/5)', 'Tür vo. re. (21/3)', 'Tür hi. li. (21/5)', 'Tür hi. re. (21/2)', 'Frontklappe (14/1)', 'Rückwandklappe (21/3)', 'SAD Dach (13/2)', 'ZP5 Karo. (14/1)']"; //	零件名称
	String fv9FunctionAK =  Web.getNumberListStr(aK);//"[2, 2, 5, 4, 2, 6, 2, 4, 3, 4, 4, 5]";    //	AK
	String fv9FunctionBK =  Web.getNumberListStr(bK);//"[10, 4, 5, 2, 5, 4, 4, 4, 6, 5, 5, 2]";    //	BK
	String fv9FunctionIO =  Web.getNumberListStr(iO);//"[110, 91, 19, 23, 15, 17, 16, 17, 8, 16, 8, 13]";    //	i.O

%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title>Highcharts Example</title>
		
		
		<!-- 1. Add these JavaScript inclusions in the head of your page -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="../js/highcharts.js"></script>
		
		<!-- 1a) Optional: add a theme file -->
		<!--
			<script type="text/javascript" src="../js/themes/gray.js"></script>
		-->
		
		<!-- 1b) Optional: the exporting module -->
		<script type="text/javascript" src="../js/modules/exporting.js"></script>
		
		
		<!-- 2. Add the JavaScript to initialize the chart on document ready -->
		<script type="text/javascript">
		
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'content',
						defaultSeriesType: 'bar'
					},
					title: {
						text: ''
					},
					xAxis: {
						tickLength: 0,
						lineColor: 'black',
						lineWidth:2,
						categories: <%=fv9FunctionStyle%>,
						labels:{
							style:{
								fontSize:'14px',
								color:'black'
							}
						}
					},
					yAxis: {
						gridLineWidth: 0,
						labels: {
							enabled:false
						},
						title: {
							text: ""
						},
						stackLabels: {
							enabled: true,
							style: {
								color: 'black',
								fontSize:'14px'
							}
						}
					},
					legend: {
						layout: 'vertical',
						verticalAlign: 'right',
						x:210,
						y:300,
						borderColor: '#CCC',
						borderWidth: 0,
						shadow: false,
						reversed: true
					},
					tooltip: {
						formatter: function() {
								return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						series: {
							stacking: 'normal',
							borderColor: 'black',
							dataLabels: {
								enabled: true,
								align: 'center',
								y:5,
								style : {
									fontWeight: 'bold',
									fontSize:'12px'
								},
								color: 'black'
							}
						}
					}, series: [{
						name: 'AK: Abweichung Toleranz > 100 %',
						color: '#E63110',
						data: <%=fv9FunctionAK%>
					}, {
						name: 'BK: 75% < Abweichung Toleranz < 100 ',
						color: '#F9A700',
						data: <%=fv9FunctionBK%>
					}, {
						name: 'i.O.: Abweichung Toleranz < 75 %',
						color: '#009C0E',
						data: <%=fv9FunctionIO%>,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white'
						}
					}]
				});
				
				
			});
				
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top"><h1>3.4 Funktionsmaße nach Bauteilen</h1></div>	
				<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zusammenbauteile (Anzahl FM/Anzahl Messungen)</h2>
				<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gesamt: 414 Funktionsmaße</h5>
				<div id="content">
					<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
