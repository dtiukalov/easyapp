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
	List fv9BF_Major = new ArrayList(); // form.get("fv9BF_Major");
	fv9BF_Major.add("AGGREGATE");
	fv9BF_Major.add("FAHRWEAK");
	fv9BF_Major.add("KAROSSERIE");
	fv9BF_Major.add("AUSSTATTUNG");
	fv9BF_Major.add("ELEKTRIK");
	fv9BF_Major.add("1:3:4"); 
	fv9BF_Major.add("Gesamt"); 
	String BFMajor = Web.getStrListStr(fv9BF_Major) ;
	System.out.println("BFMajor = " + BFMajor);
	
	//Gesamt
	List fv9BF_GesamtNum = new ArrayList(); //(List)form.get("fv9BF_GesamtNum");
	fv9BF_GesamtNum.add(336);
	fv9BF_GesamtNum.add(297);
	fv9BF_GesamtNum.add(406);
	fv9BF_GesamtNum.add(783);
	fv9BF_GesamtNum.add(287);
	fv9BF_GesamtNum.add(139);
	int BF_Gesamt = 0;
	for (int i=0; i<fv9BF_GesamtNum.size(); i++) {
		BF_Gesamt += (Integer)fv9BF_GesamtNum.get(i);
	}
	fv9BF_GesamtNum.add(BF_Gesamt);
	String BF_GesamtNum = Web.getNumberListStr(fv9BF_GesamtNum);
	System.out.println("BF_GesamtNum = " + BF_GesamtNum);
	
	//Soll
	List fv9BF_SollNum = new ArrayList(); //(List)form.get("fv9BF_SollNum");
	fv9BF_SollNum.add(336);
	fv9BF_SollNum.add(297);
	fv9BF_SollNum.add(406);
	fv9BF_SollNum.add(783);
	fv9BF_SollNum.add(287);
	fv9BF_SollNum.add(139);
	int BF_Soll = 0;
	for (int i=0; i<fv9BF_SollNum.size(); i++) {
		BF_Soll += (Integer)fv9BF_SollNum.get(i);
	}
	fv9BF_SollNum.add(BF_Soll);
	String BF_SollNum = Web.getNumberListStr(fv9BF_SollNum);
	System.out.println("BF_SollNum = " + BF_SollNum);
	
	//Ist
	List fv9BF_lstNum = new ArrayList(); //(List)form.get("fv9BF_lstNum");
	fv9BF_lstNum.add(336);
	fv9BF_lstNum.add(293);
	fv9BF_lstNum.add(397);
	fv9BF_lstNum.add(642);
	fv9BF_lstNum.add(287);
	fv9BF_lstNum.add(137);
	int BF_lst = 0;
	for (int i=0; i<fv9BF_lstNum.size(); i++) {
		BF_lst += (Integer)fv9BF_lstNum.get(i);
	}
	fv9BF_lstNum.add(BF_lst);
	String BF_lstNum = Web.getNumberListStr(fv9BF_lstNum);
	System.out.println("BF_lstNum = " + BF_lstNum);
	
	//offen
	List fv9bfoffenNum = new ArrayList();
	for(int i=0; i<fv9BF_SollNum.size(); i++){
		fv9bfoffenNum.add((Integer)((Integer)fv9BF_SollNum.get(i) - (Integer)fv9BF_lstNum.get(i)));
	}
	String BF_OffenNum = Web.getNumberListStr(fv9bfoffenNum);
	System.out.println("BF_OffenNum = " + BF_OffenNum);
	
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
					data: <%=BF_OffenNum%>,//[177, 0, 4, 9, 159, 0, 2],
					color: '#FC827F'
				}, {
					name: 'P-Ist',
					data: <%=BF_lstNum%>,//[2074, 336, 293, 397, 624, 287, 137],
					color: '#85FC84'
				}, {
					name: 'P-Soll',
					data: <%=BF_SollNum%>,//[2248, 336, 297, 406, 783, 287, 139],
					color: '#7BBFFC'
				}, {
					name: 'Gesamt',
					data: <%=BF_GesamtNum%>,//[2248, 336, 297, 406, 783, 287, 139],
					color: '#E1E1E1'
				}]
			});
			
			
		});
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.1 B-Freigaben</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
