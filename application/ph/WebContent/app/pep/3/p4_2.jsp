<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title>Highcharts Example</title>

		<script type="text/javascript">
		
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'container',
						defaultSeriesType: 'bar'
					},
					title: {
						text: ''
					},
					xAxis: {
						categories: ['Aufbau (122/2)', 'Unterbau (98/5)', 'Seitenteil li. (24/5)', 'Seitenteil re. (24/5)', 'Tür vo. li. (21/5)', 'Tür vo. re. (21/3)', 'Tür hi. li. (21/5)', 'Tür hi. re. (21/2)', 'Frontklappe (14/1)', 'Rückwandklappe (21/3)', 'SAD Dach (13/2)', 'ZP5 Karo. (14/1)']
					},
					yAxis: {
						min: 0,
						title: {
							text: ''
						},
						stackLabels: {
							enabled: true,
							style: {
								fontWeight: 'bold',
								color: (Highcharts.theme && Highcharts.theme.textColor) || '#333333'
							}
						}
					},
					legend: {
						verticalAlign: 'bottom',
						borderColor: '#CCC',
						borderWidth: 1,
						shadow: false,
						backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
						reversed: true
					},
					tooltip: {
						formatter: function() {
								return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						series: {
							stacking: 'normal',
							dataLabels: {
								enabled: true,
								color: '#CCCCCC'
							}
						}
					},
				        series: [{
						name: 'AK: Abweichung Toleranz > 100 %',
						color: '#E63110',
						data: [2, 2, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0]
					}, {
						name: 'BK: 75% < Abweichung Toleranz < 100 ',
						color: '#F9A700',
						data: [10, 4, 5, 2, 5, 4, 4, 4, 6, 5, 5, 2]
					}, {
						name: 'i.O.: Abweichung Toleranz < 75 %',
						color: '#009C0E',
						data: [110, 91, 19, 23, 15, 17, 16, 17, 8, 16, 8, 13]
					}]
				});
				
				
			});
				
		</script>
		
	</head>
	<body>
		<div id="containerouter">
			<div id="nr">
			<div id="top"><h1>3.4 Funktionsmaße nach Bauteilen</h1></div>
			<div id="top1"><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zusammenbauteile (Anzahl FM/Anzahl Messungen)</h4></div>
			<div id="top2"><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gesamt: 414 Funktionsmaße</h5></div>
			<div id="content">
				<div id="container" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>		
	</body>
</html>
