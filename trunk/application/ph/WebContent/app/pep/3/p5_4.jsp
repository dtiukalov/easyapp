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
						categories: ['KW  4', '5', '6', '7', '8', '9', '10', '11', '12', '13',  '14']
					},
					yAxis: {
						min: 0,
						max: 4000,
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
						type: 'column',
						name: 'aus Straßenfahrt',
						data: [200, 200, 200, 200, 200],
						color: '#4A6F8A'
					}, {
						type: 'column',
						name: 'Presswerk',
						data: [480, 500, 250, 250, 250],
						color: '#BBC2C5'
					}, {
						type: 'column',
						name: 'Karosseriebau',
						data: [500, 550, 250, 200, 220],
						color: '#AED4F8'
					}, {
						type: 'column',
						name: 'Kaufteil',
						data: [200, 200, 200, 200, 200],
						color: '#91AFFF'
					}, {
						type: 'column',
						name: 'Lack',
						data: [290, 220, 210, 240, 300],
						color: '#BBC2C5'
					}, {
						type: 'column',
						name: 'Montage',
						data: [1730, 1830, 1390, 1110, 1230],
						color: '#00235A'
					}, {
						type: 'spline',
						name: 'Prognose',
						data: [3500, 3500, 3400, 3300, 3200, 3000, 2500, 2500, 2500, 2250, 2000],
						color: '#027F01'
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
