<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.saturn.tc.utils.DateUtils"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			List<String> functionStyle = (List<String>)form.get("fv9FunctionStyle");
			List<String> stylePoint = (List<String>)form.get("fv9StylePoint");
			List<String> aK = (List<String>)form.get("fv9FunctionAK");
			List<String> bK = (List<String>)form.get("fv9FunctionBK");
			List<String> iO = (List<String>)form.get("fv9FunctionIO");
			
			int gesamt = 0;
			if (aK != null && aK.size() > 0) {
				for(int i=0; i<aK.size(); i++) {
					gesamt += Integer.parseInt(aK.get(i));
					gesamt += Integer.parseInt(bK.get(i));
					gesamt += Integer.parseInt(iO.get(i));
				}
			}
			System.out.println("gesamt = " + gesamt);
			
			List<String> functionStylelist = new ArrayList<String>();
			List<String> sum = Web.SumList(aK,bK,iO);
			
			if (stylePoint != null && stylePoint.size() > 0) {
				for(int i=0; i<stylePoint.size(); i++){
					StringBuffer value = new StringBuffer();
					value.append(functionStyle.get(i)).append("(");
					value.append(sum.get(i));
					value.append("/");
					value.append(stylePoint.get(i)).append(")");
					functionStylelist.add(value.toString());
				}
			}
				
			String fv9FunctionStyle = Web.getStrListStr(functionStylelist);//"['Aufbau (122/2)', 'Unterbau (98/5)', 'Seitenteil li. (24/5)', 'Seitenteil re. (24/5)', 'Tuer vo. li. (21/5)', 'Tuer vo. re. (21/3)', 'Tuer hi. li. (21/5)', 'Tuer hi. re. (21/2)', 'Frontklappe (14/1)', 'Rueckwandklappe (21/3)', 'SAD Dach (13/2)', 'ZP5 Karo. (14/1)']"; //	零件名称
			String fv9FunctionAK =  Web.getNumberListStr(aK);//"[2, 2, 5, 4, 2, 6, 2, 4, 3, 4, 4, 5]";    //	AK
			String fv9FunctionBK =  Web.getNumberListStr(bK);//"[10, 4, 5, 2, 5, 4, 4, 4, 6, 5, 5, 2]";    //	BK
			String fv9FunctionIO =  Web.getNumberListStr(iO);//"[110, 91, 19, 23, 15, 17, 16, 17, 8, 16, 8, 13]";    //	i.O
		
		%>
		
		<script type="text/javascript">
		
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'bar'
					},
					title: {
						text: ''
					},
					xAxis: {
						tickLength: 0,
						lineColor: 'black',
						lineWidth:2,
						categories: <%=fv9FunctionStyle%>,
						labels:{
							style:{
								fontSize:'14px',
								color:'black'
							}
						}
					},
					yAxis: {
						gridLineWidth: 0,
						labels: {
							enabled:false
						},
						title: {
							text: ""
						},
						stackLabels: {
							enabled: true,
							style: {
								color: 'black',
								fontSize:'14px'
							},
							x:17,
							y:10
						}
					},
					legend: {
						layout: 'vertical',
						verticalAlign: 'right',
						x:270,
						y:400,
						borderColor: '#CCC',
						borderWidth: 0,
						shadow: false,
						reversed: true
					},
					tooltip: {
						formatter: function() {
								return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y +'<br/>'+
								 'Total: '+ this.point.stackTotal;
						}
					},
					plotOptions: {
						series: {
							stacking: 'normal',
							borderColor: 'black',
							groupPadding:0.06,
							pointPadding:0.06,
							dataLabels: {
								enabled: true,
								align: 'center',
								y:7,
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
					}, series: [{
						name: 'AK: Abweichung Toleranz > 100 %',
						color: '#E63110',
						data: <%=fv9FunctionAK%>,
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'12px'
							},
							color: 'white'
						}
					}, {
						name: 'BK: 75% < Abweichung Toleranz < 100 ',
						color: '#F9A700',
						data: <%=fv9FunctionBK%>
					}, {
						name: 'i.O.: Abweichung Toleranz < 75 %',
						color: '#009C0E',
						data: <%=fv9FunctionIO%>,
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
				<div style="width: 1000px; height: 50px; padding-left: 30px; padding-top: 10px;">
					<span style="font-size: 18px;">Zusammenbauteile (Anzahl FM/Anzahl Messungen)</span><br>
					<span style="font-size: 14px;">Gesamt: <%=gesamt %> Funktionsmasse</span>
				</div>
				
				<div id="chart" style="width: 1000px; height: 500px; margin: 0px 30px auto; float: left;"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
