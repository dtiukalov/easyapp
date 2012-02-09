<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
						categories: ['Aufbau (122/2)', 'Unterbau (98/5)', 'Seitenteil li. (24/5)', 'Seitenteil re. (24/5)', 'Tür vo. li. (21/5)', 'Tür vo. re. (21/3)', 'Tür hi. li. (21/5)', 'Tür hi. re. (21/2)', 'Frontklappe (14/1)', 'Rückwandklappe (21/3)', 'SAD Dach (13/2)', 'ZP5 Karo. (14/1)']
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
								color: 'black'
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
						backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
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
									fontSize:'8px'
								},
								color: 'black'
							}
						}
					},
				        series: [{
						name: 'AK: Abweichung Toleranz > 100 %',
						color: '#E63110',
						data: [2, 2, 5, 4, 2, 6, 2, 4, 3, 4, 4, 5]
					}, {
						name: 'BK: 75% < Abweichung Toleranz < 100 ',
						color: '#F9A700',
						data: [10, 4, 5, 2, 5, 4, 4, 4, 6, 5, 5, 2]
					}, {
						name: 'i.O.: Abweichung Toleranz < 75 %',
						color: '#009C0E',
						data: [110, 91, 19, 23, 15, 17, 16, 17, 8, 16, 8, 13],
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'10px'
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
