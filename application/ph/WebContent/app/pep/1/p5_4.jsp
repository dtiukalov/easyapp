<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			int fv9PPCOP = 0;
			int fv9PPErste = 0;
			int fv9PPNicht =0;
			int fv9Genehmigt =0;
			
			if(form.get("fv9PPCOP")!= null && !"".equals(form.get("fv9PPCOP")) ){
				fv9PPCOP = Integer.parseInt((String)form.get("fv9PPCOP"));
			}
			if(form.get("fv9PPErste")!= null && !"".equals(form.get("fv9PPErste")) ){
				fv9PPErste = Integer.parseInt((String)form.get("fv9PPErste"));
			}
			if(form.get("fv9PPNicht")!= null && !"".equals(form.get("fv9PPNicht")) ){
				fv9PPNicht = Integer.parseInt((String)form.get("fv9PPNicht"));
			}
			
			fv9Genehmigt = fv9PPCOP + fv9PPErste + fv9PPNicht;			
		%>
		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Modellpflegepunkte',
					style:{
						color:'black',
						fontSize:'26px',
						fontWeight: 'bold'
					}
				},
				xAxis: {
					tickWidth:1,
					tickColor:'gray',
					lineColor:'gray',
					labels:{
						y:30,
						style:{
							color:'black',
							fontSize:'14px'
						}
					},
					categories: ["Genehmigt MOP-Punkte zum ...(Fahrzeug)", "PP COP, Ersteinsatz in anderen Projekten", "PP Ersteinsatz...(Fahrzeug)", "PP nicht relevant oder Steuerungspunkte"] 
				},
				yAxis: {
					min: 0,
					max: 350,
					gridLineWidth:0,
					tickWidth:1,
					lineWidth:1,
					lineColor:'gray',
					tickColor:'gray',
					title: {
						text: ''
					},
					labels:{
						style:{
							color:'black',
							fontSize:'14px'
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
						borderWidth:2,
						borderColor:'black',
						shadow:false
					},
					series: {
			            dataLabels: {
			                enabled: true,
			                style: {
			                    fontSize:'16px'
			                },
		                    color:'white'
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
			<div id="top">
				<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
				<div class="fr"> STATUS 19.10.2010</div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="chart" style="width: 850px; height: 400px; margin: 30px auto;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
