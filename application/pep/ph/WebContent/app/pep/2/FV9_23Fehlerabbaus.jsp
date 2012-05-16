<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%!
		public static int getListSum(List<String> list) {
			int sum = 0;
			for (String value : list) {
				sum += Integer.parseInt(value);
			}
			return sum;
		}
		%>
		<%
		
		String fv9KWNo = Web.getNumberListStr(form.get("fv9KWNo"));
		String fv9AFelhler = Web.getNumberListStr(form.get("fv9AFelhler"));
		String fv9BFelhler = Web.getNumberListStr(form.get("fv9BFelhler"));
		String fv9CFelhler = Web.getNumberListStr(form.get("fv9CFelhler"));
		
		if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
			int a_sum = getListSum((List<String>)form.get("fv9AFelhler"));
			int b_sum = getListSum((List<String>)form.get("fv9BFelhler"));
			int c_sum = getListSum((List<String>)form.get("fv9CFelhler"));
			
			fv9KWNo += "Gesamt, " + fv9KWNo;
			fv9AFelhler += a_sum + ", " + fv9AFelhler;
			fv9BFelhler += b_sum + ", " + fv9BFelhler;
			fv9CFelhler += c_sum + ", " + fv9CFelhler;
		}
		
		%>
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						margin: [30, 30, 30, 30] //下 上 右 左
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
								color:'black',
								font_size:'12px'
							}
						},
						categories:  <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						lineWidth:2,
						gridLineWidth: 0,
						tickWidth:2,
						tickColor:'black',
						lineColor:'black',
					 	title: {
			                text: ' '
			            },
						labels: {
							style: {
								color:'black'
							}
						},
						stackLabels: {
							enabled: false,
							y:-15,
							style: {
								color: 'black',
								fontSize:'12px'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
				//		verticalAlign: 'center',
				//		x: 400,
				//		y: 30,
						borderWidth: 0
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							groupPadding:0.1,
							pointPadding:0.1,
							shadow: false,
							borderColor:'black',
							borderWidth:0,
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'11px'
								},
								color: 'white',
								formatter: function() {
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},

				    series: [{
						type: 'column',
						name: 'A Felhler',
						data: <%=fv9AFelhler%>,
						color: '#BBC2C5',
						dataLabels: {
							enabled: false,
							style : {
								fontSize:'11px'
							},
							color: 'black',
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'B Felhler',
						data: <%=fv9BFelhler%>,
						color: '#AED4F8',
						dataLabels: {
							enabled: false,
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'C Felhler',
						data: <%=fv9CFelhler%>,
						color: '#91AFFF',
						dataLabels: {
							enabled:false,
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
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
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="chart" style="width: 900px; height: 500px; margin:5px auto; "></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
