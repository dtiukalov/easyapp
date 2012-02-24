<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/app/pep/include/header.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><%=title %></title>
		<%
		class Problem {
			String kw;
			String type;
			String desc;
		}
		
		List<String> fv9KWNo = (List<String>) form.get("fv9KWNo");
		String kw  = Web.getNumberListStr(fv9KWNo);
		
		List<String> fv9Projekt = (List<String>) form.get("fv9Projekt");
		List<String> fv9Kaufteile = (List<String>) form.get("fv9Kaufteile");
		List<String> fv9Montage = (List<String>) form.get("fv9Montage");
		List<String> fv9Lack = (List<String>) form.get("fv9Lack");
		List<String> fv9Karosseriebau = (List<String>) form.get("fv9Karosseriebau");
		List<String> fv9Presswerk = (List<String>) form.get("fv9Presswerk");
		
		List<String> fv9ProjektCom_GM = (List<String>) form.get("fv9ProjektCom_GM");
		List<String> fv9KaufteileCom_GM = (List<String>) form.get("fv9KaufteileCom_GM");
		List<String> fv9MontageCom_GM = (List<String>) form.get("fv9MontageCom_GM");
		List<String> fv9LackCom_GM = (List<String>) form.get("fv9LackCom_GM");
		List<String> fv9KarossCom_GM = (List<String>) form.get("fv9KarossCom_GM");
		List<String> fv9PresswerkCom_GM = (List<String>) form.get("fv9PresswerkCom_GM");
		//实际错误状态
