<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/app/pep/include/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%
			title = "3.5 Maßnahmen zur Abarbeitung der B-Fehler Audit ZP8";
			Map form = (Map)request.getAttribute("form");
			
			List<String> fv9KWNo = (List<String>) form.get("fv9KWNo");
			
			List<String> fv9Projekt = (List<String>) form.get("fv9Projekt");
			List<String> fv9ProjektCom_CN = (List<String>) form.get("fv9ProjektCom_CN");
			List<String> fv9ProjektCom_GM = (List<String>) form.get("fv9ProjektCom_GM");
			
			List<String> fv9Kaufteile = (List<String>) form.get("fv9Kaufteile");
			List<String> fv9KaufteileCom_CN = (List<String>) form.get("fv9KaufteileCom_CN");
			List<String> fv9KaufteileCom_GM = (List<String>) form.get("fv9KaufteileCom_GM");
			
			List<String> fv9Montage = (List<String>) form.get("fv9Montage");
			List<String> fv9MontageCom_CN = (List<String>) form.get("fv9MontageCom_CN");
			List<String> fv9MontageCom_GM = (List<String>) form.get("fv9MontageCom_GM");
			
			List<String> fv9Lack = (List<String>) form.get("fv9Lack");
			List<String> fv9LackCom_CN = (List<String>) form.get("fv9LackCom_CN");
			List<String> fv9LackCom_GM = (List<String>) form.get("fv9LackCom_GM");
			
			List<String> fv9Karosseriebau = (List<String>) form.get("fv9Karosseriebau");
			List<String> fv9KarossCom_CN = (List<String>) form.get("fv9KarossCom_CN");
			List<String> fv9KarossCom_GM = (List<String>) form.get("fv9KarossCom_GM");
			
			List<String> fv9Presswerk = (List<String>) form.get("fv9Presswerk");
			List<String> fv9PresswerkCom_CN = (List<String>) form.get("fv9PresswerkCom_CN");
			List<String> fv9PresswerkCom_GM = (List<String>) form.get("fv9PresswerkCom_GM");
			

		%>
		<style type="text/css">
			.div {
					width: 350px;
					margin-top:30px;
					margin-left:30px;
				}
			.div div {
					height: 35px;
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
					line-height: 35px;
					color: #000000;
					text-indent: 10px;
				}
			#content{
				margin-left:100px;
			}
		</style>
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
					text: 'B-Fehler pro Fahrzeug',
					style:{
						color:'black',
						fontSize:'18px'
					},
				align:'left'
				},
				xAxis: {
					tickLength: 0,
					lineColor: 'black',
					lineWidth:2,
					categories: ['KW15','16','17','18','19','20'],
					labels: {
							style: {
								 padding:'10px',
								 fontSize: '16px',
								 color: 'black'
							}
					}
				},
				yAxis: {
					gridLineWidth: 0,
					labels: {
						enabled:false
					},
					title: {
						text:""
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
						borderColor:'black',
						borderWidth:1,
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
				legend: {
					layout: 'vertical',
					enabled: false,
					borderWidth:1
				},
			    series: [{
					name: 'Soll',
					showInLegend: false,
					data: [{ 
							y: 0, 
							low: 0,
							color: '#009C0E'
						},{ 
							y: 2, 
							low: 8,
							color: '#009C0E'
						}, {
						 	y: 2, 
						 	low: 6,
							color: '#009C0E'
						}, {
							y: 3,
							low: 3,
							color: '#009C0E'
						}, {
							y: 2,
							low: 1,
							color: '#009C0E'
						}, { 
							y: 1, 
							low:0,
							color: '#009C0E'
						}],
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white'
						}
				},{
					name: 'Presswerk',
					color: '#BBC2C5',
					data: [{ 
						y: 2, 
						low: 8
					}]
				},{
					name: 'Karosseriebau',
					color: '#AED4F8',
					data: [{ 
						y: 2, 
						low: 6
					}]
				},{
					name: 'Lack',
					color: '#0000FF',
					data: [{ 
						y: 2, 
						low: 4
					}]
				},{
					name: 'Montage',
					color: '#00235A',
					data: [{ 
						y: 2, 
						low: 2
					}],
					dataLabels: {
						enabled: true,
						style : {
							fontWeight: 'bold',
							fontSize:'10px'
						},
						color: 'white'
					}
				},{
					name: 'Kaufteile',
					color: '#AED4F8',
					data: [{ 
						y: 1, 
						low: 1
					}]
				},{
					name: 'Projekt',
					color: '#98CB00',
					data: [{ 
						y: 1, 
						low: 0
					}]
				}]
			});
		});
		</script>
	</head>
	<body>
		<div id="container" style="height:600px">
			<div id="nr">
				<div id="top"><h1><%=title %></h1></div>	
				<div id="content" >
					<div id="chart" style="width: 400px; height: 400px; margin: 50px auto; float: left;"></div>
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
									for(int i=0; i<5; i++){
								%>
									  <tr>
									    <td width="50" rowspan="2"></td>
									    <td>111</td>
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
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
