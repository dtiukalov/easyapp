<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		
		String fv9KWNo = Web.getNumberListStr(form.get("fv9KWNo"));
		String fv9Montage = Web.getNumberListStr(form.get("fv9Montage"));
		String fv9Lack = Web.getNumberListStr(form.get("fv9Lack"));
		String fv9Kaufteile = Web.getNumberListStr(form.get("fv9Kaufteile"));
		String fv9Karosseriebau = Web.getNumberListStr(form.get("fv9Karosseriebau"));
		String fv9Presswerk = Web.getNumberListStr(form.get("fv9Presswerk"));
		String fv9Prognose = Web.getNumberListStr(form.get("fv9Prognose"));
		
		%>
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:2,
						lineColor:'black',
						tickColor:'black',
						labels: {
							y:25,
							style: {
								color:'black',
								font_size:'12px'
							}
						},
						categories:  <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						lineWidth:2,
						gridLineWidth: 0,
						tickWidth:2,
						tickColor:'black',
						lineColor:'black',
						title: {
							rotation:0,
							text: 'Punkte',
							x:-12,
							y:-180,
							style: {
								color:'gray',
								fontSize:'12px'
							}
						},
						labels: {
							style: {
								color:'black'
							}
						},
						stackLabels: {
							enabled: true,
							y:-15,
							style: {
								color: 'black',
								fontSize:'12px'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 60,
						borderWidth: 0,
						shadow:false
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
							pointWidth:28,
							shadow: false,
							borderColor:'black',
							borderWidth:0,
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'11px'
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
						type: 'column',
						name: 'Presswerk',
						data: <%=fv9Presswerk%>,
						color: '#BBC2C5',
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'11px'
							},
							color: 'black',
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Karosseriebau',
						data: <%=fv9Karosseriebau%>,
						color: '#AED4F8',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Kaufteil',
						data: <%=fv9Kaufteile%>,
						color: '#91AFFF',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Lack',
						data: <%=fv9Lack%>,
						color: '#BBC2C5',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Montage',
						data: <%=fv9Montage%>,
						color: '#00235A',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'spline',
						name: 'Prognose',
						data: <%=fv9Prognose%>,
						color: '#A6DD00',
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
				<div id="chart" style="width: 850px; height: 400px; margin: 50px auto"></div>
				<%
				if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
					int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
					
					int size = arr.length;//一共有多少个柱子 
					double pillar = 0.0;
					
					double value1 = 0 ; 
					double value2 = 0;
					double value3 = 0;
					double value4 = 0;
					
					if(size > 0){
						int maxKw = arr[size-1];
						int minKw = arr[0];
						//假定总长度是595.0px 先算出一共有多少个柱子，每个柱子的宽度 px
						double totalWidth = 628.0;//总长度是 750px 
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
						
						int vffPillarNum =  Web.getNum(vffArr,arr);//柱子个数
						int pvsPillarNum = Web.getNum(pvsArr,arr);;//柱子个数
						int osPillarNum =  Web.getNum(osArr,arr);;//柱子个数
						int sopPillarNum =  Web.getNum(sopArr,arr);;//柱子个数
						
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
				<div id="meilsteinouter" style="width: 800px;">
					<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 105px; text-align: center; overflow: hidden; ">
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
