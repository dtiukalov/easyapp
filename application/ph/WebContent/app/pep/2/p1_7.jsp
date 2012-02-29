<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.web.Web"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			String status = "08.12.2011";
			
			List<String> fv9BMGType = (List<String>)form.get("fv9BMGType");
			List<String> fv9BMGNum = (List)form.get("fv9BMGNum");
			List<String> Gesamt = new ArrayList<String>();
			int sum = 0;
			for (int i=0; i<fv9BMGNum.size(); i++){
				sum += Integer.parseInt(fv9BMGNum.get(i));
			}
			System.out.println("sum = " + sum);
			Gesamt.add(sum+"");
			String categories1 = Web.getStrListStr(Gesamt);
		
			String categories3 = Web.getStrListStr(form.get("fv9BMGKWNo"));
			String BMGfreiSoll = Web.getNumberListStr(form.get("fv9BMGSoll"));
			String inarbeit = Web.getNumberListStr(form.get("fv9BMGInArbeirt"));
			String awe = Web.getNumberListStr(form.get("fv9BMGAWE"));	
		%>	
		<script type="text/javascript">
		var chart1;
		var chart2;
		$(document).ready(function() {
				chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart1',
					defaultSeriesType: 'column',
					marginRight:0.5
				},
				title: {
					text: ''
				},
				xAxis: {
					lineColor:'black',
					tickPosition:'inside',
					tickColor:'black',
					categories: <%=categories1%>,
					labels:{
						enabled:false,
						y:20,
						style:{
							color:'black'
						}
					}
				},
				yAxis: {
					min: 0,
					max: 120,
					gridLineWidth: 0,
					lineWidth:1,
					lineColor:'black',
					tickWidth:1,
					tickPosition:'inside',
					tickColor:'black',
					title: {
						text: ''
					},
					labels:{
						style:{
							color:'black'
						}
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
						pointWidth:33,
						shadow:false,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white',
							rotation: -90,
							x:5
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: [{ 
							y: <%=sum%>, 
							low:0,
							color: '#0200FE'
						}
					
					<%	
					int temp = 0;
					String color = "\"#0200FE\"";
					for(int j=0; j<fv9BMGNum.size(); j++){
						temp = temp + Integer.parseInt(fv9BMGNum.get(j));
						if(j == fv9BMGNum.size() - 1){
							color = "\"#FF00FE\"";
						}
					%>
					,{
					 	y: <%=fv9BMGNum.get(j)%>, 
					 	low:<%=sum - temp%>,
					 	color: <%=color%>
					}
					<%}%>
					]
				}]
			});
			
			chart2 = new Highcharts.Chart({
					chart: {
						renderTo: 'chart2',
						defaultSeriesType: 'column',
						marginLeft:1
					},
					title: {
						text: ' '
					},
					xAxis: {
						categories: <%=categories3%>,
						lineColor:'black',
						lineWidth:1,
						tickWidth:0,
						labels:{
							y:20,
							style:{
								color:'black'
							}
						}
						
					},
					yAxis: {
						gridLineWidth: 0,
						title: {
							text: ' '
						},
						labels: {
							enabled:false
						},
						stackLabels: {
							enabled: false,
							style: {
								fontWeight: 'bold',
								color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
							}
						}
					},
					legend: {
						layout: 'vertical',
						verticalAlign: 'top',
						align:'right',
						x:0,
						y:20,
						shadow: false,
						borderColor:'black',
						borderWidth:0,
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
							pointWidth:33,
							borderColor: 'black',
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
						name: 'BMG frei Soll',
						data: <%=BMGfreiSoll%>,
						color: '#00FF00'
					}, {
						name: 'in arbeit',
						data: <%=inarbeit%>,
						color: '#FECC00'
					},{
						name: 'AWE',
						data: <%=awe%>,
						color: '#FEFECC'
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
			<div id="top1" style="margin-top:20px"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LC BMG-Teile von ES Teileliste (KW48/11)</h2></div>
			<div id="content" style="margin:30px 60px;height:491px;">
				<div style="margin:50px auto">
					<div id="chart1" style="width: 260px; height: 285px; float: left;margin-top:23px"></div>
					<div id="chart2" style="width: 560px; height: 320px; float: left;"></div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>