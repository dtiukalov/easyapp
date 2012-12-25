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
		String categories =""; //X轴
		String data = "";	//Y轴
		String[] colors = {"'#0000FF'", "'#F9A700'", "'#006600'", "'#AED4F8'", "'#BBC2C5'"}; //蓝色，黄色，绿色，浅蓝，深灰
		
		int total = 0;
		
		//TE负责部分
		List<String> fv9LOStyleName = new ArrayList<String>();
		List<String> fv9LOStyleNum = new ArrayList<String>(); 
				
		if(form.get("fv9LOStyleName") != null){
			fv9LOStyleName = (List<String>)form.get("fv9LOStyleName");
			categories += "'Gesamt',";
			for (String x:fv9LOStyleName) {
				categories += "'" + x + "',";
			}
			categories = categories.substring(0, categories.length()-1);
		}
		
		if(form.get("fv9LOStyleNum") != null){
			fv9LOStyleNum = (List<String>)form.get("fv9LOStyleNum");
			
			//gesamt
			total = Web.getTotalNum(fv9LOStyleNum);
			data += "{ y:" + total + ", low:0, color: " + colors[0] + "},";
			int low = 0;
			
			for (int i=0; i<fv9LOStyleNum.size(); i++) {
				int num = Integer.parseInt(fv9LOStyleNum.get(i));
				
				String color = ""; 
				if (i >= colors.length-1) {
					color = colors[colors.length-1];//超出颜色数量范围的，按最后一个颜色配色
				} else {
					color = colors[i+1]; //在颜色数量范围表内的按颜色表配色
				}
				
				if (i == fv9LOStyleNum.size()-1){
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
					text: ' ',
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
					<%
					
					double height_total = 550; //content总高度
					double height_table = 0; //表格所占高度

					List<String> fv9AekoNo = (List<String>)form.get("fv9AekoNo"); //Aeko号
					List<String> fv9AekoContent = (List<String>)form.get("fv9AekoContent"); //Aeko内容
					List<String> fv9AekoStatus = (List<String>)form.get("fv9AekoStatus"); //状态
					
					if (fv9AekoNo != null && fv9AekoNo.size() > 0) {
						//表格存在，超过10行，高度为250
						if (fv9AekoNo.size() >= 10)
							height_table = 250;
						//表格存在，超过介于5-10之间，高度为200
						if (fv9AekoNo.size() < 10 && fv9AekoNo.size() >= 5)
							height_table = 200;
						//表格存在，未超过5行，高度为130
						if (fv9AekoNo.size() < 5) 
							height_table = 130;
						double height = height_table-10;
						double h = height/(fv9AekoNo.size()+1);
					%>
					<div style="width: 900px; height: <%=height_table%>px; margin: 10px 30px auto; float: left;">
					<table style="border: none; border-collapse: collapse; 
						width: 500px; height: <%=height%>px; margin: 0px; margin-left: 430px; 
						float: left;  overflow: hidden; text-align: center; font-size:12px;">
					<%
						for (int n=0; n<fv9AekoNo.size(); n++) {
							String no = fv9AekoNo.get(n);
							String content = fv9AekoContent.get(n);
							String status = fv9AekoStatus.get(n);
					%>
						<tr>
							<td style="width: 15%; border: solid #000 1px; margin: 0px; height: <%=h%>px;"><%=no %></td>
							<td style="width: 65%; border: solid #000 1px; margin: 0px; height: <%=h%>px; overflow: hidden; "><%=content %></td>
							<td style="width: 15%; border: solid #000 1px; margin: 0px; height: <%=h%>px;"><%=status %></td>
						</tr>
					<%
						}
					%>
					</table>
					</div>
					<%
					}
					%>
					<div id="chart" style="width: 900px; height: <%=(height_total - height_table)%>px; margin:0px 0px auto; float: left;"></div>
				</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
			</div>	
		</div>
	</body>
</html>
