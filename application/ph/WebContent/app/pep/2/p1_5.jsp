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
			List<String> fv9BFreigType = (List<String>)form.get("fv9BFreigType"); //零件类型
			List<String> fv9BFreigTypeNum = (List)form.get("fv9BFreigTypeNum");  //认可数量
			List<String> fv9BFKWNo = (List)form.get("fv9BFKWNo");  //周数
			List<String> fv9BFreiSoll = (List)form.get("fv9BFreiSoll");  //fv9BFreiSoll
			List<String> fv9BFInArbeirt = (List)form.get("fv9BFInArbeirt");  //fv9BFInArbeirt
			List<String> fv9BFAWE = (List)form.get("fv9BFAWE");  //fv9BFAWE
			
			List<String> Gesamt = new ArrayList<String>();
			List<String> categories = new ArrayList<String>();
	//		StringBuffer BFreigTypeNum = new StringBuffer();
			StringBuffer BFreiSoll = new StringBuffer();
			StringBuffer BFInArbeirt = new StringBuffer();
			StringBuffer BFAWE = new StringBuffer();
	//		BFreigTypeNum.append("[");
			BFreiSoll.append("[");
			BFInArbeirt.append("[");
			BFAWE.append("[");
			int sum = 0;
			if (Web.getListYesOrNo(fv9BFreigTypeNum)) {
				for (int i=0; i<fv9BFreigTypeNum.size(); i++){
					sum += Integer.parseInt(fv9BFreigTypeNum.get(i));
				}
			
				categories.add("Gesamt");
		//		BFreigTypeNum.append("{y:" + sum + ", low:0, color:'#0200FE'},");
				BFreiSoll.append("{y:" + sum + ", low:0, color:'#0200FE'},");
				BFInArbeirt.append("{y:0, low:0, color:'#FFCC00'},");
				BFAWE.append("{y:0, low:0, color:'#FFFFCC'},");
				
				int temp = 0;
				for (int i=0; i<fv9BFreigTypeNum.size(); i++){
					int y = Integer.parseInt(fv9BFreigTypeNum.get(i));
					temp = temp + y;
					int low = sum - temp;
					categories.add(fv9BFreigType.get(i));
					String color = "#0200FE";
					if (i == fv9BFreigTypeNum.size()-1) {
						color = "#FF00FE";
					}
		//			BFreigTypeNum.append("{y:" + y + ", low:" + low + ", color:'" + color + "'},");
					BFreiSoll.append("{y:" + y + ", low:" + low + ", color:'" + color + "'},");
					BFInArbeirt.append("{y:0, low:0, color:'#FFCC00'},");
					BFAWE.append("{y:0, low:0, color:'#FFFFCC'},");
				}
				
			}
			if (Web.getObjectYesOrNo(fv9BFKWNo)) {
				for(int m=0; m<fv9BFKWNo.size(); m++) {
					categories.add(fv9BFKWNo.get(m));
					int BFAWENUM = Integer.parseInt(fv9BFAWE.get(m));
					int BFInArbeirtNUM = Integer.parseInt(fv9BFInArbeirt.get(m));
					int BFreiSollNUM = Integer.parseInt(fv9BFreiSoll.get(m));
					
		//			BFreigTypeNum.append("{y:0, low:0, color:'#0200FE'},");
					BFAWE.append("{y:" + BFAWENUM + ", low:0, color:'#FFFFCC'},");
					BFInArbeirt.append("{y:" + BFInArbeirtNUM + ", low:" + BFAWENUM + ", color:'#FFCC00'},");
					BFreiSoll.append("{y:" + BFreiSollNUM + ", low:" + (BFInArbeirtNUM+BFAWENUM) + ", color:'#00FF00'},");
					
				}
			}
			String cat = Web.getStrListStr(categories);
			System.out.println("cat = " + cat);
	//		BFreigTypeNum.append("]");
			BFreiSoll.append("]");
			BFInArbeirt.append("]");
			BFAWE.append("]");
			
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
							fontSize:'8px',
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
				//		pointWidth:33,
						shadow:false,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white',
							formatter: function() {
								if (this.y == 0 || this.y == 0.0) {
									return '';
								}
								return this.y + '';
							}
					//		rotation: -90,
					//		x:5
						}
					}
				},
				legend: {
					layout: 'vertical',
					align: 'right',
					verticalAlign: 'middle',
					borderWidth: 1,
					shadow:false,
					enabled:true
				},
			    series: [{
					name: 'BMG frei Soll',
					data: <%=BFreiSoll%>,
					color: '#00FF00',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'10px'
						},
						color: 'white'
					}
				},{
					name: 'in arbeit',
					data: <%=BFInArbeirt%>,
					color: '#FFCC00',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'10px'
						},
						color: 'black'
					}
				}, {
					name: 'AWE',
					data: <%=BFAWE%>,
					color: '#FFFFCC',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'10px'
						},
						color: 'black'
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
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LC BMG-Teile von ES Teileliste</h5>
			
			<div id="chart1" style="width: 820px; height: 320px; float: left; margin: 0px; margin-top: 50px; margin-left: 30px;"></div>
		</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
	<!-- 
		<style>
			.top-table {
				width: 820px; height: 200px; float: left; margin: 0px;
			}
			.top-table table {
				width: 520px;
			}
		</style>
	<div class="top-table">
				<table cellspacing="0">
					<tr>
						<td colspan="3">9 Teile Nach OS frei</td>
					</tr>
					<tr>
						<td>Zeil</td>
						<td>ZSB</td>
						<td>Teile</td>
					</tr>
					<tr>
						<td rowspan="4">KW37/12</td>
						<td rowspan="4">I-TAFEL</td>
						<td>ZENTRALROHR/中央柱管 X1</td>
					</tr>
					<tr>
						<td>INSTRUMENTENTAFEL/泡沫仪表板总成 X2 </td>
					</tr>
					<tr>
						<td>LUFTKANAL/风道 X1 </td>
					</tr>
					<tr>
						<td>HANDSCHUHKASTEN/手套箱总成 X1</td>
					</tr>
				</table>
			</div>
	 -->
</body>
</html>