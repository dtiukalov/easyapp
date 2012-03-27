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
		List<String> fv9BMGMajor = (List<String>) form.get("fv9BMGMajor");
		if (Web.getListYesOrNo(fv9BMGMajor)) {
			fv9BMGMajor.add("Gesamt"); 
			tdwidth = 694.0/(fv9BMGMajor.size());
		}
		String BMG_Major = Web.getStrListStr(fv9BMGMajor);
		BMG_Major = Web.replaceSpecial(BMG_Major);
		
		//Gesamt
		List<String> fv9BMGGesamtNum = (List<String>) form.get("fv9BMGGesamtNum");
		int bfGesamt = 0;
		if (Web.getListYesOrNo(fv9BMGGesamtNum)) {
			for (int i=0; i<fv9BMGGesamtNum.size(); i++) {
				bfGesamt += Integer.parseInt(fv9BMGGesamtNum.get(i));
			}
			fv9BMGGesamtNum.add(bfGesamt+"");
		}
		String BMG_GesamtNum = Web.getNumberListStr(fv9BMGGesamtNum);
		
		//Soll
		List<String> fv9BMGSollNum = (List<String>) form.get("fv9BMGSollNum");
		int sum_soll = 0;
		if (Web.getListYesOrNo(fv9BMGSollNum)) {
			for (int i=0; i<fv9BMGSollNum.size(); i++) {
				sum_soll += Integer.parseInt(fv9BMGSollNum.get(i));
			}
			fv9BMGSollNum.add(sum_soll+"");
		}
		String BMG_SollNum = Web.getNumberListStr(fv9BMGSollNum);
	
		//Ist
		List<String> fv9BMGlstNum = (List<String>) form.get("fv9BMGlstNum");
		int sum_ist = 0;
		if (Web.getListYesOrNo(fv9BMGlstNum)) {
			for (int i=0; i<fv9BMGlstNum.size(); i++) {
				sum_ist += Integer.parseInt(fv9BMGlstNum.get(i));
			}
			fv9BMGlstNum.add(sum_ist+"");
		}
		String BMG_lstNum = Web.getNumberListStr(fv9BMGlstNum);
		
		//offen
		List<String> fv9BFOffenNum = new ArrayList<String>();
		if (Web.getListYesOrNo(fv9BMGMajor)) {
			for(int i=0; i<fv9BMGMajor.size(); i++){
				int soll = Integer.parseInt(fv9BMGSollNum.get(i));
				int ist = Integer.parseInt(fv9BMGlstNum.get(i));
				fv9BFOffenNum.add((soll - ist) + "");
			}
		}
		String BMG_OffenNum = Web.getNumberListStr(fv9BFOffenNum);
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
					categories: <%=BMG_Major%>,
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
					name: 'BMG-Offen',
					data: <%=BMG_OffenNum%>,//[177, 0, 4, 9, 159, 0, 2],
					color: '#FC827F'
				}, {
					name: 'BMG-Ist',
					data: <%=BMG_lstNum%>,//[2074, 336, 293, 397, 624, 287, 137],
					color: '#85FC84'
				}, {
					name: 'BMG-Soll',
					data: <%=BMG_SollNum%>,//[2248, 336, 297, 406, 783, 287, 139],
					color: '#7BBFFC'
				}, {
					name: 'Gesamt',
					data: <%=BMG_GesamtNum%>,//[2248, 336, 297, 406, 783, 287, 139],
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
				<div id="chart" style="width: 850px; height: 400px; margin: 0 auto"></div>
				<div id="table" style="width: 800px; height: 400px; margin: 0 8px">
					<table class="table2" style="border-color: #000;border-collapse:collapse;" cellpadding="0" cellspacing="0" border="1"">
						<tr>
							<td style="text-align: left; width: 80px;">&nbsp;Pos.Gesamt</td>
							<%
							if (Web.getListYesOrNo(fv9BMGGesamtNum)) {
								for (int i=0; i<fv9BMGGesamtNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9BMGGesamtNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 80px;">&nbsp;BMG - Soll</td>
							<%
							if (Web.getListYesOrNo(fv9BMGSollNum)) {
								for (int i=0; i<fv9BMGSollNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9BMGSollNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 80px;">&nbsp;BMG - Ist</td>
							<%
							if (Web.getListYesOrNo(fv9BMGlstNum)) {
								for (int i=0; i<fv9BMGlstNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9BMGlstNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 80px;">&nbsp;BMG - Offen</td>
							<%
							if (Web.getListYesOrNo(fv9BFOffenNum)) {
								for (int i=0; i<fv9BFOffenNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9BFOffenNum.get(i)%></td>
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
