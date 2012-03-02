<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<style type="text/css">
			.left{
				width: 100px; height: 50px;float: left;margin: 20px 50px;
				vertical-align: middle;
				font-size:12px;
			}
			.title{
				width: 90px; height: 40px; float: left; margin: 0 auto; text-align: center;vertical-align: middle;padding-top: 20px;
				font-weight: bolder;color: white;
			}
			.chart{
				width: 700px; height: 110px; margin: -6px -20px; float: left;
			}
			.clear1{
				width: 100%;height: 1px;margin: 0 auto; float: left;
			}
		</style>
		<%

		StringBuffer categories = new StringBuffer();
		categories.append("[");
		List kws = (List)form.get("fv9KWNo");
		List fahrzeuge = (List)form.get("fv9Fahrzeuge");
		if (kws != null && kws.size()>0) {
			for (int i=0; i<kws.size()-1; i++) {
				categories.append("'" + kws.get(i) + "<br>" + fahrzeuge.get(i) + "',");
			}
			categories.append("'"+ kws.get(kws.size()-1) + "<br>" + fahrzeuge.get(kws.size()-1) + "'");
		}
		categories.append("]");
		String fv9KWNo = categories.toString();
		
//		冲压车间
		String fv9PresswerkNum = Web.getNumberListStr(form.get("fv9PresswerkNum"));
		String fv9PresswerkProg = Web.getNumberListStr(form.get("fv9PresswerkProg"));
		int totalPress = Web.getMax((List<String>)form.get("fv9PresswerkNum"));
		
//		焊装车间
		String fv9KarossNum = Web.getNumberListStr(form.get("fv9KarossNum"));
		String fv9KarossProg = Web.getNumberListStr(form.get("fv9KarossProg"));
		int totalKaross = Web.getMax((List<String>)form.get("fv9KarossNum"));
		
//		油漆车间
		String fv9LackNum = Web.getNumberListStr(form.get("fv9LackNum"));
		String fv9LackProg = Web.getNumberListStr(form.get("fv9LackProg"));
		int totalLack = Web.getMax((List<String>)form.get("fv9LackNum"));
		
//		总装车间
		String fv9MontageNum = Web.getNumberListStr(form.get("fv9MontageNum"));
		String fv9MontageProg = Web.getNumberListStr(form.get("fv9MontageProg"));
		int totalMontage = Web.getMax((List<String>)form.get("fv9MontageNum"));
		
//		外购件
		String fv9KaufteileNum = Web.getNumberListStr(form.get("fv9KaufteileNum"));
		String fv9KaufteileProg = Web.getNumberListStr(form.get("fv9KaufteileProg"));
		int totalKaufteil = Web.getMax((List<String>)form.get("fv9KaufteileNum"));
		
		%>
		<%
			int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
			
			int size = arr.length;//一共有多少个柱子 
			double pillar = 0.0;
			
			int vffPillarNum =  0;//柱子个数
			int pvsPillarNum = 0;//柱子个数
			int osPillarNum =  0;//柱子个数
			int sopPillarNum =  0;//柱子个数
			
			double value1 = 0 ; 
			double value2 = 0;
			double value3 = 0;
			double value4 = 0;
			if(size > 0){
				int maxKw = arr[size-1];
				int minKw = arr[0];
				//假定总长度是595.0px 先算出一共有多少个柱子，每个柱子的宽度 px
				double totalWidth = 540.0;//总长度是 750px 
				pillar = totalWidth/size;  //每个柱子的宽度 px
			
				String vff_start = "";
				String pvs_start = "";
				String os_start = "";
				String sop_start = "";
				String me_start = "";
				
				if(request.getSession().getAttribute("DATE_VFF") != null){
					vff_start = request.getSession().getAttribute("DATE_VFF").toString();
				}
				if(request.getSession().getAttribute("DATE_PVS") != null){
					pvs_start = request.getSession().getAttribute("DATE_PVS").toString();
				}
				if(request.getSession().getAttribute("DATE_0S") != null){
					os_start = request.getSession().getAttribute("DATE_0S").toString();
				}
				if(request.getSession().getAttribute("DATE_SOP") != null){
					sop_start = request.getSession().getAttribute("DATE_SOP").toString();
				}
				if(request.getSession().getAttribute("DATE_ME") != null){
					me_start = request.getSession().getAttribute("DATE_ME").toString();
				}
				
				int[] vffArr = Web.getMilepostArr(vff_start,pvs_start);
				int[] pvsArr = Web.getMilepostArr(pvs_start,os_start);
				int[] osArr = Web.getMilepostArr(os_start,sop_start);
				int[] sopArr = Web.getMilepostArr(sop_start,me_start);
				
				vffPillarNum =  Web.getNum(vffArr,arr);//柱子个数
				pvsPillarNum = Web.getNum(pvsArr,arr);;//柱子个数
				osPillarNum =  Web.getNum(osArr,arr);;//柱子个数
				sopPillarNum =  Web.getNum(sopArr,arr);;//柱子个数
				
				value1 = vffPillarNum * pillar ; 
				
				if(vffPillarNum > 0 && pvsPillarNum != 0){
					value2 = (pvsPillarNum - 1)* pillar ;
				} else {
					value2 = pvsPillarNum * pillar ;
				}
				
				if(pvsPillarNum > 0 && osPillarNum != 0){
					value3 = (osPillarNum - 1 )* pillar ;	
				} else {
					value3 = osPillarNum * pillar ;
				}
				
				if(osPillarNum > 0 && sopPillarNum != 0){
					value4 = (sopPillarNum - 1)* pillar ;			
				} else {
					value4 = sopPillarNum* pillar ;
				}
			}
			
			double sum = value1 + value2 + value3 + value4;
		%>
		<script type="text/javascript">
			var chart1, chart2, chart3, chart4, chart5;
			$(document).ready(function() {
				chart1 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart1'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false
								//verticalAlign:'bottom',
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
						data: <%=fv9PresswerkNum%>,
						color: '#003C65'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9PresswerkProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
<%if(vffPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum-1%> + 0.5, 0], [<%=vffPillarNum-1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}
	<%}%><%if(pvsPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum + pvsPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum-1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}
	<%}%><%if(osPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum - 1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-S",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-S</B>";
							}
						}
					}
	<%}%><%if(sopPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"SOP",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>SOP</B>";
							}
						}
					}
	<%}%>					
					]
				});
				
				chart2 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart2'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
						data: <%=fv9KarossNum%>,
						color: '#AED4F8'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9KarossProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
