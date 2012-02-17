<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title>3.5 Fehlerpunkte in den Gewerken</title>
		<style type="text/css">
			
			.left{
				width: 100px; height: 50px;float: left;margin: 0 50px;
				vertical-align: middle;padding-top: 35px;
			}
			.title{
				width: 90px; height: 40px; float: left; margin: 0 auto; text-align: center;vertical-align: middle;padding-top: 20px;
				font-weight: bolder;color: white;
			}
			.chart{
				width: 700px; height: 110px; margin: 0 auto; float: left;
			}
			.clear{
				width: 100%;height: 1px;margin: 0 auto; float: left;
			}
		</style>
		<%
		String fv9KWNo = "[26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40]";//	周数
		//Web.getNumberListStr(form.get("fv9KWNo"));
		String fv9Fahrzeuge = "[3,4,4,4,4,4,4,4,4,4,4,4,4,4,4]";//		车辆数量
		//Web.getNumberListStr(form.get("fv9Fahrzeuge"));
		String fv9PresswerkNum = "[161, 87, 105, 86, 103, 130, 90, 100, 110, 80, 90, 70, 70, 80, 85]";//		冲压车间
		String fv9PresswerkProg = "[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]";//		冲压车间预测值
		//Web.getNumberListStr(form.get("fv9PresswerkNum"));
		//Web.getNumberListStr(form.get("fv9PresswerkProg"));
		String fv9KarossNum = "[417, 265, 265, 273, 263, 330, 250, 270, 310, 250, 290, 310, 290, 260, 230]";//		焊装车间
		String fv9KarossProg = "[]";//		焊装车间预测值
		//Web.getNumberListStr(form.get("fv9KarossNum"));
		//Web.getNumberListStr(form.get("fv9KarossProg"));
		String fv9LackNum = "[186, 160, 87, 105, 120, 30, 140, 40, 70, 80, 80, 80, 60, 55, 50]";//		油漆车间
		String fv9LackProg = "[]";//		油漆车间预测值
		//Web.getNumberListStr(form.get("fv9LackNum"));
		//Web.getNumberListStr(form.get("fv9LackProg"));
		String fv9MontageNum = "[363, 180, 158, 127, 110, 80, 110, 60, 130, 70, 50, 60, 80, 60, 60]";//		总装车间
		String fv9MontageProg = "[]";//		总装车间预测值
		//Web.getNumberListStr(form.get("fv9MontageNum"));
		//Web.getNumberListStr(form.get("fv9MontageProg"));
		String fv9KaufteileNum = "[800, 467, 460, 390, 347, 320, 280, 320, 220, 290, 300, 260, 250, 250, 150]";//		外购件
		String fv9KaufteileProg = "[]";//		外购件预测值
		//Web.getNumberListStr(form.get("fv9KaufteileNum"));
		//Web.getNumberListStr(form.get("fv9KaufteileProg"));
		int[] categories = new int[15];
		int[] lines1 = new int[15];
		int[] lines2 = new int[15];
		int[] lines3 = new int[15];
		int[] lines4 = new int[15];
		int[] lines5 = new int[15];
		for(int i=0; i<15; i++) {
			categories[i] = i+26;
			lines1[i] = 164;
			lines2[i] = 166;
			lines3[i] = 86;
			lines4[i] = 75;
			lines5[i] = 36;
		}
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
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false
								//verticalAlign:'bottom',
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
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
					},{
						data: [[2.5, 0], [2.5001, 180]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}, {
						data: [[7.5, 0], [7.5001, 180]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}, {
						data: [[11.5, 0], [11.5001, 180]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-Serie",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-Serie</B>";
							}
						}
					}]
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
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258'
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
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
					},{
						data: [[2.5, 0], [2.5001, 400]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}, {
						data: [[7.5, 0], [7.5001, 400]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}, {
						data: [[11.5, 0], [11.5001, 400]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-Serie",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-Serie</B>";
							}
						}
					}]
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
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258'
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
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
					},{
						data: [[2.5, 0], [2.5001, 180]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}, {
						data: [[7.5, 0], [7.5001, 180]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}, {
						data: [[11.5, 0], [11.5001, 180]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-Serie",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-Serie</B>";
							}
						}
					}]
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
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258'
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
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
					},{
						data: [[2.5, 0], [2.5001, 380]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}, {
						data: [[7.5, 0], [7.5001, 380]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}, {
						data: [[11.5, 0], [11.5001, 380]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-Serie",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-Serie</B>";
							}
						}
					}]
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
							enabled:false
						},
						categories: <%=fv9KWNo%>
					}],
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
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258'
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
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
					},{
						data: [[2.5, 0], [2.5001, 800]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}, {
						data: [[7.5, 0], [7.5001, 800]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}, {
						data: [[11.5, 0], [11.5001, 800]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-Serie",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-Serie</B>";
							}
						}
					}]
				});
			});
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>3.5 Fehlerpunkte in den Gewerken</h1></div>
			<div id="content" style="height:600px">
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #003C65">Presswerk</div>
				</div>
				<div id="chart1" class="chart"></div>
				<div class="clear">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="color:black;border: solid black 1px;background-color: #AED4F8;">Karosseriebau</div>
				</div>
				<div id="chart2" class="chart"></div>
				<div class="clear">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #8994A0">Lackiererei</div>
				</div>
				<div id="chart3" class="chart"></div>
				<div class="clear">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="color:black;border: solid black 1px;background-color: #CFD7D9">Montage</div>
				</div>
				<div id="chart4" class="chart"></div>
				<div class="clear">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #3366FF">Kaufteile</div>
				</div>
				<div id="chart5" class="chart"></div>
				<div class="clear">&nbsp;</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
