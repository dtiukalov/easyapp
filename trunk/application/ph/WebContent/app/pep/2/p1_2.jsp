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

	//从TC中取出数据
	String[] fv9PFMajor = {"Ausstattung", "Elektrik", "Fahrwerk", "Getriebe", "Karosserie", "Motor", "1:3:4"}; //专业
	Integer[] fv9PFGesamtNum = {247, 153, 134, 0, 95, 192, 35};
	Integer[] fv9PFSollNum = {247, 153, 134, 0, 95, 192, 35};
	Integer[] fv9PFlstNum = {85, 121, 122, 0, 17, 180, 29};
	
	//汇总
	String[] major = new String[fv9PFMajor.length+1];
	Integer[] gesamt = new Integer[fv9PFMajor.length+1];
	Integer[] soll = new Integer[fv9PFMajor.length+1];
	Integer[] ist = new Integer[fv9PFMajor.length+1];
	Integer[] offen = new Integer[fv9PFMajor.length+1];
	
	if (fv9PFMajor.length > 0){
		int gesamtSum = 0; 
		int sollSum = 0;
		int istSum = 0;
		int offenSum = 0;
		for(int i=0; i<fv9PFMajor.length-1; i++) {
			major[i] = fv9PFMajor[i];  
			gesamt[i] = fv9PFGesamtNum[i];  
			soll[i] = fv9PFSollNum[i];  
			ist[i] = fv9PFlstNum[i];  
			offen[i] = fv9PFSollNum[i] - fv9PFlstNum[i];  //计算偏差
			gesamtSum += gesamt[i]; 
			sollSum += soll[i];  
			istSum += ist[i];  
			offenSum += offen[i];
		}
		major[major.length-1] = "Gesamt";  
		gesamt[major.length-1] = gesamtSum;  
		soll[major.length-1] = sollSum;  
		ist[major.length-1] = istSum;  
		offen[major.length-1] = offenSum;  
	}
	
	String majorArr = Web.getStrFromStringArray(major);
	String offenArr = Web.getStrFromIntArray(offen);
	String istArr = Web.getStrFromIntArray(ist);
	String sollArr = Web.getStrFromIntArray(soll);
	String gesamtArr = Web.getStrFromIntArray(gesamt);
	
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
					categories: <%=majorArr%>
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
					data: <%=offenArr%>,//[177, 0, 4, 9, 159, 0, 2],
					color: '#FC827F'
				}, {
					name: 'P-Ist',
					data: <%=istArr%>,//[2074, 336, 293, 397, 624, 287, 137],
					color: '#85FC84'
				}, {
					name: 'P-Soll',
					data: <%=sollArr%>,//[2248, 336, 297, 406, 783, 287, 139],
					color: '#7BBFFC'
				}, {
					name: 'Gesamt',
					data: <%=gesamtArr%>,//[2248, 336, 297, 406, 783, 287, 139],
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
