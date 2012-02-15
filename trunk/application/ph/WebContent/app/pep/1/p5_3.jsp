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
			title = "1.5 Fahrzeugaufbaustatus";
			Map form = (Map)request.getAttribute("form");
			String kws = "[2,3,4,5,6,7,8,9,10]";//Web.getNumberListStr(form.get("fv9KWNo"));  
			//假数据
			String soll =  "[]";//Web.getNumberListStr(form.get("fv9ZP8NumSoll"));
			//假数据
			String sumSoll =  "[]";//Web.getSumNumberListStr(form.get("fv9ZP8NumSoll"));
			//假数据
			String ist = "[1,1,2,2,3,4,5]";//Web.getNumberListStr(form.get("fv9ZP8Numlst"));
			//假数据
			String sumIst = "[1,3,5,7,10,14,19]";//Web.getSumNumberListStr(form.get("fv9ZP8Numlst"));
			//假数据
			
		%>
		<script type="text/javascript">
		
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					zoomType: 'xy',
					marginTop:60
				},
				title: {
					text: 'Fahrzeugbauprogramm ZP8',
					style:{
						fontSize:'20px',
						color:'black',
						fontWeight: 'bold'
					},
					align:'left'
				},
				xAxis: {
					tickPosition:'inside',
					lineWidth:1,
					lineColor:'gray',
					tickWidth:1,
					ticlColor:'gray',
					labels:{
						y:30,
						style:{
							fontSize:'14px',
							color:'black',
							fontWeight: 'bold'
						}
					},
					categories: <%=kws%>//[5,6,7,8,9,10,11]  
				},
				yAxis: {
					min:0,
					max:20,
					lineWidth:1,
					lineColor:'gray',
					tickWidth:1,
					ticlColor:'gray',
					tickPosition:'inside',
					title: {
						text: 'Anzahl Fzg.',
						style: {
							color: 'black',
							fontSize:'14px'
						}
					},
					labels:{
						style:{
							fontSize:'14px',
							color:'black',
							fontWeight: 'bold'
						}
					},
					stackLabels: {
						enabled: true,
						y:-15,
						style: {
							fontWeight: 'bold',
							color: 'black',
							fontSize:'14px'
						}
					}
				},
				legend: {
					align: 'center',
					verticalAlign: 'top',
					x: 200,
					y: 0,
					borderWidth: 0,
					shadow:false
				},
				tooltip: {
					formatter: function() {
						var s = ''+
								this.x  +'KW : '+ this.y;
						return s;
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
						stacking: 'normal',
						shadow: false,
						borderColor:'black',
						dataLabels: {
							enabled: false,
							style : {
								fontWeight: 'bold',
								fontSize:'10px'
							},
							color: '#224325'
						},
						enableMouseTracking: true
					}
				},
				series: [{
					type: 'column',
					name: 'Soll',
					color: '#0000FF',
					data: <%=soll%>
				}, {
					type: 'column',
					name: 'Lst',
					color: '#009C0E',
					data:  <%=ist%>
				}, {
					type: 'spline',
					name: 'Kum Soll',
					color: '#009C0E',
					data: <%=sumIst%>,
					dataLabels: {
						enabled: true,
						style : {
							fontWeight: 'bold',
							fontSize:'16px'
						},
						color: 'black'
					}
				}, {
					type: 'spline',
					name: 'Kum Lst',
					color: '#0000FF',
					data:  <%=sumSoll%>
				}]
			});
			
			
		});
		</script>
		<title><%=title %> </title>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %> </h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
