<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
					text: 'B-Fehler pro Fahrzeug'
				},
				xAxis: {
					categories: ['KW15','16','17','18','19','20']
				},
				yAxis: {
					min: 0,
					max: 12
				},
				tooltip: {
					formatter: function() {
						return '<b> - '+ this.x +'</b><br/>' +'- '+ this.y +'<br/>'+
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
				legend: {
						enabled: true
				},
			    series: [{
					name: 'Soll',
					data: [{ 
							y: 0, 
							low: 0,
							color: 'white'
						},{ 
							y: 2, 
							low: 8,
							color: '#009C0E'
						}, {
						 	y: 2, 
						 	low: 6,
							color: '#009C0E'
						}, {
							y: 3,
							low: 3,
							color: '#009C0E'
						}, {
							y: 2,
							low: 1,
							color: '#009C0E'
						}, { 
							y: 1, 
							low:0,
							color: '#009C0E'
						}]
				},{
					name: 'Projekt',
					data: [{ 
						y: 1, 
						low: 0,
						color: '#99CC00'
					}]
				},{
					name: 'Kaufteile',
					data: [{ 
						y: 1, 
						low: 1,
						color: '#AED4F8'
					}]
				},{
					name: 'Montage',
					data: [{ 
						y: 2, 
						low: 2,
						color: '#00235A'
					}]
				},{
					name: 'Lack',
					data: [{ 
						y: 2, 
						low: 4,
						color: '#0000FF'
					}]
				},{
					name: 'Karosseriebau',
					data: [{ 
						y: 2, 
						low: 6,
						color: '#AED4F8'
					}]
				},{
					name: 'Presswerk',
					data: [{ 
						y: 2, 
						low: 8,
						color: '#BBC2C5'
					}]
				}]
			});
		});
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top"><h1>3.5 Maßnahmen zur Abarbeitung der B-Fehler Audit ZP8</h1></div>	
				<div id="content">
					<div id="chart" style="width: 400px; height: 400px; margin: 0 auto; float: left;"></div>
					<div id="table" style="width: 400px; height: 400px; margin: 0 auto; float: left;">&nbsp;</div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
