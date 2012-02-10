<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<%
		Map form = (Map)request.getAttribute("form");
		
		//String kws = Web.getNumberListStr(form.get("fv9KWNo"));
		List<String> fv9KWNo = (List<String>)form.get("fv9KWNo");
		List<String> solllist = (List<String>)form.get("fv9ZP8NumSoll");
		List<String> lstlist = (List<String>)form.get("fv9ZP8Numlst");
		
		List<Integer> kumSolllist = new ArrayList<Integer>(solllist.size());
		List<Integer> kumLstlist = new ArrayList<Integer>(solllist.size());
		
		String kws = "[]";
		String soll = "[]";
		String kumSoll = "[]";
		String lst = "[]";
		String kumLst = "[]";
		if(fv9KWNo != null ){
			kws = Web.getNumberListStr(fv9KWNo);
		}
		if(solllist != null ){
			int temp1 = 0;
			for(int i=0; i<solllist.size(); i++){
				if(i == 0){
					temp1 = Integer.parseInt(solllist.get(i)) ;
				}else{
					temp1 = temp1 + Integer.parseInt(solllist.get(i));
				}
				kumSolllist.add(temp1);
			}
			soll = Web.getNumberListStr(solllist);
			kumSoll = Web.getNumberListStr(kumSolllist);
		}
		
		if(lstlist != null ){
			int temp2 = 0;
			for(int i=0; i<lstlist.size(); i++){
				if(i == 0){
					temp2 = Integer.parseInt(lstlist.get(i));
				}else{
					temp2 = temp2 + Integer.parseInt(lstlist.get(i));
				}
				kumLstlist.add(temp2);
			}
			lst = Web.getNumberListStr(lstlist);
			kumLst = Web.getNumberListStr(kumLstlist);
		}
		
		
		%>
		<script type="text/javascript">
		
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					zoomType: 'xy'
				},
				title: {
					text: 'Fahrzeugbauprogramm ZP8'
				},
				xAxis: {
					categories: <%=kws%>//[5,6,7,8,9,10,11]  
				},
				yAxis: {
					title: {
						text: 'Anzahl Fzg.',
						style: {
							color: '#333333'
						}
					}
				},
				tooltip: {
					formatter: function() {
						var s = ''+
								this.x  +'KW : '+ this.y;
						return s;
					}
				},
				plotOptions: {
					spline: {
						dataLabels: {
							enabled: true
						},
						enableMouseTracking: true
					},
					column: {
						dataLabels: {
							enabled: true
						},
						enableMouseTracking: true
					}
				},
				series: [{
					type: 'column',
					name: 'Soll',
					color: '#009C0E',
					data: <%=soll%>
				}, {
					type: 'column',
					name: 'Lst',
					color: '#0000FF',
					data:  <%=lst%>
				}, {
					type: 'spline',
					name: 'Kum Soll',
					color: '#009C0E',
					data: <%=kumSoll%>
				}, {
					type: 'spline',
					name: 'Kum Lst',
					color: '#0000FF',
					data:  <%=kumLst%>
				}]
			});
			
			
		});
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>1.5 Fahrzeugaufbaustatus</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
