<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.tc.utils.DateUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<%@ include file="/app/pep/include/highslide-fullmin.jsp"%>
		<%@ include file="/app/pep/include/highslideconfig.jsp"%>
		<%@ include file="/app/pep/include/highslidecss.jsp"%>
		<title><%=title %></title>
		<%
		
//		小于0.5mm
		int fv9FuncSmall05 = 0;
		if (!"".equals((String)form.get("fv9FuncSmall05")) && 
				(String)form.get("fv9FuncSmall05") != null) {
			fv9FuncSmall05 = Integer.parseInt((String)form.get("fv9FuncSmall05"));
		}
		String fv9FuncSmall05Com = (String)form.get("fv9FuncSmall05Com");//		备注
//		小于1.0mm
		int fv9FuncSmall10 = 0;
		if (!"".equals((String)form.get("fv9FuncSmall10")) &&
				(String)form.get("fv9FuncSmall10") != null) {
			fv9FuncSmall10 = Integer.parseInt((String)form.get("fv9FuncSmall10"));
		}
		String fv9FuncSmall10Com = (String)form.get("fv9FuncSmall10Com");//		备注
//		小于1.5mm
		int fv9FuncSmall15 = 0;
		if (!"".equals((String)form.get("fv9FuncSmall15")) && 
				(String)form.get("fv9FuncSmall15") != null) {
			fv9FuncSmall15 = Integer.parseInt((String)form.get("fv9FuncSmall15"));
		}
		String fv9FuncSmall15Com = (String)form.get("fv9FuncSmall15Com");//		备注
//		小于2.0mm
		int fv9FuncSmall20 = 0;
		if (!"".equals((String)form.get("fv9FuncSmall20")) &&
				(String)form.get("fv9FuncSmall20") != null) {
			fv9FuncSmall20 = Integer.parseInt((String)form.get("fv9FuncSmall20"));
		}
		String fv9FuncSmall20Com = (String)form.get("fv9FuncSmall20Com");//		备注
//		大于2.0mm
		int fv9FuncBig20 = 0;
		if (!"".equals((String)form.get("fv9FuncBig20")) &&
				(String)form.get("fv9FuncBig20") != null) {
			fv9FuncBig20 = Integer.parseInt((String)form.get("fv9FuncBig20"));
		}
		String fv9FuncBig20Com = (String)form.get("fv9FuncBig20Com");//		备注
		
//		公差范围内的数量(红色)
		Integer fv9FuncInTolRed = 0;
		fv9FuncInTolRed += fv9FuncSmall05;
		fv9FuncInTolRed += fv9FuncSmall10;
		fv9FuncInTolRed += fv9FuncSmall15;
		fv9FuncInTolRed += fv9FuncSmall20;
		fv9FuncInTolRed += fv9FuncBig20;
								;
//		公差范围内的数量(黄色)
		Integer fv9FuncInTolYellow = 0;
		if (!"".equals((String)form.get("fv9FuncInTolYellow"))) {
			fv9FuncInTolYellow = Integer.parseInt((String)form.get("fv9FuncInTolYellow"));
		}
		
