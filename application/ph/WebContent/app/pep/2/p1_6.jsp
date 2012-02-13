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
	List fv9BMG_Major = new ArrayList(); // form.get("fv9BMG_Major");
	fv9BMG_Major.add("AGGREGATE");
	fv9BMG_Major.add("FAHRWEAK");
	fv9BMG_Major.add("KAROSSERIE");
	fv9BMG_Major.add("AUSSTATTUNG");
	fv9BMG_Major.add("ELEKTRIK");
	fv9BMG_Major.add("1:3:4"); 
	fv9BMG_Major.add("Gesamt"); 
	String BMGMajor = Web.getStrListStr(fv9BMG_Major) ;
	System.out.println("BMGMajor = " + BMGMajor);
	
	//Gesamt
	List fv9BMG_GesamtNum = new ArrayList(); //(List)form.get("fv9BMG_GesamtNum");
	fv9BMG_GesamtNum.add(336);
	fv9BMG_GesamtNum.add(297);
	fv9BMG_GesamtNum.add(406);
	fv9BMG_GesamtNum.add(783);
	fv9BMG_GesamtNum.add(287);
	fv9BMG_GesamtNum.add(139);
	int BMG_Gesamt = 0;
	for (int i=0; i<fv9BMG_GesamtNum.size(); i++) {
		BMG_Gesamt += (Integer)fv9BMG_GesamtNum.get(i);
	}
	fv9BMG_GesamtNum.add(BMG_Gesamt);
	String BMG_GesamtNum = Web.getNumberListStr(fv9BMG_GesamtNum);
	System.out.println("BMG_GesamtNum = " + BMG_GesamtNum);
	
	//Soll
	List fv9BMG_SollNum = new ArrayList(); //(List)form.get("fv9BMG_SollNum");
	fv9BMG_SollNum.add(336);
	fv9BMG_SollNum.add(297);
	fv9BMG_SollNum.add(406);
	fv9BMG_SollNum.add(783);
	fv9BMG_SollNum.add(287);
	fv9BMG_SollNum.add(139);
	int BMG_Soll = 0;
	for (int i=0; i<fv9BMG_SollNum.size(); i++) {
		BMG_Soll += (Integer)fv9BMG_SollNum.get(i);
	}
	fv9BMG_SollNum.add(BMG_Soll);
	String BMG_SollNum = Web.getNumberListStr(fv9BMG_SollNum);
	System.out.println("BMG_SollNum = " + BMG_SollNum);
	
	//Ist
	List fv9BMG_lstNum = new ArrayList(); //(List)form.get("fv9BMG_lstNum");
	fv9BMG_lstNum.add(336);
	fv9BMG_lstNum.add(293);
	fv9BMG_lstNum.add(397);
	fv9BMG_lstNum.add(642);
	fv9BMG_lstNum.add(287);
	fv9BMG_lstNum.add(137);
	int BMG_lst = 0;
	for (int i=0; i<fv9BMG_lstNum.size(); i++) {
		BMG_lst += (Integer)fv9BMG_lstNum.get(i);
	}
	fv9BMG_lstNum.add(BMG_lst);
	String BMG_lstNum = Web.getNumberListStr(fv9BMG_lstNum);
	System.out.println("BMG_lstNum = " + BMG_lstNum);
	
	//offen
	List fv9BMGoffenNum = new ArrayList();
	for(int i=0; i<fv9BMG_SollNum.size(); i++){
		fv9BMGoffenNum.add((Integer)((Integer)fv9BMG_SollNum.get(i) - (Integer)fv9BMG_lstNum.get(i)));
	}
	String BMG_OffenNum = Web.getNumberListStr(fv9BMGoffenNum);
	System.out.println("BMG_OffenNum = " + BMG_OffenNum);
	
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
					text: 'Anzahl Teile nach TEVON'
				},
				xAxis: {
					categories: <%=BMGMajor%>
				},
				yAxis: {
					min: 0,
					title: {
						text: 'ANZAHL TITLE (ohne Doppelpos)'
					}
				},
				legend: {
					layout: 'vertical',
					backgroundColor: '#FFFFFF',
					align: 'right',
					verticalAlign: 'top',
					x: 0,
					y: 0,
					floating: true,
					shadow: false,
					borderWidth:0
				},
				tooltip: {
					formatter: function() {
						return ''+
							this.x +': '+ this.y +' mm';
					}
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0
					}
				},
			    series: [{
					name: 'P-Offen',
					data: <%=BMG_OffenNum%>,//[177, 0, 4, 9, 159, 0, 2],
					color: '#FC827F'
				}, {
					name: 'P-Ist',
					data: <%=BMG_lstNum%>,//[2074, 336, 293, 397, 624, 287, 137],
					color: '#85FC84'
				}, {
					name: 'P-Soll',
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
			<div id="top"><h1>2.1 BMG</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
