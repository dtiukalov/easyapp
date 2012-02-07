<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<%@ include file="/app/pep/include/header.jsp"%>
		<title>Insert title here</title>

		<script type="text/javascript">
		
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'container',
						zoomType: 'column'
					},
					title: {
						text: 'Average Monthly Weather Data for Tokyo'
					},
					subtitle: {
						text: 'Source: WorldClimate.com'
					},
					xAxis: [{
						categories: ['kw1', 'kw2', 'kw3', 'kw4', 'kw5', 'kw6', 
							'kw7', 'kw8', 'kw9', 'kw10', 'kw11', 'kw12']
					}],
					
					yAxis: {
						allowDecimals: false,
						min: -200,
						max: 1200,
						title: {
							text: 'Number of fruits'
						}
					},
					
					tooltip: {
						formatter: function() {
							return this.series.name;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal'
						}
					},
					series: [
						{name: 'Fehlerzulauf',
						color: '#00235A',
						type: 'column',
						data: [850, 50, 150, 50, 140, 50, 100, 20, 100, 50, 10, 30]	
					}, {
						name: 'Fehlerablauf',
						color: '#009C0E',
						type: 'column',
						data: [0, -50, -120, -40, -240, -10, -100, -20, -180,-30, -20, -30]
					}, {
						name: 'Summe offener Fehler',
						color: '#0000FF',
						type: 'line',
						data: [800, 840, 900, 950, 1000, 960, 940, 850, 920, 700, 550, 50]
					}]
				});
				
				
			});
				
		</script>
</head>
<body>		
		<div id="containerouter">
			<div id="nr">
			<div id="top"><h1>2.3 Fehlerabbaustatus</h1></div>
			<div id="top1"><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VWXXX, KWXX, anlaufrelevante Fehler</h4></div>
			<div id="container" style="width: 800px; height: 400px; margin: 0 auto"></div>
			
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>