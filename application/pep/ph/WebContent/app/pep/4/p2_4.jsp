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
		List<String> fv9TopVSIN3 = (List<String>)form.get("fv9TopVSIN3");
		List<String> fv9TopVSIN1 = (List<String>)form.get("fv9TopVSIN1");
		
	%>
	<style type="text/css">
		#subtitle h1{
			font-family:Arial, Helvetica, sans-serif;
			font-size:18px; margin:15px 50px auto;
		}
		#left {
			width: 500px; height:600px; margin: 0px 20px auto; float: left; overflow: hidden;
		}
		#left chart{
			width: 500px; height: 400px; margin: 0px 0px auto; float: left; 
		}
		#left time{
			width: 500px; height: 200px; margin: 0px 0px auto; float: left;
		}
		#time table tr td{
			text-align: center;
		}
		#right {
			width: 400px; margin: 0px 10px auto; float: left; padding: 10px; 
		}
		.biaoshi{
			width: 400px;
			height: 120px;
		}
		.div {
			width: 400px;
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
			font-family: Arial;
			font-size: 12px;
			line-height: 35px;
			color: #000000;
			text-align: left;
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
							},
							formatter: function() {
								if (this.point.stackTotal) {
									return '';
								}
								return this.y + '';
							}
						}
					},
					legend: {
						layout: 'vertical',
						enabled: false,
						align: 'center',
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
							groupPadding:0.1,
							pointPadding:0.1,
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
									if (this.y == 0 || this.y == 0.0 || this.y == null) {
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
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="subtitle">
					<h1>Anzahl Teile nach TEVON</h1>
				</div>
				<div id="left">
					<div id="chart"></div>
					<%
					int tbt_vff_kwno = 0; 
					double KWTBT = 0.0;
					double KWPVS = 0.0;
					double KW0S = 0.0;
					double KWSOP = 0.0;
					double sum = 0.0;
					
					int tbtKW = 0;
					
					if ((session.getAttribute("fv9PVSTBTZP5") != null &&
							!"".equals((String)session.getAttribute("fv9PVSTBTZP5")) &&
							session.getAttribute("DATE_PVS") != null &&
							!"".equals((String)session.getAttribute("DATE_PVS"))) ||
						(session.getAttribute("fv9PVSTBTZP7") != null &&
								!"".equals((String)session.getAttribute("fv9PVSTBTZP7")) &&
								session.getAttribute("DATE_PVS") != null &&
								!"".equals((String)session.getAttribute("DATE_PVS")))) {
						
						if ("FV9_42TeileStatPVSHT".equals(type) || "FV9_42TeileStatPVSKT".equals(type)) {
							tbt_vff_kwno = DateUtils.getWeekNumBetweenStartAndEnd(
									(String)session.getAttribute("fv9PVSTBTZP5"),
									(String)session.getAttribute("DATE_PVS")); 
							tbtKW = (Integer)session.getAttribute("PVSTBTZP5");
						}
						if ("FV9_43TeileStatPVSKT".equals(type)) {
							tbt_vff_kwno = DateUtils.getWeekNumBetweenStartAndEnd(
									(String)session.getAttribute("fv9PVSTBTZP7"),
									(String)session.getAttribute("DATE_PVS")); 
							tbtKW = (Integer)session.getAttribute("PVSTBTZP7");
						}
						
						KWTBT = Double.parseDouble(tbt_vff_kwno + "");
						KWPVS = Double.parseDouble((Integer)session.getAttribute("KWNo_PVS") + "");
						KW0S = Double.parseDouble((Integer)session.getAttribute("KWNo_0S") + "");
						KWSOP = Double.parseDouble((Integer)session.getAttribute("KWNo_SOP") + "");
						
						sum = KWPVS + KW0S + KWSOP;
					%>
					<div id="time" style="margin:0 15px">
						<table style="font-size: 10px; ">
							<tr>
								<td style="width: 12px; ">KW</td>
								<td style="width: 45px;"><%=tbtKW %></td>
								<td style="width: 10px;">&nbsp;</td>
								<td style="text-align:left; width: 110px; padding-left: 35px;">
									<%=(Integer)session.getAttribute("KW_PVS") %>
								</td>
								<td style="width: 10px;">&nbsp;</td>
								<td style="text-align:left; width: 50px; padding-left: 15px;">
									<%=(Integer)session.getAttribute("KW_0S") %>
								</td>
								<td style="width: 10px;">&nbsp;</td>
								<td style="text-align:left; width: 50px; padding-left: 15px;">
									<%=(Integer)session.getAttribute("KW_SOP") %>
								</td>
							</tr>
							<tr>
								<td colspan="8" style="border-bottom: 1px solid; height: 0px; line-height: 0px;">&nbsp;</td>
							</tr>
							<tr>
								<td style="width: 12px;">&nbsp;</td>
								<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/VFF-TBT.jpg', sizingMethod='scale'); height: 35px;">
									&nbsp;
								</td>
								<td style="width: 10px;">&nbsp;</td>
								<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/PVS-T.jpg', sizingMethod='scale'); height: 35px; ">
									<span style="font-size: 14px; color: white;font-weight: bolder;">PVS</span>
								</td>
								<td style="width: 10px;">&nbsp;</td>
								<td style="text-align: center; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/0S-T.jpg', sizingMethod='scale'); height: 35px;">
									<span style="font-size: 14px; color: white;font-weight: bolder;">0-S</span>
								</td>
								<td style="width: 10px;">&nbsp;</td>
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
				<div id="right" style="font-family: Arial;">
					<div class="biaoshi">
						<table style="margin: 0px 30px auto; float: right;">
							<tr>
								<td style="width: 20px; height: 20px; background-color: #FFFFFF; border: 1px solid;"></td>
								<td>PT-Teile/Alternativteile</td>
							</tr>
							<tr>
								<td style="width: 20px; height: 20px; background-color: #CCFFCC; border: 1px solid;"></td>
								<td>Teile aus Serienwerkzeug</td>
							</tr>
							<tr>
								<td style="width: 20px; height: 20px; background-color: #00FF00; border: 1px solid;"></td>
								<td>Note 3</td>
							</tr>
							<tr>
								<td style="width: 20px; height: 20px; background-color: #003300; border: 1px solid;"></td>
								<td>Note 1</td>
							</tr>
							<tr>
								<td style="width: 20px; height: 20px; background-color: #FF0000; border: 1px solid;"></td>
								<td>Note 6</td>
							</tr>
						</table>
					</div>
					
					<div style="margin:3px 10px;font-weight: bold;">Top</div>
						<div class="div">
							<table width="400" cellspacing="0">
								<tr style="font-weight: bold;">
									<td>Kritische Umfaenge</td>
									<td>Einzelteile</td>
									<td>VSI N3</td>
									<td>VSI N1</td>
								</tr>
								<% 
								if (fv9TopKrisUmf != null && fv9TopKrisUmf.size() > 0) {
									for(int i=0; i<fv9TopKrisUmf.size(); i++){
								%>
								<tr>
									<td style="text-indent: 15px;text-align: left;">
									<% if (!"".equals(fv9TopKrisUmf.get(i))) {%>
										<%=fv9TopKrisUmf.get(i) %>
									<%} else {%>
										&nbsp;
									<%}%>
									</td>
									<td>
									<% if (!"".equals(fv9TopEinNum.get(i))) { %>
										<%=fv9TopEinNum.get(i) %>
									<%} else { %>
										&nbsp;
									<%} %>
									</td>
									
									<td>
									<% if (!"".equals(fv9TopVSIN3.get(i))) { %>
										<%=fv9TopVSIN3.get(i) %>
									<%} else {%>
										&nbsp;
									<%} %>
									</td>
									
									<td>
									<% if (!"".equals(fv9TopVSIN1.get(i))) { %>
										<%=fv9TopVSIN1.get(i) %>
									<%} else {%>
										&nbsp;
									<%}%>
									</td>
									
								</tr>
								<%
									}
									if (fv9TopKrisUmf.size() < 8) {
										for (int k=0; k<8-fv9TopKrisUmf.size(); k++) {
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
									for (int k=0; k<8; k++) {
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
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
