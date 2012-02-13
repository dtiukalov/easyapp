<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>3.5 Nacharbeit Abbaustatus</title>
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
						lineWidth:2,
						lineColor:'black',
						tickColor:'black',
						labels: {
							y:25,
							style: {
								color:'black'
							}
						},
						categories: ['4', '5', '6', '7', '8', '9', '10', '11', '12', '13',  '14']
					},
					yAxis: {
						min: 0,
						max: 4000,
						lineWidth:2,
						gridLineWidth: 0,
						tickWidth:2,
						tickColor:'black',
						lineColor:'black',
						title: {
							rotation:0,
							text: 'Nacharbeitszeit [min]',
							x:-12,
							y:-180,
							style: {
								color:'gray',
								fontSize:'12px'
							}
						},
						labels: {
							style: {
								color:'black'
							}
						},
						stackLabels: {
							enabled: true,
							y:-15,
							style: {
								fontWeight: 'bold',
								color: 'black',
								fontSize:'10px'
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 60,
						borderWidth: 0,
						shadow:false
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
							shadow: false,
							borderColor:'black',
							borderWidth:0,
							dataLabels: {
								enabled: true,
								style : {
									fontWeight: 'bold',
									fontSize:'10px'
								},
								color: 'white'
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
						color: '#BBC2C5',
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'8px'
							},
							color: 'black'
						}
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
						color: '#A6DD00',
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
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
			<div id="top"><h1>3.5 Nacharbeit Abbaustatus</h1></div>
			<div id="content">
				<div id="chart" style="width: 950px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
