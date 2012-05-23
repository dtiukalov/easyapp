
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
		<title><%=title %></title>
		<%
			String fv9KWNo = Web.getNumberListStr(form.get("fv9KWNo"));
			String fv9MontageNum = Web.getNumberListStr(form.get("fv9MontageNum"));
			String fv9LackNum = Web.getNumberListStr(form.get("fv9LackNum"));
			String fv9KauftNum = Web.getNumberListStr(form.get("fv9KauftNum"));
			String fv9KarossNum = Web.getNumberListStr(form.get("fv9KarossNum"));
			String fv9PresswerkNum = Web.getNumberListStr(form.get("fv9PresswerkNum"));
			String fv9AusStrNum = Web.getNumberListStr(form.get("fv9AusStrNum"));
			String fv9Prognose = Web.getNumberListStr(form.get("fv9Prognose"));
		%>
		
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						margin: [40, 10, 30, 100] //上 右   下左
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:2,
						lineColor:'black',
						tickColor:'black',
						labels: {
							y:30,
							style: {
								color:'black',
								fontSize:'12px'
							}
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						lineWidth:2,
						gridLineWidth: 0,
						tickWidth:2,
						tickColor:'black',
						lineColor:'black',
						title: {
			                align: 'high',
			                offset: 0,
			                text: 'Nacharbeitszeit <br> [min]',
			                rotation: 0,
			                x: 60,
			                y: -30,
			                style: {
								color:'black',
								fontSize:'12px'
							}
			            },
						labels: {
							style: {
								color:'black',
								fontSize:'12px'
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
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						line: {
							shadow: false,
						},
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							groupPadding:0.01,
							pointPadding:0.01,
							borderWidth:0,
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'12px'
								},
								color: 'white',
								formatter: function() {
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
										return '';
									}
									return this.y + '';
								}
							}
						},
						series: {
				            pointWidth: 32
				        }
					},
					
				    series: [{
						type: 'column',
						name: 'aus Strassenfahrt',
						data: <%=fv9AusStrNum%>,
						color: '#4A6F8A'
					}, {
						type: 'column',
						name: 'Presswerk',
						data: <%=fv9PresswerkNum%>,
						color: '#BBC2C5',
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'12px'
							},
							color: 'black'
						}
					}, {
						type: 'column',
						name: 'Karosseriebau',
						data: <%=fv9KarossNum%>,
						color: '#AED4F8'
					}, {
						type: 'column',
						name: 'Kaufteil',
						data: <%=fv9KauftNum%>,
						color: '#91AFFF'
					}, {
						type: 'column',
						name: 'Lack',
						data: <%=fv9LackNum%>,
						color: '#BBC2C5'
					}, {
						type: 'column',
						name: 'Montage',
						data: <%=fv9MontageNum%>,
						color: '#00235A'
					}, {
						type: 'line',
						name: 'Prognose',
						data: <%=fv9Prognose%>,
						color: '#A6DD00',
						lineWidth: 1,
						marker: {
							enabled: false,
							shadow:false,
							lineWidth: 1,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5
								}
							}
						}
					}]
				},function(chart) { 
					chart.renderer.text(
			                '<span style="font-size:12px;">KW</span>', 
			               	85, 
			                495
			            ).attr({
			                zIndex: 6
			            }).add();
				}
				);
			});
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="chart" style="width: 1000px; height: 500px; margin:5px auto; "></div>
					<%
					if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
						int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
							double totalWidth = 891.0;
							Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(Web.getLCBNum(request, arr), arr, totalWidth);
							
							double value0 = lichenbeiPillarNum.get("vffqianPillar"); 
							double value1 = lichenbeiPillarNum.get("vffPillar"); 
							double value2 = lichenbeiPillarNum.get("pvsPillar");
							double value3 = lichenbeiPillarNum.get("osPillar");
							double value4 = lichenbeiPillarNum.get("sopPillar");
							double sum = value0 + value1 + value2 + value3 + value4;
					%>
				<div id="meilsteinouter" style="width: 1000px;">
					<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 100px; text-align: center; overflow: hidden; ">
					<div style=" width: <%=value0 %>px; height: 30px; float: left; background-color: white; vertical-align: bottom; padding-top: 5px;"><span style="color: white;"></span></div>

						<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
						<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
						<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
						<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
					</div>
				</div>
				<%
				}
					%>	
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
