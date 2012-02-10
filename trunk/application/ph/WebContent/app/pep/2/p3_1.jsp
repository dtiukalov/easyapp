<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<%
			Map value = new HashMap();
			String[] categories = new String[48];
			int[] a = new int[48];
			int[] b = new int[48];
			int[] c = new int[48];
			
			for(int i=0; i<48; i++) {
				categories[i] = i+5 + "";
				a[i] = 200;
				b[i] = 620;
				c[i] = 120;
			}
			
		%>
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'column'
					},
					title: {
						text: 'Softwarefehlerentwicklung'
					},
					subtitle: {
						text: 'VWXXX, KWXX, anlaufrelevante offene Fehler'
					}, 
					xAxis: {
						title: {
							text: 'Kalenderwoche'
						},
						categories: <%=Arrays.toString(categories)%>
					},
					yAxis: {
						min: 0,
						max: 1200,
						title: {
							text: 'Anzahl Probleme'
						},
						stackLabels: {
							enabled: false,
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
								enabled: false,
								color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
							}
						}
					},
				    series: [{
						name: 'C-Fehler',
						color: '#FFFF00',
						data: <%=Arrays.toString(c)%>
					}, {
						name: 'B-Fehler',
						color: '#FF6A00',
						data: <%=Arrays.toString(b)%>
					}, {
						name: 'A-Fehler',
						color: '#FF0000',
						data: <%=Arrays.toString(a)%>
					}]
				});
				
				
			});
				
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.3 Softwarefehlerentwicklung  (图片)</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
