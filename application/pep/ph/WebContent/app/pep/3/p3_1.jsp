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
						text: 'Baubarkeit Gesamtfahrzeug'
					},
					subtitle: {
						text: 'Anzahl Produktionsgerechter Baubarkeit aus VDSwin'
					}, 
					xAxis: {
						title: {
							text: 'Kalenderwoche'
						},
						categories: ['25-2007', '26-2007', '27-2007', '...', '50-2007', '51-2007', '52-2007', '1-2008', '...', '8-2008']
					},
					yAxis: {
						min: 0,
						max: 300,
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
						align: 'right',
						x: 0,
						verticalAlign: 'bottom',
						y: 10,
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
								color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
								formatter: function() {
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						name: 'red',
						color: '#E63110',
						data: [74, 70, 65, 65, 60, 60, 50, 20, 20, 0]
					}, {
						name: 'yellow',
						color: '#F9A700',
						data: [90, 90, 85, 85, 85, 85, 70, 70, 50, 55]
					}, {
						name: 'green',
						color: '#009C0E',
						data: [130, 134, 144, 144, 149, 149, 174, 194, 214, 229]
					}]
				});
				
				
			});
				
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
