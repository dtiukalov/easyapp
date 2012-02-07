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
						renderTo: 'chart',
						defaultSeriesType: 'column'
					},
					title: {
						text: 'In Prozent'
					},
					subtitle: {
						text: ' '
					}, 
					xAxis: {
						title: {
							text: ' '
						},
						categories: ['36', '37', '41', '42', '43', '44', '46', '2', '3', '4', '8', '9', '10', '11', ' ', 'Prognose zu Meilenstein XXX']
					},
					yAxis: {
						min: 0,
						max: 100,
						title: {
							text: 'Anzahl'
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
								enabled: true,
								color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
							}
						}
					},
				    series: [{
						name: 'AK',
						color: '#E63110',
						data: [33, 30, 22, 14, 13, 7, 6, 4, 3, 2, 1, 1, null, null, null, 1]
					}, {
						name: 'BK',
						color: '#F9A700',
						data: [13, 12, 14, 14, 13, 10, 11, 12, 11, 10, 10, 8, null, null, null, 4]
					}, {
						name: 'i.O.',
						color: '#009C0E',
						data: [54, 58, 64, 72, 74, 83, 83, 84, 86, 88, 89, 91, null, null, null, 95]
					}, {
						type: 'spline',
						name: 'Zielwert',
						color: '#FF0000',
						data: [70, 80, 80, 80, 80, 80, 90, 90, 90, 90, 90, 90, 90, 90, null, null]
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#FFFF00',
						dashStyle: 'dash',
						data: [null, null, null, null, null, null, null, null, null, null, null, 92, 92, 94, 95, 100]
					}, {
						data: [[1.5, 0], [1.5001, 2500]],
						name :"VFF",
						color: '#000000',
						dashStyle: 'dash',
						lineWidth: 2,
						showInLegend: false,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}, {
						data: [[6.5, 0], [6.5001, 2500]],
						name :"PVS",
						color: '#000000',
						dashStyle: 'dash',
						lineWidth: 2,
						showInLegend: false,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}, {
						data: [[13.5, 0], [13.5001, 2500]],
						color: '#000000',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0S",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0S</B>";
							}
						}
					}, {
						data: [[14.5, 0], [14.5001, 2500]],
						name :"SOP",
						color: '#000000',
						dashStyle: 'dash',
						lineWidth: 2,
						showInLegend: false,
						marker: {enabled: false},
						shadow: false,
						enableMouseTracking: false,
						type: 'line',
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>SOP</B>";
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
			<div id="top"><h1>3.4 Funktionsmaße</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