//		公差范围内的数量(绿色)
		int fv9FuncInTolGreen = 0;
		if (!"".equals((String)form.get("fv9FuncInTolGreen"))) {
			fv9FuncInTolGreen = Integer.parseInt((String)form.get("fv9FuncInTolGreen"));
		}
		
		int gesamt = fv9FuncInTolGreen + fv9FuncInTolYellow + fv9FuncInTolRed;
		
		int y1 = fv9FuncInTolYellow;
		int low1 = fv9FuncInTolGreen;
		
		int y2 = fv9FuncSmall05;
		int low2 = low1 + y1;
		
		int y3 = fv9FuncSmall10;
		int low3 = low2 + y2;
		
		int y4 = fv9FuncSmall15;
		int low4 = low3 + y3;
		
		int y5 = fv9FuncSmall20;
		int low5 = low4 + y4;
		
		int y6 = fv9FuncBig20;
		int low6 = low5 + y5;
		
		%>
		
		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
		
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Gesamt: <%=gesamt%> Funktionsmasse',
					style:{
						color:'black',
						fontSize: '18px'
					},
					align:'left'
				},
				xAxis: {
					labels: {
							y:20,
							style: {
								 padding:'8px',
								 color:'black',
								 fontSize:'14px'
							}
						},
					tickLength: 0,
					lineColor: 'black',
					categories: ['In Toleranz', '<0,5 mm', '<1,0 mm', '<1,5 mm', '<2,0 mm', '>2,0 mm']
				},
				yAxis: {
					min:0,
					max:<%=low6+y6+5%>,
					gridLineWidth: 0,
					labels: {
						enabled:false
					},
					title: {
						text: ""
					}
				},
				tooltip: {
					
					//点击柱状图弹出一个对话框，显示备注信息
					//borderWidth: 0,
					//shadow:false,
					// formatter: function() {
					//	return '<table style="border-collapse:collapse;border:solid 1px #000;" width="200" cellpadding="0" cellspacing="0"><tr><td><br>' + this.point.desc +'<br></td></tr></table>';
					//	return '';
					// }
					borderWidth: 1,
					shadow:false,
					formatter: function() {
						return '<b>'+ this.x +'</b><br/>'+
						 this.series.name +': '+ this.y +'<br/>';
					}
				},
				plotOptions: {
					column: {
						shadow: false,
						stacking: 'normal',
						borderColor: 'black'
					},
					series:{
						dataLabels: {
							enabled: true,
							color:'black',
							/* verticalAlign: 'top', */
							y:-10,
							style:{
								fontSize:'18px'
							},
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
							}
						}
					}
				},
				legend: {
						enabled: false
				},
			    series: [{
					name: 'Anzahl Aenderungen',
					data: [{ 
							y: <%=y1%>, 
							low: <%=low1%>,
//							desc: '',
							color: '#F9A700'
						}, {
						 	y: <%=y2%>, 
						 	low: <%=low2%>,
			//			 	desc: "<%=Web.replaceSpecial(fv9FuncSmall05Com)%>",
							color: '#E63110'
						}, {
							y: <%=y3%>,
							low: <%=low3%>,
			//				desc: "<%=Web.replaceSpecial(fv9FuncSmall10Com)%>",
							color: '#E63110'
						}, {
							y: <%=y4%>,
							low: <%=low4%>,
			//				desc: "<%=Web.replaceSpecial(fv9FuncSmall15Com)%>",
							color: '#E63110'
						}, { 
							y: <%=y5%>, 
							low:<%=low5%>,
				//			desc: "<%=Web.replaceSpecial(fv9FuncSmall20Com)%>",
							color: '#E63110'
						}, {
						 	y: <%=y6%>, 
						 	low: <%=low6%>,
				//		 	desc: "<%=Web.replaceSpecial(fv9FuncBig20Com)%>",
							color: '#E63110'
						}],
		/*			cursor: 'pointer',
					point: {
						events: {
							click: function() {
								hs.htmlExpand(null, {
									pageOrigin: {
								//		x: this.pageX,
										x: 120,
								//		y: this.pageY
										y: 300
									},
									headingText: '',
									maincontentText: this.desc,
									width: 100,
									height: 300
								});
							}
						}
					}, */
					marker: {
						lineWidth: 1
					}
				},{
					name: ' ',
					data: [{ 
						y: <%=fv9FuncInTolGreen%>, 
						low: 0,
						color: '#009C0E',
						style:{
							fontSize:'18px'
						},
					}],
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'18px'
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
				<div id="chart" style="width: 1000px; height: 500px; margin: 5px auto; margin-top: 30px;"></div>
				<div style = "font-size: 14px; overflow: hidden;">
					<!-- 
					<div style="position: absolute; width: 1px; height: 20px; top:330px; margin-left: 252px; border-left: 1px solid;"></div>
					 -->
					<div style="position: absolute; width: 85px; height: 210px; top: 350px; margin-left: 210px; border: 1px solid;">
						<%= Web.replaceSpecial(fv9FuncSmall05Com) %>
					</div>
					
					<!-- 
					<div style="position: absolute; width: 1px; height: 20px; top:330px; margin-left: 417px; border-left: 1px solid;"></div>
					 -->
					<div style="position: absolute; width: 85px; height: 210px; top: 350px; margin-left: 375px; border: 1px solid;">
						<%= Web.replaceSpecial(fv9FuncSmall10Com) %>
					</div>
					
					<!-- 
					<div style="position: absolute; width: 1px; height: 20px; top:330px; margin-left: 582px; border-left: 1px solid;"></div>
					 -->
					<div style="position: absolute; width: 85px; height: 210px; top: 350px; margin-left: 540px; border: 1px solid;">
						<%= Web.replaceSpecial(fv9FuncSmall15Com) %>
					</div>
					
					<!-- 
					<div style="position: absolute; width: 1px; height: 20px; top:330px; margin-left: 742px; border-left: 1px solid;"></div>
					 -->
					<div style="position: absolute; width: 85px; height: 210px; top: 350px; margin-left: 700px; border: 1px solid;">
						<%= Web.replaceSpecial(fv9FuncSmall20Com) %>
					</div>
					
					<!-- 
					<div style="position: absolute; width: 1px; height: 20px; top:330px; margin-left: 902px; border-left: 1px solid;"></div>
					 -->
					<div style="position: absolute; width: 85px; height: 210px; top: 350px; margin-left: 860px; border: 1px solid;">
						<%= Web.replaceSpecial(fv9FuncBig20Com) %>
					</div>
				</div>
				
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
