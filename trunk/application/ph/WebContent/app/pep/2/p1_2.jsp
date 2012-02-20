<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<%@page import="com.saturn.web.Web"%>
<!DOCTYPE HTML>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
	<%
		Map form = (Map)request.getAttribute("form");	
		
		//专业组
		List<String> fv9PFMajor = (List<String>) form.get("fv9PFMajor");
		fv9PFMajor.add("Gesamt"); 
		String PFMajor = Web.getStrListStr(fv9PFMajor) ;
		System.out.println("PFMajor = " + PFMajor);
		
		//Gesamt
		List<String> fv9PFGesamtNum = (List<String>) form.get("fv9PFGesamtNum");
		int pfGesamt = 0;
		for (int i=0; i<fv9PFGesamtNum.size(); i++) {
			pfGesamt += Integer.parseInt(fv9PFGesamtNum.get(i));
		}
		fv9PFGesamtNum.add(pfGesamt+"");
		String PFGesamtNum = Web.getNumberListStr(fv9PFGesamtNum);
		
		//Soll
		List<String> fv9PFSollNum = (List<String>) form.get("fv9PFSollNum");
		int pfSoll = 0;
		for (int i=0; i<fv9PFSollNum.size(); i++) {
			pfSoll += Integer.parseInt(fv9PFSollNum.get(i));
		}
		fv9PFSollNum.add(pfSoll+"");
		String PFSollNum = Web.getNumberListStr(fv9PFSollNum);
		System.out.println("PFSollNum = " + PFSollNum);
	
		//Ist
		List<String> fv9PFlstNum = (List<String>) form.get("fv9PFlstNum");
		int pflst = 0;
		for (int i=0; i<fv9PFlstNum.size(); i++) {
			pflst += Integer.parseInt(fv9PFlstNum.get(i));
		}
		fv9PFlstNum.add(pflst+"");
		String PFlstNum = Web.getNumberListStr(fv9PFlstNum);
		System.out.println("PFlstNum = " + PFlstNum);
		
		//offen
		List<Integer> fv9PFoffenNum = new ArrayList<Integer>();
		for(int i=0; i<fv9PFSollNum.size(); i++){
			int soll = Integer.parseInt(fv9PFSollNum.get(i));
			int ist = Integer.parseInt(fv9PFlstNum.get(i));
			fv9PFoffenNum.add(soll - ist);
		}
		String PFoffenNum = Web.getNumberListStr(fv9PFoffenNum);
		
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
					text: 'Anzahl Teile nach TEVON',
					style:{
						color:'black'
					},
					align:'left'
				},
				xAxis: {
					gridLineWidth:1,
					gridLineColor:'#404040',
					categories: <%=PFMajor%>,
					lineColor:'#404040',
					lineWidth:2,
					tickWidth:0,
					tickColor:'#404040',
					labels:{
						y:20,
						style:{
							color:'black'
						}
					}
				},
				yAxis: {
					min: 0,
					lineWidth:1,
					gridLineColor:'#404040',
					lineColor:'#404040',
					tickWidth:1,
					tickColor:'#404040',
					title: {
						text: 'ANZAHL TITLE (ohne Doppelpos)',
						style:{
							color:'black'
						}
					},
					labels:{
						style:{
							color:'black'
						}
					}
				},
				legend: {
					layout: 'vertical',
					align: 'right',
					verticalAlign: 'center',
					borderWidth: 1,
					borderColor:'#404040',
					shadow: false,
					//x: 235,
					y: 60
				},
				tooltip: {
					formatter: function() {
						return ''+
							this.x +': '+ this.y +' mm';
					}
				},
				plotOptions: {
					column: {
						pointPadding: 0.1,
						borderWidth: 1,
						borderColor:'black',
						groupPadding: 0.01,
						shadow:false
						
					}
				},
			    series: [{
					name: 'P-Offen',
					data: <%=PFoffenNum%>,//[177, 0, 4, 9, 159, 0, 2],
					color: '#FC827F'
				}, {
					name: 'P-Ist',
					data: <%=PFlstNum%>,//[2074, 336, 293, 397, 624, 287, 137],
					color: '#85FC84'
				}, {
					name: 'P-Soll',
					data: <%=PFSollNum%>,//[2248, 336, 297, 406, 783, 287, 139],
					color: '#7BBFFC'
				}, {
					name: 'Gesamt',
					data: <%=PFGesamtNum%>,//[2248, 336, 297, 406, 783, 287, 139],
					color: '#E1E1E1'
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
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
				<div id="table" style="width: 800px; height: 400px; margin: 0 auto">
					<table class="freigaben" style="border-color: #000;border-collapse:collapse;" cellpadding="0" cellspacing="0" border="1"">
						<tr>
							<td>&nbsp;</td>
							<%
							for (int i=0; i<fv9PFMajor.size(); i++){
							%>
							<td><%= fv9PFMajor.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td>Pos.Gesamt</td>
							<%
							for (int i=0; i<fv9PFGesamtNum.size(); i++){
							%>
							<td><%= fv9PFGesamtNum.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td>P - Soll</td>
							<%
							for (int i=0; i<fv9PFSollNum.size(); i++){
							%>
							<td><%= fv9PFSollNum.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td>P - Ist</td>
							<%
							for (int i=0; i<fv9PFlstNum.size(); i++){
							%>
							<td><%= fv9PFlstNum.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td>P - Offen</td>
							<%
							for (int i=0; i<fv9PFoffenNum.size(); i++){
							%>
							<td><%= fv9PFoffenNum.get(i)%></td>
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
