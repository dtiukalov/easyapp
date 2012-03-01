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
		<title><%=title %></title>
		<%
		List KWNo = (List)form.get("fv9KWNo"); //周数
		List InPlanung = (List)form.get("fv9InPlanung");  //计划中
		List MabnaNichtErarb = (List)form.get("fv9MabnaNichtErarb"); //为制定措施
		List MabnaWerdenDef = (List)form.get("fv9MabnaWerdenDef"); //将要制定措施
		List MabnaDef = (List)form.get("fv9MabnaDef"); //已制定措施
		List IO = (List)form.get("fv9IO");  //i.O.
		List PrognosePlan = (List)form.get("fv9PrognosePlan"); //计划预测
		List Zeil = (List)form.get("fv9Zeil"); //目标
		List PrognoseIO = (List)form.get("fv9PrognoseIO");  //预测i.O.

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
			<%
			int total = 125;
			int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
			int size = arr.length;//一共有多少个柱子 
			double pillar = 0.0;
			int vffNum =  0;//柱子个数
			int pvsNum = 0;//柱子个数
			int osNum =  0;//柱子个数
			int sopNum =  0;//柱子个数
			
			if(size > 0){
				int maxKw = arr[size-1];
				int minKw = arr[0];
			
				String vff_start = "";
				String pvs_start = "";
				String os_start = "";
				String sop_start = "";
				String me_start = "";
				
				if(request.getSession().getAttribute("DATE_VFF") != null){
					vff_start = request.getSession().getAttribute("DATE_VFF").toString();
				}
				if(request.getSession().getAttribute("DATE_PVS") != null){
					pvs_start = request.getSession().getAttribute("DATE_PVS").toString();
				}
				if(request.getSession().getAttribute("DATE_0S") != null){
					os_start = request.getSession().getAttribute("DATE_0S").toString();
				}
				if(request.getSession().getAttribute("DATE_SOP") != null){
					sop_start = request.getSession().getAttribute("DATE_SOP").toString();
				}
				if(request.getSession().getAttribute("DATE_ME") != null){
					me_start = request.getSession().getAttribute("DATE_ME").toString();
				}
				
				int[] vffArr = Web.getMilepostArr(vff_start,pvs_start);
				int[] pvsArr = Web.getMilepostArr(pvs_start,os_start);
				int[] osArr = Web.getMilepostArr(os_start,sop_start);
				int[] sopArr = Web.getMilepostArr(sop_start,me_start);
				
				 vffNum =  Web.getNum(vffArr,arr);//柱子个数
				 pvsNum = Web.getNum(pvsArr,arr);;//柱子个数
				 osNum =  Web.getNum(osArr,arr);;//柱子个数
				 sopNum =  Web.getNum(sopArr,arr);;//柱子个数
			}
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
						lineColor:'black',
						gridLineWidth:1,
						gridLineColor:'black',
						//tickLength:13,
						//tickColor:'black',
						categories: <%=fv9KWNo%>,
						plotBands: [{
							from: -100,
							to: 100,
							color: '#C0C0C0'
						}],
						labels:{
							enabled:false,
							style:{
								color:'#C0C0C0'
							}
						}
					},
					yAxis: {
						min: 0,
						max: 120,
						tickWidth:1,
						gridLineColor:'black',
						tickColor:'black',
						lineWidth:1,
						lineColor:'black',
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
						shadow: false,
						enabled:false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
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
					}
<%if(vffNum > 0){%>
					,{
						data: [[<%=vffNum-1%> + 0.3, 0], [<%=vffNum-1%> + 0.3001, <%=total%>]],
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
					}
	<%}%><%if(pvsNum > 0){%>
					,{
						data: [[<%=vffNum + pvsNum-1%> + 0.3, 0], [<%=vffNum + pvsNum-1%> + 0.3001, <%=total%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}
	<%}%><%if(osNum > 0){%>
					, {
						data: [[<%=vffNum + pvsNum + osNum-1%> + 0.3, 0], [<%=vffNum + pvsNum + osNum - 1%> + 0.3001, <%=total%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-S",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-S</B>";
							}
						}
					}
	<%}%><%if(sopNum > 0){%>
					, {
						data: [[<%=vffNum + pvsNum + osNum + sopNum-1%> + 0.3, 0], [<%=vffNum + pvsNum + osNum + sopNum-1%> + 0.3001, <%=total%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"SOP",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>SOP</B>";
							}
						}
					}
	<%}%>				
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
			<div id="content">
				<div id="chart" style="width: 700px; height: 400px; margin: -30px 183px;position:absolute;z-index:1;"></div>
				<div style="width: 821px; margin: 355px 52px;text-align: center;position:absolute;z-index:2;">
				<table class="freigaben" style="border-color: #000;border-collapse:collapse;" cellpadding="0" cellspacing="0" border="1"">
					<tr>
						<td style="text-align: left;width: 400px;">&nbsp;</td>
						<%
						for (int j=0; j<KWNo.size(); j++) {
						%>
							<td style="width: <%=642/KWNo.size()%>px"><%=KWNo.get(j) %></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width:400px;"><img src="<%=request.getContextPath() %>/app/pep/images/ls.jpg">in Planung</td>
						<%
						for (int j=0; j<InPlanung.size(); j++) {
						%>
							<td><%if (InPlanung.get(j) != null){out.print(InPlanung.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width: 400px;"><img src="<%=request.getContextPath() %>/app/pep/images/hs.jpg">Maßnahme nicht erarbeitet</td>
						<%
						for (int j=0; j<MabnaNichtErarb.size(); j++) {
						%>
							<td><%if (MabnaNichtErarb.get(j) != null){out.print(MabnaNichtErarb.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width: 550px;"><img src="<%=request.getContextPath() %>/app/pep/images/huangs.jpg">Maßnahmen werden definiert</td>
						<%
						for (int j=0; j<MabnaWerdenDef.size(); j++) {
						%>
							<td><%if (MabnaWerdenDef.get(j) != null){out.print(MabnaWerdenDef.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width: 300px;"><img src="<%=request.getContextPath() %>/app/pep/images/lvs.jpg">Maßnahme definiert</td>
						<%
						for (int j=0; j<MabnaDef.size(); j++) {
						%>
							<td><%if (MabnaDef.get(j) != null){out.print(MabnaDef.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width: 300px;"><img src="<%=request.getContextPath() %>/app/pep/images/slv.jpg">i.O.</td>
						<%
						for (int j=0; j<IO.size(); j++) {
						%>
							<td><%if (IO.get(j) != null){out.print(IO.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width: 300px;"><img src="<%=request.getContextPath() %>/app/pep/images/lx.jpg">Prognose in Planung</td>
						<%
						for (int j=0; j<PrognosePlan.size(); j++) {
						%>
							<td><%if (PrognosePlan.get(j) != null){out.print(PrognosePlan.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width: 300px;"><img src="<%=request.getContextPath() %>/app/pep/images/hsx.jpg">Ziel</td>
						<%
						for (int j=0; j<Zeil.size(); j++) {
						%>
							<td><%if (Zeil.get(j) != null){out.print(Zeil.get(j));} else {out.print("&nbsp;");}%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td style="text-align: left;width: 300px;"><img src="<%=request.getContextPath() %>/app/pep/images/lsx.jpg">Prognose i.O.</td>
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
