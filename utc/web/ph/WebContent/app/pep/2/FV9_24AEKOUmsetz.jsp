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
		//分两个图表，左侧为TE负责部分，右侧为LO负责部分
		double sepline = 0.0; //两个图表中间的分割线		
		String categories =""; //X轴
		String data = "";	//Y轴
		String[] colors1 = {"'#0000FF'", "'#F9A700'", "'#339966'"}; //TE图表 - 第三个柱子以后的颜色均为一样的
		String[] colors2 = {"'#0000FF'", "'#00FF00'", "'#00CCFF'"}; //LO图表 - 第三个柱子以后的颜色均为一样的
		
		int total = 0;
		
		//TE负责部分
		List<String> fv9StyleName = new ArrayList<String>();
		List<String> fv9StyleNum = new ArrayList<String>(); 
				
		if(form.get("fv9StyleName") != null){
			fv9StyleName = (List<String>)form.get("fv9StyleName");
			categories += "'Gesamt',";
			for (String x:fv9StyleName) {
				categories += "'" + x + "',";
			}
			categories = categories.substring(0, categories.length()-1);
		}
		
		if(form.get("fv9StyleNum") != null){
			fv9StyleNum = (List<String>)form.get("fv9StyleNum");
			
			sepline = fv9StyleNum.size() + 0.5;
			//gesamt
			total = Web.getTotalNum(fv9StyleNum);
			data += "{ y:" + total + ", low:0, color: " + colors1[0] + "},";
			int low1 = total;
			
			for (int i=0; i<fv9StyleNum.size(); i++) {
				int num = Integer.parseInt(fv9StyleNum.get(i));
				low1 = low1 - num;
				String color = colors1[2];
				if (i == 0)
					color = colors1[1];
				
				if (i == fv9StyleNum.size()-1){
					data += "{ y:" + num + ", low:" + low1 + ", color:" + color + "}";
				} else {
					data += "{ y:" + num + ", low:" + low1 + ", color:" + color + "},";
				}
					
			}
		}

			
		
		//LO负责部分
		List<String> fv9MMStyleName = new ArrayList<String>();
		List<String> fv9MMStyleNum = new ArrayList<String>(); 
		if(form.get("fv9MMStyleName") != null){
			fv9MMStyleName = (List<String>)form.get("fv9MMStyleName");
			if (fv9StyleName != null && fv9StyleName.size() > 0) {
				//如果TE部分存在数据，则在X轴数据前添加一个,
				categories += ",";
			}
			categories += "'genehmigt/<br>techn.i.O.',";
			for (String x : fv9MMStyleName) {
				categories += "'" + x + "',";
			}
			categories = categories.substring(0, categories.length()-1);
		}
			
		if(form.get("fv9MMStyleNum") != null){
			fv9MMStyleNum = (List<String>)form.get("fv9MMStyleNum");
			if (fv9MMStyleName != null && fv9MMStyleName.size() > 0) {
				//如果TE部分存在数据，则在Y轴数据前添加一个,
				data += ",";
			}

			//genehmigt/techn.i.O.
			int total2 = Web.getTotalNum(fv9MMStyleNum);
			data += "{ y:" + total2 + ", low:0, color: " + colors2[0] + "},";
			int low1 = total2;
			
			for (int i=0; i<fv9MMStyleNum.size(); i++) {
				int num = Integer.parseInt(fv9MMStyleNum.get(i));
				low1 = low1 - num;
				String color = colors2[2];
				if (i == 0)
					color = colors2[1];
				
				if (i == fv9MMStyleNum.size()-1){
					data += "{ y:" + num + ", low:" + low1 + ", color:" + color + "}";
				} else {
					data += "{ y:" + num + ", low:" + low1 + ", color:" + color + "},";
				}
					
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
					text: 'Anzahl Aenderungen',
					style:{
						color:'black',
						fontSize:'20px'
					},
					align:'left',
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
						groupPadding:0.06,
						pointPadding:0.06,
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
					name: 'Anzahl Aenderungen',
					data: [<%=data%>]
				},{
					data: [[<%=sepline%>, 0], [ <%=sepline%>, <%=total + 5%>]],
					color: '#5762A0',
					dashStyle: 'dash',
					lineWidth: 1,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"",
					dataLabels: {
						enabled: true,
						formatter: function() {
							return "<B></B>";
						}
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
					<div style="width: 900px; height: 80px; margin: 0px 0px auto; font-size: 18px; text-align: left; padding-top: 10px; padding-left: 650px;
						font-family: Arial;">
						Status 485&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;technisch i.O.  <br>
						Status 487/496&nbsp;&nbsp;&nbsp;&nbsp;genehmigt  <br>
						Status 800&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Terminfindung
					</div>
					<div id="chart" style="width: 900px; height: 470px; margin:0px 30px auto; float: left;"></div>
				</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
			</div>	
		</div>
	</body>
</html>