//		String ist_kw = "";//周 
		//项目
		int ist_Projekt = 0;  int low_Projekt = 0; 
		//外购件
		int ist_Kaufteile = 0;  int low_Kaufteile = 0;
		//总装数
		int ist_Montage = 0;  int low_Montage = 0;
		//油漆数
		int ist_Lack = 0;  int low_Lack = 0;
		//焊装数
		int ist_Karosseriebau = 0;  int low_Karosseriebau = 0;
		//冲压数
		int ist_Presswerk = 0;  int low_Presswerk = 0;
		
		//计划每周解决错误数
		List<Integer> reduce_no = new ArrayList();
		List<Integer> reduce_low = new ArrayList();
		
		
		if (fv9KWNo != null && fv9KWNo.size() > 0){
			//获取各个车间实际错误状况
//			ist_kw = "KW" + (String)fv9KWNo.get(0);
			ist_Projekt = Integer.parseInt((String)fv9Projekt.get(0));
			
			ist_Kaufteile = Integer.parseInt((String)fv9Kaufteile.get(0));
			low_Kaufteile = low_Projekt + ist_Projekt;
			
			ist_Montage = Integer.parseInt((String)fv9Montage.get(0));
			low_Montage = low_Kaufteile + ist_Kaufteile;
			
			ist_Lack = Integer.parseInt((String)fv9Lack.get(0));
			low_Lack = low_Montage + ist_Montage;
			
			ist_Karosseriebau = Integer.parseInt((String)fv9Karosseriebau.get(0));
			low_Karosseriebau = low_Lack + ist_Lack;
			
			ist_Presswerk = Integer.parseInt((String)fv9Presswerk.get(0));
			low_Presswerk = low_Karosseriebau + ist_Karosseriebau;
			
			int gesamt = ist_Projekt + ist_Kaufteile + ist_Montage
						+ ist_Lack + ist_Karosseriebau + ist_Presswerk;
			
			//计划每周解决错误数
			reduce_no.add(0); 
			reduce_low.add(0);
			for (int i=1; i<fv9KWNo.size(); i++){
				int sum = Integer.parseInt((String)fv9Projekt.get(i))
						+ Integer.parseInt((String)fv9Kaufteile.get(i))
						+ Integer.parseInt((String)fv9Montage.get(i))
						+ Integer.parseInt((String)fv9Lack.get(i))
						+ Integer.parseInt((String)fv9Karosseriebau.get(i))
						+ Integer.parseInt((String)fv9Presswerk.get(i));
//				soll_kw.add(fv9KWNo.get(i));
				reduce_no.add(sum);
				reduce_low.add(gesamt - sum);
				gesamt -= sum;
				
			}
			
		}

		%>
		<style type="text/css">
			.div {
					width: 350px;
					margin-top:30px;
					margin-left:30px;
				}
			.div div {
					height: 35px;
					border-bottom-width: 2px;
					border-bottom-style: solid;
					border-bottom-color: #000000;
				}
			.div table td {
					border-bottom-width: 1px;
					border-bottom-style: solid;
					border-bottom-color: #000000;
					font-family: "宋体";
					font-size: 12px;
					line-height: 35px;
					color: #000000;
					text-indent: 10px;
				}
			#content{
				margin-left:100px;
			}
		</style>
		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
		
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'B-Fehler pro Fahrzeug',
					style:{
						color:'black',
						fontSize:'18px'
					},
				align:'left'
				},
				xAxis: {
					tickLength: 0,
					lineColor: 'black',
					lineWidth:2,
					categories: <%=kw%>,
					labels: {
							style: {
								 padding:'10px',
								 fontSize: '16px',
								 color: 'black'
							}
					}
				},
				yAxis: {
					gridLineWidth: 0,
					labels: {
						enabled:false
					},
					title: {
						text:""
					}
				},
				tooltip: {
					formatter: function() {
						return '<b> - '+ this.x +'</b><br/>' +'- '+ this.y +'<br/>'+
							 'Total: '+ this.point.stackTotal;
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						borderColor:'black',
						borderWidth:1,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'black'
						}
					}
				},
				legend: {
					layout: 'vertical',
					enabled: false,
					borderWidth:1
				},
			    series: [{
					name: 'Soll',
					showInLegend: false,
					<%
						String datastr = "";
						if (reduce_no != null && reduce_no.size() > 0) {
							StringBuffer output = new StringBuffer();
							output.append("[");
							for (int i=0; i<reduce_no.size()-1; i++){
								output.append("{y: " + reduce_no.get(i) + ", low: " + reduce_low.get(i) + ", color: '#009C0E'},");
							}
							output.append("{y: " + reduce_no.get(reduce_no.size()-1) + ", low: " + reduce_low.get(reduce_no.size()-1) + ", color: '#009C0E'}");
							output.append("]");
							datastr = output.toString();
						}
						if ("".equals(datastr)) {
							datastr = "[]";
						}
					%>
					data: <%=datastr%>,
					dataLabels: {
						enabled: true,
						style : {
							fontWeight: 'bold',
							fontSize:'12px'
						},
						color: 'white'
					}
				},{
					name: 'Presswerk',
					color: '#BBC2C5',
					data: [{ 
						y: <%=ist_Presswerk%>, 
						low: <%=low_Presswerk%>
					}]
				},{
					name: 'Karosseriebau',
					color: '#AED4F8',
					data: [{ 
						y: <%=ist_Karosseriebau%>, 
						low: <%=low_Karosseriebau%>
					}]
				},{
					name: 'Lack',
					color: '#8894A2',
					data: [{ 
						y: <%=ist_Lack%>, 
						low: <%=low_Lack%>
					}]
				},{
					name: 'Montage',
					color: '#00235A',
					data: [{ 
						y: <%=ist_Montage%>, 
						low: <%=low_Montage%>
					}],
					dataLabels: {
						enabled: true,
						style : {
							fontWeight: 'bold',
							fontSize:'10px'
						},
						color: 'white'
					}
				},{
					name: 'Kaufteile',
					color: '#AED4F8',
					data: [{ 
						y: <%=ist_Kaufteile%>, 
						low: <%=low_Kaufteile%>
					}]
				},{
					name: 'Projekt',
					color: '#98CB00',
					data: [{ 
						y: <%=ist_Projekt%>, 
						low: <%=low_Projekt%>
					}]
				}]
			});
		});
		</script>
	</head>
	<body>
		<div id="container" style="height:650px">
			<div id="nr">
				<div id="top">
				<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
				<div class="fr"> STATUS 19.10.2010</div>
				<h1><%=title %></h1>
			</div>
				<div id="content" >
					<div id="left" style="width: 400px; height: auto; margin: 0 auto; float: left;">
						<div id="chart" style="width: 400px; height: 400px; margin: 0px auto; float: left;"></div>
						<div style="width: 400px; height: 100px; margin: 0px 20px; float: left;">
							<div style="width: 120px; height: 30px; float: left; vertical-align: middle; padding-top: 10px; padding-left: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/presswerk.jpg" width="15" height="15" />Presswerk
							</div>
							<div style="width: 120px; height: 30px; float: left; vertical-align: middle; padding-top: 10px; padding-left: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/montage.jpg" width="15" height="15" />Montage
							</div>
							<div style="width: 120px; height: 30px; float: left; vertical-align: middle; padding-top: 10px; padding-left: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/Kaufteile.jpg" width="15" height="15" />Kaufteile
							</div>
							<div style="width: 120px; height: 30px; float: left; vertical-align: middle; padding-top: 10px; padding-left: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/karosseriebau.jpg" width="15" height="15" />Karosseriebau
							</div>
							<div style="width: 120px; height: 30px; float: left; vertical-align: middle; padding-top: 10px; padding-left: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/lack.jpg" width="15" height="15" />Lack
							</div>
							<div style="width: 120px; height: 30px; float: left; vertical-align: middle; padding-top: 10px; padding-left: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/Projekt.jpg" width="15" height="15" />Projekt
							</div>
						</div>
					</div>
					
					<div id="table" style="width: 400px; height: 400px; margin: 0 auto; float: left;">&nbsp;
					<div class="div">
						<div>
						  <table width="350" cellspacing="0">
						    <tr>
						      <td>Wichtigste Maßnahmen</td>
						      <td></td>
						      <td></td>
						      <td></td>
						    </tr>
						  </table>
						</div>
						<table width="350" cellspacing="0">
						<% 
						List ps = new ArrayList();
						
						if(fv9KWNo != null && fv9KWNo.size() > 0) {	
							for(int i=1; i<fv9KWNo.size(); i++){
								int rows = 0;
								if (Integer.parseInt(fv9Projekt.get(i)) > 0) {
									rows++;
									Problem p = new Problem();
									p.kw = (String)fv9KWNo.get(i);
									p.type = "Projekt";
									p.desc = fv9ProjektCom_GM.get(i);
									ps.add(p);
								}
								if (Integer.parseInt(fv9Kaufteile.get(i)) > 0) {
									rows++;
									Problem p = new Problem();
									p.kw = (String)fv9KWNo.get(i);
									p.type = "Kaufteile";
									p.desc = fv9KaufteileCom_GM.get(i);
									ps.add(p);
								}
								if (Integer.parseInt(fv9Montage.get(i)) > 0) {
									rows++;
									Problem p = new Problem();
									p.kw = (String)fv9KWNo.get(i);
									p.type = "Montage";
									p.desc = fv9MontageCom_GM.get(i);
									ps.add(p);
								}
								if (Integer.parseInt(fv9Lack.get(i)) > 0) {
									rows++;
									Problem p = new Problem();
									p.kw = (String)fv9KWNo.get(i);
									p.type = "Lack";
									p.desc = fv9LackCom_GM.get(i);
									ps.add(p);
								}
								if (Integer.parseInt(fv9Presswerk.get(i)) > 0) {
									rows++;
									Problem p = new Problem();
									p.kw = (String)fv9KWNo.get(i);
									p.type = "Presswerk";
									p.desc = fv9PresswerkCom_GM.get(i);
									ps.add(p);
								}
								if (Integer.parseInt(fv9Karosseriebau.get(i)) > 0) {
									rows++;
									Problem p = new Problem();
									p.kw = (String)fv9KWNo.get(i);
									p.type = "Karosseriebau";
									p.desc = fv9KarossCom_GM.get(i);
									ps.add(p);
								}

								if (ps != null && ps.size() > 0) {
									for (int j=0; j< ps.size(); j++) {
										Problem pp = (Problem)ps.get(j);
								%>
									  <tr>
									  <%
									  	if (j == 0) {
									  		%>
									  		<td rowspan="<%=rows%>"><%=pp.kw %></td>
									  		<%
									  	} 
									  %>
										<td>
										<% if("Projekt".equals(pp.type)){%>
											    <img src="<%=request.getContextPath()%>/app/pep/images/Projekt.jpg" width="10" height="10" />
										<% }if("Kaufteile".equals(pp.type)){%>
											    <img src="<%=request.getContextPath()%>/app/pep/images/Kaufteile.jpg" width="10" height="10" />
										<% }if("Montage".equals(pp.type)){%>
											   	<img src="<%=request.getContextPath()%>/app/pep/images/montage.jpg" width="10" height="10" />
									   	<% }if("Lack".equals(pp.type)){%>
									   			<img src="<%=request.getContextPath()%>/app/pep/images/lack.jpg" width="10" height="10" />
									   	<% }if("Presswerk".equals(pp.type)){%>
									   			<img src="<%=request.getContextPath()%>/app/pep/images/presswerk.jpg" width="10" height="10" />
									   	<% }if("Karosseriebau".equals(pp.type)){%>
									   			<img src="<%=request.getContextPath()%>/app/pep/images/karosseriebau.jpg" width="10" height="10" />
									   	<%} %>
										</td>
										<td><%=pp.desc %></td>
									 </tr>
								<%			
										}
										
								ps.clear();
								}
							}
						}
						  %>
						</table>
					</div>
					</div>
					</div>
				</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
