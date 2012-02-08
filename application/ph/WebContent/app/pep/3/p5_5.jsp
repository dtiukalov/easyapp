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
					symbols: ['triangle-down'],
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'column'
					},
					title: {
						text: ' '
					},
					xAxis: {
						categories: [46,47,48,49,50,51,52,53,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,19,20,21,22,23]
						
					},
					yAxis: {
						min: 0,
						max: 6,
						title: {
							text: 'Nacharbeitszeit [min]'
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
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 100,
						borderWidth: 0
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
								enabled: true,
								color: 'white',
								font: 'normal 10px  Verdana'
							}
						}
					},
				    series: [{
						type: 'line',
						name: 'Konzernziel Audit mit NA',
						data: [0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,2.3,2.3,2.3,2.3,2.3,2.3,2.3,2.3,2.3,2.3,1.5,1.5],
						color: '#F9A700'
					}, {
						type: 'line',
						name: 'TargetPrognose',
						data: [6,5.8,5.6,5.4,5.2,5,4.5,4.1,3.8,3.8,3.6,3.6,3.4,3.4,3.4,3.2,3.2,3.2,2.9,2.9,2.9,2.4,2.4,2.4,1.9,1.8,1.7,1.6],
						color: '#99FF99'
					}, {
						name: 'Audit-Erstangebot',
						data: [5.6,5.3,5.2,5,5.4,4.9,4,3.7,3.7,3.6,3.6,3,3,2.9,2.5,2.8,0,0,0,0,0,0,0,0,0,0,0,0],
						color: '#AED4F8'
					}, {
						type: 'scatter',
						name: 'Audit-Zweitangebot',
						data: [4.2,4,4.2,3.9,3.9,4.9,3.5,3.2,2.7,2.9,2.7,3,2.6,2.6,1.9,2.8,0,0,0,0,0,0,0,0,0,0,0,0],
						color: '#4A6F8A'
					},{
						type: 'line',
						data: [[1,0.5],[1,1.5]],
						showInLegend: false,
						color: 'black'
					}, {
						type: 'line',
						data: [[3,0.5],[3,3.5]],
						showInLegend: false,
						color: 'black'
					}, {
						type: 'line',
						data: [[2,3.5],[2,4.5]],
						showInLegend: false,
						color: 'black'
					}, {
						type: 'line',
						data: [[0,3.5],[0,4.5]],
						showInLegend: false,
						color: 'black'
					}]
				});
			});
			
			
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>3.5 Nacharbeit Abbaustatus</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
