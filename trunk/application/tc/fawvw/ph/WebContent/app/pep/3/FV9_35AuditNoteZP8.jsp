<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		
		String fv9KWNo = Web.getNumberListStr((List)form.get("fv9KWNo"));
		String fv9AuditErstang = Web.getNumberListStr((List)form.get("fv9AuditErstang"));
		String fv9TargetProg = Web.getNumberListStr((List)form.get("fv9TargetProg"));
		String fv9AuditZweit = Web.getNumberListStr((List)form.get("fv9AuditZweit"));
		String fv9KonzAuditMitNA = Web.getNumberListStr((List)form.get("fv9KonzAuditMitNA"));
		String fv9AuditMax = Web.getNumberListStr((List)form.get("fv9AuditMax"));
		String fv9AuditMin = Web.getNumberListStr((List)form.get("fv9AuditMin"));
		String fv9Anzahl = Web.getStrListStr((List)form.get("fv9Anzahl"));

		List kw_list = (List)form.get("fv9KWNo");
		List anzahl_list = (List)form.get("fv9Anzahl");
		StringBuffer x = new StringBuffer();
		x.append("[");

		int size = 0;
		int maxHeight = 0;
		if (anzahl_list != null && anzahl_list.size() > 0) {
			size = anzahl_list.size();
			for (int i=0; i<anzahl_list.size(); i++) {
				String anzahl = (String)anzahl_list.get(i);
				if (maxHeight == 0)
					maxHeight = anzahl.length();
				
				if (anzahl.length() > maxHeight) 
					maxHeight = anzahl.length();
			}
			
		}
		
		if (kw_list != null && kw_list.size() > 0) {
			for (int i=0; i<kw_list.size(); i++) {
				String anzahl = "";
				if (i < size) {
					anzahl = (String)anzahl_list.get(i);
				} else if (anzahl.equals("")) {
					anzahl = "&nbsp;";
				} else {
					anzahl = "&nbsp;";
				}
				anzahl = "<span style='writing-mode: bt-lr; height:" + (8 * maxHeight) + "px;'>" + anzahl + "</span>";
				if (i == kw_list.size()-1) {
					x.append("\"" + anzahl + "<br>" + kw_list.get(i)+ "\"");
				} else { 
					x.append("\"" + anzahl + "<br>" + kw_list.get(i) + "\", ");
				}
			}
		}		
		
		x.append("]");
		
		System.out.println(x.toString());
		
		List auditMax = (List)form.get("fv9AuditMax");
		List auditMin = (List)form.get("fv9AuditMin");
		
		fv9KonzAuditMitNA = fv9KonzAuditMitNA.replaceAll("0.0", "null");
		
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
						text: ' '
					},
					xAxis: {
						lineColor:'gray',
						tickColor:'gray',
						labels: {
							y:25,
							//x:-6,
							style: {
								color:'black',
								fontSize:'12px'
							}
						},
						categories: <%=x%>
						
					},
					yAxis: {
						min: 0,
						gridLineWidth:0,
						tickWidth:1,
						lineWidth:1,
						lineColor:'gray',
						tickColor:'gray',
 						title: {
							text: ''
						},
						labels: {
							style:{
								color:'black'
							}
						}
					},
					legend: {
						layout: 'vertical',
						verticalAlign: 'center',
						x: 250,
						y: 50,
						borderWidth: 0
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y
						}
					},
					plotOptions: {
						line: {
							shadow: false
						},
						column: {
							stacking: 'normal',
							shadow: false,
							borderColor:'gray',
							borderWidth:1,
							groupPadding:0.01,
							pointPadding:0.01,
							dataLabels: {
								enabled: true,
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
					},
					series: [ {
						name: 'Audit-Erstangebot',
						data: <%=fv9AuditErstang%>,
						color: '#AED4F8'
					}, {
						type: 'line',
						name: 'Konzernziel Audit mit NA',
						data: <%=fv9KonzAuditMitNA%>,
						color: '#FA3611',
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'diamond',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}, {
						type: 'line',
						name: 'TargetPrognose',
						data: <%=fv9TargetProg%>,
						color: '#9DCE09',
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'diamond',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}, {
						type: 'scatter',
						name: 'Audit-Zweitangebot',
						data: <%=fv9AuditZweit%>,
						color: '#003366',
						marker: {
							enabled: true,
							shadow:false,
							symbol : 'diamond'
						}
					}
					<%
					String js_str = "";
					if (auditMax != null && auditMax.size() > 0 && auditMin != null && auditMin.size() > 0) {
						for (int i=0; i<auditMax.size(); i++){
							js_str += ",{type: 'scatter',data: [[" + i + "," + auditMin.get(i) + "],[" + i + "," + auditMax.get(i) + "]],showInLegend: false,lineWidth : 1,color: 'black',marker:{enabled: true,shadow:false,symbol : 'triangle-down'}}";
						}
					}
					%>
					<%=js_str%>
					]
				} , function(chart) { 
					chart.renderer.text(
			                '<span style="font-size:12px;">KW</span>', 
			               	10, 
			                495
			            ).attr({
			                zIndex: 6
			            }).add();
				} );
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
				<div id="chart" style="width: 1000px; height: 500px; margin: 5px auto; "></div>
				
				<%
				if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
					int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
					double totalWidth = 970.0;
	
					Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(Web.getLCBNum(request, arr), arr, totalWidth);
					
					double value0 = lichenbeiPillarNum.get("vffqianPillar"); 
					double value1 = lichenbeiPillarNum.get("vffPillar"); 
					double value2 = lichenbeiPillarNum.get("pvsPillar");
					double value3 = lichenbeiPillarNum.get("osPillar");
					double value4 = lichenbeiPillarNum.get("sopPillar");
					double sum = value0 + value1 + value2 + value3 + value4;
				%>
					<div id="meilsteinouter" style="width: 1000px;">
						<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 23px; text-align: center; overflow: hidden; ">
							<div style=" width: <%=value0 %>px; height: 30px; float: left; background-color: white; vertical-align: bottom; padding-top: 5px;"><span style="color: white;"></span></div>
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
