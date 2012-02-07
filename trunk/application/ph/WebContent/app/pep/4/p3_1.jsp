<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
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
						categories: ['05/2009', '06/2009', '...', '53/2009', '01/2010', '...', '03/2010', '...', '...', '...',  '...', '...', '...', '53/2010'],
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
						name: 'ohne B-Freigabe',
						data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 331],
						color: '#FF7F80'
					}, {
						type: 'column',
						name: 'ohne EMT(B-Frei)',
						data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 881],
						color: '#087BFA'
					}, {
						type: 'column',
						name: ' ',
						data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1150],
						color: '#FFFFFF'
					}, {
						type: 'column',
						name: 'Note 6',
						data: [10, 20, 30, 40, 50, 60, 70, 0, 0, 0, 0, 0, 0],
						color: '#FF0200'
					}, {
						type: 'column',
						name: 'In Arbeit',
						data: [30, 40, 50, 60, 90, 120, 130, 0, 0, 0, 0, 0, 0],
						color: '#00049E'
					}, {
						type: 'column',
						name: 'Note 3',
						data: [30, 50, 70, 82, 94, 100, 102, 0, 0, 0, 0, 0, 0],
						color: '#FFFF00'
					}, {
						type: 'column',
						name: 'Note 1',
						data: [600, 602, 603, 630, 630, 650, 700, 0, 0, 0, 0, 0, 0],
						color: '#027F01'
					}, {
						type: 'spline',
						name: 'Note 1-Termin',
						color: '#19FA0A',
						data: [830, 902, 950, 1000, 1030, 1050, 1087, 1100, 1150, 1300, 1300, 1300, 1300]
					}, {
						type: 'spline',
						name: 'EM-Termin',
						color: '#91A7D0',
						data: [800, 830, 902, 950, 1000, 1030, 1050, 1087, 1100, 1150, 1150, 1150, 1150]
					}, {
						type: 'spline',
						name: 'Prognose EM-Elngang',
						color: '#000000',
						data: [840, 952, 970, 1170, 1230, 1250, 1297, 1330, 1350, 1480, 1480, 1480, 1480]
					}, {
						type: 'spline',
						name: 'Prognose Freigabe',
						color: '#000000',
						dashStyle: 'shortdot',
						data: [820, 932, 950, 1070, 1130, 1150, 1287, 1500, 1650, 1780, 1780, 1780, 1780]
					}, {
						type: 'spline',
						name: 'Zu bemustem',
						color: '#000000',
						data: [3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000]
					},{
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
						name :"OS",
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
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
