<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%
	Map form = (Map)request.getAttribute("form");
	String fv9KWNo = Web.getNumberListStrSubFirst(form.get("fv9KWNo"));
	String fv9AekoAbgesch = Web.getNumberListStrSubFirst(form.get("fv9AekoAbgesch"));
	String fv9AekoSmall2Woch = Web.getNumberListStrSubFirst(form.get("fv9AekoSmall2Woch"));
	String fv9AekoBig2Woch = Web.getNumberListStrSubFirst(form.get("fv9AekoBig2Woch"));
	System.out.println(fv9KWNo);
	System.out.println(fv9AekoAbgesch);
	System.out.println(fv9AekoSmall2Woch);
	System.out.println(fv9AekoBig2Woch);
	List<String> sumList = Web.SumList((List<String>)form.get("fv9AekoAbgesch"), 
			(List<String>)form.get("fv9AekoSmall2Woch"),
			(List<String>)form.get("fv9AekoBig2Woch"));
	String deviationa = Web.compareByKW(sumList);
	
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
						categories: <%=fv9KWNo%>
						
					},{ // mirror axis on right side
						opposite: false,
						reversed: false,
						categories: <%=deviationa%>,
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
						data: <%=fv9AekoBig2Woch%>,
						color: '#E63110'
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
			<div id="top"><h1>2.4 Status ÄKO </h1></div>
			<div id="chart" style="width: 800px; height: 400px; margin: 0 auto;"></div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>