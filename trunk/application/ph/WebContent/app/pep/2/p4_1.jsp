<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		
		<%
			String fv9KWNo = "[]";
			String fv9AekoAbgesch =  "[]";
			String fv9AekoSmall2Woch =  "[]";
			String fv9AekoBig2Woch =  "[]"; 
			String deviationa =  "[]";
			
			 if(form.get("fv9KWNo") != null && ((List<String>)form.get("fv9KWNo")).size() > 0){
				fv9KWNo = Web.getNumberListStrSubFirst((List<String>)form.get("fv9KWNo"));
			 }	
			 if(form.get("fv9AekoAbgesch") != null && ((List<String>)form.get("fv9AekoAbgesch")).size() > 0){
				fv9AekoAbgesch =  Web.getNumberListStrSubFirst((List<String>)form.get("fv9AekoAbgesch"));
			 }
			 if(form.get("fv9AekoSmall2Woch") != null && ((List<String>)form.get("fv9AekoSmall2Woch")).size() > 0){
				fv9AekoSmall2Woch = Web.getNumberListStrSubFirst((List<String>)form.get("fv9AekoSmall2Woch"));
			 }
			 if(form.get("fv9AekoBig2Woch") != null && ((List<String>)form.get("fv9AekoBig2Woch")).size() > 0){
				fv9AekoBig2Woch = Web.getNumberListStrSubFirst((List<String>)form.get("fv9AekoBig2Woch"));
			 }
			 if(((List<String>)form.get("fv9AekoAbgesch")).size() > 0 &&
					 ((List<String>)form.get("fv9AekoSmall2Woch")).size() > 0&&
					 ((List<String>)form.get("fv9AekoBig2Woch")).size() > 0 ){
				 
				 List<String> sumList = Web.SumList((List<String>)form.get("fv9AekoAbgesch"), 
							(List<String>)form.get("fv9AekoSmall2Woch"),
							(List<String>)form.get("fv9AekoBig2Woch"));
				 deviationa = Web.compareByKW(sumList);
			 }
			
			int fv9PronoseAbgesch = 0;
			int fv9PronoseSmall2Woch = 0;
			int fv9PronoseBig2Woch = 0;
		
			if(form.get("fv9PronoseAbgesch")!= null && !"".equals(form.get("fv9PronoseAbgesch")) ){
				fv9PronoseAbgesch = Integer.parseInt((String)form.get("fv9PronoseAbgesch"));
			}
			
			if(form.get("fv9PronoseSmall2Woch")!= null && !"".equals(form.get("fv9PronoseSmall2Woch")) ){
				fv9PronoseSmall2Woch = Integer.parseInt((String)form.get("fv9PronoseSmall2Woch"));
			}

			if(form.get("fv9PronoseBig2Woch")!= null && !"".equals(form.get("fv9PronoseBig2Woch")) ){
				fv9PronoseBig2Woch = Integer.parseInt((String)form.get("fv9PronoseBig2Woch"));
			}

		%>

		<script type="text/javascript">
		var chart1;
		var chart2;
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart1',
					defaultSeriesType: 'column',
					marginLeft:30
				},
				title: {
					text: 'Anzahl Änderungen',
					style:{
						color:'black',
						fontSize:'20px'
					}
				},
				xAxis: [{
					lineColor:'black',
					tickWidth:0,
					lineWidth:2,
					categories: <%=fv9KWNo%>,
					labels:{
						enabled:true,
						y:20,
						style:{
							color:'black',
							fontSize:'12px'
						}
					}
				},{ // mirror axis on right side
					//opposite: false,
					//reversed: false,
					categories: <%=deviationa%>,
					linkedTo: 0,
					lineColor:'black',
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:20,
						style:{
							color:'black',
							fontSize:'12px'
						}
					},
					title: {
						text: '2011 Anzahl neuer ÄKOs',
						style:{
							color:'black'
						}
					}
				}],
				yAxis: {
					gridLineWidth: 0,
					title: {
						text: ''
					},
					labels:{
						enabled:false,
						style:{
							color:'black'
						}
					},
					stackLabels: {
						enabled: true,
						y:-15,
						style: {
							color: 'black',
							fontSize:'12px'
						}
					}
				},
				legend: {
					enabled: false,
					layout: 'vertical',
					align: 'right',
					verticalAlign: 'top',
					x: -10,
					y: 220,
					borderWidth: 0,
					shadow: false
				},
				tooltip: {
					formatter: function() {
						return '<b>'+ this.x +'</b><br/>'+
							 this.series.name +': '+ this.y +'<br/>'+
							 'Total: '+ this.point.stackTotal;
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						borderColor: 'black',
						pointWidth:20,
						shadow:false,
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'12px'
							},
							color: 'black'
						}
					}
				},
			    series: [
			     {
					name: 'ÄKO,AeA  im Durchlauf (> 2 Wochen)',
					data: <%=fv9AekoBig2Woch%>,
					color: '#E63110',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
				}, {
					name: 'ÄKO,AeA im Durchlauf (< 2 Wochen)',
					data: <%=fv9AekoSmall2Woch%>,
					color: '#F9A700'
				},{
					name: 'ÄKO,AeA abgeschlossen',
					data: <%=fv9AekoAbgesch%>,
					color: '#009C0E'
				}]
			});
			
			chart2 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart2',
					defaultSeriesType: 'column'
				},
				title: {
					text: '',
					style:{
						color:'black',
						fontSize:'20px'
					}
				},
				xAxis: [{
					lineColor:'black',
					tickWidth:0,
					lineWidth:2,
					categories: ' ',
					labels:{
						enabled:true,
						y:20,
						style:{
							color:'black',
							fontSize:'12px'
						}
					}
				},{ // mirror axis on right side
					opposite: false,
					reversed: false,
					categories: ' ',
					linkedTo: 0,
					lineColor:'black',
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:20,
						style:{
							color:'black',
							fontSize:'12px'
						}
					},
					title: {
						text: '2011 Anzahl neuer ÄKOs',
						style:{
							color:'black'
						}
					}
				}],
				yAxis: {
					gridLineWidth: 0,
					title: {
						text: ''
					},
					labels:{
						enabled:false,
						style:{
							color:'black'
						}
					},
					stackLabels: {
						enabled: true,
						y:-15,
						style: {
							color: 'black',
							fontSize:'12px'
						}
					}
				},
				legend: {
					layout: 'horizontal',
					align: 'right',
					verticalAlign: 'bottom',
					x: -30,
					y: -50,
					borderWidth: 0,
					shadow: false,
		            width:220, 
		            symbolWidth: 10,
					itemStyle: {
			            color: '#000000',
			            paddingBottom: '5px'

			        } 
				},
				
				tooltip: {
					formatter: function() {
						return '<b>'+ this.x +'</b><br/>'+
							 this.series.name +': '+ this.y +'<br/>'+
							 'Total: '+ this.point.stackTotal;
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						borderColor: 'black',
						shadow:false,
						pointWidth:20,
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'12px'
							},
							color: 'black'
						}
					}
				},
			    series: [
			     {
					name: 'ÄKO,AeA  im Durchlauf (> 2 Wochen)',
					data: <%=fv9PronoseBig2Woch%>,
					color: '#E63110',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
				}, {
					name: 'ÄKO,AeA im Durchlauf (< 2 Wochen)',
					data: <%=fv9PronoseSmall2Woch%>,
					color: '#F9A700'
				},{
					name: 'ÄKO,AeA abgeschlossen',
					data: <%=fv9PronoseAbgesch%>,
					color: '#009C0E'
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
				<div id="chart1" style="width: 580px; height: 400px; margin: 50px 30px; float: left;"></div>
				<div id="chart2" style="width: 320px; height: 400px; margin: 36px -50px; float: left;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>