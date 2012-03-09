<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.tc.utils.DateUtils"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			String fv9KWNo = Web.getNumberListStr(form.get("fv9KWNo"));
			String fv9FunktionSmall75 = Web.getNumberListStr(form.get("fv9FunktionSmall75"));  //AK
			String fv9FunktionSmall100 = Web.getNumberListStr(form.get("fv9FunktionSmall100"));	//BK
			String fv9FunktionBig100 = Web.getNumberListStr(form.get("fv9FunktionBig100"));	//i.O
			String fv9Zielwert = Web.getNumberListStr(form.get("fv9Zielwert")); //目标
			double fv9PrognoseAK = 0;
			double fv9PrognoseBK = 0;
			double fv9PrognoseIO = 0;
			if(form.get("fv9PrognoseAK")!= null && !"".equals(form.get("fv9PrognoseAK")) ){
				fv9PrognoseAK = Double.parseDouble((String)form.get("fv9PrognoseAK"));
			}
			if(form.get("fv9PrognoseBK")!= null && !"".equals(form.get("fv9PrognoseBK")) ){
				fv9PrognoseBK = Double.parseDouble((String)form.get("fv9PrognoseBK"));
			}
			if(form.get("fv9PrognoseIO")!= null && !"".equals(form.get("fv9PrognoseIO")) ){
				fv9PrognoseIO = Double.parseDouble((String)form.get("fv9PrognoseIO"));
			}
			double max = fv9PrognoseAK + fv9PrognoseBK + fv9PrognoseIO;
		%>
		<script type="text/javascript">
		var chart1;
		var chart2;
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart1',
					defaultSeriesType: 'column',
					marginTop:120
				},
				title: {
					text: 'In Prozent',
					style:{
						color:'black',
						fontSize:'18px'
					},
					align:'left'
				},
				subtitle: {
					text: ' '
				}, 
				xAxis: {
					lineWidth:1,
					tickLength: 0,
					lineColor:'black',
					title: {
						text: ' '
					},
					labels: {
				//		rotation: -45,
				//		align: 'right',
						y:20,
						style: {
							 padding:'5px',
							 fontSize: '14px',
							 color:'black'
						}
					},
					categories: <%=fv9KWNo%>
				},
				yAxis: {
					min: 0,
					max: <%=max%>,
					lineWidth:1,
					lineColor:'black',
					showLastLabel: true,
					gridLineWidth: 0,
					labels:{
						style:{
							color:'black',
							fontSize:'12px'
						}
					},
					title: {
						text: '',
						style: {
							 padding:'5px',
							 font: 'normal 14px Arial, sans-serif',
							 fontWeight: 'bold'
						}}
				},
				legend:{
					borderWidth:0,
					layout: 'vertical',
					align: 'center',
					verticalAlign: 'top',
					x: 200,
					y: 0,
					width: 270
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
						pointWidth:25,
						borderWidth: 1,
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'12px'
							},
							color: 'black',
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
					name: 'AK: Abweichung Toleranz > 100 %',
					color: '#E63110',
					data:  <%=fv9FunktionSmall75%>
				}, {
					name: 'BK: 75% < Abweichung Toleranz < 100 %',
					color: '#F9A700',
					data:  <%=fv9FunktionSmall100%>
				}, {
					name: 'i.O.: Abweichung Toleranz < 75 %',
					color: '#009C0E',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					},
					data:  <%=fv9FunktionBig100%>
				}, {
					type: 'spline',
					name: 'Zielwert',
					color: '#FF0000',
					data: <%=fv9Zielwert%>,
					marker: {
						enabled: false,
						states: {
							hover: {
								enabled: true,
								symbol: 'circle',
								radius: 5,
								lineWidth: 1
							}
						}
					}
				}]
			});
			
			chart2 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart2',
					defaultSeriesType: 'column'
				},
				title: {
					text: ' ',
					style:{
						color:'black',
						fontSize:'18px'
					},
					align:'left'
				},
				subtitle: {
					text: ' '
				}, 
				xAxis: {
					lineWidth:1,
					tickLength: 0,
					lineColor:'black',
					title: {
						text: ' '
					},
					labels: {
						y:20,
						style: {
							 fontSize: '14px',
							 color:'black'
						}
					},
					categories: 'ww'
				},
				yAxis: {
					gridLineWidth: 0,
					labels:{
						enabled:false
					},
					title: {
						text: '',
						y:20,
						style: {
							 padding:'5px',
							 font: 'normal 14px Arial, sans-serif',
							 fontWeight: 'bold'
						}
					}
				},
				legend:{
					enabled: false
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
						pointWidth:25,
						stacking: 'normal',
						borderColor: 'black',
						borderWidth: 1,
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'12px'
							},
							color: 'black',
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
					name: 'AK: Abweichung Toleranz > 100 %',
					color: '#E63110',
					data:  <%=fv9PrognoseAK%>
				}, {
					name: 'BK: 75% < Abweichung Toleranz < 100 %',
					color: '#F9A700',
					data:  <%=fv9PrognoseBK%>
				}, {
					name: 'i.O.: Abweichung Toleranz < 75 %',
					color: '#009C0E',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'14px'
						},
						color: 'white'
					},
					data:  <%=fv9PrognoseIO%>
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
				<div id="chart1" style="width: 700px; height: 450px; margin: 0 50px; float: left;"></div>
				<div id="chart2" style="width: 100px; height: 450px; margin: 0 -75px; float: left;margin-top:-10px; "></div>
			<%
			if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
				int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
				double totalWidth = 640.0;
				
				Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(Web.getLCBNum(request, arr), arr, totalWidth);
				
				double value1 = lichenbeiPillarNum.get("vffPillar"); 
				double value2 = lichenbeiPillarNum.get("pvsPillar");
				double value3 = lichenbeiPillarNum.get("osPillar");
				double value4 = lichenbeiPillarNum.get("sopPillar");
				double sum = value1 + value2 + value3 + value4;
				
				%>
				<div id="meilsteinouter" style="width: 800px;">
					<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 92px; text-align: center; overflow: hidden; ">
						<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
						<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
						<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
						<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
					</div>
				</div>
<%
				}
					%>	
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
