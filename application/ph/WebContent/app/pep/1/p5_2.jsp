<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<%
			
			Map form = (Map)request.getAttribute("form");
			String kws = Web.getNumberListStr(form.get("fv9KWNo"));  
			String soll = Web.getNumberListStr(form.get("fv9ZP5NumSoll"));
			String sumSoll = Web.getSumNumberListStr(form.get("fv9ZP5NumSoll"));
			String ist = Web.getNumberListStr(form.get("fv9ZP5Numlst"));
			String sumIst = Web.getSumNumberListStr(form.get("fv9ZP5Numlst"));
			
		%>
		<script type="text/javascript">
		
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					zoomType: 'xy'
				},
				title: {
					text: 'Fahrzeugbauprogramm ZP5'
				},
				xAxis: {
					categories: <%=kws%>
				},
				yAxis: {
					title: {
						text: 'Anzahl Fzg.',
						
						style: {
							color: '#333333'							
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
					spline: {
						dataLabels: {
							enabled: true
						},
						enableMouseTracking: true
					},
					column: {
						dataLabels: {
							enabled: true
						},
						enableMouseTracking: true
					}
				},
				series: [{
					type: 'column',
					name: 'Soll',
					color: '#009C0E',
					data: <%=soll%>
				},{
					type: 'column',
					name: 'lst',
					color: '#0000FF',
					data: <%=ist%>
				}, {
					type: 'spline',
					name: 'Kum Soll',
					color: '#009C0E',
					data: <%=sumSoll%>
				}, {
					type: 'spline',
					name: 'Kum lst',
					color: '#0000FF',
					data: <%=sumIst%>
				}]
			});
		});
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>1.5 Fahrzeugaufbaustatus</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
