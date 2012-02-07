<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%
	Map<String, String> form = new HashMap<String, String>();//(Map<String, String>)request.getAttribute("form");
	form.put("fv9ReportMeil","ReportMeil");form.put("fv9ReportDept","ReportDept");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts2.1.9/highcharts.src2.1.4.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css"></link>
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<title>Insert title here</title>

		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'column'
					},
					title: {
						text: 'Anzahl Änderungen'
					},
					xAxis: [{
						categories: ['40', '42', '43', '44', '45', '46', '47', '48', '49']
						
					},{ // mirror axis on right side
						opposite: true,
						reversed: false,
						categories: [0,1,2,1,5,0,5,1,0],
						linkedTo: 0,
						title: {
							text: '2011 Anzahl neuer ÄKOs'
						}
					}],
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
						enabled: true,
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 100,
						backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
						borderWidth: 1,
						borderColor: '#CCC',
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
								enabled: true,
								color:  '#333333'
							}
						}
					},
				    series: [
				     {
						name: 'ÄKO,AeA  im Durchlauf (> 2 Wochen)',
						data: [1,1,1,0,0,0,0,2,1,0],
						color: '#E63110'
					}, {
						name: 'ÄKO,AeA im Durchlauf (< 2 Wochen)',
						data: [1,2,2,1,1,0,5,3,3,4],
						color: '#F9A700'
					},{
						name: 'ÄKO,AeA Vorschau',
						data: [0,0,0,0,0,0,0,0,0,0],
						color: 'white'
					},{
						name: 'ÄKO,AeA abgeschlossen',
						data: [5,5,7,10,15,16,16,17,18,18],
						color: '#009C0E'
					},{
						name: 'Prognosen',
						data: [],
						color: '#99FF99'
					}]
				});
		});
		</script>
</head>
<body>		
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.4 Status ÄKO </h1></div>
			<div id="chart" style="width: 800px; height: 400px; margin: 0 auto;"></div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>