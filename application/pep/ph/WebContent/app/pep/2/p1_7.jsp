<%@page import="com.sun.accessibility.internal.resources.accessibility"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.web.Web"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			String status = "08.12.2011";
			List<String> fv9BMGType = (List<String>)form.get("fv9BMGType"); //零件类型
			List<String> fv9BMGTypeNum = (List)form.get("fv9BMGNum");  //认可数量
			List<String> fv9BMGKWNo = (List)form.get("fv9BMGKWNo");  //周数
			List<String> fv9BMGSoll = (List)form.get("fv9BMGSoll");  //fv9BMGSoll
			List<String> fv9BMGInArbeirt = (List)form.get("fv9BMGInArbeirt");  //fv9BMGInArbeirt
			List<String> fv9BMGAWE = (List)form.get("fv9BMGAWE");  //fv9BMGAWE
			String fv9DisDate = (String)form.get("fv9DisDate"); //讨论日期
			
			List<String> Gesamt = new ArrayList<String>();
			List<String> categories = new ArrayList<String>();
			StringBuffer BFreiSoll = new StringBuffer();
			StringBuffer BFInArbeirt = new StringBuffer();
			StringBuffer BFAWE = new StringBuffer();
			BFreiSoll.append("[");
			BFInArbeirt.append("[");
			BFAWE.append("[");
			int sum = 0;
			if (Web.getListYesOrNo(fv9BMGTypeNum)) {
				for (int i=0; i<fv9BMGTypeNum.size(); i++){
					sum += Integer.parseInt(fv9BMGTypeNum.get(i));
				}
			
				categories.add("Gesamt");
				BFreiSoll.append("{y:" + sum + ", low:0, color:'#0200FE'},");
				BFInArbeirt.append("{y:0, low:0, color:'#FFCC00'},");
				BFAWE.append("{y:0, low:0, color:'#FFFFCC'},");
				
				int temp = 0;
				for (int i=0; i<fv9BMGTypeNum.size(); i++){
					int y = Integer.parseInt(fv9BMGTypeNum.get(i));
					temp = temp + y;
					int low = sum - temp;
					categories.add(fv9BMGType.get(i));
					String color = "#0200FE";
					if (i == fv9BMGTypeNum.size()-1) {
						color = "#FF00FE";
					}
					BFreiSoll.append("{y:" + y + ", low:" + low + ", color:'" + color + "'},");
					BFInArbeirt.append("{y:0, low:0, color:'#FFCC00'},");
					BFAWE.append("{y:0, low:0, color:'#FFFFCC'},");
				}
				
			}
			if (Web.getObjectYesOrNo(fv9BMGKWNo)) {
				for(int m=0; m<fv9BMGKWNo.size(); m++) {
					categories.add(fv9BMGKWNo.get(m));
					int BFAWENUM = Integer.parseInt(fv9BMGAWE.get(m));
					int BFInArbeirtNUM = Integer.parseInt(fv9BMGInArbeirt.get(m));
					int BFreiSollNUM = Integer.parseInt(fv9BMGSoll.get(m));
					
					BFAWE.append("{y:" + BFAWENUM + ", low:0, color:'#FFFFCC'},");
					BFInArbeirt.append("{y:" + BFInArbeirtNUM + ", low:" + BFAWENUM + ", color:'#FFCC00'},");
					BFreiSoll.append("{y:" + BFreiSollNUM + ", low:" + (BFInArbeirtNUM+BFAWENUM) + ", color:'#00FF00'},");
					
				}
			}
			String cat = Web.getStrListStr(categories);
			BFreiSoll.append("]");
			BFInArbeirt.append("]");
			BFAWE.append("]");
			
		%>	
	<%
	
			int preNum = 0;
			
			if(Web.getObjectYesOrNo(fv9BMGType)){
				preNum = fv9BMGType.size() + 1;
			}
			int total = sum;
			
			int[] arr = null;
			if(Web.getObjectYesOrNo(form.get("fv9BMGKWNo"))){
			 	arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9BMGKWNo"));
			}
			
			Map<String,Integer> lichengbeiNum = Web.getLCBNum(request, arr);
			
			int vffNum =  lichengbeiNum.get("vffNum");//柱子个数
			int pvsNum = lichengbeiNum.get("pvsNum");//柱子个数
			int osNum =  lichengbeiNum.get("osNum");//柱子个数
			int sopNum =  lichengbeiNum.get("sopNum");//柱子个数
			
			double temp0 = 0;
			int temp1 = 0;
			int temp2 = 0;
			int temp3 = 0;
			
			if(vffNum > 0){
				temp0 = preNum;
			}
			if(pvsNum > 0){
				temp1 = preNum + vffNum;
			}
			if(osNum > 0){
				temp2 = preNum + vffNum + pvsNum ;
			}
			if(sopNum > 0){
				temp3 = preNum + vffNum + pvsNum + osNum ;
			}
