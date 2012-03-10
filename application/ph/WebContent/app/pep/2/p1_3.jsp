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
		
		//左侧-瀑布图
		List<String> fv9PFreigType = (List<String>)form.get("fv9PFreigType");
		List<String> fv9PFreigTypeNum = (List<String>)form.get("fv9PFreigTypeNum");
		
		List<String> Gesamt = new ArrayList<String>();
		int sum = 0;
		List<String> categories = new ArrayList<String>();
		if (Web.getListYesOrNo(fv9PFreigTypeNum)) {
			categories.add("Gesamt");
			for (int i=0; i<fv9PFreigTypeNum.size(); i++){
				sum += Integer.parseInt(fv9PFreigTypeNum.get(i));
				categories.add(fv9PFreigType.get(i));
			}
			Gesamt.add(sum+"");
		}
		String cat = Web.getStrListStr(categories);
		String categories1 = Web.getStrListStr(Gesamt);
		//右侧-普通柱状图
		String categories2 = Web.getStrListStr(form.get("fv9PFKWNo"));
		String BMGfreiSoll = Web.getNumberListStr(form.get("fv9PFreiSoll"));
		String inarbeit = Web.getNumberListStr(form.get("fv9PFInArbeirt"));
		String awe = Web.getNumberListStr(form.get("fv9PFAWE"));	
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
					categories: <%=cat%>,
					labels:{
						enabled:true,
						y:20,
						style:{
							color:'black'
						}
					}
				},
				yAxis: {
					min: 0,
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
					if (Web.getListYesOrNo(fv9PFreigTypeNum)) {
						for(int j=0; j<fv9PFreigTypeNum.size(); j++){
							temp = temp + Integer.parseInt(fv9PFreigTypeNum.get(j));
							if(j == fv9PFreigTypeNum.size() - 1){
								color = "\"#FF00FE\"";
							}
						%>
						,{
						 	y: <%=fv9PFreigTypeNum.get(j)%>, 
						 	low:<%=sum - temp%>,
						 	color: <%=color%>
						}
						<%
						}
					}
					%>
					]
				}]
			});
			<%
			int total = sum + 10;
			int[] arr = null;
			
			if (Web.getListYesOrNo((List<String>)form.get("fv9PFKWNo"))) {
				arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9PFKWNo"));
			}	
			
			Map<String,Integer> lichenbeiNum = Web.getLCBNum(request, arr);
				
			int vffNum =  lichenbeiNum.get("vffNum");//柱子个数
			int pvsNum = lichenbeiNum.get("pvsNum");//柱子个数
			int osNum = lichenbeiNum.get("osNum");//柱子个数
			int sopNum = lichenbeiNum.get("sopNum");//柱子个数
			
			%>
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
					categories: <%=categories2%>,
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
					min:1,
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
					layout: 'horizontal',
					verticalAlign: 'top',
					align:'center',
		//			x:0,
		//			y:20,
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
				//		pointWidth:33,
						borderColor: 'black',
						shadow:false
						},
						series: {
				            dataLabels: {
				                enabled: true,
				                style: {
				                    fontSize:'10px'
				                	},
				                	color:'black',
									formatter: function() {
										if (this.y == 0) {
											return '';
										}
										return this.y + '';
									}
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
					color: '#FFCC00'
				}, {
					name: 'AWE',
					data: <%=awe%>,
					color: '#FFFFCC'
				}
<%if(vffNum > 0){%>
				,{
					data: [[<%=vffNum-1%> + 0.5, 0], [<%=vffNum-1%> + 0.5001, <%=total%>]],
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
					data: [[<%=vffNum + pvsNum-1%> + 0.5, 0], [<%=vffNum + pvsNum-1%> + 0.5001, <%=total%>]],
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
					data: [[<%=vffNum + pvsNum + osNum-1%> + 0.5, 0], [<%=vffNum + pvsNum + osNum - 1%> + 0.5001, <%=total%>]],
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
<%}%><%if(sopNum > 0){%>
				, {
					data: [[<%=vffNum + pvsNum + osNum + sopNum-1%> + 0.5, 0], [<%=vffNum + pvsNum + osNum + sopNum-1%> + 0.5001, <%=total%>]],
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
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="top1" style="margin-top:20px"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LC BMG-Teile von ES Teileliste (KW48/11)</h2></div>
			<div id="content" style="margin:30px 60px;height:491px;width:850px;">
				<div style="margin:50px auto">
					<div id="chart1" style="width: 260px; height: 285px; float: left;margin-top:23px"></div>
					<div id="chart2" style="width: 560px; height: 320px; float: left;"></div>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>