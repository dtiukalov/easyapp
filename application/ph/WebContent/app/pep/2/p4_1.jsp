<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<%@ include file="/app/pep/include/header.jsp"%>
		<%
			title = "2.4 Status ÄKO";
			Map form = (Map)request.getAttribute("form");
			String fv9KWNo = "[40,42,43,44,45,46,47,48,49]";// Web.getNumberListStrSubFirst(form.get("fv9KWNo"));
			String fv9AekoAbgesch = "[5,5,7,10,15,16,16,17,18]";//Web.getNumberListStrSubFirst(form.get("fv9AekoAbgesch"));
			String fv9AekoSmall2Woch = "[1,2,2,1,1,0,5,3,3]";//Web.getNumberListStrSubFirst(form.get("fv9AekoSmall2Woch"));
			String fv9AekoBig2Woch = "[1,1,1,0,0,0,0,2,1]";//Web.getNumberListStrSubFirst(form.get("fv9AekoBig2Woch"));
			/* 	System.out.println(fv9KWNo);
			System.out.println(fv9AekoAbgesch);
			System.out.println(fv9AekoSmall2Woch);
			System.out.println(fv9AekoBig2Woch);
			List<String> sumList = Web.SumList((List<String>)form.get("fv9AekoAbgesch"), 
					(List<String>)form.get("fv9AekoSmall2Woch"),
					(List<String>)form.get("fv9AekoBig2Woch")); */
			String deviationa = "[0,1,2,1,5,0,5,1,0]";//Web.compareByKW(sumList);
			
		%>
		<title><%=title %></title>

		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'column'
					},
					title: {
						text: 'Anzahl Änderungen',
						style:{
							color:'black',
							fontSize:'20px'
						}
					},
					xAxis: [{
						lineColor:'black',
						tickWidth:0,
						lineWidth:2,
						categories: <%=fv9KWNo%>,
						labels:{
							enabled:true,
							y:20,
							style:{
								color:'black',
								fontSize:'12px'
							}
						}
					},{ // mirror axis on right side
						opposite: false,
						reversed: false,
						categories: <%=deviationa%>,
						linkedTo: 0,
						lineColor:'black',
						lineWidth:2,
						tickWidth:0,
						labels:{
							y:20,
							style:{
								color:'black',
								fontSize:'12px'
							}
						},
						title: {
							text: '2011 Anzahl neuer ÄKOs',
							style:{
								color:'black'
							}
						}
					}],
					yAxis: {
						gridLineWidth: 0,
						title: {
							text: ''
						},
						labels:{
							enabled:false,
							style:{
								color:'black'
							}
						},
						stackLabels: {
							enabled: true,
							y:-15,
							style: {
								fontWeight: 'bold',
								color: 'black',
								fontSize:'12px'
							}
						}
					},
					legend: {
						enabled: true,
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 220,
						borderWidth: 0,
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
							borderColor: 'black',
							shadow:false,
							dataLabels: {
								enabled: true,
								style : {
									fontWeight: 'bold',
									fontSize:'12px'
								},
								color: 'black'
							}
						}
					},
				    series: [
				     {
						name: 'ÄKO,AeA  im Durchlauf (> 2 Wochen)',
						data: <%=fv9AekoBig2Woch%>,
						color: '#E63110',
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white'
						}
					}, {
						name: 'ÄKO,AeA im Durchlauf (< 2 Wochen)',
						data: <%=fv9AekoSmall2Woch%>,
						color: '#F9A700'
					},{
						name: 'ÄKO,AeA Vorschau',
						data: [],
						color: 'white'
					},{
						name: 'ÄKO,AeA abgeschlossen',
						data: <%=fv9AekoAbgesch%>,
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
			<div id="top"><h1><%=title %> </h1></div>
			<div id="chart" style="width: 800px; height: 400px; margin: 0 auto;"></div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>