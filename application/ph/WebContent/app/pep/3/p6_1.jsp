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
						categories: <%=Arrays.toString(categories)%>,
						plotBands: [{ // Light air
							from: 0,
							to: 3,
							color: 'rgba(68, 170, 213, 0.1)',
							label: {
								text: 'PVS',
								style: {
									color: '#606060',
									font: 'normal 15px Verdana, sans-serif'
								},
								y : 290
							}
						}, { // Light breeze
							from: 3,
							to: 5,
							color: '#EFEFEF',
							label: {
								text: '0S',
								style: {
									color: '#606060',
									left: '40px',
									top: '100px',
									font: 'normal 15px Verdana, sans-serif'
								},
								y : 290
								
							}
						}, { // Light breeze
							from: 5,
							to: 7,
							color: 'rgba(68, 170, 213, 0.1)',
							label: {
								text: 'TPPA',
								style: {
									color: '#606060',
									font: 'normal 15px Verdana, sans-serif'
								},
								y : 290
							}
						}, { // Light breeze
							from: 7,
							to: 9,
							color: '#EFEFEF',
							label: {
								text: 'SOP',
								style: {
									color: '#606060',
									font: 'normal 15px Verdana, sans-serif'
								},
								y : 290
							}
						}]
					},
					yAxis: {
						min: 0,
						max: 120,
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							style: {
								fontWeight: 'bold',
								color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
							}
						}
					},
					legend: {
						enabled: true,
						align: 'center',
						x: 0,
						verticalAlign: 'top',
						y: 0,
						floating: true,
						backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
						borderColor: '#CCC',
						borderWidth: 1,
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
							dataLabels: {
								enabled: false,
								color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
							}
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
						color: '#9E6943'
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
						color: '#0000FF',
						data: [55, 58, 60, 61, 65, 75, 90, 100, 102, 104, 105, 105, 106, 107, 107, 108, 109, 110, 110, 110, 110]
					}, {
						type: 'spline',
						name: 'Ziel',
						color: '#993300',
						data: [110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110, 110]
					}, {
						type: 'spline',
						name: 'Prognose i.O.',
						color: '#008000',
						dashStyle: 'shortdot',
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
