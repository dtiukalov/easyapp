<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	
	<%
	Map form = (Map)request.getAttribute("form");
	
	String fv9KWNo = "['4', '5', '6', '7', '8', '9', '10', '11', '12', '13',  '14']" ; //	周数
	//Web.getNumberListStr(form.get("fv9KWNo"));
	String fv9Montage = "[1730, 1830, 1390, 1110, 1230]" ; //		总装
	//Web.getNumberListStr(form.get("fv9Montage"));
	String fv9Lack = "[290, 220, 210, 240, 300]" ; //		油漆
	//Web.getNumberListStr(form.get("fv9Lack"));
	String fv9Kaufteile = "[200, 200, 200, 200, 200]" ; //		外购件
	//Web.getNumberListStr(form.get("fv9Kaufteile"));
	String fv9Karosseriebau = "[500, 550, 250, 200, 220]" ; //		焊装
	//Web.getNumberListStr(form.get("fv9Karosseriebau"));
	String fv9Presswerk = "[480, 500, 250, 250, 250]" ; //		冲压
	//Web.getNumberListStr(form.get("fv9Presswerk"));
	String fv9Prognose = "[3500, 3500, 3400, 3300, 3200, 3000, 2500, 2500, 2500, 2250, 2000]" ; //		预测
	//Web.getNumberListStr(form.get("fv9Prognose"));
	
	%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title>3.5 Nacharbeitpunkte????</title>
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
						lineWidth:2,
						lineColor:'black',
						tickColor:'black',
						labels: {
							y:25,
							style: {
								color:'black'
							}
						},
						categories:  <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						max: 4000,
						lineWidth:2,
						gridLineWidth: 0,
						tickWidth:2,
						tickColor:'black',
						lineColor:'black',
						title: {
							rotation:0,
							text: 'Nacharbeitszeit [min]',
							x:-12,
							y:-180,
							style: {
								color:'gray',
								fontSize:'12px'
							}
						},
						labels: {
							style: {
								color:'black'
							}
						},
						stackLabels: {
							enabled: true,
							y:-15,
							style: {
								fontWeight: 'bold',
								color: 'black',
								fontSize:'10px'
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 60,
						borderWidth: 0,
						shadow:false
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
							borderWidth:0,
							dataLabels: {
								enabled: true,
								style : {
									fontWeight: 'bold',
									fontSize:'10px'
								},
								color: 'white'
							}
						}
					},

				    series: [{
						type: 'column',
						name: 'Presswerk',
						data: <%=fv9Presswerk%>,
						color: '#BBC2C5',
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'8px'
							},
							color: 'black'
						}
					}, {
						type: 'column',
						name: 'Karosseriebau',
						data: <%=fv9Karosseriebau%>,
						color: '#AED4F8'
					}, {
						type: 'column',
						name: 'Kaufteil',
						data: <%=fv9Kaufteile%>,
						color: '#91AFFF'
					}, {
						type: 'column',
						name: 'Lack',
						data: <%=fv9Lack%>,
						color: '#BBC2C5'
					}, {
						type: 'column',
						name: 'Montage',
						data: <%=fv9Montage%>,
						color: '#00235A'
					}, {
						type: 'spline',
						name: 'Prognose',
						data: <%=fv9Prognose%>,
						color: '#A6DD00',
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
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
			<div id="top"><h1>3.5 Nacharbeitpunkte</h1></div>
			<div id="content">
				<div id="chart" style="width: 950px; height: 400px; margin: 50px auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
