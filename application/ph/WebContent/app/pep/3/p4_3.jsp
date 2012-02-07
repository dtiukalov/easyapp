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
					text: 'Gesamt: 414 Funktionsmaße'
				},
				xAxis: {
					categories: ['In Toleranz', '<0,5 mm', '<1,0 mm', '<1,5 mm', '<2,0 mm', '>2,0 mm']
				},
				yAxis: {
					min: 0,
					max: 450
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
							enabled: true
						}
					}
				},
				legend: {
						enabled: false
				},
			    series: [{
					name: 'Anzahl Änderungen',
					data: [{ 
							y: 20, 
							low: 352,
							color: '#F9A700'
						}, {
						 	y: 23, 
						 	low: 372,
							color: '#E63110'
						}, {
							y: 13,
							low: 395,
							color: '#E63110'
						}, {
							y: 4,
							low: 408,
							color: '#E63110'
						}, { 
							y: 1, 
							low:412,
							color: '#E63110'
						}, {
						 	y: 1, 
						 	low: 413,
							color: '#E63110'
						}]
				},{
					name: ' ',
					data: [{ 
						y: 352, 
						low: 0,
						color: '#009C0E'
					}]
				}]
			});
		});
		</script>
		
	</head>
	
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>3.4 Funktionsmaße außerhalb der Toleranz</h1></div>
			<div id="top1"><h5>Gesamt: 414 Funktionsmaße</h5></div>
			
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
