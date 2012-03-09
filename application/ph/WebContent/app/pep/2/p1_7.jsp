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
			List<String> categories = new ArrayList<String>();
			int sum = 0;
			if (Web.getListYesOrNo(fv9BMGNum)) {
				categories.add("Gesamt");
				for (int i=0; i<fv9BMGNum.size(); i++){
					sum += Integer.parseInt(fv9BMGNum.get(i));
					categories.add(fv9BMGType.get(i));
				}
				Gesamt.add(sum+"");
			}
			
			String cat = Web.getStrListStr(categories);
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
					if (Web.getListYesOrNo(fv9BMGNum)) {
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
						<%
						}
					}
					%>
					]
				}]
			});
				<%
				int total = sum;
				double pillar = 0.0;
				int vffNum =  0;//柱子个数
				int pvsNum = 0;//柱子个数
				int osNum =  0;//柱子个数
				int sopNum =  0;//柱子个数
				if (Web.getListYesOrNo((List<String>)form.get("fv9BMGKWNo"))) {
					int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9BMGKWNo"));
					int size = arr.length;//一共有多少个柱子 
					
					if(size > 0){
						int maxKw = arr[size-1];
						int minKw = arr[0];
					
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
						
						 vffNum =  Web.getNum(vffArr,arr);//柱子个数
						 pvsNum = Web.getNum(pvsArr,arr);;//柱子个数
						 osNum =  Web.getNum(osArr,arr);;//柱子个数
						 sopNum =  Web.getNum(sopArr,arr);;//柱子个数
					}
				}
				
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
						layout: 'horizontal',
						verticalAlign: 'top',
						align:'center',
				//		x:0,
				//		y:20,
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
					data: [[<%= vffNum + pvsNum + osNum-1%> + 0.5, 0], [<%=vffNum + pvsNum + osNum - 1%> + 0.5001, <%=total%>]],
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