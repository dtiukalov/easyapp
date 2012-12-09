<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<%@page import="com.saturn.web.Web"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
	<%
		double tdwidth = 0.0;
	
		//专业组
		List<String> fv9BFMajor = (List<String>) form.get("fv9BFMajor");
		if (Web.getListYesOrNo(fv9BFMajor)) {
			fv9BFMajor.add("Gesamt"); 
			tdwidth = 780.0/(fv9BFMajor.size());
		}
		String BFMajor = Web.getStrListStr(fv9BFMajor);
		BFMajor = Web.replaceSpecial(BFMajor);
		
		//Gesamt
		List<String> fv9BFGesamtNum = (List<String>) form.get("fv9BFGesamtNum");
		int bfGesamt = 0;
		if (Web.getListYesOrNo(fv9BFGesamtNum)) {
			for (int i=0; i<fv9BFGesamtNum.size(); i++) {
				bfGesamt += Integer.parseInt(fv9BFGesamtNum.get(i));
			}
			fv9BFGesamtNum.add(bfGesamt+"");
		}
		String BFGesamtNum = Web.getNumberListStr(fv9BFGesamtNum);
		
		//Soll
		List<String> fv9BFSollNum = (List<String>) form.get("fv9BFSollNum");
		int bfSoll = 0;
		if (Web.getListYesOrNo(fv9BFSollNum)) {
			for (int i=0; i<fv9BFSollNum.size(); i++) {
				bfSoll += Integer.parseInt(fv9BFSollNum.get(i));
			}
			fv9BFSollNum.add(bfSoll+"");
		}
		String BFSollNum = Web.getNumberListStr(fv9BFSollNum);
	
		//Ist
		List<String> fv9BFlstNum = (List<String>) form.get("fv9BFlstNum");
		int pflst = 0;
		if (Web.getListYesOrNo(fv9BFlstNum)) {
			for (int i=0; i<fv9BFlstNum.size(); i++) {
				pflst += Integer.parseInt(fv9BFlstNum.get(i));
			}
			fv9BFlstNum.add(pflst+"");
		}
		String BFlstNum = Web.getNumberListStr(fv9BFlstNum);
		
		//offen
		List<String> fv9BFOffenNum = new ArrayList<String>();
		if (Web.getListYesOrNo(fv9BFMajor)) {
			for(int i=0; i<fv9BFMajor.size(); i++){
				int soll = Integer.parseInt(fv9BFSollNum.get(i));
				int ist = Integer.parseInt(fv9BFlstNum.get(i));
				fv9BFOffenNum.add((soll - ist) + "");
			}
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
					verticalAlign: 'bottom',
					borderWidth: 0,
					borderColor:'#404040',
					shadow: false,
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
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<div id="chart" style="width: 950px; height: 480px; margin: 0 auto"></div>
				<div id="table" style="width: 950px; height: 400px; margin: 0 8px">
					<table class="table2" style="border-color: #000;border-collapse:collapse;" cellpadding="0" cellspacing="0" border="1"">
						<tr>
							<td style="text-align: left; width: 90px;">&nbsp;Pos.Gesamt</td>
							<%
							if (Web.getListYesOrNo(fv9BFGesamtNum)) {
								for (int i=0; i<fv9BFGesamtNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9BFGesamtNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 90px;">&nbsp;B - Soll</td>
							<%
							if (Web.getListYesOrNo(fv9BFSollNum)) {
								for (int i=0; i<fv9BFSollNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9BFSollNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 90px;">&nbsp;B - Ist</td>
							<%
							if (Web.getListYesOrNo(fv9BFlstNum)) {
								for (int i=0; i<fv9BFlstNum.size(); i++){
								%>
								<td style="width: <%=tdwidth%>px;"><%= fv9BFlstNum.get(i)%></td>
								<%
								}
							}
							%>
						</tr>
						<tr>
							<td style="text-align: left; width: 90px;">&nbsp;B - Offen</td>
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
