<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		String chart_title = "Aeko Uebersicht";
		if (form.get("fv9ChartTitle") != null) 
			chart_title = form.get("fv9ChartTitle").toString();
		String categories =""; //X轴
		String data = "";	//Y轴
		String[] colors = {"'#0000FF'", "'#F9A700'", "'#339966'"}; //TE图表 - 第三个柱子以后的颜色均为一样的
		
		int total = 0;
		
		//TE负责部分
		List<String> fv9TEStyleName = new ArrayList<String>();
		List<String> fv9TEStyleNum = new ArrayList<String>(); 
				
		if(form.get("fv9TEStyleName") != null){
			fv9TEStyleName = (List<String>)form.get("fv9TEStyleName");
			categories += "'Gesamt',";
			for (String x:fv9TEStyleName) {
				categories += "'" + x + "',";
			}
			categories = categories.substring(0, categories.length()-1);
		}
		
		if(form.get("fv9TEStyleNum") != null){
			fv9TEStyleNum = (List<String>)form.get("fv9TEStyleNum");
			
			//gesamt
			total = Web.getTotalNum(fv9TEStyleNum);
			data += "{ y:" + total + ", low:0, color: " + colors[0] + "},";
			int low = 0;
			
			for (int i=0; i<fv9TEStyleNum.size(); i++) {
				int num = Integer.parseInt(fv9TEStyleNum.get(i));
				
				String color = colors[2];
				if (i == 0)
					color = colors[1];
				
				if (i == fv9TEStyleNum.size()-1){
					data += "{ y:" + num + ", low:" + low + ", color:" + color + "}";
				} else {
					data += "{ y:" + num + ", low:" + low + ", color:" + color + "},";
				}
					
				low = low + num;
			}
		}

	
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
					text: '<%=chart_title%>',
					style:{
						color:'black',
						fontSize:'20px'
					},
					align:'center',
					y:10
				},
				xAxis: {
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:30,
						style:{
							color:'black',
							fontSize:'14px'
						}
					},
					categories: [<%=categories%>]
				},
				yAxis: {
					min: 0,
					gridLineWidth:0,
					tickWidth:1,
					tickPosition:'inside',
					lineWidth:1,
					lineColor:'gray',
					tickColor:'gray',
					title: {
						text: ''
					},
					labels:{
						style:{
							color:'black',
							fontSize:'14px'
						}
					},
					stackLabels: {
						enabled: false,
						style: {
							fontSize:'14px',
							color: 'black'
						}
					}
				},
				legend: {
					align: 'right',
					verticalAlign: 'top',
					y: 20,
					floating: true,
					borderWidth: 1,
					shadow: false,
					enabled:false
				},
				tooltip: {
					formatter: function() {
						return '<b>'+ this.x +'</b><br/>'+
							 this.series.name +': '+ this.y +'<br/>';
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
				//		pointWidth:30,
						groupPadding:0.15,
						pointPadding:0.15,
						borderWidth:0,
						shadow:false,
						dataLabels: {
							enabled: true,
							color:'black',
							verticalAlign: 'top',
							y:-10,
							style:{
								fontSize:'14px'
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
				series: [{
					name: ' ',
					data: [<%=data%>]
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
					<div id="chart" style="width: 900px; height: 500px; margin:30px 30px auto; float: left;"></div>
				</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
			</div>	
		</div>
	</body>
</html>
