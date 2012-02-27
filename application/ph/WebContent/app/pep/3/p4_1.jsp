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
			int fv9PrognoseAK = 0;
			int fv9PrognoseBK = 0;
			int fv9PrognoseIO = 0;
			if(form.get("fv9PrognoseAK")!= null && !"".equals(form.get("fv9PrognoseAK")) ){
				fv9PrognoseAK = Integer.parseInt((String)form.get("fv9PrognoseAK"));
			}
			if(form.get("fv9PrognoseBK")!= null && !"".equals(form.get("fv9PrognoseBK")) ){
				fv9PrognoseBK = Integer.parseInt((String)form.get("fv9PrognoseBK"));
			}
			if(form.get("fv9PrognoseIO")!= null && !"".equals(form.get("fv9PrognoseIO")) ){
				fv9PrognoseIO = Integer.parseInt((String)form.get("fv9PrognoseIO"));
			}
			int max = fv9PrognoseAK + fv9PrognoseBK + fv9PrognoseIO;
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
						groupPadding:0.15,
						pointPadding:0.15,
						borderWidth: 1,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'10px'
							},
							color: 'black'
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
							fontWeight: 'bold',
							fontSize:'10px'
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
						//groupPadding:0.1,
						stacking: 'normal',
						borderColor: 'black',
						borderWidth: 1,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'10px'
							},
							color: 'black'
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
							fontWeight: 'bold',
							fontSize:'10px'
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
						<%
						int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
						int size = arr.length;//一共有多少个柱子 
						double pillar = 0.0;
						int vffPillarNum = 2;//柱子个数
						int pvsPillarNum = 4;//柱子个数
						int osPillarNum = 4;//柱子个数
						int sopPillarNum = 2;//柱子个数

						if(size > 0){
							int maxKw = arr[size-1];
							int minKw = arr[0];
							//假定总长度是595.0px 先算出一共有多少个柱子，每个柱子的宽度 px
							double totalWidth = 595.0;//总长度是 750px 
							pillar = totalWidth/size;  //每个柱子的宽度 px
						
						}
						double value1 = vffPillarNum * pillar ; 
						double value2 = pvsPillarNum * pillar ;
						double value3 = osPillarNum * pillar ;
						double value4 = sopPillarNum * pillar ;
						double sum = value1 + value2 + value3 + value4;
						%>
			<div id="content">
				<div id="chart1" style="width: 650px; height: 500px; margin: 0 70px; float: left;"></div>
				<div id="chart2" style="width: 100px; height: 500px; margin: 0 -90px; float: left;margin-top:-10px; "></div>
				<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 108px; text-align: left; overflow: hidden; ">
					<table>
						<tr > 
							<td width="<%=value1 %>px" align="left" bgcolor="#99FF99"><%if(vffPillarNum != 0){%>VFF<%} %></td> 
							<td width="<%=value2%>px" align="left" bgcolor="#33CC33"><%if(pvsPillarNum != 0){%>PVS<%} %></td> 
						 	<td width="<%=value3 %>px" align="left" bgcolor="#006600"><%if(osPillarNum != 0){%>0S<%} %></td> 
							<td width="<%=value4%>px" align="left" bgcolor="#333333"><%if(sopPillarNum != 0){%>SOP<%} %></td>
						</tr>
					</table>
				</div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
