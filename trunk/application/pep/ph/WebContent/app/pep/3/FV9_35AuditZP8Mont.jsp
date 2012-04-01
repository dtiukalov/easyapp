<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.saturn.web.Web"%>	
<!DOCTYPE HTML>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<%@ include file="/app/pep/include/highslide-fullmin.jsp"%>
		<%@ include file="/app/pep/include/highslideconfig.jsp"%>
		<%@ include file="/app/pep/include/highslidecss.jsp"%>
		<title><%=title %></title>
		<%
		List<String> KWNo = (List)form.get("fv9KWNo");
		List<String> MontageNum = (List)form.get("fv9MontageNum");
		List<String> KonzernNum = (List)form.get("fv9KonzernNum");
		List<String> PrognoseNum = (List)form.get("fv9PrognoseNum");
		
		String fv9KWNo = Web.getNumberListStr(KWNo);
		String fv9MontageNum = Web.getNumberListStr(MontageNum);
		String fv9KonzernNum = Web.getNumberListStr(KonzernNum);
		String fv9PrognoseNum = Web.getNumberListStr(PrognoseNum);
		
		List<String> fv9KW = (List)form.get("fv9KW");
		List<String> fv9Name = (List)form.get("fv9Name");
		List<String> fv9Score = (List)form.get("fv9Score");
		List<String> fv9Option = (List)form.get("fv9Option");

		List<String> newMontage = new ArrayList();
		if (Web.getObjectYesOrNo(MontageNum)) {
			for(int i=0; i<MontageNum.size(); i++){
				String table = "<table style=\"border-collapse:collapse;border:solid 1px #000;\" width=\"350\" cellpadding=\"0\" cellspacing=\"0\">";
				if (Web.getListYesOrNo(fv9KW)) {
					for(int k=0; k<fv9KW.size(); k++) {
						if ((!"".equals(fv9KW.get(k))) && (fv9KW.get(k).equals(KWNo.get(i)))) {
							table += "<tr>";
							table += "	<td width=\"50%\" style=\"border-bottom:solid 1px #000;border-right:solid 1px #000;text-align:left;\">" + fv9Name.get(k) + "</td>";
							table += "	<td width=\"30%\" style=\"border-bottom:solid 1px #000;border-right:solid 1px #000\">" + fv9Score.get(k) + " Pkt.</td>";
							if ("Yes".equals(fv9Option.get(k))) {
								table += "	<td width=\"25%\" style=\"border-bottom:solid 1px #000;text-align:center\">√</td>";
							}
							if ("No".equals(fv9Option.get(k))) {
								table += "	<td width=\"25%\" style=\"border-bottom:solid 1px #000;text-align:center\">×</td>";
							}
							if ("".equals(fv9Option.get(k))) {
								table += "	<td width=\"25%\" style=\"border-bottom:solid 1px #000;text-align:center\">&nbsp;</td>";
							}
							table += "</tr><br>";
						}
					}
				}
				table += "</table>";
				newMontage.add(mergeTableAndNum(MontageNum.get(i), table));
			}
		}
		
		String Montage = Web.getStrListStr(newMontage);
		Montage = Montage.replaceAll("\"", "");
		%>
		
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						margin: [20, 0, 30, 50] //下 上 右 左
					},
					title: {
						text: ' '
					},
					xAxis: {
						tickLength: 0,
						lineColor:'black',
						lineWidth:2,
						labels: {
							x:-2,
							y:20,
							style: {
								 font: 'normal 12px Verdana, sans-serif',
								 color: 'black'
							}
					},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						gridLineWidth: 0,
						lineWidth: 2,
						lineColor: 'black',
						labels: {
							style: {
								padding: '5px',
								color: 'black'
							}
						},
						title: {
			                align: 'high',
			                offset: 0,
			                text: 'Punkte',
			                rotation: 0,
			                x: 50,
			                y: -10,
			                style: {
								color:'black',
								fontSize:'12px'
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
							return this.point.table;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
				//			groupPadding:0.35,
							shadow: false,
							borderColor:'black',
							borderWidth:1,
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
						type: 'column',
						name: 'Montage',
						data: <%=Montage%>,
						color: '#00235A',
						cursor: 'pointer',
						point: {
							events: {
								click: function() {
									hs.htmlExpand(null, {
										pageOrigin: {
									//		x: this.pageX,
											x: 400,
									//		y: this.pageY
											y: 200
										},
										headingText: this.series.name,
										maincontentText: this.table
								//		width: 400
									});
								}
							}
						}, 
						marker: {
							lineWidth: 1
						}
					}, {
						type: 'spline',
						name: 'Prognose',
						data: <%=fv9PrognoseNum%>,
						color: '#99CC00'
					}, {
						type: 'spline',
						name: 'Konzernziel',
						data: <%=fv9KonzernNum%>,
						color: '#E63110'
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
				<div id="chart" style="width: 1000px; height: 500px; margin: 5px auto; "></div>
					<%
					if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
						int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
						
						double totalWidth = 950.0;
						Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(Web.getLCBNum(request, arr), arr, totalWidth);
					
						double value0 = lichenbeiPillarNum.get("vffqianPillar"); 
						double value1 = lichenbeiPillarNum.get("vffPillar"); 
						double value2 = lichenbeiPillarNum.get("pvsPillar");
						double value3 = lichenbeiPillarNum.get("osPillar");
						double value4 = lichenbeiPillarNum.get("sopPillar");
						double sum = value0 + value1 + value2 + value3 + value4;
					%>
				<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 50px; text-align: center; overflow: hidden; ">
					<div style=" width: <%=value0 %>px; height: 30px; float: left; background-color: white; vertical-align: bottom; padding-top: 5px;"><span style="color: white;"></span></div>
					<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
					<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
					<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
					<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
				</div>
<%
				}
					%>	
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
