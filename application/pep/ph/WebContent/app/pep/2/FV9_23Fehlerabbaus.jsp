<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%!
		public static int getListSum(List<String> list) {
			int sum = 0;
			for (String value : list) {
				sum += Integer.parseInt(value);
			}
			return sum;
		}
		%>
		<%
		
		List<String> fv9KWNo = (List<String>)form.get("fv9KWNo");
		List<String> fv9AFelhler = (List<String>)form.get("fv9AFelhler");
		List<String> fv9BFelhler = (List<String>)form.get("fv9BFelhler");
		List<String> fv9CFelhler = (List<String>)form.get("fv9CFelhler");
		
		List<String> KWNo = new ArrayList<String>();
		List<String> AFelhler = new ArrayList<String>();
		List<String> BFelhler = new ArrayList<String>();
		List<String> CFelhler = new ArrayList<String>();
		
		String categories = "";
		StringBuffer valuea = new StringBuffer();
		StringBuffer valueb = new StringBuffer();
		StringBuffer valuec = new StringBuffer();
		
		int gesamt = 0; 
		
		//计算汇报周所在位置
		//double currentIndex = 0;
		//String fv9ReportKW = (String)request.getSession().getAttribute("fv9ReportKW");
		//int reportKW = Integer.parseInt(fv9ReportKW.replaceAll("KW", "").replaceAll("kw", ""));
		
		if (Web.getListYesOrNo(fv9KWNo)) {
			int a_sum = getListSum(fv9AFelhler);
			int b_sum = getListSum(fv9BFelhler);
			int c_sum = getListSum(fv9CFelhler);
			
			gesamt = a_sum + b_sum + c_sum;
			
			KWNo.add("Gesamt");
			AFelhler.add(a_sum + "");
			BFelhler.add(b_sum + "");
			CFelhler.add(c_sum + "");
			
			for (int i=0; i<fv9KWNo.size(); i++) {
				KWNo.add(fv9KWNo.get(i));
				AFelhler.add(fv9AFelhler.get(i));
				BFelhler.add(fv9BFelhler.get(i));
				CFelhler.add(fv9CFelhler.get(i));
			}
			
			categories = Web.getStrListStr(KWNo);
			
			valuec.append("[");
			valueb.append("[");
			valuea.append("[");
			
			int count = gesamt;
			valuec.append("{y: " + c_sum + ", low:" + (gesamt-c_sum) + "}, ");
			valueb.append("{y: " + b_sum + ", low:" + (gesamt-c_sum-b_sum) + "}, ");
			valuea.append("{y: " + a_sum + ", low:" + (gesamt-c_sum-b_sum-a_sum) + "}, ");
			
			for (int index=1; index<KWNo.size(); index++) {
				int c = Integer.parseInt(CFelhler.get(index));
				int b = Integer.parseInt(BFelhler.get(index));
				int a = Integer.parseInt(AFelhler.get(index));
				String value_c = "", low_c = "";
				String value_b = "", low_b = "";
				String value_a = "", low_a = "";
				if (c != 0) { 
					value_c = c + ""; 
					low_c = (count-c)+"";
					count = count - c;
				} else { 
					value_c = "null"; 
					low_c = "null";
				}
				if (b != 0) { 
					value_b = b + ""; 
					low_b = (count - b) + "";
					count = count - b;
				} else { 
					value_b = "null"; 
					low_b = "null"; 
				}
				if (a != 0) { 
					value_a = a + ""; 
					low_a = (count-a) + "";
					count = count - a;
				} else { 
					value_a = "null"; 
					low_a = "null"; 
				}
				
				if (index == KWNo.size()-1) {
					valuec.append("{y: " + value_c + ", low:" + low_c + "}");
					valueb.append("{y: " + value_b + ", low:" + low_b + "}");
					valuea.append("{y: " + value_a + ", low:" + low_a + "}");
				} else {
					valuec.append("{y: " + value_c + ", low:" + low_c + "}, ");
					valueb.append("{y: " + value_b + ", low:" + low_b + "}, ");
					valuea.append("{y: " + value_a + ", low:" + low_a + "}, ");
				}
				
				//计算汇报周所在位置
				/* String kw = KWNo.get(index);
				if (kw.contains(fv9ReportKW) || kw.split("/")[0].equals(reportKW)) {
					currentIndex = index - 0.3;
				} */
				
				
			}
			
			valuec.append("]");
			valueb.append("]");
			valuea.append("]");
			
			System.out.println("valuec = " + valuec.toString());
			System.out.println("valueb = " + valueb.toString());
			System.out.println("valuea = " + valuea.toString());
		//	System.out.println("currentIndex = " + currentIndex);
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
					text: ' '
				},
				xAxis: {
			//		tickLength: 0,
			//		lineColor: 'black',
			//		lineWidth:2,
					categories: <%=categories%>,
					labels: {
						style: {
							 padding:'10px',
							 color: 'black',
							 fontSize: '18px'
						}
					}
				},
				yAxis: {
					min:0,
					max:<%=gesamt%>,
					lineWidth:1,
					lineColor: 'black',
			//		tickPixelInterval: 200,
					gridLineWidth: 1,
					labels: {
						enabled:true
					},
					title: {
						text:""
					}
				},
				tooltip: {
					formatter: function() {
						return '<b> - '+ this.x +'</b><br/>' + this.series.name +': '+ this.y;
					}
				},
				plotOptions: {
					column: {
						shadow: false,
						stacking: 'normal',
						borderColor:'black',
						borderWidth:1,
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'14px'
							},
							color: 'black',
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
							}
						}
					},
					series: {
			            dataLabels: {
			                enabled: true,
			                style: {
			                    fontSize:'12px'
			                },
			                color:'white'
			            }
			        }
				},
				legend: {
					layout: 'vertical',
					align: 'right',
					verticalAlign: 'top',
					x: -10,
					y: 200,
					borderWidth: 0,
					style: {
						 fontSize: '16px',
						 color: 'black'
					}
				},
				series: [{
						name: 'C Fehler',
						color: '#009C0E',
						data: <%=valuec.toString()%>
					}, {
						name: 'B Fehler',
						color: '#0000FF',
						data: <%=valueb.toString()%>
					}, {
						name: 'A Fehler',
						color: '#E63110',
						data: <%=valuea.toString()%>
					}
				<%
				//if (currentIndex != -0.3) { data: [[=currentIndex, 0], [ =currentIndex, =gesamt]], 
				%>
					, {
						data: [[1.5, 0], [1.5, <%=gesamt%>]],
						color: '#3366FF',
						dashStyle: 'dash',
						lineWidth: 3,
						marker: {enabled: false},
						shadow: false,
						showInLegend: false,
						enableMouseTracking: false,
						type: 'line',
						name :"",
						dataLabels: {
							enabled: true,
							formatter: function() {
								return "<span style='font-size:18px; font-weight: bolder;'>Jetzt</span>";
							}
						}
					}
				<%
			//	}
				%>
					]
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
				<div id="chart" style="width: 900px; height: 500px; margin:5px auto; "></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
