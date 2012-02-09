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
					tickLength: 0,
					lineColor: 'black',
					categories: ['KW15','16','17','18','19','20'],
					labels: {
							style: {
								 padding:'10px',
								 font: 'normal 12px Verdana, sans-serif',
								 color: 'black'
							}
					}
				},
				yAxis: {
					gridLineWidth: 0,
					labels: {
						enabled:false
					},
					title: {
						text:""
					}
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
						borderColor:'black',
						borderWidth:1,
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
				legend: {
					layout: 'vertical',
					enabled: true,
					borderWidth:1
				},
			    series: [{
					name: 'Soll',
					showInLegend: false,
					data: [{ 
							y: 0, 
							low: 0,
							color: '#009C0E'
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
						}],
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'10px'
							},
							color: 'white'
						}
				},{
					name: 'Presswerk',
					color: '#BBC2C5',
					data: [{ 
						y: 2, 
						low: 8
					}]
				},{
					name: 'Karosseriebau',
					color: '#AED4F8',
					data: [{ 
						y: 2, 
						low: 6
					}]
				},{
					name: 'Lack',
					color: '#0000FF',
					data: [{ 
						y: 2, 
						low: 4
					}]
				},{
					name: 'Montage',
					color: '#00235A',
					data: [{ 
						y: 2, 
						low: 2
					}]
				},{
					name: 'Kaufteile',
					color: '#AED4F8',
					data: [{ 
						y: 1, 
						low: 1
					}]
				},{
					name: 'Projekt',
					color: '#98CB00',
					data: [{ 
						y: 1, 
						low: 0
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
					<div id="chart" style="width: 400px; height: 500px; margin: 0 auto; float: left;"></div>
					<div id="table" style="width: 400px; height: 400px; margin: 0 auto; float: left;">&nbsp;</div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
