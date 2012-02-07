<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/app/pep/include/header.jsp"%>
<title></title>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<%
		Map<String, String> form = new HashMap<String, String>();//(Map<String, String>)request.getAttribute("form");

		form.put("fv9ReportMeil","ReportMeil");form.put("fv9ReportDept","ReportDept");

			int[] categories = new int[50];
			int[] a = new int[50];
			int[] b = new int[50];
			int[] c = new int[50];
			int[] d = new int[50];
			int[] e = new int[50];
			for(int i=0; i<50; i++){
				categories[i] = i+1;
				a[i] = i + 5;
				b[i] = i + 25;
				c[i] = i + 45;
				d[i] = i + 55;
				e[i] = i + 67;
			}
		%>
		<script type="text/javascript">
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'line'
					},
					title: {
						text: 'Auslaufkurve New Bora FL 启动曲线',
						x: -20 //center
					},
					subtitle: {
						text: 'Entwurf: XX.XX.XXXX (Version 7)',
						x: -120
					},
					xAxis: {
						categories: <%=Arrays.toString(categories)%>,
						labels: {
							rotation: -45,
							align: 'right'
						}
					},
					yAxis: {
						title: {
							text: ''
						}
					},
					tooltip: {
						formatter: function() {
				                return '<b>'+ this.series.name +'</b><br/>'+
								this.x +': '+ this.y +'°C';
						}
					},
					series: [{
						name: 'New Bora FL/Tag 日产量',
						color: '#FF0000',
						data: <%=Arrays.toString(a)%>
					},{
						name: 'New Bora FL/Tag(Soll) 目标日产量',
						color: '#000000',
						data: <%=Arrays.toString(b)%>
					},{
						name: 'New Bora alt/Tag 日产量',
						color: '#0000FF',
						data: <%=Arrays.toString(c)%>
					},{
						name: 'New Bora Taxi/Tag 日产量',
						color: '#0000FF',
						data: <%=Arrays.toString(d)%>
					},{
						name: 'New Bora FL/Tag(Ist) 已落实日产量',
						color: '#000000',
						dashStyle: 'shortdot',
						data: <%=Arrays.toString(e)%>
					}]
				});
				
			});
				
		</script>

</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>1.4 Anlaufkurve</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<div id="datatable" style="width: 800px; height: 100px; margin: 0 auto; margin-top: 20px;text-align: center;">
				此处有表格(需详细分析，不是图表的数据)
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>