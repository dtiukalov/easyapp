<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE HTML>
<html>

	<%
		Map<String, Object> form = new HashMap<String, Object>();//(Map<String, String>)request.getAttribute("form");

		form.put("fv9Genehmigt", 300);
		form.put("fv9PPCOP", 120);
		form.put("fv9PPErste", 70);
		form.put("fv9PPNicht", 110);
		
		Integer fv9PPCOP = (Integer)form.get("fv9PPCOP");
		Integer fv9PPErste = (Integer)form.get("fv9PPErste");			
		Integer fv9PPNicht = (Integer)form.get("fv9PPNicht");
		Integer fv9Genehmigt = fv9PPCOP + fv9PPErste + fv9PPNicht;			
		form.put("fv9ReportDept", "Vorserienlogistik");
	%>
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
					text: 'Modellpflegepunkte'
				},
				xAxis: {
					categories: ["Genehmigt MOP-Punkte zum ...(Fahrzeug)", "PP COP, Ersteinsatz in anderen Projekten", "PP Ersteinsatz...(Fahrzeug)", "PP nicht relevant oder Steuerungspunkte"] 
				},
				yAxis: {
					min: 0,
					max: 350,
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
				legend: {
					align: 'right',
					x: -100,
					verticalAlign: 'top',
					y: 20,
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
							enabled: true
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: [{  
							y: <%=fv9Genehmigt %>,
							low:0,
							color: '#0000FF'
						}, {
						 	y: <%=fv9PPCOP %>,
						 	low:0,
							color: '#AED4F8'
						}, {
							y: <%=fv9PPErste %>,
							low: <%=fv9PPCOP %>,
							color: '#AED4F8'
						}, {
							y: <%=fv9PPNicht %>,
							low: <%=fv9PPCOP + fv9PPErste %>,
							color: '#AED4F8'
						}]
				}]
			});
		});
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>1.5 Programmpunkte</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
