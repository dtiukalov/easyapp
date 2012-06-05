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
		double tdwidth = 0.0;
	
		//专业组
		List<String> fv9PFMajor = (List<String>) form.get("fv9PFMajor");
		if(Web.getListYesOrNo(fv9PFMajor)){
			 fv9PFMajor.add("Gesamt"); 
			 tdwidth = 800.0/(fv9PFMajor.size());
		}
		String PFMajor = Web.getStrListStr(fv9PFMajor);
		PFMajor = Web.replaceSpecial(PFMajor);
		
		//Gesamt
		List<String> fv9PFGesamtNum = (List<String>) form.get("fv9PFGesamtNum");
		int pfGesamt = 0;
		if(Web.getListYesOrNo(fv9PFGesamtNum)){
			for (int i=0; i<fv9PFGesamtNum.size(); i++) {
				pfGesamt += Integer.parseInt(fv9PFGesamtNum.get(i));
			}
			fv9PFGesamtNum.add(pfGesamt + "");
		}
		String PFGesamtNum = Web.getNumberListStr(fv9PFGesamtNum);
		
		//Soll
		List<String> fv9PFSollNum = (List<String>) form.get("fv9PFSollNum");
		int pfSoll = 0;
		if(Web.getListYesOrNo(fv9PFSollNum)){
			for (int i=0; i<fv9PFSollNum.size(); i++) {
				pfSoll += Integer.parseInt(fv9PFSollNum.get(i));
			}
			fv9PFSollNum.add(pfSoll + "");
		}
		String PFSollNum = Web.getNumberListStr(fv9PFSollNum);
	
		//Ist
		List<String> fv9PFlstNum = (List<String>) form.get("fv9PFlstNum");
		int pflst = 0;
		if(form.get("fv9PFlstNum") != null){
			for (int i=0; i<fv9PFlstNum.size(); i++) {
				pflst += Integer.parseInt(fv9PFlstNum.get(i));
			}
			fv9PFlstNum.add(pflst + "");
		}
		String PFlstNum = Web.getNumberListStr(fv9PFlstNum);
		
		//offen
		List<String> fv9PFoffenNum = new ArrayList<String>();
		if (Web.getListYesOrNo(fv9PFMajor)) {
			for(int i=0; i<fv9PFMajor.size(); i++){
				int soll = Integer.parseInt(fv9PFSollNum.get(i));
				int ist = Integer.parseInt(fv9PFlstNum.get(i));
				fv9PFoffenNum.add((soll - ist) + "");
			}
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
					verticalAlign: 'bottom',
					borderWidth: 0,
					borderColor:'#404040',
					shadow: false,
					//x: 235,
					y: -10,
					itemStyle: {
			            color: '#000000',
			            paddingBottom: '15px'

			        } 
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
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="chart" style="width: 950px; height: 480px; margin: 0 auto"></div>
				<div id="table" style="width: 950px; height: 400px; margin: 0 8px">
					<table class="table2" style="border-color: #000;border-collapse:collapse;" cellpadding="0" cellspacing="0" border="1"">
						<tr>
							<td style="text-align: left; width: 72px;"">&nbsp;Pos.Gesamt</td>
							<%
							if (Web.getListYesOrNo(fv9PFGesamtNum)) {
								for (int i=0; i < fv9PFGesamtNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9PFGesamtNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 72px;"">&nbsp;P - Soll</td>
							<%
							if (Web.getListYesOrNo(fv9PFSollNum)) {
								for (int i=0; i < fv9PFSollNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9PFSollNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 72px;"">&nbsp;P - Ist</td>
							<%
							if (Web.getListYesOrNo(fv9PFlstNum)) {
								for (int i=0; i<fv9PFlstNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9PFlstNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 72px;"">&nbsp;P - Offen</td>
							<%
							if (Web.getListYesOrNo(fv9PFoffenNum)) {
								for (int i=0; i<fv9PFoffenNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9PFoffenNum.get(i)%></td>
								<%
								}
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
