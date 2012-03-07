<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	
<%@page import="com.saturn.tc.utils.DateUtils"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<% 
		int fv9TotalNum	= 0;//	总数
		int fv9CKDCOPNum = 0;//CKD/COP
		
		if(form.get("fv9TotalNum")!= null && !"".equals(form.get("fv9TotalNum")) ){
			fv9TotalNum = Integer.parseInt((String)form.get("fv9TotalNum"));
		}
		if(form.get("fv9CKDCOPNum")!= null && !"".equals(form.get("fv9CKDCOPNum")) ){
			fv9CKDCOPNum = Integer.parseInt((String)form.get("fv9CKDCOPNum"));
		}
		
		List<String> teilestName = (List<String>)form.get("fv9TeilestName");
		int size = 0;
		if(teilestName != null ){
			teilestName.add("CKD/COP<br \\>Direkt-bezug");
			size = teilestName.size();
		}
		int CKD_low = fv9TotalNum - fv9CKDCOPNum;
		
		String fv9TeilestName = Web.getStrListStr(teilestName);
		String fv9TeileAusSerien = Web.getNumberListStr(form.get("fv9TeileAusSerien"));
		String fv9TeileFehlend = Web.getNumberListStr(form.get("fv9TeileFehlend"));
		String fv9TeileNote3 = Web.getNumberListStr(form.get("fv9TeileNote3"));
		String fv9TeileNote1 = Web.getNumberListStr(form.get("fv9TeileNote1"));
		String fv9TeileNote6 = Web.getNumberListStr(form.get("fv9TeileNote6"));
		
		List<String> fv9TopKrisUmf = (List<String>)form.get("fv9TopKrisUmf");
		List<String> fv9TopEinNum = (List<String>)form.get("fv9TopEinNum");
		List<String> fv9TopVSISWZ = (List<String>)form.get("fv9TopVSISWZ");
		List<String> fv9TopVSIN3 = (List<String>)form.get("fv9TopVSIN3");
		
	%>
		<style type="text/css">
			/* #subtitle {
				width: 400px; height: 100px; margin: 0 auto; float: left; 
			} */
			#subtitle h1{
				font-family:Arial, Helvetica, sans-serif;
				font-size:16px; margin:15px auto;
			}
			#left {
				width: 450px; height: 600px; margin: 0 auto; float: left;
			}
			#left chart{
				width: 450px; height: 400px; margin: 0 auto; float: left;
			}
			#left time{
				width: 400px; height: 200px; margin: 0 auto; float: left;
			}
			#time table tr td{
				text-align: center;
			}
			#right {
				width: 350px; margin: 20px 10px; float: left; padding: 10px;
			}
			.div {
				width: 350px;
				border-top-width: 1px;
				border-top-style: solid;
				border-top-color: #000000;
				margin-bottom: 10px;
			}
			.div div {
				height: 42px;
				border-bottom-width: 1px;
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
				text-align: center;
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
							pointWidth:30,
							shadow: false,
							borderWidth:1,
							borderColor:'black',
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'12px'
								},
								color: 'black',
								formatter: function() {
									if (this.y == 0) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
					
				    series: [
						{
							name: 'PT-Teile/Alternativteile',
							data: <%=fv9TeileFehlend%>,
							color: '#FFFFFF'
						}, {
							name: 'Note 6',
							data: <%=fv9TeileNote6%>,
							color: '#FF0000'
						},{
							name: 'Teile aus Serienwerkzeug',
							data: <%=fv9TeileAusSerien%>,
							color: '#CCFFCC'
						},{
							name: 'Note 3',
							data: <%=fv9TeileNote3%>,
							color: '#00FF00',
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'12px'
								},
								color: 'white'
							}
						},{
							name: 'Note 1',
							data: <%=fv9TeileNote1%>,
							color: '#003300',
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'12px'
								},
								color: 'white'
							}
						},{
							name: 'CKDCOP',
							data: [
							<%
								for(int m=0; m<size-1; m++){
							%>
								{ 
									y: 0, 
									low: 0
								},
							<% 
								}
							%>
								{ 
									y: <%=fv9CKDCOPNum%>, 
									low: <%=CKD_low%>
								}
							],
							color: '#003300',
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'12px'
								},
								color: 'white'
							}
						}
				    ]
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
				<div id="content" style="margin:0 50px;height:600px;">
					<div id="subtitle">
						<h1>Anzahl Teile nach TEVON</h1>
					</div>
					<div id="left">
						<div id="chart"></div>
						<%
							int tbt_vff_kwno = 0; 
							double KWTBT = 0.0;
							double KWVFF = 0.0;
							double KWPVS = 0.0;
							double KW0S = 0.0;
							double KWSOP = 0.0;
							double sum = 0.0;
							
							if (session.getAttribute("fv9VFFTBTZP5") != null &&
									!"".equals((String)session.getAttribute("fv9VFFTBTZP5")) &&
									session.getAttribute("DATE_VFF") != null &&
									!"".equals((String)session.getAttribute("DATE_VFF"))) {
								tbt_vff_kwno = DateUtils.getWeekNumBetweenStartAndEnd(
										(String)session.getAttribute("fv9VFFTBTZP5"),
										(String)session.getAttribute("DATE_VFF")); 
								KWTBT = Double.parseDouble(tbt_vff_kwno + "");
								KWVFF = Double.parseDouble((Integer)session.getAttribute("KWNo_VFF") + "");
								KWPVS = Double.parseDouble((Integer)session.getAttribute("KWNo_PVS") + "");
								KW0S = Double.parseDouble((Integer)session.getAttribute("KWNo_0S") + "");
								KWSOP = Double.parseDouble((Integer)session.getAttribute("KWNo_SOP") + "");
								sum = KWVFF + KWPVS + KW0S + KWSOP;
								
						%>
						<div id="time" style="margin:0 30px">
							<table style="font-size: 10px;">
								<tr>
									<td style="width: 12px; ">KW</td>
									<td width="45">
										<%=(Integer)session.getAttribute("VFFTBTZP5") %>
									</td>
									<td width="<%=(243.0/sum)*KWVFF*0.8%>" style="text-align:left; padding-left: <%=(243.0/sum)*KWVFF*0.2%>px;">
										<%=(Integer)session.getAttribute("KW_VFF") %>
									</td>
									<td width="<%=(243.0/sum)*KWPVS*0.8%>" style="text-align:left; padding-left: <%=(243.0/sum)*KWPVS*0.2%>px;">
										<%=(Integer)session.getAttribute("KW_PVS") %>
									</td>
									<td width="<%=(243.0/sum)*KW0S*0.8%>" style="text-align:left; padding-left: <%=(243.0/sum)*KW0S*0.2%>px;">
										<%=(Integer)session.getAttribute("KW_0S") %>
									</td>
									<td width="<%=(243.0/sum)*KWSOP*0.8%>" style="text-align:left; padding-left: <%=(243.0/sum)*KWSOP*0.2%>px;">
										<%=(Integer)session.getAttribute("KW_SOP") %>
									</td>
								</tr>
								<tr>
									<td colspan="6" style="border-bottom: 1px solid; height: 0px; line-height: 0px;">&nbsp;</td>
								</tr>
								<tr>
									<td style="width: 12px;">&nbsp;</td>
									<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/VFF-TBT.jpg', sizingMethod='scale'); height: 35px;">
										<span style="font-size: 14px; color: white;font-weight: bolder;">&nbsp;</span>
									</td>
									<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/VFF-T.jpg', sizingMethod='scale'); height: 35px;">
										<span style="font-size: 14px; color: black;font-weight: bolder;">VFF</span>
									</td>
									<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/PVS-T.jpg', sizingMethod='scale'); height: 35px;">
										<span style="font-size: 14px; color: white;font-weight: bolder;">PVS</span>
									</td>
									<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/0S-T.jpg', sizingMethod='scale'); height: 35px;">
										<span style="font-size: 14px; color: white;font-weight: bolder;">0-S</span>
									</td>
									<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/SOP-T.jpg', sizingMethod='scale'); height: 35px;">
										<span style="font-size: 14px; color: white;font-weight: bolder;">SOP</span>
									</td>
								</tr>
							</table>
						</div>
						<%
							}
						%>
						
					</div>
					<div id="right">
						<div style="margin:3px 10px;font-weight: bold;">Top</div>
						<div class="div"><table width="350" cellspacing="0">
								<tr style="font-weight: bold;">
									<td>Kritische Umfänge</td>
									<td>Einzelteile</td>
									<td>VSI SWZ</td>
									<td>VSI N3</td>
								</tr>
								<% 
								if (fv9TopKrisUmf != null && fv9TopKrisUmf.size() > 0) {
									for(int i=0; i<fv9TopKrisUmf.size(); i++){
								%>
								<tr>
									<td style="text-indent: 15px;text-align: left;">
										<% if (!"".equals(fv9TopKrisUmf.get(i))) { %>
											<%=fv9TopKrisUmf.get(i) %>
										<%} else {%>
											&nbsp;
										<%}%>
									</td>
									<td>
										<% if (!"".equals(fv9TopEinNum.get(i))) { %>
											<%=fv9TopEinNum.get(i) %>
										<%} else {%>
											&nbsp;
										<%}%>
									</td>
									<td>
										<% if (!"".equals(fv9TopVSIN3.get(i))) { %>
											<%=fv9TopVSIN3.get(i) %>
										<%} else {%>
											&nbsp;
										<%}%>
									</td>
									<td>
										<% if (!"".equals(fv9TopVSISWZ.get(i))) { %>
											<%=fv9TopVSISWZ.get(i) %>
										<%} else {%>
											&nbsp;
										<%}%>
									</td>
								</tr>
								<%
									}
									if (fv9TopKrisUmf.size() < 10) {
										for (int k=0; k<10-fv9TopKrisUmf.size(); k++) {
								%>
									<tr>
										<td style="text-indent: 15px;text-align: left;">&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
							<%		
										}		
									}
								}
									
								if (fv9TopKrisUmf == null) {
									for (int k=0; k<10; k++) {
								%>
								<tr>
									<td style="text-indent: 15px;text-align: left;">&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<%		
									}
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
