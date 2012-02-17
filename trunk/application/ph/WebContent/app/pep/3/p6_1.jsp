<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<%@page import="com.saturn.web.Web"%>
<!DOCTYPE HTML>
<%@ include file="/app/pep/include/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<%
		title = "3.6 Vorschau 2-Tagesproduktion";
		Map form = (Map)request.getAttribute("form");	

		List KWNo = new ArrayList(); //(List)form.get("fv9KWNo"); //周数
		List InPlanung = new ArrayList(); // (List)form.get("fv9InPlanung");  //计划中
		List MabnaNichtErarb = new ArrayList(); //(List)form.get("fv9MabnaNichtErarb"); //为制定措施
		List MabnaWerdenDef = new ArrayList(); // (List)form.get("fv9MabnaWerdenDef"); //将要制定措施
		List MabnaDef = new ArrayList();// (List)form.get("fv9MabnaDef"); //已制定措施
		List IO = new ArrayList(); // (List)form.get("fv9IO");  //i.O.
		List PrognosePlan = new ArrayList(); //(List)form.get("fv9PrognosePlan"); //计划预测
		List Zeil = new ArrayList();  //(List)form.get("fv9Zeil"); //目标
		List PrognoseIO = new ArrayList();  //(List)form.get("fv9PrognoseIO");  //预测i.O.
		
		KWNo.add(20);KWNo.add(21);KWNo.add(22);KWNo.add(23);KWNo.add(24);
		KWNo.add(25);KWNo.add(26);KWNo.add(27);KWNo.add(28);KWNo.add(29);
		KWNo.add(30);KWNo.add(31);KWNo.add(32);KWNo.add(33);KWNo.add(34);
		KWNo.add(35);KWNo.add(36);KWNo.add(37);KWNo.add(38);KWNo.add(39);
		
		InPlanung.add("0");InPlanung.add("0");InPlanung.add("0");InPlanung.add("49");InPlanung.add(null);
		InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);
		InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);
		InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);InPlanung.add(null);
		
		MabnaNichtErarb.add(0);MabnaNichtErarb.add(0);MabnaNichtErarb.add(1);MabnaNichtErarb.add(1);MabnaNichtErarb.add(null);
		MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);
		MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);
		MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);MabnaNichtErarb.add(null);
		
		MabnaWerdenDef.add(27);MabnaWerdenDef.add(23);MabnaWerdenDef.add(22);MabnaWerdenDef.add(17);MabnaWerdenDef.add(null);
		MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);
		MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);
		MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);MabnaWerdenDef.add(null);
		
		MabnaDef.add(18);MabnaDef.add(20);MabnaDef.add(22);MabnaDef.add(25);MabnaDef.add(null);
		MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);
		MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);
		MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);MabnaDef.add(null);
		
		IO.add(10);IO.add(14);IO.add(15);IO.add(18);IO.add(null);
		IO.add(null);IO.add(null);IO.add(null);IO.add(null);IO.add(null);
		IO.add(null);IO.add(null);IO.add(null);IO.add(null);IO.add(null);
		IO.add(null);IO.add(null);IO.add(null);IO.add(null);IO.add(null);
		
		PrognosePlan.add(55);PrognosePlan.add(58);PrognosePlan.add(60);PrognosePlan.add(61);PrognosePlan.add(65);
		PrognosePlan.add(75);PrognosePlan.add(90);PrognosePlan.add(100);PrognosePlan.add(102);PrognosePlan.add(104);
		PrognosePlan.add(105);PrognosePlan.add(105);PrognosePlan.add(106);PrognosePlan.add(107);PrognosePlan.add(107);
		PrognosePlan.add(108);PrognosePlan.add(109);PrognosePlan.add(110);PrognosePlan.add(110);PrognosePlan.add(110);
		
		Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);
		Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);
		Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);
		Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);Zeil.add(110);
		
		PrognoseIO.add(26);PrognoseIO.add(28);PrognoseIO.add(32);PrognoseIO.add(42);PrognoseIO.add(52);
		PrognoseIO.add(63);PrognoseIO.add(71);PrognoseIO.add(80);PrognoseIO.add(89);PrognoseIO.add(93);
		PrognoseIO.add(94);PrognoseIO.add(95);PrognoseIO.add(97);PrognoseIO.add(98);PrognoseIO.add(99);
		PrognoseIO.add(100);PrognoseIO.add(101);PrognoseIO.add(102);PrognoseIO.add(103);PrognoseIO.add(104);
		
		String fv9KWNo = Web.getNumberListStr(KWNo);
		String fv9InPlanung = Web.getNumberListStr(InPlanung);
		String fv9MabnaNichtErarb = Web.getNumberListStr(MabnaNichtErarb);
		String fv9MabnaWerdenDef = Web.getNumberListStr(MabnaWerdenDef);
		String fv9MabnaDef = Web.getNumberListStr(MabnaDef);
		String fv9IO = Web.getNumberListStr(IO);
		String fv9PrognosePlan = Web.getNumberListStr(PrognosePlan);
		String fv9Zeil = Web.getNumberListStr(Zeil);
		String fv9PrognoseIO = Web.getNumberListStr(PrognoseIO);
		
		%>
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineColor:'#747474',
						gridLineWidth:1,
						gridLineColor:'#747474',
						tickLength:13,
						tickColor:'#747474',
						categories: <%=fv9KWNo%>,
						plotBands: [{
							from: -100,
							to: 100,
							color: '#C0C0C0'
						}],
						labels:{
							style:{
								color:'black'
							}
						}
					},
					yAxis: {
						min: 0,
						max: 120,
						tickWidth:1,
						gridLineColor:'#747474',
						tickColor:'#747474',
						lineWidth:1,
						lineColor:'#747474',
						title: {
							text: ' '
						},
						labels:{
							style:{
								color:'black'
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'left',
						verticalAlign: 'bottom',
						x: 0,
						y: 0,
						borderWidth: 1,
						borderRadius: 0,
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
							borderColor:'black',
							borderWidth:1,
							groupPadding: 0.11
						}
					},
				    series: [{
						type: 'column',
						name: 'in Planung',
						data: <%=fv9InPlanung%>,
						color: '#0000FF'
					}, {
						type: 'column',
						name: 'Maßnahmen nicht erarbeitet',
						data: <%=fv9MabnaNichtErarb%>,
						color: '#FF0000'
					}, {
						type: 'column',
						name: 'Maßnahmen werden definiert',
						data: <%=fv9MabnaWerdenDef%>,
						color: '#FFFF00'
					}, {
						type: 'column',
						name: 'Maßnahmen definiert',
						data: <%=fv9MabnaDef%>,
						color: '#AAD42A'
					}, {
						type: 'column',
						name: 'i.O.',
						data: <%=fv9IO%>,
						color: '#008000'
					}, {
						type: 'spline',
						name: 'Prognose in Planung',
						color: '#0000FE',
						lineWidth:1,
						shadow:false,
						marker: {
							radius : 3
						},
						data: <%=fv9PrognosePlan%>
					}, {
						type: 'line',
						name: 'Ziel',
						color: '#993300',
						lineWidth:1,
						shadow:false,
						marker: {
							enabled: true,
							symbol : 'triangle',
							radius : 3
						},
						data: <%=fv9Zeil%>
					}, {
						type: 'line',
						name: 'Prognose i.O.',
						color: '#008000',
						lineWidth:1,
						shadow:false,
						marker: {
							enabled: true,
							shadow:false,
							symbol : 'circle',
							radius : 3
						},
						data: <%=fv9PrognoseIO%>
					}, {
						data: [[1, 0], [1.0001, 2500]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					},{
						data: [[3, 0], [3.0001, 2500]],
						name :"PVS",
				//		color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						},marker: {
								symbol: 'url(../graphics/sun.png)'
							}

					},{
						data: [[5, 0], [5.0001, 2500]],
						name :"0-S",
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>OS</B>";
							}
						}
					}]
				});
			});
		</script>
		<title><%=title %></title>
	</head>

	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>
			<div id="content" style="height:600px;">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
				<div style="width: 800px; margin: 0 auto;text-align: center; margin-top: 20px;">
				<table border="1" >
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<KWNo.size(); j++) {
						%>
							<td><%=KWNo.get(j) %></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<InPlanung.size(); j++) {
						%>
							<td><%if (InPlanung.get(j) != null){out.print(InPlanung.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<MabnaNichtErarb.size(); j++) {
						%>
							<td><%if (MabnaNichtErarb.get(j) != null){out.print(MabnaNichtErarb.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<MabnaWerdenDef.size(); j++) {
						%>
							<td><%if (MabnaWerdenDef.get(j) != null){out.print(MabnaWerdenDef.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<MabnaDef.size(); j++) {
						%>
							<td><%if (MabnaDef.get(j) != null){out.print(MabnaDef.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<IO.size(); j++) {
						%>
							<td><%if (IO.get(j) != null){out.print(IO.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<PrognosePlan.size(); j++) {
						%>
							<td><%if (PrognosePlan.get(j) != null){out.print(PrognosePlan.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<Zeil.size(); j++) {
						%>
							<td><%if (Zeil.get(j) != null){out.print(Zeil.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td width="245">&nbsp;</td>
						<%
						for (int j=0; j<PrognoseIO.size(); j++) {
						%>
							<td><%if (PrognoseIO.get(j) != null){out.print(PrognoseIO.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
				</table>
				
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
