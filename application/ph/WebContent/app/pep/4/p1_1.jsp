<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<script type="text/javascript">
		var chart1;
		var chart2;
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart1',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Anzahl Teile nach TEVON'
				},
				xAxis: {
					categories: ["Gesamt", "Nominiert", "Nicht<br>nominiert"], 
				},
				yAxis: {
					min: 0,
					max: 250,
					title: {
						text: ''
					},
					stackLabels: {
						enabled: true,
						style: {
							fontWeight: 'bold',
							color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
						}
					}
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
							enabled: true
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: [{ 
							y: 233, 
							low:0,
							color: '#CFD7D9'
						}, {
						 	y: 200, 
						 	low:33,
							color: '#333333'
						}, {
							y: 33,
							low:0,
							color: '#013C66'
						}]
				}]
			});
			
			chart2 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart2',
					defaultSeriesType: 'column'
				},
				title: {
					text: ' '
				},
				xAxis: {
					title: {
						text: 'Geplante Nominierungen'
					},
					categories: ["Kritische<br>Nominierungen", 'KW09', 'KW11', 'KW13', 'später'], 
				},
				yAxis: {
					min: 0,
					max: 20,
					title: {
						text: ''
					},
					stackLabels: {
						enabled: true,
						style: {
							fontWeight: 'bold',
							color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
						}
					}
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
							enabled: true
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: [{ 
							y: 15, 
							low:0,
							color: '#E53110'
						}, {
						 	y: 4, 
						 	low:11,
							color: '#E53110'
						}, {
							y: 6,
							low:5,
							color: '#E53110'
						}, {
						 	y: 4, 
						 	low:1,
							color: '#E53110'
						}, {
							y: 1,
							low:0,
							color: '#E53110'
						}]
				}]
			});
		});
		
		//, 
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>4.1 Nominierungen/Lieferantenstatus</h1></div>
			<div id="content">
				<div style="width: 50px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart1" style="width: 250px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart2" style="width: 600px; height: 400px; margin: 0 auto; float: left;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
