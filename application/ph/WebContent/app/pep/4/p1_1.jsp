<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %> </title>
		<%
			//左侧图表数据
			int fv9Nominiert = Integer.parseInt((String)form.get("fv9Nominiert")); //已定厂 
			int fv9Nichtnominiert = Integer.parseInt((String)form.get("fv9Nichtnominiert")); //未定厂
			int Gesamt = fv9Nominiert + fv9Nichtnominiert;	
			
			//右侧图表数据
			int fv9KritischeNomini = Integer.parseInt((String)form.get("fv9KritischeNomini")); //风险件
			List<String> fv9KWNo = (List<String>)form.get("fv9KWNo");	//周数
			List<String> fv9KWNum = (List<String>)form.get("fv9KWNumber");	//数量
			List<String> fv9KWCom = (List<String>)form.get("fv9KWCom");	//备注
			int[] fv9KWNumber = Web.getIntArrByStringlist(fv9KWNum);
			
			List<String> KW = new ArrayList(); //周数
			List<Integer> value = new ArrayList(); //y值
			List<Integer> low = new ArrayList(); //low值
			List<String> desc = new ArrayList(); //每个柱的描述
			//设置风险件
			KW.add("Kritische<br>Nominierungen");
			value.add(fv9KritischeNomini);
			low.add(0);
			desc.add("");
			
			//设置每周状态
			int max = fv9KritischeNomini;
			for (int k=0; k<fv9KWNo.size(); k++){
				KW.add("KW" + fv9KWNo.get(k));
				value.add(Integer.parseInt((String)fv9KWNum.get(k)));
				low.add(max - Integer.parseInt((String)fv9KWNum.get(k)));
				desc.add(fv9KWCom.get(k));
				max = max - Integer.parseInt((String)fv9KWNum.get(k));
			}
			
			//设置später
			KW.add("später");
			value.add(max);
			low.add(0);
			desc.add("");
			
			String categories = Web.getStrListStr(KW);
			
			
			StringBuffer sb = new StringBuffer();
			sb.append("[");
			if (KW !=null && KW.size() > 0) {
				if (KW.size() > 1) {
					for (int m=0; m<KW.size()-1; m++) {
						sb.append("{y:" + value.get(m) + ", low: " + low.get(m) + ", desc: '"+desc.get(m)+"', color: '#E53110' },");
					}
				}
				sb.append("{y:" + value.get(KW.size()-1) + ", low: " + low.get(KW.size()-1) + ", desc: '"+desc.get(KW.size()-1)+"', color: '#E53110' }");
			}
				
			sb.append("]");
			String data_str = sb.toString();
		%>
		<script type="text/javascript">
		var chart1;
		var chart2;
	
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart1',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Anzahl Teile nach TEVON',
					style:{
						color:'black'
					}
				},
				xAxis: {
					lineColor:'black',
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:20,
						style:{
							color:'black'
						}
					},
					categories: ["Gesamt", "Nominiert", "Nicht<br>nominiert"]
				},
				yAxis: {
					min: 0,
					max: 250,
					gridLineWidth:0,
					title: {
						text: ' '
					},
					labels:{
						enabled: false,
						style:{
							color:'black'
						}
					},
					stackLabels: {
						enabled: true,
						style: {
							fontWeight: 'bold',
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
						shadow: false,
						dataLabels: {
							enabled: false,
							style : {
								fontWeight: 'bold',
								fontSize:'10px',
								align:'top'
							},
							color: '#4C5258'
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: [{ 
							y: <%=Gesamt%>, 
							low:0,
							color: '#CFD7D9'
						}, {
						 	y: <%=fv9Nominiert%>, 
						 	low:<%=fv9Nichtnominiert%>,
							color: '#333333'
						}, {
							y: <%=fv9Nichtnominiert%>,
							low:0,
							color: '#013C66'
						}]
				}]
			});
		
			chart2 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart2',
					defaultSeriesType: 'column'
				},
				title: {
					text: ' '
				},
				xAxis: {
					lineColor:'black',
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:20,
						style:{
							color:'black'
						}
					},
					title: {
						text: 'Geplante Nominierungen',
						style:{
							color:'black'
						}
					},
					categories: <%=categories%> 
				},
				yAxis: {
					min: 0,
					max: 20,
					gridLineWidth:0,
					title: {
						text: ' '
					},
					labels:{
						enabled: false,
						style:{
							color:'black'
						}
					},
					stackLabels: {
						enabled: true,
						style: {
							fontWeight: 'bold',
							color: 'black'
						}
					}
				},
				tooltip: {
					formatter: function() {
						return '<b>'+  this.point.desc +'</b>';
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						shadow: false,
						dataLabels: {
							enabled: false,
							style : {
								fontWeight: 'bold',
								fontSize:'10px',
								align:'top'
							},
							color: '#4C5258'
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: <%=data_str%>
				}]
			});
		});
		
		//, 
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
				<div style="width: 50px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart1" style="width: 250px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart2" style="width: 600px; height: 400px; margin: 0 auto; float: left;margin-top:20px"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
