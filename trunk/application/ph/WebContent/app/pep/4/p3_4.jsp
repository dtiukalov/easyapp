<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>	
	
	<% Map form = (Map)request.getAttribute("form");
	String fv9PartSource = "";//	零件分类
	int fv9TotalNum	= 0;//总数
	int fv9CKDCOPNum = 0;//	CKD/COP
		
	String teilestName = "['TBT VFF', 'Beginn VFF', 'Ende VFF', 'Beginn PVS', 'Beginn 0-S', 'Beginn SOP']";//	名称
	String teileAusSerien = "[33, 32, 4, 0, 0, 0]";//Web.getNumberListStr(form.get("fv9AA"));
	String note3 = "[2, 3, 30, 27, 0, 0]";//Web.getNumberListStr(form.get("fv9BB"));
	String note1 = "[1, 1, 2, 9, 36, 36]";//Web.getNumberListStr(form.get("fv9BB"));
	String note6 = "[0, 0, 0, 0, 0, 0]";//Web.getNumberListStr(form.get("fv9BB"));
	
	String[]  topKrisUmf = new String[]{"FK aussen","FK aussen","FK aussen","FK aussen","FK aussen","FK aussen","FK aussen"};//Web.getNumberListStr(form.get("fv9BB"));	问题零件范围
	Integer[]  topEinNum =  new Integer[]{1,1,1,1,1,1,1};//Web.getNumberListStr(form.get("fv9BB"));	单件数量
	String[] topVSIN3 =  new String[]{"KW16_12","KW16_12","KW16_12","KW16_12","KW16_12","KW16_12","KW16_12"};//Web.getNumberListStr(form.get("fv9BB"));	预测小批量模具时间
	String[] topVSISWZ =  new String[]{"KW30_12","KW30_12","KW30_12","KW30_12","KW30_12","KW30_12","KW30_12"};//Web.getNumberListStr(form.get("fv9BB"));	预测3分时间

%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<style type="text/css">
			#left{
				width: 400px; height: 500px; margin: 0 auto; float: left;
			}
			#left chart{
				width: 400px; height: 400px; margin: 0 auto; float: left;
			}
			#left time{
				width: 400px; height: 100px; margin: 0 auto; float: left;
			}
			#right {
				width: 400px; height: 500px; margin: 0 auto; float: left;margin-left: 10px;
			}
			#right legend {
				width: 400px; height: 100px; margin: 0 auto; float: left; padding-left: 10px;
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
						categories: <%=teilestName%>
						
					},
					yAxis: {
						min: 0,
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							style: {
								fontWeight: 'bold',
								color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
							}
						}
					},
					legend: {
						enabled: false,
						align: 'center',
						x: 0,
						verticalAlign: 'top',
						y: 0,
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
							dataLabels: {
								enabled: false,
								color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
							}
						}
					},
				    series: [{
						name: 'Teile aus Serienwerkzeug',
						data: <%=teileAusSerien%>,
						color: '#CCFFCC'
					}, {
						name: 'Note 3',
						data: <%=note3%>,
						color: '#00FF00'
					}, {
						name: 'Note 1',
						data: <%=note1%>,
						color: '#003300'
					}, {
						name: 'Note 6',
						data: <%=note6%>,
						color: '#FF0000'
					}]
				});
			});
				
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top"><h1>4.3 Teileverfügbarkeit fuer KT von ZP7</h1></div>
				<div id="left">
					<div id="chart"></div>
					<div id="time"><img src="/ph/app/pep/4/bottom.jpg" width="400" height="70"></div>
				</div>
				<div id="right">
					<div id="legend" style="margin-top: 40px;">
						<li><img src="/ph/app/pep/images/legend_lightgreen.png" width="13" height="13">
						&nbsp;Teile aus Serienwerkzeug
						<li><img src="/ph/app/pep/images/legend_green.png" width="13" height="13">
						&nbsp;Note 3
						<li><img src="/ph/app/pep/images/legend_black.png" width="13" height="13">
						&nbsp;Note 1
						<li><img src="/ph/app/pep/images/legend_red.png" width="13" height="13">
						&nbsp;Note 6
					</div>
					<table width="100%" style="margin-top: 30px;">
						<tr>
							<td colspan="4" style="text-align: left;font-weight: bolder; height: 36px;border-bottom: 1px solid;">Top</td>
						</tr>
						<tr>
							<td width="34%" style="font-weight: bolder;height: 36px;border-bottom: 2px solid;">Kritische Umfänge</td>
							<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">Einzelteile</td>
							<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">VSI N3</td>
							<td width="22%" style="font-weight: bolder;text-align: center;border-bottom: 2px solid;">VSI N1</td>
						</tr>
						<%
							for(int i=0; i<topKrisUmf.length; i++) {
						%>		
						<tr>
							<td style="height: 36px;border-bottom: 1px solid;"><%=topKrisUmf[i] %></td>
							<td style="text-align: center;border-bottom: 1px solid;"><%=topEinNum[i] %></td>
							<td style="text-align: center;border-bottom: 1px solid;"><%=topVSIN3[i] %></td>
							<td style="text-align: center;border-bottom: 1px solid;"><%=topVSISWZ[i] %></td>
						</tr>
						<%
						}
						%>
					</table>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
