<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/app/pep/include/header.jsp"%>
<!DOCTYPE HTML>
<%
	title = "4.1 Nominierungen/Lieferantenstatus";
	Map form = (Map)request.getAttribute("form");
	int fv9Nominiert = 200; // (Integer) form.get("fv9Nominiert");已定厂 
	int fv9Nichtnominiert = 33;//	 (Integer) form.get("fv9Nichtnominiert");未定厂
	int Gesamt = fv9Nominiert + fv9Nichtnominiert;	
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %> </title>
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
		<%

			List<String> fv9KWNo = new ArrayList<String>();//(List<String>)form.get("fv9KWNo")	周数
			fv9KWNo.add("9");
			fv9KWNo.add("11");
			fv9KWNo.add("13");
			fv9KWNo.add("15");
			
			List<String> fv9KWNum = new ArrayList<String>();//(List<String>)form.get("fv9KWNumber")	数量
			fv9KWNum.add("4");
			fv9KWNum.add("3");
			fv9KWNum.add("3");
			fv9KWNum.add("4");
			int[] fv9KWNumber = Web.getIntArrByStringlist(fv9KWNum);
			
			List<String> fv9KWCom = new ArrayList<String>();//{"-x:*** <br/>-y:***","-x:***<br/> -y:***","-x:*** <br/>-y:***"};//(List<String>)form.get("fv9KWCom")	备注
			fv9KWCom.add("-x:*** <br/>-y:***");
			fv9KWCom.add("-x:*** <br/>-y:***");
			fv9KWCom.add("-x:*** <br/>-y:***");
			fv9KWCom.add("-x:*** <br/>-y:***");
			
			int fv9KritischeNomini = 1;//(Integer) form.get("fv9KritischeNomini");	 有风险
			
			StringBuffer buffer = new StringBuffer("[");
			buffer.append("\"" + "Kritische<br>Nominierungen" + "\",");
			int total = 0;
			
			for(int i=0; i<fv9KWNo.size(); i++){
				buffer.append("\"KW" + fv9KWNo.get(i) + "\",");
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
					 		desc: '<%=fv9KWCom.get(i)%>'
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
			<div id="top"><h1><%=title %></h1></div>
			<div id="content">
				<div style="width: 50px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart1" style="width: 250px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart2" style="width: 600px; height: 400px; margin: 0 auto; float: left;margin-top:20px"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
