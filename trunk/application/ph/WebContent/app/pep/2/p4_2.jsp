<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts2.1.9/highcharts.src2.1.4.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">

		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			var highs = [22, 4, 0, 5, 13, 18, 17, 1, 0, 0, 0],
				lows = [0, 18, 0, 13, 0, 0, 1, 1, 0, 0, 0],
				colors = ['#0000FF', '#FFCC00', '#339966', '#339966', '#339966', '#0000FF', 
								'#00FF00', '#00CCFF', '#00CCFF', '#00CCFF', '#00CCFF'],
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Anzahl Änderungen'
				},
				xAxis: {
					categories: ['Gesamt', 'Planungs durchlauf', 'Status 485', 'Status 487/496', 'Status 800', 
								'genehmigt/<br>techn.i.O.', 'VFF', 'PVS', '0-Serie', 'SOP', 'Offen']
				},
				yAxis: {
					min: 0,
					max: 25,
					title: {
						text: ''
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
					align: 'right',
					x: -100,
					verticalAlign: 'top',
					y: 20,
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
							enabled: true
						}
					}
				},
			    series: [{
					name: 'Anzahl Änderungen',
					data: [{ 
							y: highs[0], 
							low: lows[0],
							color: colors[0]
						}, {
						 	y: highs[1], 
						 	low: lows[1],
							color: colors[1]
						}, {
							y: highs[2],
							low: lows[2],
							color: colors[2]
						}, {
							y: highs[3],
							low: lows[3],
							color: colors[3]
						}, { 
							y: highs[4], 
							low:lows[4],
							color: colors[4]
						}, {
						 	y: highs[5], 
						 	low: lows[5],
							color: colors[5]
						}, {
							y: highs[6],
							low: lows[6],
							color: colors[6]
						}, {
							y: highs[7],
							low: lows[7],
							color: colors[7]
						}, { 
							y: highs[8], 
							low: lows[8],
							color: colors[8]
						}, {
						 	y: highs[9], 
						 	low: lows[9],
							color: colors[9]
						}, {
							y: highs[10],
							low: lows[10],
							color: colors[10]
						}]
				}]
			});
		});
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.4 ÄKO-Umsetzungsstatus (Genehmigungsstand)</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
