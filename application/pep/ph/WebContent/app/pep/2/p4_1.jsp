<%@page import="com.saturn.tc.utils.DateUtils"%>
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
			int fv9PronoseAbgesch = 0;
			int fv9PronoseSmall2Woch = 0;
			int fv9PronoseBig2Woch = 0;

			 if(Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))){
				fv9KWNo = Web.getNumberListStrSubFirst((List<String>)form.get("fv9KWNo"));
				fv9KWNo = fv9KWNo.substring(0, fv9KWNo.length()-1);
				fv9KWNo += ",'', '', '']";
			 }	
			 
			 if(Web.getListYesOrNo((List<String>)form.get("fv9AekoAbgesch"))){
				fv9AekoAbgesch = Web.getNumberListStrSubFirst((List<String>)form.get("fv9AekoAbgesch"));
				fv9AekoAbgesch = fv9AekoAbgesch.substring(0, fv9AekoAbgesch.length()-1);
				fv9AekoAbgesch += ", null, null,";
				if(Web.getObjectYesOrNo(form.get("fv9PronoseAbgesch"))){
					fv9PronoseAbgesch = Integer.parseInt((String)form.get("fv9PronoseAbgesch"));
				}
				fv9AekoAbgesch += fv9PronoseAbgesch + "]";
			 }
			 
			 if(Web.getListYesOrNo((List<String>)form.get("fv9AekoSmall2Woch"))){
				fv9AekoSmall2Woch = Web.getNumberListStrSubFirst((List<String>)form.get("fv9AekoSmall2Woch"));
				fv9AekoSmall2Woch = fv9AekoSmall2Woch.substring(0, fv9AekoSmall2Woch.length()-1);
				fv9AekoSmall2Woch += ", null, null,";
				if(Web.getObjectYesOrNo(form.get("fv9PronoseSmall2Woch"))){
					fv9PronoseSmall2Woch = Integer.parseInt((String)form.get("fv9PronoseSmall2Woch"));
				}
				fv9AekoSmall2Woch += fv9PronoseSmall2Woch + "]";
			 }
			 
			 if(Web.getListYesOrNo((List<String>)form.get("fv9AekoBig2Woch"))){
				fv9AekoBig2Woch = Web.getNumberListStrSubFirst((List<String>)form.get("fv9AekoBig2Woch"));
				fv9AekoBig2Woch = fv9AekoBig2Woch.substring(0, fv9AekoBig2Woch.length()-1);
				fv9AekoBig2Woch += ", null, null,";
				if(Web.getObjectYesOrNo(form.get("fv9PronoseBig2Woch"))){
					fv9PronoseBig2Woch = Integer.parseInt((String)form.get("fv9PronoseBig2Woch"));
				}
				fv9AekoBig2Woch += fv9PronoseBig2Woch + "]";
			 }
			 
			 if(Web.getListYesOrNo((List<String>)form.get("fv9AekoAbgesch")) && 
					 Web.getListYesOrNo((List<String>)form.get("fv9AekoSmall2Woch")) &&
					 Web.getListYesOrNo((List<String>)form.get("fv9AekoBig2Woch"))){
						 
					 List<String> sumList = Web.SumList((List<String>)form.get("fv9AekoAbgesch"), 
								(List<String>)form.get("fv9AekoSmall2Woch"),
								(List<String>)form.get("fv9AekoBig2Woch"));
					 deviationa = Web.compareByKW(sumList);
					 deviationa = deviationa.substring(0, deviationa.length()-1);
					 deviationa += ", '', '', '']";
			 }
			String categories = "";
			categories += "[";
			
			categories += "]";
			 
			//如果二维表中的周数跨年，则取当前年的前一年
			//如果二维表中的周数不跨年，则取当前年
			String show_year = DateUtils.getCurrentYear();
			if(Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))){
				List weeks = ((List<String>)form.get("fv9KWNo"));
				int n = weeks.size();
				if (n >= 2) {
					if (Integer.parseInt((String)weeks.get(0)) >= Integer.parseInt((String)weeks.get(n-1))) {
						show_year = (Integer.parseInt((String)DateUtils.getCurrentYear()) - 1) + "";
					}
				}
			}
		%>

		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column',
					marginLeft:30
				},
				title: {
					text: 'Anzahl AEnderungen',
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
						y:12,
						style:{
							color:'black',
							fontSize:'12px'
						}
					}
				}, {
					categories: '[]',
					lineColor:'black',
					linkedTo: 0,
					lineWidth:2,
					title: {
						text: '<%=show_year%> Anzahl neuer AEKOs',
						style:{
							color:'black'
						}
					},
					labels: {
						enabled:false
					}
				}, {
					categories:  <%=deviationa%>,
					lineColor:'black',
					lineWidth:2,
					linkedTo: 1,
					title: {
						style:{
							color:'black'
						}
					},
					labels: {
						enabled:true
					}
				}
				],
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
					enabled: true,
					layout: 'horizontal',
					align: 'center',
					verticalAlign: 'top',
					x: 10,
					y: 20,
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
							color: 'black',
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
							}
						}
					}
				},
			    series: [
			     {
					name: 'AEKO,AeA  im Durchlauf (> 2 Wochen)',
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
					name: 'AEKO,AeA im Durchlauf (< 2 Wochen)',
					data: <%=fv9AekoSmall2Woch%>,
					color: '#F9A700'
				},{
					name: 'AEKO,AeA abgeschlossen',
					data: <%=fv9AekoAbgesch%>,
					color: '#009C0E',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
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
				<div id="chart" style="width: 900px; height: 400px; margin: 50px 30px; float: left;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>