<%if(vffPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum-1%> + 0.5, 0], [<%=vffPillarNum-1%> + 0.5001, <%=totalKaross%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}
	<%}%><%if(pvsPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum + pvsPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum-1%> + 0.5001, <%=totalKaross%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}
	<%}%><%if(osPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum - 1%> + 0.5001, <%=totalKaross%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-S",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-S</B>";
							}
						}
					}
	<%}%><%if(sopPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5001, <%=totalKaross%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"SOP",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>SOP</B>";
							}
						}
					}
	<%}%>					
					
					]
				});
				
				chart3 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart3'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
						data: <%=fv9LackNum%>,
						color: '#8994A0'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9LackProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
<%if(vffPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum-1%> + 0.5, 0], [<%=vffPillarNum-1%> + 0.5001, <%=totalLack%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}
	<%}%><%if(pvsPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum + pvsPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum-1%> + 0.5001, <%=totalLack%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}
	<%}%><%if(osPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum - 1%> + 0.5001, <%=totalLack%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-S",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-S</B>";
							}
						}
					}
	<%}%><%if(sopPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5001, <%=totalLack%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"SOP",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>SOP</B>";
							}
						}
					}
	<%}%>					

					]
				});
				
				chart4 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart4'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:false
						},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
						data: <%=fv9MontageNum%>,
						color: '#CFD7D9'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9MontageProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
					<%if(vffPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum-1%> + 0.5, 0], [<%=vffPillarNum-1%> + 0.5001, <%=totalMontage%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}
	<%}%><%if(pvsPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum + pvsPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum-1%> + 0.5001, <%=totalMontage%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}
	<%}%><%if(osPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum - 1%> + 0.5001, <%=totalMontage%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-S",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-S</B>";
							}
						}
					}
	<%}%><%if(sopPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5001, <%=totalMontage%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"SOP",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>SOP</B>";
							}
						}
					}
	<%}%>					
					]
				});
				
				chart5 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart5'
					},
					title: {
						text: ' '
					},
					xAxis: [{
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						labels: {
							enabled:true
						},
						categories: <%=fv9KWNo%>
					}],
					yAxis: {
						min:0,
						max:250,
						gridLineWidth:0,
						lineWidth:1,
						tickWidth:1,
						lineColor:'black',
						tickColor:'black',
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							y:1,
							style: {
								color: 'black'
							}
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						enabled: false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: false,
								style : {
									fontWeight: 'bold',
									fontSize:'10px',
									align:'top'
								},
								color: '#4C5258',
								formatter: function() {
									if (this.y == 0) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},
				    series: [{
						type: 'column',
						name: 'aus Straßenfahrt',
						data: <%=fv9KaufteileNum%>,
						color: '#3366FF'
					}, {
						type: 'spline',
						name: 'Prognose',
						color: '#99CC00',
						data: <%=fv9KaufteileProg%>,
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}
<%if(vffPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum-1%> + 0.5, 0], [<%=vffPillarNum-1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"VFF",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>VFF</B>";
							}
						}
					}
	<%}%><%if(pvsPillarNum > 0){%>
					,{
						data: [[<%=vffPillarNum + pvsPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum-1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"PVS",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>PVS</B>";
							}
						}
					}
	<%}%><%if(osPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum - 1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"0-S",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>0-S</B>";
							}
						}
					}
	<%}%><%if(sopPillarNum > 0){%>
					, {
						data: [[<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5, 0], [<%=vffPillarNum + pvsPillarNum + osPillarNum + sopPillarNum-1%> + 0.5001, <%=totalPress%>]],
			//			color: 'black',
						dashStyle: 'dash',
						lineWidth: 2,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"SOP",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<B>SOP</B>";
							}
						}
					}
	<%}%>					
				
					]
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
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #003C65">Presswerk</div>
				</div>
				<div id="chart1" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #AED4F8;">Karosseriebau</div>
				</div>
				<div id="chart2" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #8994A0">Lackiererei</div>
				</div>
				<div id="chart3" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="color:black;border: solid black 1px;background-color: #CFD7D9">Montage</div>
				</div>
				<div id="chart4" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				
				<div class="left">
					<div class="title" style="border: solid black 1px;background-color: #3366FF">Kaufteile</div>
				</div>
				<div id="chart5" class="chart"></div>
				<div class="clear1">&nbsp;</div>
				<div id="meilsteinouter" style="width: 800px;">
				<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 254px; text-align: center; overflow: hidden; ">
					<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
					<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
					<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
					<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
				</div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
