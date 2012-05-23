<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.tc.utils.DateUtils"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			String FuntionsmasseUID = (String)session.getAttribute("FuntionsmasseUID");
			System.out.println("FuntionsmasseUID = " + FuntionsmasseUID);
			int gesamt = 0;
			if (!"".equals(FuntionsmasseUID) && FuntionsmasseUID != null) {
				Map<String, Object> Funtionsmasse = FormManager.getFormValue("FV9_34FuntNachBaut", FuntionsmasseUID, true);
				List<String> aK = (List<String>)Funtionsmasse.get("fv9FunctionAK");
				List<String> bK = (List<String>)Funtionsmasse.get("fv9FunctionBK");
				List<String> iO = (List<String>)Funtionsmasse.get("fv9FunctionIO");
				
				if (aK != null && aK.size() > 0) {
					for(int i=0; i<aK.size(); i++) {
						gesamt += Integer.parseInt(aK.get(i));
						gesamt += Integer.parseInt(bK.get(i));
						gesamt += Integer.parseInt(iO.get(i));
					}
				}
			
			}
			System.out.println("gesamt = " + gesamt);
			
			double sum1 = 0;
			List<String> kwno = null;
			if(Web.getObjectYesOrNo(form.get("fv9KWNo"))){
				kwno = (List<String>)form.get("fv9KWNo");
				
				if (Web.getObjectYesOrNo(form.get("fv9PrognoseKW"))) {
					kwno.add("Prognose zu Meilenstein SOP KW " + form.get("fv9PrognoseKW"));
				} else {
					kwno.add("Prognose zu Meilenstein SOP KW XXX");
				}
			}
			String fv9KWNo = Web.getStrListStr(kwno);
			
			List<String> funktionSmall75 = null;
			if(Web.getObjectYesOrNo(form.get("fv9FunktionSmall75"))){
				String fv9PrognoseAK = "0";
				funktionSmall75 = (List<String>)form.get("fv9FunktionSmall75");
				if(form.get("fv9PrognoseAK")!= null && !"".equals(form.get("fv9PrognoseAK")) ){
					fv9PrognoseAK = (String)form.get("fv9PrognoseAK");
				}
				funktionSmall75.add(fv9PrognoseAK);
				sum1 = sum1 + Double.parseDouble(fv9PrognoseAK);
			}	
			String fv9FunktionSmall75 = Web.getNumberListStr(funktionSmall75);  //AK
			
			
			List<String> funktionSmall100 = null;
			if(Web.getObjectYesOrNo(form.get("fv9FunktionSmall100"))){
				String fv9PrognoseBK = "0";
				funktionSmall100 = (List<String>)form.get("fv9FunktionSmall100");
				if(form.get("fv9PrognoseBK")!= null && !"".equals(form.get("fv9PrognoseBK")) ){
					fv9PrognoseBK = (String)form.get("fv9PrognoseBK");
				}
				funktionSmall100.add(fv9PrognoseBK);
				sum1 = sum1 + Double.parseDouble(fv9PrognoseBK);
			}
			String fv9FunktionSmall100 = Web.getNumberListStr(funktionSmall100);	//BK
			
			
			List<String> funktionBig100 = null;
			if(Web.getObjectYesOrNo(form.get("fv9FunktionBig100"))){
				String fv9PrognoseIO = "0";
				funktionBig100 = (List<String>)form.get("fv9FunktionBig100");
				if(form.get("fv9PrognoseIO")!= null && !"".equals(form.get("fv9PrognoseIO")) ){
					fv9PrognoseIO = (String)form.get("fv9PrognoseIO");
				}
				funktionBig100.add(fv9PrognoseIO);
				sum1 = sum1 + Double.parseDouble(fv9PrognoseIO);
			}
			String fv9FunktionBig100 = Web.getNumberListStr(funktionBig100);	//i.O
			
			String fv9Zielwert = Web.getNumberListStr(form.get("fv9Zielwert")); //目标
			
			if (!"[]".equals(fv9Zielwert)) {
				fv9Zielwert = fv9Zielwert.replaceAll("]", "");
				String lastZiel = ((List<String>)form.get("fv9Zielwert")).get(((List)form.get("fv9Zielwert")).size()-1);
				fv9Zielwert += ", " + lastZiel + "]";
			}
			
		%>
		<%
		double total = sum1 + 10;
		int vffqianNum = 0;
		int vffNum =  0;
		int pvsNum = 0;
		int osNum = 0;
		int sopNum = 0;	
		
		Map<String,Integer> lichenbeiNum = null;	
		int[] arr = null;
		
		if (Web.getListYesOrNo(kwno)) {
			kwno.remove(kwno.size()-1);
			
			if(Web.getObjectYesOrNo(form.get("fv9PrognoseKW"))){
				kwno.add((String)form.get("fv9PrognoseKW"));
			}
			
			arr = Web.getIntArrByStringlist(kwno);
			
			lichenbeiNum = Web.getLCBNum(request, arr);
			vffqianNum = lichenbeiNum.get("vffqianNum"); //VFF前柱子个数
			vffNum =  lichenbeiNum.get("vffNum");//VFF柱子个数
			pvsNum = lichenbeiNum.get("pvsNum");//PVS柱子个数
			osNum = lichenbeiNum.get("osNum");//0S柱子个数
			sopNum = lichenbeiNum.get("sopNum");//SOP柱子个数
			
			System.out.println("vffqianNum = " + vffqianNum + " vffNum = " + vffNum + " pvsNum = " + pvsNum + " osNum = " + osNum + " sopNum = " + sopNum );
		}
		
		double temp0 = 0;
		int temp1 = 0;
		int temp2 = 0;
		int temp3 = 0;
		
		if(vffNum > 0){
			temp0 = 0.5;
		}
		if(pvsNum > 0){
			temp1 = vffNum;
		}
		if(osNum > 0){
			temp2 = vffNum + pvsNum ;
		}
		if(sopNum > 0){
			temp3 = vffNum + pvsNum + osNum ;
		}
		
		%>
		<script type="text/javascript">
		var chart1;
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column',
					marginTop:120
				},
				title: {
					text: 'In Prozent',
					style:{
						color:'black',
						fontSize:'16px'
					},
					align:'left'
				},
				subtitle: {
					text: 'Gesamt: <%=gesamt%> Funktionsmasse',
					style:{
						color:'black',
						fontSize:'10px'
					},
					align:'left'
				}, 
				xAxis: {
					min:0,
					lineWidth:1,
					tickLength: 0,
					lineColor:'black',
					title: {
						text: ' '
					},
					labels: {
				//		rotation: -45,
				//		align: 'right',
						y:20,
						style: {
							 padding:'5px',
							 fontSize: '12px',
							 color:'black'
						}
					},
					categories: <%=fv9KWNo%>
				},
				yAxis: {
					min: 0,
					max: 100,
					lineWidth:1,
					lineColor:'black',
					showLastLabel: true,
					gridLineWidth: 0,
					labels:{
						style:{
							color:'black',
							fontSize:'12px'
						}
					},
					title: {
						text: '',
						style: {
							 padding:'5px',
							 font: 'normal 14px Arial, sans-serif',
							 fontWeight: 'bold'
						}
					}
				},
				legend:{
					borderWidth:0,
					layout: 'vertical',
					align: 'center',
					verticalAlign: 'top',
					x: 200,
					y: 0,
					width: 270
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
						borderColor: 'black',
						groupPadding:0.06,
						pointPadding:0.06,
						borderWidth: 1,
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
			    series: [{
					name: 'AK: Abweichung Toleranz > 100 %',
					color: '#E63110',
					data:  <%=fv9FunktionSmall75%>,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					}
				}, {
					name: 'BK: 75% < Abweichung Toleranz < 100 %',
					color: '#F9A700',
					data:  <%=fv9FunktionSmall100%>
				}, {
					name: 'i.O.: Abweichung Toleranz < 75 %',
					color: '#009C0E',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						color: 'white'
					},
					data:  <%=fv9FunktionBig100%>
				}, {
					type: 'line',
					name: 'Zielwert',
					color: '#E63110',
					data: <%=fv9Zielwert%>,
					marker: {
						enabled: false,
						states: {
							hover: {
								enabled: true,
								symbol: 'circle',
								radius: 5,
								lineWidth: 1
							}
						}
					}
				}
				<%
				if (vffNum != 0) {
					double vff_begin = -0.5 + vffqianNum;
				%>
				,{
					data: [[<%=vff_begin%>, 0], [<%=vff_begin%>, 100]],
					color: 'black',
					dashStyle: 'dash',
					lineWidth: 1,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"",
					dataLabels: {
						enabled: false,
						formatter: function() {
							return "<span style='font-size:18px; font-weight: bolder;'>VFF</span>";
						}
					}
				}
				<%
				}

				if (pvsNum != 0) {
					double pvs_begin = -0.5 + vffqianNum + vffNum;
				%>
				,{
					data: [[<%=pvs_begin%>, 0], [<%=pvs_begin%>, 100]],
					color: 'black',
					dashStyle: 'dash',
					lineWidth: 1,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"",
					dataLabels: {
						enabled: false,
						formatter: function() {
							return "<span style='font-size:18px; font-weight: bolder;'>PVS</span>";
						}
					}
				}
				<%
				}
				
				if (osNum != 0) {
					double os_begin = -0.5 + vffqianNum + vffNum + pvsNum;
				%>
				,{
					data: [[<%=os_begin%>, 0], [<%=os_begin%>, 100]],
					color: 'black',
					dashStyle: 'dash',
					lineWidth: 1,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"",
					dataLabels: {
						enabled: false,
						formatter: function() {
							return "<span style='font-size:18px; font-weight: bolder;'>0S</span>";
						}
					}
				}
				<%
				}

				if (sopNum != 0) {
					double sop_begin = -0.5 + vffqianNum + vffNum + pvsNum + osNum;
				%>
				,{
					data: [[<%=sop_begin%>, 0], [<%=sop_begin%>, 100]],
					color: 'black',
					dashStyle: 'dash',
					lineWidth: 1,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"",
					dataLabels: {
						enabled: false,
						formatter: function() {
							return "<span style='font-size:18px; font-weight: bolder;'>SOP</span>";
						}
					}
				}
				<%
				}
				%>

				]
			}, function(chart) { 
				chart.renderer.text(
		                '<span style="font-size:12px;">KW</span>', 
		               	20, 
		                375
		            ).attr({
		                zIndex: 6
		            }).add();
			});
		})
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
				
				<div id="chart" style="width: 1000px; height: 450px; margin: 5px auto; float: left; margin-top: 30px;"></div>
			<%
			if (lichenbeiNum != null && arr != null) {
				double totalWidth = 950.0;
				Map<String,Integer> tt = lichenbeiNum;
				
			/* 	lichenbeiNum.put("vffqianNum",0);//柱子个数
				lichenbeiNum.put("vffNum",1);//柱子个数
				lichenbeiNum.put("pvsNum",1);//柱子个数
				lichenbeiNum.put("osNum",1);//柱子个数
				lichenbeiNum.put("sopNum",1);//柱子个数 */
				
				Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(tt, arr, totalWidth);
				//totalWidth = totalWidth - lichenbeiPillarNum.get("pillar");
				
				double value0 = lichenbeiPillarNum.get("vffqianPillar"); 
				double value1 = lichenbeiPillarNum.get("vffPillar"); 
				double value2 = lichenbeiPillarNum.get("pvsPillar");
				double value3 = lichenbeiPillarNum.get("osPillar");
				double value4 = lichenbeiPillarNum.get("sopPillar");
				double sum = value0 + value1 + value2 + value3 + value4;
				
				%>
				<div id="meilsteinouter" style="width: 1000px;">
					<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 40px; text-align: center; overflow: hidden; ">
						<div style=" width: <%=value0 %>px; height: 30px; float: left; background-color: white; vertical-align: bottom; padding-top: 5px;"><span style="color: white;"></span></div>
						<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
						<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
						<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
						<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
					</div>
				</div>
				<%
				}
				%>	
				<div id="legent" style="width: 130px; height: 100px; 
				position: absolute; margin-left: 300px; margin-top: -500px; padding-left: 60px;
				font-size: 12px;">
					Konzernziele<br>
					(max. rot)<br>
					VFF	30 %<br>
					PVS	15 %<br>
					0&nbsp;-&nbsp;S	10 %<br>
					SOP	5 %
				</div>
			</div>
			
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
