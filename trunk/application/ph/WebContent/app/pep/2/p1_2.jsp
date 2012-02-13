<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<%@page import="com.saturn.web.Web"%>
<%

	Map form = (Map)request.getAttribute("form");	

	//专业组
	List fv9PFMajor = new ArrayList(); // form.get("fv9PFMajor");
	fv9PFMajor.add("AGGREGATE");
	fv9PFMajor.add("FAHRWEAK");
	fv9PFMajor.add("KAROSSERIE");
	fv9PFMajor.add("AUSSTATTUNG");
	fv9PFMajor.add("ELEKTRIK");
	fv9PFMajor.add("1:3:4"); 
	fv9PFMajor.add("Gesamt"); 
	String PFMajor = Web.getStrListStr(fv9PFMajor) ;
	System.out.println("PFMajor = " + PFMajor);
	
	//Gesamt
	List fv9PFGesamtNum = new ArrayList(); //(List)form.get("fv9PFGesamtNum");
	fv9PFGesamtNum.add(247);
	fv9PFGesamtNum.add(153);
	fv9PFGesamtNum.add(134);
	fv9PFGesamtNum.add(95);
	fv9PFGesamtNum.add(192);
	fv9PFGesamtNum.add(35);
	int pfGesamt = 0;
	for (int i=0; i<fv9PFGesamtNum.size(); i++) {
		pfGesamt += (Integer)fv9PFGesamtNum.get(i);
	}
	fv9PFGesamtNum.add(pfGesamt);
	String PFGesamtNum = Web.getNumberListStr(fv9PFGesamtNum);
	
	//Soll
	List fv9PFSollNum = new ArrayList(); //(List)form.get("fv9PFSollNum");
	fv9PFSollNum.add(247);
	fv9PFSollNum.add(153);
	fv9PFSollNum.add(134);
	fv9PFSollNum.add(95);
	fv9PFSollNum.add(192);
	fv9PFSollNum.add(35);
	int pfSoll = 0;
	for (int i=0; i<fv9PFSollNum.size(); i++) {
		pfSoll += (Integer)fv9PFSollNum.get(i);
	}
	fv9PFSollNum.add(pfSoll);
	String PFSollNum = Web.getNumberListStr(fv9PFSollNum);

	//Ist
	List fv9PFlstNum = new ArrayList(); //(List)form.get("fv9PFlstNum");
	fv9PFlstNum.add(85);
	fv9PFlstNum.add(121);
	fv9PFlstNum.add(122);
	fv9PFlstNum.add(17);
	fv9PFlstNum.add(180);
	fv9PFlstNum.add(29);
	int pflst = 0;
	for (int i=0; i<fv9PFlstNum.size(); i++) {
		pfSoll += (Integer)fv9PFlstNum.get(i);
	}
	fv9PFlstNum.add(pfSoll);
	String PFlstNum = Web.getNumberListStr(fv9PFlstNum);

	//offen
	List fv9PFoffenNum = new ArrayList();
	for(int i=0; i<fv9PFSollNum.size(); i++){
		fv9PFoffenNum.add((Integer)((Integer)fv9PFSollNum.get(i) - (Integer)fv9PFlstNum.get(i)));
	}
	String PFoffenNum = Web.getStrListStr(fv9PFoffenNum);
	
%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		

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
			<div id="top"><h1>2.1 P-Freigaben</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
