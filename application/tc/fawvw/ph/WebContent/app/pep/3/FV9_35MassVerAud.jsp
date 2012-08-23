<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<style type="text/css">
	#ybanckground{
		background:url(<%=request.getContextPath()%>/app/pep/images/bgRound.jpg) no-repeat;
		width:35px; 
		height:24px; 
		padding-top:5px;
	}
</style>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<style type="text/css">
			.div {
				width: 450px;
				margin-top:80px;
				margin-left:30px;
			}
			.div div {
				height: 30px;
				border-bottom-width: 2px;
				border-bottom-style: solid;
				border-bottom-color: #000000;
			}
			.div table td {
				font-family: "宋体";
				font-size: 12px;
				line-height: 25px;
				color: #000000;
			}
		</style>
		<%
		class Problem {
			String kw;
			String type;
			String desc;
			String num;
		}
		
		Double audit_ist = 0.0;
		Double audit_soll = 0.0;
		
		if ((String)form.get("fv9AuditIst") != null && !"".equals((String)form.get("fv9AuditIst"))) {
			audit_ist = Double.parseDouble((String)form.get("fv9AuditIst"));
		}
		if ((String)form.get("fv9AuditSoll") != null && !"".equals((String)form.get("fv9AuditSoll"))) {
			audit_soll = Double.parseDouble((String)form.get("fv9AuditSoll"));
		}
		
		List<String> fv9KWNo = (List)form.get("fv9KWNo");
		List<String> fv9Projekt = (List)form.get("fv9Projekt"); //项目
		List<String> fv9ProjektCom_GM = (List)form.get("fv9ProjektCom_GM");
		List<String> fv9Kaufteile = (List)form.get("fv9Kaufteile");//外购件
		List<String> fv9KaufteileCom_GM = (List)form.get("fv9KaufteileCom_GM");
		List<String> fv9Montage = (List)form.get("fv9Montage");//总装
		List<String> fv9MontageCom_GM = (List)form.get("fv9MontageCom_GM");
		List<String> fv9Lack = (List)form.get("fv9Lack");//油漆
		List<String> fv9LackCom_GM = (List)form.get("fv9LackCom_GM");
		List<String> fv9Karosseriebau = (List)form.get("fv9Karosseriebau");//焊装
		List<String> fv9KarossCom_GM = (List)form.get("fv9KarossCom_GM");
		List<String> fv9Presswerk = (List)form.get("fv9Presswerk");//冲压
		List<String> fv9PresswerkCom_GM = (List)form.get("fv9PresswerkCom_GM");
		
		/* ['26<br>3','27<br>4','28<br>4','29<br>4','30<br>4','31<br>4'] */
		//把Audit的分值加在相应的周上
		StringBuffer kwbuffer = new StringBuffer();
		kwbuffer.append("[");
		/* if (fv9KWNo != null && fv9KWNo.size() > 0) {
			for (int k=0; k<fv9KWNo.size()-1; k++) {
				if (k==0) {
					kwbuffer.append("'" + fv9KWNo.get(k)+ "<br>( " + audit_ist + " )'");
					kwbuffer.append(",");
				} if (k == fv9KWNo.size()-2)  {
					kwbuffer.append("'" + fv9KWNo.get(fv9KWNo.size()-1)+ "<br>( " + audit_soll + " )'");
					kwbuffer.append(",");
				} else {
					kwbuffer.append("'" + fv9KWNo.get(k)+ "'");
					kwbuffer.append(",");
				}
			}
			
		} */
		if(fv9KWNo != null && fv9KWNo.size() > 0){
			for(int k=0; k<fv9KWNo.size(); k++){
				kwbuffer.append("'" + fv9KWNo.get(k)+ "'");
				kwbuffer.append(",");
			}
		} 
		if (kwbuffer.toString().contains(",")) {
			kwbuffer.substring(0, kwbuffer.lastIndexOf(","));
		}
		kwbuffer.append("]");
		String KW = kwbuffer.toString();
		
  		String Projekt = "[";
		String Kaufteile = "[";
		String Montage = "[";
		String Lack = "[";
		String Karosseriebau = "[";
		String Presswerk = "[";
		String everyKW = "[";
		
		//右侧表格所需List
		List<Problem> t_Projekt = new ArrayList();
		List<Problem> t_Kaufteile = new ArrayList();
		List<Problem> t_Montage = new ArrayList();
		List<Problem> t_Lack = new ArrayList();
		List<Problem> t_Karosseriebau = new ArrayList();
		List<Problem> t_Presswerk = new ArrayList();
		
		if (fv9KWNo != null && fv9KWNo.size() > 0) {
			int n = fv9KWNo.size();
			int ist_sum = 0; //实际问题总数
			List<Integer> sollNumVerKW = new ArrayList(); //每周解决的问题数
			List<Integer> lowNumVerKW = new ArrayList(); //每周的low
			
			//实际状态
			int istProjekt = Integer.parseInt(fv9Projekt.get(0));
			int istKaufteile = Integer.parseInt(fv9Kaufteile.get(0));
			int istMontage = Integer.parseInt(fv9Montage.get(0));
			int istLack = Integer.parseInt(fv9Lack.get(0));
			int istKarosseriebau = Integer.parseInt(fv9Karosseriebau.get(0));
			int istPresswerk = Integer.parseInt(fv9Presswerk.get(0));
			
			ist_sum += istProjekt 
					+ istKaufteile 
					+ istMontage 
					+ istLack 
					+ istKarosseriebau 
					+ istPresswerk;
			
			Projekt += "{y: " + istProjekt + ",low: 0},";
			Kaufteile += "{y: " + istKaufteile + ",low: 0},";
			Montage += "{y: " + istMontage + ",low: 0},";
			Lack += "{y: " + istLack + ",low: 0},";
			Karosseriebau += "{y: " + istKarosseriebau + ",low: 0},";
			Presswerk += "{y: " + istPresswerk + ",low: 0},";
			everyKW += "{y: 0, low: 0, color: 'white'},";
			
			//每周解决措施状态
			if (n > 2) {
				for (int k=1; k<n-1; k++){
					Projekt += "{y: 0, low: 0},";
					Kaufteile += "{y: 0, low: 0},";
					Montage += "{y: 0, low: 0},";
					Lack += "{y: 0, low: 0},";
					Karosseriebau += "{y: 0, low: 0},";
					Presswerk += "{y: 0, low: 0},";
					
					int count = 0;
					if (fv9Projekt.get(k) != null && Integer.parseInt(fv9Projekt.get(k)) > 0){
						count += Integer.parseInt(fv9Projekt.get(k));
						Problem p = new Problem();
						p.kw = fv9KWNo.get(k);
						p.type = "Projekt";
						p.desc = Web.replaceSpecial(fv9ProjektCom_GM.get(k));
						p.num = fv9Projekt.get(k);
						t_Projekt.add(p);
					}
					if (fv9Kaufteile.get(k) != null && Integer.parseInt(fv9Kaufteile.get(k)) > 0){
						count += Integer.parseInt(fv9Kaufteile.get(k));
						Problem p = new Problem();
						p.kw = fv9KWNo.get(k);
						p.type = "Kaufteile";
						p.desc = Web.replaceSpecial(fv9KaufteileCom_GM.get(k));
						p.num = fv9Kaufteile.get(k);
						t_Kaufteile.add(p);
					}
					if (fv9Montage.get(k) != null && Integer.parseInt(fv9Montage.get(k)) > 0){
						count += Integer.parseInt(fv9Montage.get(k));
						Problem p = new Problem();
						p.kw = fv9KWNo.get(k);
						p.type = "Montage";
						p.desc = Web.replaceSpecial(fv9MontageCom_GM.get(k));
						p.num = fv9Montage.get(k);
						t_Montage.add(p);
					}
					if (fv9Lack.get(k) != null && Integer.parseInt(fv9Lack.get(k)) > 0){
						count += Integer.parseInt(fv9Lack.get(k));
						Problem p = new Problem();
						p.kw = fv9KWNo.get(k);
						p.type = "Lack";
						p.desc = Web.replaceSpecial(fv9LackCom_GM.get(k));
						p.num = fv9Lack.get(k);
						t_Lack.add(p);
					}
					if (fv9Karosseriebau.get(k) != null && Integer.parseInt(fv9Karosseriebau.get(k)) > 0){
						count += Integer.parseInt(fv9Karosseriebau.get(k));
						Problem p = new Problem();
						p.kw = fv9KWNo.get(k);
						p.type = "Karosseriebau";
						p.desc = Web.replaceSpecial(fv9KarossCom_GM.get(k));
						p.num = fv9Karosseriebau.get(k);
						t_Karosseriebau.add(p);
					}
					if (fv9Presswerk.get(k) != null && Integer.parseInt(fv9Presswerk.get(k)) > 0){
						count += Integer.parseInt(fv9Presswerk.get(k));
						Problem p = new Problem();
						p.kw = fv9KWNo.get(k);
						p.type = "Presswerk";
						p.desc = Web.replaceSpecial(fv9PresswerkCom_GM.get(k));
						p.num = fv9Presswerk.get(k);
						t_Presswerk.add(p);
					}
					
					sollNumVerKW.add(count);
					lowNumVerKW.add(ist_sum - count);
					ist_sum -= count;
				}
				
				if (sollNumVerKW != null && sollNumVerKW.size() > 0) {
					for(int m=0; m<sollNumVerKW.size(); m++){
						everyKW += "{y: " + sollNumVerKW.get(m) + ", low: " + lowNumVerKW.get(m) + ", color: '#009C0E'},";
					}
						
				}
				
			}
				
			//计划状态
			int sollProjekt = Integer.parseInt(fv9Projekt.get(n-1));
			int sollKaufteile = Integer.parseInt(fv9Kaufteile.get(n-1));
			int sollMontage = Integer.parseInt(fv9Montage.get(n-1));
			int sollLack = Integer.parseInt(fv9Lack.get(n-1));
			int sollKarosseriebau = Integer.parseInt(fv9Karosseriebau.get(n-1));
			int sollPresswerk = Integer.parseInt(fv9Presswerk.get(n-1));
			
			Projekt += "{y: " + sollProjekt + ",low: 0}";
			Kaufteile += "{y: " + sollKaufteile + ",low: 0},";
			Montage += "{y: " + sollMontage + ",low: 0},";
			Lack += "{y: " + sollLack + ",low: 0},";
			Karosseriebau += "{y: " + sollKarosseriebau + ",low: 0},";
			Presswerk += "{y: " + sollPresswerk + ",low: 0},";
			everyKW += "{y: 0, low: 0, color: 'white'}";
			
		}
		
		Projekt += "]";
		Kaufteile += "]";
		Montage += "]";
		Lack += "]";
		Karosseriebau += "]";
		Presswerk += "]";
		everyKW += "]";
		
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
					text: 'Fehlerpunkte/Fahrzeug',
					style:{
						fontSize:'18px',
						color:'black'
					},
					align:'left',
					y:30
				},
				xAxis: [{
					tickLength: 0,
					lineColor: 'black',
					categories: <%=KW%>,
					labels: {
						style: {
							 padding:'10px',
							 font: 'normal 12px Verdana, sans-serif',
							 color: 'black'
						}
				}
				}],
				yAxis: {
					gridLineWidth: 0,
					labels: {
						enabled:false
					},
					title: {
						text:""
					},
					stackLabels: {
						enabled: true,
						style: {
							color: 'black',
							fontSize:'14px'
						},
						y: -30,
						formatter:function() {
							/*ie下打印背景图片或者颜色的时候，需要设置
							ie 文件->页面设置->打印背景颜色和图片，选中。
							Internet选项->高级下设置里找到->打印->选中打印背景颜色和图片
							*/
							if(this.x == 0){
								return '<div id="ybanckground">2.1</div>' + this.total;
							}
							if(this.x == <%=fv9KWNo.size()%>-1){
								return '<div id="ybanckground">1.5</div>' + this.total;
							}
							return this.total;
						}
					}
				},
				tooltip: {
					formatter: function() {
						return '<b> KW'+ this.x +' ' + this.series.name + ' : '+ this.y + '</b>';
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						shadow: false,
						borderColor:'black',
						borderWidth:1,
						dataLabels: {
							enabled: true,
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
					}
				},
				legend: {
					layout: 'vertical',
					align: 'center',
					verticalAlign: 'top',
					x: 120,
					y: 30,
					borderWidth: 1,
					shadow:false,
					enabled:false
				},
			    series: [{
					name: 'Soll',
					data: <%=everyKW%>,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
				},{
					name: 'Presswerk',
					data: <%=Presswerk%>,
					color: '#BBC2C5',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				},{
					name: 'Karosseriebau',
					data: <%=Karosseriebau%>,
					color: '#AED4F8',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				}, {
					name: 'Lack',
					data: <%=Lack%>,
					color: '#8994A0',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false
				}, {
					name: 'Montage',
					data: <%=Montage%>,
					color: '#00235A',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
				}, {
					name: 'Kaufteile',
					data: <%=Kaufteile%>,
					color: '#91AFFF',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
				}, {
					name: 'Projekt',
					data: <%=Projekt%>,
					color: '#99CC00',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
				}]
			}, function(chart) { 
				chart.renderer.text(
		                '<span style="font-size:12px;">KW</span>', 
		               	10, 
		                455
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
					<div id="left" style="width: 400px; height: auto; margin: 0 30px; float: left;">
						<div id="chart" style="width: 400px; height: 480px; margin: 0 auto; float: left;"></div>
						<div style="width: 400px; height: auto; margin: 0px 10px auto; float: left; font-size: 12px;font-family: '宋体'">
							<div style="width: 100px; height: 30px; float: left; vertical-align: middle; padding-top: 10px; ">
								<img src="<%=request.getContextPath()%>/app/pep/images/presswerk.jpg" width="15" height="15" />Presswerk
							</div>
							<div style="width: 100px; height: 30px; float: left; vertical-align: middle; padding-top: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/montage.jpg" width="15" height="15" />Montage
							</div>
							<div style="width: 100px; height: 30px; float: left; vertical-align: middle; padding-top: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/Kaufteile.jpg" width="15" height="15" />Kaufteile
							</div>
							<div style="width: 100px; height: 30px; float: left; vertical-align: middle; padding-top: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/audit.jpg" width="15" height="15" />Audit-Note
							</div>
							<div style="width: 100px; height: 30px; float: left; vertical-align: middle; padding-top: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/karosseriebau.jpg" width="15" height="15" />Karosseriebau
							</div>
							<div style="width: 100px; height: 30px; float: left; vertical-align: middle; padding-top: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/lack.jpg" width="15" height="15" />Lack
							</div>
							<div style="width: 100px; height: 30px; float: left; vertical-align: middle; padding-top: 10px;">
								<img src="<%=request.getContextPath()%>/app/pep/images/Projekt.jpg" width="15" height="15" />Projekt
							</div>
						</div>
					</div>
					
					<div id="table" style="width: 500px; height: 540px; margin: 0px 0px auto; float: left;">&nbsp;
						<div class="div">
								<div>
								  <table cellspacing="0" style="width: 450px; font-size: 9px; overflow: hidden;">
								    <tr>
								      <td style="width: 30px; height: 30px;">KW</td>
								      <td style="width: 220px;">&nbsp;Wichtigste Massnahmen</td>
								      <td style="width: 100px;text-align: right;">Reduzierung&nbsp;</td>
								      <td style="width: 50px;text-align: right;">Fehlerpunkte/Fzg</td>
								    </tr>
								  </table>
								</div>
								<table width="450" cellspacing="0">
								<% 
									if (t_Presswerk != null && t_Presswerk.size() > 0) {
										int sum = 0;
										for(int i=0; i<t_Presswerk.size(); i++){
											Problem pp = t_Presswerk.get(i);
											sum += Integer.parseInt(pp.num);
										}
										for(int i=0; i<t_Presswerk.size(); i++){
											Problem pp = t_Presswerk.get(i);
								%>
									  <tr>
									  	<td><%=pp.kw %></td>
								<%
											if (i == (t_Presswerk.size()-1)) {
								%>
										<td>&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											} else {
								%>
										<td style="border-bottom: 1px solid; width: 250px;">&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											}
								%>
									    
									    <td style="text-align: right;width: 30px;"><%=pp.num %></td>
								     <%
									  	if (i == 0) {
									 %>
									  	<td rowspan="<%=t_Presswerk.size()%>" style="text-align: right; vertical-align: middle; padding-top:5px; width: 50px;">
									  		<img src="<%=request.getContextPath()%>/app/pep/images/presswerk.jpg" width="10" height="10" />
									  		<span style="font-size: 14px;"><%=sum %></span>
									  	</td>
									 <%
									  	} 
									 %>
								      </tr>
									
								<%
										}
								%>
									<tr><td style="line-height: 0px; border-bottom: 1px solid;" colspan="4">&nbsp;</td></tr>
								<%
									}
								
									if (t_Karosseriebau != null && t_Karosseriebau.size() > 0) {
										int sum = 0;
										for(int i=0; i<t_Karosseriebau.size(); i++){
											Problem pp = t_Karosseriebau.get(i);
											sum += Integer.parseInt(pp.num);
										}
										for(int i=0; i<t_Karosseriebau.size(); i++){
											Problem pp = t_Karosseriebau.get(i);
								%>
									  <tr>
									  	<td><%=pp.kw %></td>
								<%
											if (i == (t_Karosseriebau.size()-1)) {
								%>
										<td>&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											} else {
								%>
										<td style="border-bottom: 1px solid;">&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											}
								%>
									    <td style="text-align: right;"><%=pp.num %></td>
								     <%
									  	if (i == 0) {
									 %>
									  	<td rowspan="<%=t_Karosseriebau.size()%>" style="text-align: right; vertical-align: middle; padding-top:5px; width: 50px;">
										  	<img src="<%=request.getContextPath()%>/app/pep/images/karosseriebau.jpg" width="10" height="10" />
										  	<span style="font-size: 14px;"><%=sum %></span>
									  	</td>
									 <%
									  	} 
									 %>
								      </tr>
									
								<%
										}
								%>
									<tr><td style="line-height: 0px; border-bottom: 1px solid;" colspan="4">&nbsp;</td></tr>
								<%
									}
									
									if (t_Lack != null && t_Lack.size() > 0) {
										int sum = 0;
										for(int i=0; i<t_Lack.size(); i++){
											Problem pp = t_Lack.get(i);
											sum += Integer.parseInt(pp.num);
										}
										for(int i=0; i<t_Lack.size(); i++){
											Problem pp = t_Lack.get(i);
								%>
									  <tr>
									  	<td><%=pp.kw %></td>
								<%
											if (i == (t_Lack.size()-1)) {
								%>
										<td>&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											} else {
								%>
										<td style="border-bottom: 1px solid;">&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											}
								%>
									    <td style="text-align: right;"><%=pp.num %></td>
								     <%
									  	if (i == 0) {
									 %>
									  	<td rowspan="<%=t_Lack.size()%>" style="text-align: right; vertical-align: middle; padding-top:5px; width: 50px;">
									  		<img src="<%=request.getContextPath()%>/app/pep/images/lack.jpg" width="10" height="10" />
									  		<span style="font-size: 14px;"><%=sum %></span>
									  	</td>
									 <%
									  	} 
									 %>
								      </tr>
									
								<%
										}
								%>
									<tr><td style="line-height: 0px; border-bottom: 1px solid;" colspan="4">&nbsp;</td></tr>
								<%
									}
									
									if (t_Montage != null && t_Montage.size() > 0) {
										int sum = 0;
										for(int i=0; i<t_Montage.size(); i++){
											Problem pp = t_Montage.get(i);
											sum += Integer.parseInt(pp.num);
										}
										for(int i=0; i<t_Montage.size(); i++){
											Problem pp = t_Montage.get(i);
								%>
									  <tr>
									  	<td><%=pp.kw %></td>
								<%
											if (i == (t_Montage.size()-1)) {
								%>
										<td>&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											} else {
								%>
										<td style="border-bottom: 1px solid;">&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											}
								%>
									    <td style="text-align: right;"><%=pp.num %></td>
								     <%
									  	if (i == 0) {
									 %>
									  	<td rowspan="<%=t_Montage.size()%>" style="text-align: right; vertical-align: middle; padding-top:5px; width: 50px;">
									  		<img src="<%=request.getContextPath()%>/app/pep/images/montage.jpg" width="10" height="10" />
									  		<span style="font-size: 14px;"><%=sum %></span>
									  	</td>
									 <%
									  	} 
									 %>
								      </tr>
									
								<%
										}
								%>
									<tr><td style="line-height: 0px; border-bottom: 1px solid;" colspan="4">&nbsp;</td></tr>
								<%
									}
									
									if (t_Kaufteile != null && t_Kaufteile.size() > 0) {
										int sum = 0;
										for(int i=0; i<t_Kaufteile.size(); i++){
											Problem pp = t_Kaufteile.get(i);
											sum += Integer.parseInt(pp.num);
										}
										for(int i=0; i<t_Kaufteile.size(); i++){
											Problem pp = t_Kaufteile.get(i);
											
								%>
									  <tr>
									  	<td><%=pp.kw %></td>
								<%
											if (i == (t_Kaufteile.size()-1)) {
								%>
										<td>&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											} else {
								%>
										<td style="border-bottom: 1px solid;">&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											}
								%>
									    <td style="text-align: right;"><%=pp.num %></td>
								     <%
									  	if (i == 0) {
									 %>
									  	<td rowspan="<%=t_Kaufteile.size()%>" style="text-align: right; vertical-align: middle; padding-top:5px; width: 50px;">
										  	<img src="<%=request.getContextPath()%>/app/pep/images/Kaufteile.jpg" width="10" height="10" />
										  	<span style="font-size: 14px;"><%=sum %></span>
									  	</td>
									 <%
									  	} 
									 %>
								      </tr>
									
								<%
										}
								%>
									<tr><td style="line-height: 0px; border-bottom: 1px solid;" colspan="4">&nbsp;</td></tr>
								<%
									}
									
									if (t_Projekt != null && t_Projekt.size() > 0) {
										int sum = 0;
										for(int i=0; i<t_Projekt.size(); i++){
											Problem pp = t_Projekt.get(i);
											sum += Integer.parseInt(pp.num);
										}
										for(int i=0; i<t_Projekt.size(); i++){
											Problem pp = t_Projekt.get(i);
								%>
									  <tr>
									  	<td><%=pp.kw %></td>
								<%
											if (i == (t_Projekt.size()-1)) {
								%>
										<td>&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											} else {
								%>
										<td style="border-bottom: 1px solid;">&nbsp;-&nbsp;<%=pp.desc %></td>
								<%				
											}
								%>
									    <td style="text-align: right;"><%=pp.num %></td>
								     <%
									  	if (i == 0) {
									 %>
									  	<td rowspan="<%=t_Projekt.size()%>" style="text-align: right; vertical-align: middle; padding-top:5px; width: 50px;">
									  		<img src="<%=request.getContextPath()%>/app/pep/images/Projekt.jpg" width="10" height="10" />
									  		<span style="font-size: 14px;"><%=sum %></span>
									  	</td>
									 <%
									  	} 
									 %>
								      </tr>
									
								<%
										}
								%>
									<tr><td style="line-height: 0px; border-bottom: 1px solid;" colspan="4">&nbsp;</td></tr>
								<%
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
