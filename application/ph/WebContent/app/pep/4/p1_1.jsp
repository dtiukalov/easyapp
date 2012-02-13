<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<script type="text/javascript">
		var chart1;
		var chart2;
	<%
		Map form = (Map)request.getAttribute("form");
		int fv9Nominiert = 200; //已定厂
		int fv9Nichtnominiert = 33;//	未定厂
		int Gesamt = fv9Nominiert + fv9Nichtnominiert;	
	%>
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
		<%

			Integer[] fv9KWNo = new Integer[]{9, 11, 13};//周数
			Integer[] fv9KWNumber = new Integer[]{4,6,4};//数量
			String[] fv9KWCom = new String[]{"-x:*** <br/>-y:***","-x:***<br/> -y:***","-x:*** <br/>-y:***"};//备注
			int fv9KritischeNomini = 1;//	有风险
			
			StringBuffer buffer = new StringBuffer("[");
			buffer.append("\"" + "Kritische<br>Nominierungen" + "\",");
			int total = 0;
			
			for(int i=0; i<fv9KWNo.length; i++){
				buffer.append("\"" + "KW" + fv9KWNo[i].toString() + "\",");
				total = fv9KWNumber[i] + total;
			}
			
			buffer.append("\"" + "später" + "\",");
			buffer.deleteCharAt(buffer.length()-1);
			buffer.append("]");
			String categories = buffer.toString();
			total = fv9KritischeNomini + total;
		%>
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
					categories: <%=categories%>//["Kritische<br>Nominierungen", 'KW09', 'KW11', 'KW13', 'später'] 
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
					data: [{ 
							y: <%=total%>, 
							low:0,
							color: '#E53110',
							desc:'titletest'
						}, 
						<%
						int temp = 0;
						for(int i=0; i<fv9KWNumber.length; i++){
							if(i == 0){
						 		temp = total - fv9KWNumber[i];
						 	} else {
						 		temp = temp - fv9KWNumber[i];
						 	}
						%>
						{
						 	y: <%=fv9KWNumber[i]%>, 
					 		low: <%=temp%>,
					 		color: '#E53110',
					 		desc: '<%=fv9KWCom[i]%>'
						},
						<%}
						%>
						{
							y: <%=fv9KritischeNomini%>,
							low:<%=temp - fv9KritischeNomini%>,
							color: '#E53110',
							desc: '-x:*** <br/>-y:***'
						}]
				}]
			});
		});
		
		//, 
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>4.1 Nominierungen/Lieferantenstatus</h1></div>
			<div id="content">
				<div style="width: 50px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart1" style="width: 250px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart2" style="width: 600px; height: 400px; margin: 0 auto; float: left;margin-top:20px"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
