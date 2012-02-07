<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts2.1.9/highcharts.src2.1.4.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">

		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
		
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Fehlerpunkte/Fahrzeug'
				},
				xAxis: [{
					categories: ['KW15','16','17','18','19','20']
				},{ // mirror axis on right side
						opposite: true,
						reversed: false,
						categories: ['(2,1)','','','','','(1,5)'],
						linkedTo: 0,
						title: {
							text: '2011 Anzahl neuer ÄKOs'
						}
				}],
				yAxis: {
					min: 0,
					max: 700,
					dataLabels: {
						enabled: true,
						color: '#333333'
					}
				},
				tooltip: {
					formatter: function() {
						return '<b> - '+ this.x +'</b><br/>' +'- '+ this.y +'<br/>'+
							 'Total: '+ this.point.stackTotal;
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						dataLabels: {
							enabled: true,
							color: '#333333'
						}
					}
				},
				legend: {
						enabled: true
				},
			    series: [{
					name: 'Soll',
					data: [{ 
							y: 0, 
							low: 0,
							color: 'white'
						},{ 
							y: 45, 
							low: 644,
							color: '#009C0E'
						}, {
						 	y: 64, 
						 	low: 580,
							color: '#009C0E'
						}, {
							y: 68,
							low: 512,
							color: '#009C0E'
						}, {
							y: 32,
							low: 480,
							color: '#009C0E'
						},{ 
							y: 0, 
							low:0,
							color: 'white'
						}]
				},{
					name: 'Projekt',
					data: [{ 
							y: 40, 
							low: 0
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 40, 
							low: 0
						}],
					color: '#99CC00',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Kaufteile',
					data: [{ 
							y: 119, 
							low: 40
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 40, 
							low: 40
						}],
					color: '#AED4F8',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Montage',
					data: [{ 
							y: 120, 
							low: 159
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 80
						}],
					color: '#00235A',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Lack',
					data: [{ 
							y: 130, 
							low: 279
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 180
						}],
					color: '#0000FF',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Karosseriebau',
					data: [{ 
							y: 150, 
							low: 409
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 280
						}],
					color: '#AED4F8',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Presswerk',
					data: [{ 
							y: 130, 
							low: 559
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 380
						}],
					color: '#BBC2C5',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				}]
			});
		});
		</script>
		
	</head>
	
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>3.5 Maßnahmen zur Verbesserung der Audit-Ergebnisse</h1></div>
			
			<div id="content">
				<div id="chart" style="width: 500px; height: 400px; margin: 0 auto;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
