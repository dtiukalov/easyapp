<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<%
		int[] categories = new int[19];
		for(int i=0; i<19; i++) {
			categories[i] = i+22;
		}
		%>
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineColor:'#747474',
						gridLineWidth:1,
						gridLineColor:'#747474',
						tickLength:13,
						tickColor:'#747474',
						categories: <%=Arrays.toString(categories)%>,
						plotBands: [{
							from: -100,
							to: 100,
							color: '#C0C0C0'
						}],
						labels:{
							style:{
								color:'black'
							}
						}
					},
					yAxis: {
						min: 0,
						max: 120,
						tickWidth:1,
						gridLineColor:'#747474',
						tickColor:'#747474',
						lineWidth:1,
						lineColor:'#747474',
						title: {
							text: ' '
						},
						labels:{
							style:{
								color:'black'
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'left',
						verticalAlign: 'bottom',
						x: 0,
						y: 0,
						borderWidth: 1,
						borderRadius: 0,
						shadow: false
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
							groupPadding: 0.11
						}
					},
				    series: [{
						type: 'column',
						name: 'in Planung',
						data: [0, 0, 0, 40, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null],
						color: '#0000FF'
					}, {
						type: 'column',
						name: 'Maßnahmen nicht erarbeitet',
						data: [0, 0, 1, 1, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null],
						color: '#FF0000'
					}, {
						type: 'column',
						name: 'Maßnahmen werden definiert',
						data: [27, 23, 22, 17, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null],
						color: '#FFFF00'
					}, {
						type: 'column',
						name: 'Maßnahmen definiert',
						data: [18, 20, 22, 25, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null],
						color: '#AAD42A'
					}, {
						type: 'column',
						name: 'i.O.',
						data: [10, 14, 15, 18, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null],
						color: '#008000'
					}, {
						type: 'spline',
						name: ' ',
						color: '#00FF00',
						data: [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]
					}, {
						type: 'spline',
						name: 'Prognose in Planung',
						color: '#0000FE',
						lineWidth:1,
						shadow:false,
						marker: {
							radius : 3
						},
						data: [55, 58, 60, 61, 65, 75, 90, 100, 102, 104, 105, 105, 106, 107, 107, 108, 109, 110, 110, 110, 110]
					}, {
						type: 'line',
						name: 'Ziel',
						color: '#993300',
						lineWidth:1,
						shadow:false,
						marker: {
							enabled: true,
							symbol : 'triangle',
							radius : 3
						},
						data: [110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110]
					}, {
						type: 'line',
						name: 'Prognose i.O.',
						color: '#008000',
						lineWidth:1,
						shadow:false,
						marker: {
							enabled: true,
							shadow:false,
							symbol : 'circle',
							radius : 3
						},
						data: [26, 28, 32, 42, 52, 63, 71, 80, 89, 93, 94, 95, 97, 98, 99, 100, 101, 102, 103, 104, 105]
					}, {
						data: [[1, 0], [1.0001, 2500]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					},{
						data: [[3, 0], [3.0001, 2500]],
						name :"PVS",
				//		color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						},marker: {
								symbol: 'url(../graphics/sun.png)'
							}

					},{
						data: [[5, 0], [5.0001, 2500]],
						name :"0-S",
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>OS</B>";
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
			<div id="top"><h1>4.3 Teilequalität ZP7 (HT/KT)</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
				<div style="width: 800px; margin: 0 auto;text-align: center;margin-top: 20px;">下面含有表格</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
