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
		
	String fv9TeilestName = "['TBT VFF', 'Beginn VFF', 'Ende VFF', 'Beginn PVS', 'Beginn 0-S', 'Beginn SOP', 'CKD/COP']";//	名称
	String fv9TeileFehlend = "[0, 0, 0, 0, 0, 0, 0]";//Web.getNumberListStr(form.get("fv9AA"));
	String fv9TeileAusSerien = "[6, 6, 6, 4, 0, 0, 0]";//Web.getNumberListStr(form.get("fv9AA"));
	String fv9TeileNote3 = "[0, 0, 0, 2, 4, 0, 0]";//Web.getNumberListStr(form.get("fv9BB"));
	String fv9TeileNote1 = "[0, 0, 0, 0, 2, 6, 0]";//Web.getNumberListStr(form.get("fv9BB"));
	String fv9TeileNote6 = "[0, 0, 0, 0, 0, 0, 0]";//Web.getNumberListStr(form.get("fv9BB"));
	
	String[]  fv9TopKrisUmf = new String[]{"FK aussen","FK aussen","FK aussen","FK aussen","FK aussen","FK aussen","FK aussen"};//Web.getNumberListStr(form.get("fv9BB"));	问题零件范围
	Integer[]  fv9TopEinNum =  new Integer[]{1,1,1,1,1,1,1};//Web.getNumberListStr(form.get("fv9BB"));	单件数量
	String[] fv9TopVSIN3 =  new String[]{"KW16_12","KW16_12","KW16_12","KW16_12","KW16_12","KW16_12","KW16_12"};//Web.getNumberListStr(form.get("fv9BB"));	预测小批量模具时间
	String[] fv9TopVSISWZ =  new String[]{"KW30_12","KW30_12","KW30_12","KW30_12","KW30_12","KW30_12","KW30_12"};//Web.getNumberListStr(form.get("fv9BB"));	预测3分时间

%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<style type="text/css">
			#subtitle {
				width: 400px; height: 100px; margin: 0 auto; float: left; 
			}
			#subtitle h1{
				font-family:Arial, Helvetica, sans-serif;
				font-size:24px;
			}
			#left {
				width: 500px; height: 500px; margin: 0 auto; float: left;
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
			.div {
				width: 400px; border: 2px solid #000000;margin-top:100px;float: right;margin-right:20px;
			}
			.div div {
				height: 20px;border-bottom-width: 2px;border-bottom-style: solid;border-bottom-color: #000000;
			}
			.div table td {
				border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #000000;
				width: 125px;font-family: "宋体";font-size: 12px;line-height: 20px;color: #000000;text-indent: 35px
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
				<div id="top"><h1>4.3 Teileverfügbarkeit fuer KT von ZP7</h1></div>
				<div id="content" >
					<div id="left">
						<div id="chart"></div>
						<div id="time">
							<img src="/ph/app/pep/4/bottom.jpg" width="400" height="70">
						</div>
					</div>
					<div class="div">
								<div>
								  <table width="400" cellspacing="0">
								    <tr>
								      <td>Top</td>
								      <td></td>
								      <td></td>
								      <td></td>
								    </tr>
								  </table>
								</div>
								<table width="400" cellspacing="0">
								  <tr>
								    <td>1</td>
								    <td>1</td>
								    <td>1</td>
								    <td>1</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								  </tr>
								</table>
							</div>
				</div>
				
				<div class="clear"></div>
				<%@ include file="/app/pep/include/foot.jsp"%>
			</div>
			
		</div>	
	</body>
</html>
