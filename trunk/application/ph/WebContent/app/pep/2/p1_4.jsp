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
		//专业组
		List<String> fv9BFMajor = (List<String>) form.get("fv9BFMajor");
		fv9BFMajor.add("Gesamt"); 
		String BFMajor = Web.getStrListStr(fv9BFMajor) ;
		System.out.println("BFMajor = " + BFMajor);
		
		//Gesamt
		List<String> fv9BFGesamtNum = (List<String>) form.get("fv9BFGesamtNum");
		int bfGesamt = 0;
		for (int i=0; i<fv9BFGesamtNum.size(); i++) {
			bfGesamt += Integer.parseInt(fv9BFGesamtNum.get(i));
		}
		fv9BFGesamtNum.add(bfGesamt+"");
		String BFGesamtNum = Web.getNumberListStr(fv9BFGesamtNum);
		
		//Soll
		List<String> fv9BFSollNum = (List<String>) form.get("fv9BFSollNum");
		int bfSoll = 0;
		for (int i=0; i<fv9BFSollNum.size(); i++) {
			bfSoll += Integer.parseInt(fv9BFSollNum.get(i));
		}
		fv9BFSollNum.add(bfSoll+"");
		String BFSollNum = Web.getNumberListStr(fv9BFSollNum);
		System.out.println("BF_SollNum = " + BFSollNum);
	
		//Ist
		List<String> fv9BFlstNum = (List<String>) form.get("fv9BFlstNum");
		int pflst = 0;
		for (int i=0; i<fv9BFlstNum.size(); i++) {
			pflst += Integer.parseInt(fv9BFlstNum.get(i));
		}
		fv9BFlstNum.add(pflst+"");
		String BFlstNum = Web.getNumberListStr(fv9BFlstNum);
		System.out.println("BF_lstNum = " + BFlstNum);
		
		//offen
		List<Integer> fv9BFOffenNum = new ArrayList<Integer>();
		for(int i=0; i<fv9BFMajor.size(); i++){
			int soll = Integer.parseInt(fv9BFSollNum.get(i));
			int ist = Integer.parseInt(fv9BFlstNum.get(i));
			fv9BFOffenNum.add(soll - ist);
		}
		String BFOffenNum = Web.getNumberListStr(fv9BFOffenNum);
		
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
					categories: <%=BFMajor%>,
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
					name: 'B-Offen',
					data: <%=BFOffenNum%>,
					color: '#FC827F'
				}, {
					name: 'B-Ist',
					data: <%=BFlstNum%>,
					color: '#85FC84'
				}, {
					name: 'B-Soll',
					data: <%=BFSollNum%>,
					color: '#7BBFFC'
				}, {
					name: 'Gesamt',
					data: <%=BFGesamtNum%>,
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
				<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
				<div class="fr"> STATUS 19.10.2010</div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
				<div id="table" style="width: 800px; height: 400px; margin: 0 150px">
					<table class="freigaben" style="border-color: #000;border-collapse:collapse;" cellpadding="0" cellspacing="0" border="1"">
						<tr>
							<td>&nbsp;</td>
							<%
							for (int i=0; i<fv9BFMajor.size(); i++){
							%>
							<td><%= fv9BFMajor.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left;">&nbsp;Pos.Gesamt</td>
							<%
							for (int i=0; i<fv9BFGesamtNum.size(); i++){
							%>
							<td><%= fv9BFGesamtNum.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left;">&nbsp;B - Soll</td>
							<%
							for (int i=0; i<fv9BFSollNum.size(); i++){
							%>
							<td><%= fv9BFSollNum.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left;">&nbsp;B - Ist</td>
							<%
							for (int i=0; i<fv9BFlstNum.size(); i++){
							%>
							<td><%= fv9BFlstNum.get(i)%></td>
							<%
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left;">&nbsp;B - Offen</td>
							<%
							for (int i=0; i<fv9BFOffenNum.size(); i++){
							%>
							<td><%= fv9BFOffenNum.get(i)%></td>
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
