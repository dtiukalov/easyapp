<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<style type="text/css">
			#left{
				width: 400px; height: 500px; margin: 0 auto; float: left;
			}
			#left chart{
				width: 400px; height: 400px; margin: 0 auto; float: left;
			}
			#left time{
				width: 400px; height: 100px; margin: 0 auto; float: left;
			}
			#right {
				width: 400px; height: 500px; margin: 0 auto; float: left;margin-left: 10px;
			}
			#right legend {
				width: 400px; height: 100px; margin: 0 auto; float: left; padding-left: 10px;
			}
		</style>
		<script type="text/javascript">
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'column'
					},
					title: {
						text: ' '
					},
					xAxis: {
						categories: ['TBT VFF', 'Beginn VFF', 'Ende VFF', 'Beginn PVS', 'Beginn 0-S', 'Beginn SOP']
						
					},
					yAxis: {
						min: 0,
						title: {
							text: ' '
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
						enabled: false,
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
								enabled: false,
								color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
							}
						}
					},
				    series: [{
						name: 'Teile aus Serienwerkzeug',
						data: [33, 32, 4, 0, 0, 0],
						color: '#CCFFCC'
					}, {
						name: 'Note 3',
						data: [2, 3, 30, 27, 0, 0],
						color: '#00FF00'
					}, {
						name: 'Note 1',
						data: [1, 1, 2, 9, 36, 36],
						color: '#003300'
					}, {
						name: 'Note 6',
						data: [0, 0, 0, 0, 0, 0],
						color: '#FF0000'
					}]
				});
			});
				
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top"><h1>4.3 Teileverfügbarkeit fuer KT von ZP7</h1></div>
				<div id="left">
					<div id="chart"></div>
					<div id="time"><img src="/ph/app/pep/4/bottom.jpg" width="400" height="70"></div>
				</div>
				<div id="right">
					<div id="legend" style="margin-top: 40px;">
						<li><img src="/ph/app/pep/images/legend_lightgreen.png" width="13" height="13">
						&nbsp;Teile aus Serienwerkzeug
						<li><img src="/ph/app/pep/images/legend_green.png" width="13" height="13">
						&nbsp;Note 3
						<li><img src="/ph/app/pep/images/legend_black.png" width="13" height="13">
						&nbsp;Note 1
						<li><img src="/ph/app/pep/images/legend_red.png" width="13" height="13">
						&nbsp;Note 6
					</div>
					<table width="100%" style="margin-top: 30px;">
						<tr>
							<td colspan="4" style="text-align: left;font-weight: bolder; height: 36px;border-bottom: 1px solid;">Top</td>
						</tr>
						<tr>
							<td width="34%" style="font-weight: bolder;height: 36px;border-bottom: 2px solid;">Kritische Umfänge</td>
							<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">Einzelteile</td>
							<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">VSI N3</td>
							<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">VSI N1</td>
						</tr>
						<%
							for(int i=0; i<6; i++) {
						%>		
						<tr>
							<td style="height: 36px;border-bottom: 1px solid;">FK aussen</td>
							<td style="text-align: center;border-bottom: 1px solid;">1</td>
							<td style="text-align: center;border-bottom: 1px solid;">KW16_12</td>
							<td style="text-align: center;border-bottom: 1px solid;">KW30_12</td>
						</tr>
						<%
						}
						%>
					</table>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
