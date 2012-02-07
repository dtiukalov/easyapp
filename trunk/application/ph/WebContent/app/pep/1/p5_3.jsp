<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@page import="json.JSONArray;"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<%
			Map<String, String> form = new HashMap<String, String>();//(Map<String, String>)request.getAttribute("form");
			
			form.put("KW0","2");form.put("Soll0","2");form.put("Ist0","0");
			form.put("KW1","3");form.put("Soll1","7");form.put("Ist1","0");
			form.put("KW2","4");form.put("Soll2","0");form.put("Ist2","0");
			form.put("KW3","5");form.put("Soll3","6");form.put("Ist3","0");
			form.put("KW4","6");form.put("Soll4","2");form.put("Ist4","0");
			form.put("KW5","7");form.put("Soll5","1");form.put("Ist5","0");
			form.put("KW6","8");form.put("Soll6","6");form.put("Ist6","0");
			form.put("KW7","9");form.put("Soll7","8");form.put("Ist7","0");
			form.put("KW8","10");form.put("Soll8","5");form.put("Ist8","0");
			form.put("KW9","11");form.put("Soll9","1");form.put("Ist9","0");
			form.put("KW10","12");form.put("Soll10","1");form.put("Ist10","0");
			form.put("KW11","13");form.put("Soll11","1");form.put("Ist11","0");
			form.put("KW12","14");form.put("Soll12","1");form.put("Ist12","0");
			form.put("KW13","");form.put("Soll13","");form.put("Ist13","");
			form.put("KW14","");form.put("Soll14","");form.put("Ist14","");
			form.put("KW15","");form.put("Soll15","");form.put("Ist15","");
			form.put("KW16","");form.put("Soll16","");form.put("Ist16","");
			form.put("KW17","");form.put("Soll17","");form.put("Ist17","");
			form.put("KW18","");form.put("Soll18","");form.put("Ist18","");
			form.put("KW19","");form.put("Soll19","");form.put("Ist19","");
			
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		//	Map<String, Map <String,String>>  map = new HashMap<String, Map <String,String>>();
			
			for(int i=0; i < 20; i++){
				String value = form.get("KW" + i);
					if(value != null && !"".equals(value)){
						Map<String,String> tempMap = new HashMap<String,String>();
						tempMap.put("KW" + i , form.get("KW" + i));
						tempMap.put("Soll" + i,form.get("Soll" + i));
						tempMap.put("Ist" + i, form.get("Ist" + i));
						list.add(tempMap);
					}
			}
			//排序todo
			int size = list.size();
			int[] kw = new int[size];
			int[] soll = new int[size];
			int[] kumSoll = new int[size];
			int[] lst = new int[size];
			int[] kumLst = new int[size];
			
			JSONArray kwarr = new JSONArray();
			JSONArray sollarr = new JSONArray();
			JSONArray kumSollarr = new JSONArray();
			JSONArray lstarr = new JSONArray();
			JSONArray kumLstkwarr = new JSONArray();
			
			for(int j=0; j < size; j++ ){
				Map<String, String> map = list.get(j);
				kw[j] = Integer.parseInt(map.get("KW" + j));
				kwarr.put(j,kw[j]);
				
				soll[j] = Integer.parseInt(map.get("Soll" + j));
				if(j == 0){
					kumSoll[j] = soll[j];
				} else {
					kumSoll[j] = kumSoll[j-1] + soll[j];
				}
				sollarr.put(j,soll[j]);
				kumSollarr.put(j,kumSoll[j]);
				
				lst[j] = Integer.parseInt(map.get("Ist" + j));
				if(j == 0){
					kumLst[j] = lst[j];
				} else {
					kumLst[j] = kumLst[j-1] + lst[j];
				}
				lstarr.put(j,lst[j]);
				kumLstkwarr.put(j,kumLst[j]);
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
					categories: <%=kwarr%>//[5,6,7,8,9,10,11]  
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
					data: <%=sollarr%>
				}, {
					type: 'column',
					name: 'Lst',
					color: '#0000FF',
					data:  <%=lstarr%>
				}, {
					type: 'spline',
					name: 'Kum Soll',
					color: '#009C0E',
					data: <%=kumSollarr%>
				}, {
					type: 'spline',
					name: 'Kum Lst',
					color: '#0000FF',
					data:  <%=kumLstkwarr%>
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
