<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<style type="text/css">
			.left{
				width: 100px; height: 60px;float: left; margin: 20px 20px;
				vertical-align: middle;
				font-size:14px;
			}
			.title{
				width: 90px; height: 40px; float: left; margin: 0px 0px auto; text-align: center;vertical-align: middle;padding-top: 20px;
				font-weight: bolder;color: white;
			}
			.chart{
				width: 800px; height: 100px; margin: 0px 0px auto; float: left;
			}
			.last-chart {
				width: 800px; height: 120px; margin: 0px 0px auto; float: left;
			}
			.clear1{
				width: 100%; height: 1px; margin: 0 auto; float: left;
			}
		</style>
		<%

		StringBuffer categories = new StringBuffer();
		categories.append("[");
		List kws = (List)form.get("fv9KWNo");
		List fahrzeuge = (List)form.get("fv9Fahrzeuge");
		if (kws != null && kws.size()>0) {
			for (int i=0; i<kws.size()-1; i++) {
				categories.append("'" + kws.get(i) + "<br>" + fahrzeuge.get(i) + "',");
			}
			categories.append("'"+ kws.get(kws.size()-1) + "<br>" + fahrzeuge.get(kws.size()-1) + "'");
		}
		categories.append("]");
		String fv9KWNo = categories.toString();
		
//		冲压车间
		String fv9PresswerkNum = Web.getNumberListStr(form.get("fv9PresswerkNum"));
		String fv9PresswerkProg = Web.getNumberListStr(form.get("fv9PresswerkProg"));
		int totalPress = Web.getMax((List<String>)form.get("fv9PresswerkNum"));
		
//		焊装车间
		String fv9KarossNum = Web.getNumberListStr(form.get("fv9KarossNum"));
		String fv9KarossProg = Web.getNumberListStr(form.get("fv9KarossProg"));
		int totalKaross = Web.getMax((List<String>)form.get("fv9KarossNum"));
		
//		油漆车间
		String fv9LackNum = Web.getNumberListStr(form.get("fv9LackNum"));
		String fv9LackProg = Web.getNumberListStr(form.get("fv9LackProg"));
		int totalLack = Web.getMax((List<String>)form.get("fv9LackNum"));
		
//		总装车间
		String fv9MontageNum = Web.getNumberListStr(form.get("fv9MontageNum"));
		String fv9MontageProg = Web.getNumberListStr(form.get("fv9MontageProg"));
		int totalMontage = Web.getMax((List<String>)form.get("fv9MontageNum"));
		
//		外购件
		String fv9KaufteileNum = Web.getNumberListStr(form.get("fv9KaufteileNum"));
		String fv9KaufteileProg = Web.getNumberListStr(form.get("fv9KaufteileProg"));
		int totalKaufteil = Web.getMax((List<String>)form.get("fv9KaufteileNum"));
		
		%>
		<%
		double sum = 0.0;
		int[] arr = null;
		if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
			 arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
		}	
		
		Map<String,Integer> lichenbeiNum = Web.getLCBNum(request, arr);
		int vffNum =  lichenbeiNum.get("vffNum");//柱子个数
		int pvsNum = lichenbeiNum.get("pvsNum");//柱子个数
		int osNum = lichenbeiNum.get("osNum");//柱子个数
		int sopNum =  lichenbeiNum.get("sopNum");//柱子个数
		
		double temp0 = 0;
		int temp1 = 0;
		int temp2 = 0;
		int temp3 = 0;
		
		if(vffNum > 0){
			temp0 = 0.5;
		}
		if(pvsNum > 0){
			temp1 = vffNum;
		}
		if(osNum > 0){
			temp2 = vffNum + pvsNum ;
		}
		if(sopNum > 0){
			temp3 = vffNum + pvsNum + osNum ;
		}
		
		double totalWidth = 755.0;
	
		Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(Web.getLCBNum(request,arr), arr, totalWidth);
		
		double value0 = lichenbeiPillarNum.get("vffqianPillar"); 
		double value1 = lichenbeiPillarNum.get("vffPillar"); 
		double value2 = lichenbeiPillarNum.get("pvsPillar");
		double value3 = lichenbeiPillarNum.get("osPillar");
		double value4 = lichenbeiPillarNum.get("sopPillar");
		
		sum = value0 + value1 + value2 + value3 + value4;
		
		%>
		<script type="text/javascript">
			var chart1, chart2, chart3, chart4, chart5;
			$(document).ready(function() {
				chart1 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart1'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							groupPadding:0.06,
							pointPadding:0.06,
							dataLabels: {
								enabled: false
								//verticalAlign:'bottom',
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Strassenfahrt',
						data: <%=fv9PresswerkNum%>,
						color: '#003C65'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9PresswerkProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
					]
				});
				
				chart2 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart2'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							groupPadding:0.06,
							pointPadding:0.06,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Strassenfahrt',
						data: <%=fv9KarossNum%>,
						color: '#AED4F8'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9KarossProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
					]
				});
				
				chart3 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart3'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							groupPadding:0.06,
							pointPadding:0.06,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Strassenfahrt',
						data: <%=fv9LackNum%>,
						color: '#8994A0'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9LackProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
					]
				});
				
				chart4 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart4'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							groupPadding:0.06,
							pointPadding:0.06,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Strassenfahrt',
						data: <%=fv9MontageNum%>,
						color: '#CFD7D9'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9MontageProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}

					]
				});
				
				chart5 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart5'
					},
					title: {
						text: ' '
					},
					xAxis: [{
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:true
						},
						categories: <%=fv9KWNo%>
					}],
					yAxis: {
						min:0,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							groupPadding:0.06,
							pointPadding:0.06,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Strassenfahrt',
						data: <%=fv9KaufteileNum%>,
						color: '#3366FF'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9KaufteileProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}

					]
				});
			});
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #003C65">Presswerk</div>
				</div>
				<div id="chart1" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #AED4F8;">Karosseriebau</div>
				</div>
				<div id="chart2" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #8994A0">Lackiererei</div>
				</div>
				<div id="chart3" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="color:black;border: solid black 1px;background-color: #CFD7D9">Montage</div>
				</div>
				<div id="chart4" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #3366FF">Kaufteile</div>
				</div>
				<div id="chart5" class="last-chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div id="meilsteinouter" style="width: 800px;">
				<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 181px; text-align: center; overflow: hidden; ">
					<div style=" width: <%=value0 %>px; height: 30px; float: left; background-color: white; vertical-align: bottom; padding-top: 5px;"><span style="color: white;"></span></div>

					<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
					<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
					<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
					<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
				</div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
