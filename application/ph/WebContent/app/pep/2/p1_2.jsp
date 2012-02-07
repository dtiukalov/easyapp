<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<%
	Map<String, String> form = new HashMap<String, String>();//(Map<String, String>)request.getAttribute("form");
	form.put("fv9ReportMeil","ReportMeil");form.put("fv9ReportDept","ReportDept");
	
	List<Map<String, String>> list = new ArrayList<Map<String, String>>();
	
	int size = list.size();
	
	int[] offen = new int[size];
	int[] ist = new int[size];
	int[] soll = new int[size];
	int[] gesamt = new int[size];
	
	JSONArray offenarr = new JSONArray();
	JSONArray istarr = new JSONArray();
	JSONArray sollarr = new JSONArray();
	JSONArray gesamtarr = new JSONArray();
	
%>
<!DOCTYPE HTML>
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
					text: 'Anzahl Teile nach TEVON'
				},
				xAxis: {
					categories: [
						'GESAMT', 
						'AGGREGATE', 
						'FAHRWEAK', 
						'KAROSSERIE', 
						'AUSSTATTUNG', 
						'ELEKTRIK', 
						'1:3:4'
					]
				},
				yAxis: {
					min: 0,
					title: {
						text: 'ANZAHL TITLE (ohne Doppelpos)'
					}
				},
				legend: {
					layout: 'vertical',
					backgroundColor: '#FFFFFF',
					align: 'right',
					verticalAlign: 'top',
					x: 0,
					y: 0,
					floating: true,
					shadow: false,
					borderWidth:0
				},
				tooltip: {
					formatter: function() {
						return ''+
							this.x +': '+ this.y +' mm';
					}
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0
					}
				},
			    series: [{
					name: 'P-Offen',
					data: [177, 0, 4, 9, 159, 0, 2],
					color: '#FC827F'
				}, {
					name: 'P-Ist',
					data: [2074, 336, 293, 397, 624, 287, 137],
					color: '#85FC84'
				}, {
					name: 'P-Soll',
					data: [2248, 336, 297, 406, 783, 287, 139],
					color: '#7BBFFC'
				}, {
					name: 'Gesamt',
					data: [2248, 336, 297, 406, 783, 287, 139],
					color: '#E1E1E1'
				}]
			});
			
			
		});
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.1 P-Freigaben</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>