%>	

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
					text: ''
				},
				xAxis: {
					lineColor:'black',
					tickPosition:'inside',
					tickColor:'black',
					categories: <%=cat%>,
					labels:{
						rotation: -45,
						enabled:true,
						y:20,
						style:{
							fontSize:'10px',
							color:'black'
						}
					}
				},
				yAxis: {
					min: 0,
					gridLineWidth: 0,
					lineWidth:1,
					lineColor:'black',
					tickWidth:1,
					tickPosition:'inside',
					tickColor:'black',
					title: {
						text: ''
					},
					labels:{
						style:{
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
						borderColor: 'black',
				//		pointWidth:33,
						groupPadding:0.01,
						pointPadding:0.01,
						shadow:false,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							color: 'white',
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
							}
					//		rotation: -90,
					//		x:5
						}
					}
				},
				legend: {
					layout: 'vertical',
					align: 'right',
					verticalAlign: 'middle',
					borderWidth: 1,
					shadow:false,
					enabled:true
				},
			    series: [{
					name: 'BMG frei Soll',
					data: <%=BFreiSoll%>,
					color: '#00FF00',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'10px'
						},
						color: 'white'
					}
				},{
					name: 'in arbeit',
					data: <%=BFInArbeirt%>,
					color: '#FFCC00',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'10px'
						},
						color: 'black'
					}
				}, {
					name: 'AWE',
					data: <%=BFAWE%>,
					color: '#FFFFCC',
					type: 'column',
					dashStyle: 'dash',
					marker: {enabled: false},
					lineWidth: 1,
					shadow: false,
					enableMouseTracking: false,
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'10px'
						},
						color: 'black'
					}
				}
				<%if(vffNum > 0){%>
				,{
					data: [[<%=temp0-1%> + 0.5, 0], [<%=temp0-1%> + 0.5001, <%=total%>]],
		//			color: 'black',
					dashStyle: 'dash',
					lineWidth: 2,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"VFF",
					dataLabels: {
						enabled: true,
						formatter: function() {
							return "<B>VFF</B>";
						}
					}
				}
<%}%><%if(pvsNum > 0){%>
				,{
					data: [[<%=temp1 - 1%> + 0.5, 0], [<%=temp1 - 1%> + 0.5001, <%=total%>]],
		//			color: 'black',
					dashStyle: 'dash',
					lineWidth: 2,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"PVS",
					dataLabels: {
						enabled: true,
						formatter: function() {
							return "<B>PVS</B>";
						}
					}
				}
<%}%><%if(osNum > 0){%>
				, {
					data: [[<%=temp2 - 1%> + 0.5, 0], [<%=temp2 - 1%> + 0.5001, <%=total%>]],
		//			color: 'black',
					dashStyle: 'dash',
					lineWidth: 2,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"0-S",
					dataLabels: {
						enabled: true,
						formatter: function() {
							return "<B>0-S</B>";
						}
					}
				}
<%}%><%if(sopNum > 0){%>
				, {
					data: [[<%=temp3-1%> + 0.5, 0], [<%=temp3-1%> + 0.5001, <%=total%>]],
		//			color: 'black',
					dashStyle: 'dash',
					lineWidth: 2,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"SOP",
					dataLabels: {
						enabled: true,
						formatter: function() {
							return "<B>SOP</B>";
						}
					}
				}
<%}%>		
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
			<br>
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LC P-Freigaben-Teile von ES Teileliste(<%=fv9DisDate%>)</h5>
		 	<br>
		<style>
			.top-table {
				width: 940px; height: 180px; float: left; margin: 0px 0px auto; overflow: hidden;
			}
			.top-table table {
				width: 520px; height: 180px; float: left; margin-left: 210px; overflow: hidden;
				font-size: 9px;
			}
			.top-table table tr td {
				border: 1px solid #000000;
			}
			
		</style>
		<%
		List<String> fv9KWNo = (List<String>)form.get("fv9KWNo"); //周数 
		List<String> fv9ZSB = (List<String>)form.get("fv9ZSB"); //零件范围
		List<String> fv9Teil = (List<String>)form.get("fv9Tei"); //零件名称
		List<String> fv9TeilNum = (List<String>)form.get("fv9TeilNum"); //零件数量
		if (Web.getListYesOrNo(fv9KWNo)) {
			int n = fv9KWNo.size() + 3;
			double tdHeight = (180*1.0)/(n*1.0);
			int teilSumNum = 0; //总零件数
			String tempKWNo = ""; //临时周数
			String tempZBS = "";  //临时零件范围

			int flag = 0;
			List<HashMap> teilList = new ArrayList<HashMap>();
			List<Integer> indexArr = new ArrayList();
			for (int i=0; i<fv9KWNo.size(); i++) {
				String kw = (String)fv9KWNo.get(i);
				String zsb = (String)fv9ZSB.get(i);
				String teil = (String)fv9Teil.get(i);
				int teilNum = Integer.parseInt((String)fv9TeilNum.get(i));
				teilSumNum = teilSumNum + teilNum;
				
				if (!kw.equalsIgnoreCase(tempKWNo) ||
						!zsb.equalsIgnoreCase(tempZBS)){
					tempKWNo = kw;
					tempZBS = zsb;

					indexArr.add(i);
				} 
			}

		%>
			<div class="top-table">
				<table cellspacing="0">
					<tr>
						<td colspan="3" style="text-align: center;" height="<%=tdHeight%>px"><%=teilSumNum %> Teile Nach OS frei</td>
					</tr>
					<tr>
						<td width="15%" height="<%=tdHeight%>px" style="text-align: center;">Zeil</td>
						<td width="25%" height="<%=tdHeight%>px" style="text-align: center;">ZSB</td>
						<td width="60%" height="<%=tdHeight%>px" style="text-align: center;">Teile</td>
					</tr>
		<%
			if (indexArr != null && indexArr.size() > 0) {
				
			
			for (int m = 0; m < indexArr.size()-1; m++) {
				for (int t=m; t<indexArr.get(m+1); t++) {
					int rowscol = indexArr.get(m+1) - indexArr.get(m);
		%>
					<tr>
		<%
					if (t == m) {
		%>
						<td rowspan="<%=rowscol%>" style="text-align: center;"><%=fv9KWNo.get(t) %></td>
						<td rowspan="<%=rowscol%>" style="text-align: center;"><%=fv9ZSB.get(t) %></td>
		<%	
					}
		%>
						<td height="<%=tdHeight%>px" style="padding-left: 2px;"><%=fv9Teil.get(t) %> X<%=fv9TeilNum.get(t) %></td>
					</tr>
		<%			
				}
			}
			for (int p = indexArr.get(indexArr.size()-1); p<fv9KWNo.size(); p++) {
					int rowscol = fv9KWNo.size() - indexArr.get(indexArr.size()-1);
		%>
					<tr>
		<%
					if (p == indexArr.get(indexArr.size()-1)) {
		%>
						<td rowspan="<%=rowscol%>" style="text-align: center;"><%=fv9KWNo.get(p) %></td>
						<td rowspan="<%=rowscol%>" style="text-align: center;"><%=fv9ZSB.get(p) %></td>
		<%	
					}
		%>
						<td height="<%=tdHeight%>px" style="padding-left: 2px;"><%=fv9Teil.get(p) %> X<%=fv9TeilNum.get(p) %></td>
					</tr>
		<%			
			}
			}
		%>
				</table>
			</div>
		
		<%
		}
		
		%>

			<div id="chart1" style="width: 950px; height: 340px; float: left; margin: 0px;  margin-left: 30px;"></div>
		</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>