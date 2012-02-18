<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	
<!DOCTYPE HTML>
<%@ include file="/app/pep/include/header.jsp"%>
	<% 
	title = "4.3 Teilestatus zu PVS ZP7 (KT)";
	Map form = (Map)request.getAttribute("form");
	int fv9TotalNum	= 0;//	(Integer)form.get("fv9TotalNum");		总数
	int fv9CKDCOPNum = 0;//	(Integer)form.get("fv9CKDCOPNum");		CKD/COP
	
	String fv9TeilestName = "['TBT VFF', 'Beginn VFF', 'Ende VFF', 'Beginn PVS', 'Beginn 0-S', 'Beginn SOP', 'CKD/COP']";//	名称
	//Web.getStrFromStringArray(form.get("fv9TeilestName"));
	String fv9TeileFehlend = "[0, 0, 0, 0, 0, 0, 0]";
	//Web.getNumberListStr(form.get("fv9TeileFehlend"));
	String fv9TeileAusSerien = "[6, 6, 6, 4, 0, 0, 0]";
	//Web.getNumberListStr(form.get("fv9TeileAusSerien"));
	String fv9TeileNote3 = "[0, 0, 0, 2, 4, 0, 0]";
	//Web.getNumberListStr(form.get("fv9TeileNote3"));
	String fv9TeileNote1 = "[0, 0, 0, 0, 2, 6, 0]";
	//Web.getNumberListStr(form.get("fv9TeileNote1"));
	String fv9TeileNote6 = "[0, 0, 0, 0, 0, 0, 0]";
	//Web.getNumberListStr(form.get("fv9TeileNote6"));
	
	List<String> fv9TopKrisUmf = new ArrayList<String>();//问题零件范围
	//(List<String>)form.get("fv9TopKrisUmf");
	fv9TopKrisUmf.add("FK aussen");
	fv9TopKrisUmf.add("FK aussen");
	fv9TopKrisUmf.add("FK aussen");
	fv9TopKrisUmf.add("FK aussen");

	List<String> fv9TopEinNum = new ArrayList<String>();//	单件数量
	//(List<String>)form.get("fv9TopEinNum");
	fv9TopEinNum.add("1");
	fv9TopEinNum.add("1");
	fv9TopEinNum.add("1");
	fv9TopEinNum.add("1");

	List<String> fv9TopVSISWZ = new ArrayList<String>();//预测小批量模具时间
	//(List<String>)form.get("fv9TopVSISWZ");
	fv9TopVSISWZ.add("KW30_12");
	fv9TopVSISWZ.add("KW30_12");
	fv9TopVSISWZ.add("KW30_12");
	fv9TopVSISWZ.add("KW30_12");
	List<String> fv9TopVSIN3 = new ArrayList<String>();//	预测3分时间
	//(List<String>)form.get("fv9TopVSIN3");
	fv9TopVSIN3.add("KW16_12");
	fv9TopVSIN3.add("KW16_12");
	fv9TopVSIN3.add("KW16_12");
	fv9TopVSIN3.add("KW16_12");
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<title><%=title %> </title>
		
		<style type="text/css">
			#subtitle {
				width: 400px; height: 100px; margin: 0 auto; float: left; 
			}
			#subtitle h1{
				font-family:Arial, Helvetica, sans-serif;
				font-size:24px;
			}
			#legend {
				width: 400px; height: 100px; margin: 0 auto; float: left; padding-left: 150px;
			}
			#left {
				width: 400px; height: 500px; margin: 0 auto; float: left;
			}
			#left chart{
				width: 400px; height: 400px; margin: 0 auto; float: left;
			}
			#left time{
				width: 400px; height: 100px; margin: 0 auto; float: left;
			}
			#right {
				width: 400px; height: 500px; margin: 0 auto; float: left; padding: 10px;
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
						text: ' '
					},
					xAxis: {
						lineColor:'black',
						lineWidth:2,
						tickWidth:0,
						labels:{
							y:20,
							style:{
								color:'black'
							}
						},
						categories: <%=fv9TeilestName%>
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						title: {
							text: ' '
						},
						labels:{
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
						enabled: false,
						align: 'right',
						x: 0,
						verticalAlign: 'top',
						y: 0,
						shadow: false,
						borderWidth:0
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
							borderWidth:1,
							borderColor:'black',
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
					
				    series: [{
						name: 'PT-Teile/Alternativteile',
						data: <%=fv9TeileFehlend%>,
						color: '#FFFFFF'
					}, {
						name: 'Teile aus Serienwerkzeug',
						data: <%=fv9TeileAusSerien%>,
						color: '#CCFFCC'
					}, {
						name: 'Note 3',
						data: <%=fv9TeileNote3%>,
						color: '#00FF00',
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white'
						}
					}, {
						name: 'Note 1',
						data: <%=fv9TeileNote1%>,
						color: '#003300',
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white'
						}
					}, {
						name: 'Note 6',
						data: <%=fv9TeileNote6%>,
						color: '#FF0000'
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
					<div id="subtitle">
						<h1>Teilestatus zu PVS ZP7 KT</h1>
					</div>
					<div id="legend">
						<li><img src="/ph/app/pep/images/legend_white.png" width="13" height="13">
						&nbsp;PT-Teile/Alternativteile
						<li><img src="/ph/app/pep/images/legend_lightgreen.png" width="13" height="13">
						&nbsp;Teile aus Serienwerkzeug
						<li><img src="/ph/app/pep/images/legend_green.png" width="13" height="13">
						&nbsp;Note 3
						<li><img src="/ph/app/pep/images/legend_black.png" width="13" height="13">
						&nbsp;Note 1
						<li><img src="/ph/app/pep/images/legend_red.png" width="13" height="13">
						&nbsp;Note 6
					</div>
					<div id="left">
						<div id="chart"></div>
						<div id="time">
							<img src="/ph/app/pep/4/bottom.jpg" width="400" height="70">
						</div>
					</div>
					<div id="right">
						<table width="100%">
							<tr>
								<td colspan="4" style="text-align: left;font-weight: bolder; height: 36px;border-bottom: 1px solid;">Top</td>
							</tr>
							<tr>
								<td width="34%" style="font-weight: bolder;height: 36px;border-bottom: 2px solid;">Kritische Umfänge</td>
								<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">Einzelteile</td>
								<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">VSI SWZ</td>
								<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">VSI N3</td>
							</tr>
							<%
								for(int i=0; i<fv9TopKrisUmf.size(); i++) {
							%>		
							<tr>
								<td style="height: 36px;border-bottom: 1px solid;"><%=fv9TopKrisUmf.get(i)%></td>
								<td style="text-align: center;border-bottom: 1px solid;"><%=fv9TopEinNum.get(i)%></td>
								<td style="text-align: center;border-bottom: 1px solid;"><%=fv9TopVSIN3.get(i)%></td>
								<td style="text-align: center;border-bottom: 1px solid;"><%=fv9TopVSISWZ.get(i)%></td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
				
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
