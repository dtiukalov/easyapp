<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		
		String fv9KWNo = Web.getNumberListStr((List)form.get("fv9KWNo"));
		String fv9AuditErstang = Web.getNumberListStr((List)form.get("fv9AuditErstang"));
		String fv9TargetProg = Web.getNumberListStr((List)form.get("fv9TargetProg"));
		String fv9AuditZweit = Web.getNumberListStr((List)form.get("fv9AuditZweit"));
		String fv9KonzAuditMitNA = Web.getNumberListStr((List)form.get("fv9KonzAuditMitNA"));
		String fv9AuditMax = Web.getNumberListStr((List)form.get("fv9AuditMax"));
		String fv9AuditMin = Web.getNumberListStr((List)form.get("fv9AuditMin"));
		
		List auditMax = (List)form.get("fv9AuditMax");
		List auditMin = (List)form.get("fv9AuditMin");
		
		fv9KonzAuditMitNA = fv9KonzAuditMitNA.replaceAll("0.0", "null");
		
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
						text: ' '
					},
					xAxis: {
						lineColor:'gray',
						tickColor:'gray',
						labels: {
							y:25,
							//x:-6,
							style: {
								color:'black'
							}
						},
						categories: <%=fv9KWNo%>
						
					},
					yAxis: {
						min: 0,
						max: 6,
						gridLineWidth:0,
						tickWidth:1,
						lineWidth:1,
						lineColor:'gray',
						tickColor:'gray',
 						title: {
							text: ''
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						layout: 'vertical',
						verticalAlign: 'center',
						x: 250,
						y: 50,
						borderWidth: 0
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
							borderColor:'gray',
							borderWidth:1,
							groupPadding:0.1,
							pointPadding:0.1,
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
				    series: [{
						type: 'line',
						name: 'Konzernziel Audit mit NA',
						data: <%=fv9KonzAuditMitNA%>,
						color: '#FA3611',
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'diamond',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}, {
						type: 'line',
						name: 'TargetPrognose',
						data: <%=fv9TargetProg%>,
						color: '#9DCE09',
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'diamond',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}, {
						name: 'Audit-Erstangebot',
						data: <%=fv9AuditErstang%>,
						color: '#AED4F8'
					}, {
						type: 'scatter',
						name: 'Audit-Zweitangebot',
						data: <%=fv9AuditZweit%>,
						color: '#003366',
						marker: {
							enabled: true,
							shadow:false,
							symbol : 'diamond'
						}
					}
					<%
					String js_str = "";
					if (auditMax != null && auditMax.size() > 0 && auditMin != null && auditMin.size() > 0) {
						for (int i=0; i<auditMax.size(); i++){
							js_str += ",{type: 'scatter',data: [[" + i + "," + auditMin.get(i) + "],[" + i + "," + auditMax.get(i) + "]],showInLegend: false,lineWidth : 1,color: 'black',marker:{enabled: true,shadow:false,symbol : 'triangle-down'}}";
						}
					}
					%>
					<%=js_str%>
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
				<div id="chart" style="width: 700px; height: 450px; margin: 0 auto"></div>
				<div id="meilstein" style="width: 674px; height: 30px; margin-left: 150px; text-align: center; overflow: hidden; ">
					<div style=" width: <%=vff%>%; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
					<div style=" width: <%=pvs%>%; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
					<div style=" width: <%=os%>%; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
					<div style=" width: <%=sop%>%; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
