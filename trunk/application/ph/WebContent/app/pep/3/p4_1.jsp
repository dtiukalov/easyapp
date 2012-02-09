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
						//lineWidth:1,
						tickLength: 0,
						//lineColor:'black',
						title: {
							text: ' '
						},
						labels: {
					//		rotation: -45,
					//		align: 'right',
							style: {
								 padding:'5px',
								 font: 'normal 12px Verdana, sans-serif'
							}
						},
						categories: ['36', '37', '41', '42', '43', '44', '46', '2', '3', '4', '8', '9', '10', '11', ' ', 'Prognose zu Meilenstein XXX']
					},
					yAxis: {
						min: 0,
						max: 100,
						showLastLabel: true,
						//gridLineWidth: 0,
						//lineWidth:1,
						//lineColor:'black',
						title: {
							text: 'Anzahl',
							style: {
								 padding:'5px',
								 font: 'normal 14px Arial, sans-serif',
								 fontWeight: 'bold'
							}}
					},
					/* legend: {
						layout: 'vertical',
						align: 'right',
						x: 0,
						verticalAlign: 'top',
						y: 0,
						floating: true,
						backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
						borderColor: '#CCC',
						borderWidth: 1,
						shadow: false
					}, */
					legend:{
						layout: 'vertical',
						align: 'center',
						verticalAlign: 'bottom',
						x: 0,
						y: 0,
						width: 270
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
							borderColor: 'black',
							borderWidth: 1,
							dataLabels: {
								enabled: true,
								style : {
									fontWeight: 'bold',
									fontSize:'10px'
								},
								color: 'black'
							}
						}
					},
				    series: [{
						name: 'AK: Abweichung Toleranz > 100 %',
						color: '#E63110',
						data: [33, 30, 22, 14, 13, 7, 6, 4, 3, 2, 1, 1, null, null, null, 1]
					}, {
						name: 'BK: 75% < Abweichung Toleranz < 100 %',
						color: '#F9A700',
						data: [13, 12, 14, 14, 13, 10, 11, 12, 11, 10, 10, 8, null, null, null, 4]
					}, {
						name: 'i.O.: Abweichung Toleranz < 75 %',
						color: '#009C0E',
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'10px'
							},
							color: 'white'
						},
						data: [54, 58, 64, 72, 74, 83, 83, 84, 86, 88, 89, 91, null, null, null, 95]
					}, {
						type: 'spline',
						name: 'Zielwert',
						color: '#FF0000',
						data: [70, 80, 80, 80, 80, 80, 90, 90, 90, 90, 90, 90, 90, 90, null, null],
						marker: {
							enabled: false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#FFFF00',
						dashStyle: 'dash',
						data: [null, null, null, null, null, null, null, null, null, null, null, 92, 92, 94, 95, 100],
						marker: {
							enabled: false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
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
				<div id="chart" style="width: 800px; height: 450px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
