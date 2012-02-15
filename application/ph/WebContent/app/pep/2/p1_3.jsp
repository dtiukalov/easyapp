<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<%

	Map form = (Map)request.getAttribute("form");	

	String status = "08.12.2011";
	String categories1 = "['Gesamt 120', 'CKD3', 'SKD1', 'LC116']";//Web.getNumberListStr(form.get("fv9AA"));
	String categories2 = "['13', '15', '17', '19', '21', '23', '25', '27', '29', '30', '31', '33', '34', '35', '36', '37', '38', '39', '40']";//Web.getNumberListStr(form.get("fv9BB"));
	String BMGfreiSoll = "[1,2,5,6,9,27,30,31,34,72,107,107,107,107,107,111,111,116,116]";//Web.getNumberListStr(form.get("fv9AA"));
	String inarbeit = "[115, 113, 111, 110, 107,89,86,85,82,44,9,0,0,0, 0, 0, 0, 0,  0]";//Web.getNumberListStr(form.get("fv9AA"));
	String awe = "[0,0,0,0,0,0,0,0,0,0,0,9,9,9,9,5,5,0,0]";//Web.getNumberListStr(form.get("fv9BB"));
	
%>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<title>Insert title here</title>

		<script type="text/javascript">
		var chart1;
		var chart2;
		$(document).ready(function() {
				chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart1',
					defaultSeriesType: 'column',
					marginRight:0.5
				},
				title: {
					text: ''
				},
				xAxis: {
					lineColor:'black',
					tickPosition:'inside',
					tickColor:'black',
					categories: <%=categories1%>,
					labels:{
						enabled:false,
						y:20,
						style:{
							color:'black'
						}
					}
				},
				yAxis: {
					min: 0,
					max: 120,
					gridLineWidth: 0,
					lineWidth:1,
					lineColor:'black',
					tickWidth:1,
					tickPosition:'inside',
					tickColor:'black',
					title: {
						text: ''
					},
					labels:{
						style:{
							color:'black'
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
					column: {
						stacking: 'normal',
						borderColor: 'black',
						pointPadding: 0.001,
						groupPadding: 0.01,
						shadow:false,
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
					name: '',
					showInLegend: false,
					data: [{ 
							y: 120, 
							low:0,
							color: '#0200FE'
						}, {
						 	y: 2, 
						 	low:118,
							color: '#0200FE'
						}, {
							y: 2,
							low:116,
							color: '#0200FE'
						}, {
							y: 116,
							low:0,
							color: '#FF00FE'
						}]
				}]
			});
			
			chart2 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart2',
						defaultSeriesType: 'column',
						marginLeft:1
					},
					title: {
						text: ' '
					},
					xAxis: {
						categories: <%=categories2%>,
						lineColor:'black',
						lineWidth:1,
						tickWidth:0,
						labels:{
							y:20,
							style:{
								color:'black'
							}
						}
						
					},
					yAxis: {
						min: 0,
						max: 120,
						gridLineWidth: 0,
						title: {
							text: ' '
						},
						labels: {
							enabled:false
						},
						stackLabels: {
							enabled: false,
							style: {
								fontWeight: 'bold',
								color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
							}
						}
					},
					legend: {
						layout: 'vertical',
						verticalAlign: 'top',
						align:'right',
						x:0,
						y:0,
						shadow: false,
						borderColor:'black',
						reversed: true
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
							pointPadding: 0.001,
							groupPadding: 0.01,
							borderColor: 'black',
							shadow:false,
							dataLabels: {
								enabled: true,
								style : {
									fontWeight: 'bold',
									fontSize:'10px'
								},
								color: 'black'
							}
						}
					},
				    series: [
				     {
						name: 'BMG frei Soll',
						data: <%=BMGfreiSoll%>,
						color: '#00FF00'
					}, {
						name: 'in arbeit',
						data: <%=inarbeit%>,
						color: '#FECC00'
					},{
						name: 'AWE',
						data: <%=awe%>,
						color: '#FEFECC'
					}]
				});
		});
		</script>
</head>
<body>		
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.1 P-Freigaben</h1></div>
			<div id="top1"><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LC BMG-Teile von ES Teileliste (KW48/11)</h4></div>
			<div id="top2" align="right"><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STATUS: <%=status %></h4></div>
			<div id="content" style="margin-left:50px">
				<div style="width: 50px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart1" style="width: 150px; height: 285px; float: left;margin-top:23px"></div>
				<div id="chart2" style="width: 600px; height: 320px; float: left;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>