<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title>3.5 Maßnahmen zur Verbesserung der Audit-Ergebnisse</title>
		<style type="text/css">
				.div {
						width: 350px;
						margin-top:80px;
						margin-left:30px;
					}
			.div div {
						height: 30px;
						border-bottom-width: 2px;
						border-bottom-style: solid;
						border-bottom-color: #000000;
					}
			.div table td {
						border-bottom-width: 1px;
						border-bottom-style: solid;
						border-bottom-color: #000000;
						font-family: "宋体";
						font-size: 12px;
						line-height: 30px;
						color: #000000;
					}
			#content{
				margin-left:100px;
			}
		</style>
		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
		
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Fehlerpunkte/Fahrzeug',
					style:{
						fontSize:'18px',
						color:'black'
					},
					align:'left'
				},
				xAxis: [{
					tickLength: 0,
					lineColor: 'black',
					categories: ['KW15','16','17','18','19','20'],
					labels: {
						style: {
							 padding:'10px',
							 font: 'normal 12px Verdana, sans-serif',
							 color: 'black'
						}
				}
				}],
				yAxis: {
					gridLineWidth: 0,
					labels: {
						enabled:false
					},
					title: {
						text:""
					},
					stackLabels: {
						enabled: true,
						style: {
							color: 'black',
							fontWeight: 'bold'
						}
					}
				},
				tooltip: {
					formatter: function() {
						return '<b> - '+ this.x +'</b><br/>' +'- '+ this.y +'<br/>'+
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
								fontSize:'10px'
							},
							color: 'black'
						}
					}
				},
				legend: {
					layout: 'vertical',
					align: 'center',
					verticalAlign: 'top',
					x: 120,
					y: 30,
					borderWidth: 1,
					shadow:false
				},
			    series: [{
					name: 'Soll',
					data: [{ 
							y: 0, 
							low: 0,
							color: 'white'
						},{ 
							y: 45, 
							low: 644,
							color: '#009C0E'
						}, {
						 	y: 64, 
						 	low: 580,
							color: '#009C0E'
						}, {
							y: 68,
							low: 512,
							color: '#009C0E'
						}, {
							y: 32,
							low: 480,
							color: '#009C0E'
						},{ 
							y: 0, 
							low:0,
							color: 'white'
						}]
				},{
					name: 'Kaufteile',
					data: [{ 
							y: 119, 
							low: 40
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 40, 
							low: 40
						}],
					color: '#AED4F8',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
					
				},{
					name: 'Montage',
					data: [{ 
							y: 120, 
							low: 159
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 80
						}],
					color: '#00235A',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Lack',
					data: [{ 
							y: 130, 
							low: 279
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 180
						}],
					color: '#0000FF',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Karosseriebau',
					data: [{ 
							y: 150, 
							low: 409
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 280
						}],
					color: '#AED4F8',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Presswerk',
					data: [{ 
							y: 130, 
							low: 559
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 100, 
							low: 380
						}],
					color: '#BBC2C5',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},
				{
					name: 'Projekt',
					data: [{ 
							y: 40, 
							low: 0
						},{ 
							y: 0, 
							low: 0
						}, {
						 	y: 0, 
						 	low: 0
						}, {
							y: 0,
							low: 0
						}, {
							y: 0,
							low: 0
						},{ 
							y: 40, 
							low: 0
						}],
					color: '#99CC00',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				}]
			});
		});
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top"><h1>3.5 Maßnahmen zur Verbesserung der Audit-Ergebnisse</h1></div>	
				<div id="content">
					<div id="chart" style="width: 400px; height: 500px; margin: 0 auto; float: left;"></div>
					<div id="table" style="width: 400px; height: 400px; margin: 0 auto; float: left;">&nbsp;
						<div class="div">
								<div>
								  <table width="350" cellspacing="0">
								    <tr>
								      <td><font size="14px">Wichtigste Maßnahmen</font></td>
								      <td></td>
								      <td></td>
								      <td></td>
								    </tr>
								  </table>
								</div>
								<table width="350" cellspacing="0">
								<% 
									for(int i=0; i<4; i++){
								%>
									  <tr>
									    <td width="50" rowspan="3"></td>
									    <td>111</td>
								      </tr>
									   <tr>
									    <td>&nbsp;</td>
								  	  </tr>
									  <tr>
									  	<td>&nbsp;</td>
								      </tr>
								   <%
									}
								  %>
								</table>
							</div>
					</div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
