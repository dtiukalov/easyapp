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
			double sum1 = 0;
			List<String> kwno = null;
			if(Web.getObjectYesOrNo(form.get("fv9KWNo"))){
				kwno = (List<String>)form.get("fv9KWNo");
				
				if (Web.getObjectYesOrNo(form.get("fv9PrognoseKW"))) {
					kwno.add("Prognose zu Meilenstein SOP KW " + form.get("fv9PrognoseKW"));
				} else {
					kwno.add("Prognose zu Meilenstein SOP KW XXX");
				}
			}
			String fv9KWNo = Web.getStrListStr(kwno);
			
			List<String> funktionSmall75 = null;
			if(Web.getObjectYesOrNo(form.get("fv9FunktionSmall75"))){
				String fv9PrognoseAK = "0";
				funktionSmall75 = (List<String>)form.get("fv9FunktionSmall75");
				if(form.get("fv9PrognoseAK")!= null && !"".equals(form.get("fv9PrognoseAK")) ){
					fv9PrognoseAK = (String)form.get("fv9PrognoseAK");
				}
				funktionSmall75.add(fv9PrognoseAK);
				sum1 = sum1 + Double.parseDouble(fv9PrognoseAK);
			}	
			String fv9FunktionSmall75 = Web.getNumberListStr(funktionSmall75);  //AK
			
			
			List<String> funktionSmall100 = null;
			if(Web.getObjectYesOrNo(form.get("fv9FunktionSmall100"))){
				String fv9PrognoseBK = "0";
				funktionSmall100 = (List<String>)form.get("fv9FunktionSmall100");
				if(form.get("fv9PrognoseBK")!= null && !"".equals(form.get("fv9PrognoseBK")) ){
					fv9PrognoseBK = (String)form.get("fv9PrognoseBK");
				}
				funktionSmall100.add(fv9PrognoseBK);
				sum1 = sum1 + Double.parseDouble(fv9PrognoseBK);
			}
			String fv9FunktionSmall100 = Web.getNumberListStr(funktionSmall100);	//BK
			
			
			List<String> funktionBig100 = null;
			if(Web.getObjectYesOrNo(form.get("fv9FunktionBig100"))){
				String fv9PrognoseIO = "0";
				funktionBig100 = (List<String>)form.get("fv9FunktionBig100");
				if(form.get("fv9PrognoseIO")!= null && !"".equals(form.get("fv9PrognoseIO")) ){
					fv9PrognoseIO = (String)form.get("fv9PrognoseIO");
				}
				funktionBig100.add(fv9PrognoseIO);
				sum1 = sum1 + Double.parseDouble(fv9PrognoseIO);
			}
			String fv9FunktionBig100 = Web.getNumberListStr(funktionBig100);	//i.O
			
			String fv9Zielwert = Web.getNumberListStr(form.get("fv9Zielwert")); //目标
			
		%>
		<%
		double total = sum1 + 10;
	
		int vffNum =  0;
		int pvsNum = 0;
		int osNum = 0;
		int sopNum = 0;	
		
		Map<String,Integer> lichenbeiNum = null;	
		int[] arr = null;
		
		if (Web.getListYesOrNo(kwno)) {
			kwno.remove(kwno.size()-1);
			arr = Web.getIntArrByStringlist(kwno);
			
			lichenbeiNum = Web.getLCBNum(request, arr);
			
			vffNum =  lichenbeiNum.get("vffNum");//柱子个数
			pvsNum = lichenbeiNum.get("pvsNum");//柱子个数
			osNum = lichenbeiNum.get("osNum");//柱子个数
			sopNum = lichenbeiNum.get("sopNum");//柱子个数
		}
		
		double temp0 = 0;
		int temp1 = 0;
		int temp2 = 0;
		int temp3 = 0;
		
		if(vffNum > 0){
			temp0 = 0.5;
		}
		if(pvsNum > 0){
			temp1 = vffNum;
		}
		if(osNum > 0){
			temp2 = vffNum + pvsNum ;
		}
		if(sopNum > 0){
			temp3 = vffNum + pvsNum + osNum ;
		}
		
		%>
		<script type="text/javascript">
		var chart1;
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
							 fontSize: '10px',
							 color:'black'
						}
					},
					categories: <%=fv9KWNo%>
				},
				yAxis: {
					min: 0,
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
								if (this.y == 0 || this.y == 0.0) {
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
				}
<%if(vffNum > 0){%>
				,{
					data: [[<%=temp0-1%> + 0.5, 0], [<%=temp0-1%> + 0.50001, <%=total%>]],
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
<%}%><%if(pvsNum > 0){%>
				,{
					data: [[<%=temp1-1%> + 0.5, 0], [<%=temp1-1%> + 0.5001, <%=total%>]],
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
<%}%><%if(osNum > 0){%>
				, {
					data: [[<%=temp2-1%> + 0.5, 0], [<%=temp2 - 1%> + 0.5001, <%=total%>]],
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
<%}%><%if(sopNum > 0){
				
%>
				, {
					data: [[<%=temp3-1%> + 0.5, 0], [<%=temp3-1%> + 0.5001, <%=total%>]],
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
		})
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
				<div id="chart1" style="width: 700px; height: 450px; margin: 0 50px; float: left;"></div>
			<%
			if (lichenbeiNum != null && arr != null) {
				double totalWidth = 604.0;
				Map<String,Integer> tt = lichenbeiNum;
				Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(tt, arr, totalWidth);
				
				double value1 = lichenbeiPillarNum.get("vffPillar"); 
				double value2 = lichenbeiPillarNum.get("pvsPillar");
				double value3 = lichenbeiPillarNum.get("osPillar");
				double value4 = lichenbeiPillarNum.get("sopPillar");
				double sum = value1 + value2 + value3 + value4;
				
				%>
				<div id="meilsteinouter" style="width: 800px;">
					<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 90px; text-align: center; overflow: hidden; ">
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
