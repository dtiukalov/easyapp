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
						categories: ['KW  4', '5', '6', '7', '8', '9', '10', '11', '12', '13',  '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',  '24']
					},
					yAxis: {
						min: 0,
						max: 260,
						title: {
							text: 'Punkte'
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
						name: 'Prognose',
						data: [275,265,242,227,210,190,170,165,165,110],
						color: '#00235A'
					}, {
						type: 'spline',
						name: 'Presswerk',
						data: [260,245,235,220,200,180,160,160,160,100,85,75,65,60,60,55,55,50,50,45,45],
						color: '#99FF99'
					}, {
						type: 'spline',
						name: 'Konzernziel',
						data: [80,80,80,80,80,60,60,60,60,60,35,35,35,35,35,35,35,25,25,25,25],
						color: '#E63110'
					}]
				});
			});
			
			
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>3.5 Audit ZP8 – Gewerk: Presswerk</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
