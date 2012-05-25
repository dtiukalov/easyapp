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
			int length = 0;

			 if(Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))){
				fv9KWNo = Web.getNumberListStrSubFirst((List<String>)form.get("fv9KWNo"));
				fv9KWNo = fv9KWNo.substring(0, fv9KWNo.length()-1);
				fv9KWNo += ",'', '', 'IST']";
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
			 
			//如果二维表中的周数跨年，则取当前年的前一年+当前年
			//如果二维表中的周数不跨年，则取当前年
			int first = 0; 
			int first_year = 0;
			int second = 0;
			int second_year = 0;
			String show_year = DateUtils.getCurrentYear();
			if(Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))){
				List weeks = ((List<String>)form.get("fv9KWNo"));
				int n = weeks.size();
				length = weeks.size();
				if (n >= 2) {
					if (Integer.parseInt((String)weeks.get(0)) >= Integer.parseInt((String)weeks.get(n-1))) {
						first_year = Integer.parseInt((String)DateUtils.getCurrentYear()) - 1;
						for (int m=1; m<weeks.size(); m++) {
							//前一年，周数越来越大
							
							if (Integer.parseInt((String)weeks.get(m)) > Integer.parseInt((String)weeks.get(m-1))) {
								second_year = Integer.parseInt((String)DateUtils.getCurrentYear());
								second = m-2;
							} 
						}
						
				//		show_year += "." + DateUtils.getCurrentYear();
					}
				}
			}
			int max = fv9PronoseAbgesch + fv9PronoseSmall2Woch + fv9PronoseBig2Woch;
			
			System.out.println("first = " + first + " first-year = " + first_year);
			System.out.println("second = " + second + " second-year = " + second_year);
		%>

		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column',
					margin: [0, 200, 60, 0] 
				//           上      右     下
				},
				title: {
					text: 'Anzahl Aenderungen',
					style:{
						color:'black',
						fontSize:'18px'
					},
					align:'left',
					y:20
				},
				subtitle: {
					text: ' ',
					style:{
						color:'black',
						fontSize:'18px'
					}
				}, 
				xAxis: [{
					min: 0,
					max: <%=length+1%>,
					lineColor:'black',
					tickWidth:0,
					lineWidth:2,
					categories: <%=fv9KWNo%>,
					labels:{
						enabled:true,
						y:12,
						style:{
							color:'black',
							fontSize:'11px'
						}
					}
				}, {
					categories: '[]',
					lineColor:'black',
					linkedTo: 0,
					lineWidth:2,
					title: {
						text: '<%=show_year%>',
						style:{
							color:'white',
							fontSize:'14px'
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
							color:'black',
							fontSize:'14px'
						}
					},
					labels: {
						enabled:true
					}
				}
				],
				yAxis: {
				//	min: -10,
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
					align: 'right',
					layout: 'vertical',
					verticalAlign: 'middle',
					x: 0,
					y: 100,
					borderWidth: 0,
					shadow: false
				},
				tooltip: {
					formatter: function() {
						return '<b>'+ this.x +'</b><br/>'+
							 this.series.name +': '+ this.y +'<br/>';
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						borderColor: 'black',
					//	pointWidth:20,
						groupPadding:0.1,
						pointPadding:0.1,
						shadow:false,
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'11px'
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
					name: 'AEKO,AeA  im Durchlauf <br> (> 2 Wochen)',
					data: <%=fv9AekoBig2Woch%>,
					color: '#E63110',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'11px'
						},
						color: 'white'
					}
				}, {
					name: 'AEKO,AeA im Durchlauf <br> (< 2 Wochen)',
					data: <%=fv9AekoSmall2Woch%>,
					color: '#F9A700'
				},{
					name: 'AEKO,AeA <br> abgeschlossen',
					data: <%=fv9AekoAbgesch%>,
					color: '#009C0E',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'11px'
						},
						color: 'white'
					}
				},{
					data: [[0, <%=max%>], [<%=length+10%>, <%=max%>]],
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
										return "<%=max%>";
									}
								}
							}]
			},function(chart) { 
				var point1 = chart.series[0].data[<%=first%>];
				var point2 = chart.series[0].data[<%=second%>];

				var text1 = chart.renderer.text(
	                '<b><%=first_year%></b>', 
	                point1.plotX, 
	                490
	            ).attr({
	                zIndex: 5
	            }).add();
	        
				var text2 = chart.renderer.text(
	                '<b><%=second_year%></b>', 
	                point2.plotX, 
	                490
	            ).attr({
	                zIndex: 5
	            }).add();

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
				<div style="width: 60px; height: 60px; margin-left: 20px; text-align: center; vertical-align: bottom; float: left;font-family: Arail; font-size: 11px; padding-top: 460px;">
					KW<br><br><br>
					Anzahl <br> neuer <br> AEKOs
				</div>
				<div id="chart" style="width: 910px; height: 520px; float: left; margin: 0px 0px auto;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>