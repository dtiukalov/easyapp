<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		List<String> fv9KWNo = (List<String>)form.get("fv9KWNo"); //周数

		List<String> fv9NewAFelhler = (List<String>)form.get("fv9NewAFelhler"); //每周新发现的A类软件错误
		List<String> fv9NewBFelhler = (List<String>)form.get("fv9NewBFelhler"); //每周新发现的B类软件错误
		List<String> fv9NewCFelhler = (List<String>)form.get("fv9NewCFelhler"); //每周新发现的C类软件错误
		
		List<String> fv9SolvedAFelhler = (List<String>)form.get("fv9SolvedAFelhler"); //每周解决的A类软件错误
		List<String> fv9SolvedBFelhler = (List<String>)form.get("fv9SolvedBFelhler"); //每周解决的B类软件错误
		List<String> fv9SolvedCFelhler = (List<String>)form.get("fv9SolvedCFelhler"); //每周解决的C类软件错误
		
		List<Integer> newFelhler = new ArrayList<Integer>();
		List<Integer> solvedFelhler = new ArrayList<Integer>();
		List<Integer> SummeOffenFelher = new ArrayList<Integer>();
		
		int lastAFehlerNum = 0, lastBFehlerNum = 0, lastCFehlerNum = 0; //最后剩余的错误
		
		if (fv9KWNo != null && fv9KWNo.size() > 0) {
			int summe = 0;
			for (int k=0;k<fv9KWNo.size(); k++){
				//每周新增软件错误
				int new_num = 0;
				if (fv9NewAFelhler.get(k) != null && !"".equals(fv9NewAFelhler.get(k))){
					new_num += Integer.parseInt(fv9NewAFelhler.get(k));
					lastAFehlerNum += Integer.parseInt(fv9NewAFelhler.get(k));
				}
				if (fv9NewBFelhler.get(k) != null && !"".equals(fv9NewBFelhler.get(k))){
					new_num += Integer.parseInt(fv9NewBFelhler.get(k));
					lastBFehlerNum += Integer.parseInt(fv9NewBFelhler.get(k));
				}
				if (fv9NewCFelhler.get(k) != null && !"".equals(fv9NewCFelhler.get(k))){
					new_num += Integer.parseInt(fv9NewCFelhler.get(k));
					lastCFehlerNum += Integer.parseInt(fv9NewCFelhler.get(k));
				}
				newFelhler.add(new_num);
				
				//每周解决软件错误
				int solved_num = 0;
				if (fv9SolvedAFelhler.get(k) != null && !"".equals(fv9SolvedAFelhler.get(k))){
					solved_num += Integer.parseInt(fv9SolvedAFelhler.get(k));
					lastAFehlerNum -= Integer.parseInt(fv9SolvedAFelhler.get(k));
				}
				if (fv9SolvedBFelhler.get(k) != null && !"".equals(fv9SolvedBFelhler.get(k))){
					solved_num += Integer.parseInt(fv9SolvedBFelhler.get(k));
					lastBFehlerNum -= Integer.parseInt(fv9SolvedBFelhler.get(k));
				}
				if (fv9SolvedCFelhler.get(k) != null && !"".equals(fv9SolvedCFelhler.get(k))){
					solved_num += Integer.parseInt(fv9SolvedCFelhler.get(k));
					lastCFehlerNum -= Integer.parseInt(fv9SolvedCFelhler.get(k));
				}
				solvedFelhler.add(-solved_num);
					
				summe = summe + new_num - solved_num; //line的值：所有发现的-所有已解决的
				if (new_num == 0 && solved_num == 0) {
					SummeOffenFelher.add(null); //新增和已解决的数量都为0，不显示线
				} else {
					SummeOffenFelher.add(summe);
				}
			}
		}
		String kws = Web.getStrListStr(fv9KWNo); //周数
		String news = Web.getNumberListStr(newFelhler); //每周发现的错误
		String solveds = Web.getNumberListStr(solvedFelhler); //每周解决的错误
		String SummeOffen = Web.getNumberListStr(SummeOffenFelher); //剩余的错误数
		int offen_num = lastAFehlerNum + lastBFehlerNum + lastCFehlerNum; //offen数量
		String fv9Geschlossen = (String)form.get("fv9Geschlossen"); //Geschlossen-软件错误总数
		
		String project = ""; //项目信息
		if (!"".equals((String) request.getSession()
				.getAttribute("project"))) {
			project = (String) request.getSession().getAttribute("project");
		}
		
		String reportYear = "";//汇报年
		String reportKW = "";//汇报周
		int fv9ReportYear = 1900, fv9ReportKW = 1; //汇报年,汇报周
		int createYear = 1900, createKW = 1; //创建年,创建周
		
		if (session.getAttribute("fv9ReportKW") != null) {
			fv9ReportKW = Integer.parseInt(
					((String)session.getAttribute("fv9ReportKW")).replaceAll("kw", "").replaceAll("KW", ""));
		}
		if (session.getAttribute("creation_date") != null) {
			Calendar cal = (Calendar)session.getAttribute("creation_date");
			createYear = cal.get(cal.YEAR);
			createKW = cal.get(cal.WEEK_OF_YEAR);
		}
		//如果创建日期所在周 <= PH汇报周，则汇报年为当年
		if (createKW <= fv9ReportKW) {
			reportYear = createYear  + "";
		} else { //汇报年为下一年
			reportYear = (createYear + 1)  + "";
		}
		reportKW = fv9ReportKW + "";
		
		
		String fv9SOPKW = ""; //SOP周数
		if (session.getAttribute("DATE_SOP") != null) {
			fv9SOPKW = DateUtils.getKWByDate((String)session.getAttribute("DATE_SOP"));
		}
		
		String string_left = "Problemblattzu - und - ablauf<br>"; //左侧字符 串
		string_left += project + "(" + fv9SOPKW + ")" + ", AB-Fehler, KW " + reportYear + "-" + reportKW;
		
		String string_right = "Offen:" + offen_num; //右侧字符 串
		%>
		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					zoomType: 'xy',
					marginTop: 60
					
				},
				title: {
					text: ' ',
					style:{
						enabled: false
					},
					align:'left'
				},
				xAxis: {
					tickPosition:'inside',
					lineWidth:1,
					lineColor:'gray',
					tickWidth:1,
					ticlColor:'gray',
					title: {
						text: '<br>Kalenderwoche',
						style: {
							color: 'black',
							fontSize:'16px'
						}
					},
					labels:{
						y:30,
						style:{
							align: 'center',
							verticalAlign: 'bottom',
							fontSize:'16px',
							color:'black',
							fontWeight: 'bold'
						}
					},
					categories: <%=kws%>
				},
				yAxis: {
					lineWidth:1,
					tickPixelInterval: 100,
					lineColor:'gray',
					tickWidth:1,
					ticlColor:'gray',
					tickPosition:'inside',
					title: {
						text: 'Problemblattzu- und -ablauf',
						style: {
							color: 'black',
							fontSize:'16px'
						}
					},
					labels:{
						style:{
							fontSize:'16px',
							color:'black'
						}
					},
					stackLabels: {
						enabled: false
					}
				},
				legend: {
					align: 'center',
					shadow:false,
					borderWidth: 1,
					borderColor: '#000000',
					style: {
						padding: '5px'
					}
				},
				tooltip: {
					formatter: function() {
						return this.series.name +': '+ this.y;
					}
				},
				plotOptions: {
					line: {
						shadow: false,
						dataLabels: {
							enabled: false
						},
						enableMouseTracking: true
					},
					column: {
						stacking: 'normal',
						shadow: false,
						borderColor:'black',
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'10px'
							},
							color: 'black'
						}
					}
				},
				series: [{
					type: 'column',
					name: 'Fehlerzulauf  ',
					color: '#00235A',
					data: <%=news%>,
					dataLabels: {
						enabled: false,
						style : {
							fontSize:'12px'
						},
						color: 'black',
						formatter: function() {
							if (this.y == 0 || this.y == 0.0 || this.y == null) {
								return '';
							}
							return this.y + '';
						}
					}
				},{
					type: 'column',
					name: 'Fehlerzulauf  ',
					color: '#006600',
					data: <%=solveds%>,
					dataLabels: {
						enabled: false,
						style : {
							fontSize:'12px'
						},
						color: 'black',
						formatter: function() {
							if (this.y == 0 || this.y == 0.0 || this.y == null) {
								return '';
							}
							return -this.y + '';
						}
					}
				}, {
					type: 'line',
					name: 'Summe offener Fehler',
					color: '#00235A',
					data: <%=SummeOffen%>,
					dataLabels: {
						enabled: false,
						style : {
							fontSize:'16px'
						},
						y: -10,
						color: 'black'
					},
					marker:{
						fillColor: '#FFFFFF',
		                lineWidth: 2,
		                lineColor: null,
		                radius: 3
					}
				}]
			}, function(chart) { 
				chart.renderer.text(
		                '<span style="font-size:18px;">TE-EE7 Elektronikintegeation</span>', 
		               	80, 
		                50
		            ).attr({
		                zIndex: 6
		            }).add();
				
				chart.renderer.text(
		                '<div style="width: 150px; height: 83px; border: 1px solid; font-size: 14px; padding-left: 10px; padding-top: 5px;">' 
						+ 'Aktuelle KW <%= reportKW%><br>'
						+ 'A-Fehler: <%=lastAFehlerNum %><br>'
						+ 'B-Fehler: <%=lastBFehlerNum %><br>'
						+ 'C-Fehler: <%=lastCFehlerNum %><br>'
						+ 'Geschlossen: <%=fv9Geschlossen %>'
						+ '</div>', 
		               	700, 
		                50
		            ).attr({
		                zIndex: 6
		            }).add();
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
				<div style="width: 900px; height: 30px; margin: 5px auto; float: left; font-weight: bolder;">
					<div style="width: 80%; float: left; text-align: left; padding-left: 10px;"><%=string_left %></div>
					<div style="width: 15%; float: left; text-align: right;"><%=string_right %></div>
				</div>
				<div id="chart" style="width: 900px; height: 500px; margin:5px auto; float: left; "></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
