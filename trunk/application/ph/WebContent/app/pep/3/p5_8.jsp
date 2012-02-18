<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	
<!DOCTYPE HTML>
<%@ include file="/app/pep/include/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<%
		Map form = (Map)request.getAttribute("form");
		title = ".5 Audit ZP8 – Gewerk: Karosseriebau";
		
		String fv9KWNo = "['4', '5', '6', '7', '8', '9', '10', '11', '12', '13',  '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',  '24']";
		//Web.getNumberListStr(form.get("fv9KWNo"));
		String fv9KarosseriebauNum = "[260,245,235,220,200,180,160,160,160,100,85,75,65,60,60,55,55,50,50,45,45]";
		//Web.getNumberListStr(form.get("fv9KarosseriebauNum"));
		String fv9KonzernNum = "[80,80,80,80,80,60,60,60,60,60,35,35,35,35,35,35,35,25,25,25,25]";
		//Web.getNumberListStr(form.get("fv9KonzernNum"));
		String fv9PrognoseNum = "[275,265,242,227,210,190,170,165,165,110]";
		//Web.getNumberListStr(form.get("fv9PrognoseNum"));
		
		//fv9Note3Num
		//fv9Note2Num
		//fv9Note1Num

		%>
		<title><%=title %></title>
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart'
					},
					title: {
						text: ' '
					},
					xAxis: {
						tickLength: 0,
						lineColor:'black',
						lineWidth:2,
						labels: {
							x:-2,
							y:20,
							style: {
								 font: 'normal 12px Verdana, sans-serif',
								 color: 'black'
							}
					},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						max: 260,
						gridLineWidth: 0,
						lineWidth: 2,
						lineColor: 'black',
						labels: {
							style: {
								padding: '5px',
								color: 'black'
							}
						},
						title: {
							rotation:0,
							text: 'Punkte',
							x:-15,
							y:-160,
							style: {
								color: 'black',
								fontSize:'14px'
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 100,
						borderWidth: 1,
						borderRadius: 0,
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
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: true,
								style : {
									fontWeight: 'bold',
									fontSize:'12px'
								},
								color: 'white',
								rotation: -90,
								x:5
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'Prognose',
						data: <%=fv9PrognoseNum%>,
						color: '#00235A'
					}, {
						type: 'spline',
						name: 'Karosseriebau',
						data: <%=fv9KarosseriebauNum%>,
						color: '#99FF99'
					}, {
						type: 'spline',
						name: 'Konzernziel',
						data: <%=fv9KonzernNum%>,
						color: '#E63110'
					}]
				});
			});
			
			
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
