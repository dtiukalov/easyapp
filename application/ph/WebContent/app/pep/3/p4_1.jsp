<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE HTML>
<%
	Map form = (Map)request.getAttribute("form");

	String fv9KWNo = "['36', '37', '41', '42', '43', '44', '46', '2', '3', '4', '8', '9', '10', '11', ' ', 'Prognose zu Meilenstein XXX']";	
	String fv9FunktionSmall75 = "[33, 30, 22, 14, 13, 7, 6, 4, 3, 2, 1, 1, null, null, null, 1]";	//AK
	String fv9FunktionSmall100 = "[13, 12, 14, 14, 13, 10, 11, 12, 11, 10, 10, 8, null, null, null, 4]";	//BK
	String fv9FunktionBig100 = "[54, 58, 64, 72, 74, 83, 83, 84, 86, 88, 89, 91, null, null, null, 95]";	//i.O
%>

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
						defaultSeriesType: 'column',
						marginTop:120
					},
					title: {
						text: 'In Prozent',
						style:{
							color:'black'
						},
						align:'left'
					},
					subtitle: {
						text: ' '
					}, 
					xAxis: {
						lineWidth:1,
						tickLength: 0,
						lineColor:'black',
						title: {
							text: ' '
						},
						labels: {
					//		rotation: -45,
					//		align: 'right',
							style: {
								 padding:'5px',
								 fontSize: '14px',
								 color:'black'
							}
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						max: 100,
						lineWidth:1,
						lineColor:'black',
						showLastLabel: true,
						gridLineWidth: 0,
						labels:{
							style:{
								color:'black',
								fontSize:'12px'
							}
						},
						title: {
							text: '',
							style: {
								 padding:'5px',
								 font: 'normal 14px Arial, sans-serif',
								 fontWeight: 'bold'
							}}
					},
					legend:{
						borderWidth:0,
						layout: 'vertical',
						align: 'center',
						verticalAlign: 'top',
						x: 250,
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
						data:  <%=fv9FunktionSmall75%>
					}, {
						name: 'BK: 75% < Abweichung Toleranz < 100 %',
						color: '#F9A700',
						data:  <%=fv9FunktionSmall100%>
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
						data:  <%=fv9FunktionBig100%>
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
				<div id="chart" style="width: 800px; height: 500px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
