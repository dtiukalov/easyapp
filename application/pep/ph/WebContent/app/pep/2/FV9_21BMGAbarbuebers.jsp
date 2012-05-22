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
			List<String> fv9BMGPrognose = (List)form.get("fv9Prognose");  //预测值
			List<String> fv9BMGSoll = (List)form.get("fv9BMGSoll");  //fv9BMGSoll
			List<String> fv9BMGInArbeirt = (List)form.get("fv9BMGInArbeirt");  //fv9BMGInArbeirt
			List<String> fv9BMGAWE = (List)form.get("fv9BMGAWE");  //fv9BMGAWE
			String fv9DisDate = (String)form.get("fv9DisDate"); //讨论日期
			
			List<String> Gesamt = new ArrayList<String>();
			List<String> categories = new ArrayList<String>();
			StringBuffer BMGType = new StringBuffer();
			StringBuffer BFreiSoll = new StringBuffer();
			StringBuffer BFInArbeirt = new StringBuffer();
			StringBuffer BFAWE = new StringBuffer();
			StringBuffer PrognoseShow = new StringBuffer();
			
			int temptotal = 0;
			
			BMGType.append("[");
			BFreiSoll.append("[");
			BFInArbeirt.append("[");
			BFAWE.append("[");
			PrognoseShow.append("[");
			
			int sum = 0;
			if (Web.getListYesOrNo(fv9BMGTypeNum)) {
				for (int i=0; i<fv9BMGTypeNum.size(); i++){
					sum += Integer.parseInt(fv9BMGTypeNum.get(i));
				}
			
				categories.add("Gesamt");
				BMGType.append("{y:" + sum + ", low:0, color:'#0200FE'},");
				BFreiSoll.append("{y:0, low:0, color:'#0200FE'},");
				BFInArbeirt.append("{y:0, low:0, color:'#F9A700'},");
				BFAWE.append("{y:0, low:0, color:'#FFFFCC'},");
				PrognoseShow.append("null,");
				
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
					BMGType.append("{y:" + y + ", low:" + low + ", color:'" + color + "'},");
					BFreiSoll.append("{y:0, low:0, color:'0200FE'},");
					BFInArbeirt.append("{y:0, low:0, color:'#F9A700'},");
					BFAWE.append("{y:0, low:0, color:'#FFFFCC'},");
					PrognoseShow.append("null,");
				}
				
			}
			if (Web.getObjectYesOrNo(fv9BMGKWNo)) {
				for(int m=0; m<fv9BMGKWNo.size(); m++) {
					categories.add(fv9BMGKWNo.get(m));
					int BFAWENUM = Integer.parseInt(fv9BMGAWE.get(m));
					int BFInArbeirtNUM = Integer.parseInt(fv9BMGInArbeirt.get(m));
					int BFreiSollNUM = Integer.parseInt(fv9BMGSoll.get(m));
				
					temptotal = BFAWENUM+BFInArbeirtNUM+BFreiSollNUM;
					int bmgprognose = 0;
					if (fv9BMGPrognose != null && fv9BMGPrognose.size() > m) 
						bmgprognose = Integer.parseInt(fv9BMGPrognose.get(m));
					
					int BMGPrognoseShowNum = (BFAWENUM+BFInArbeirtNUM+BFreiSollNUM) - bmgprognose;
					
					
					/* 最后一列去掉,	 */			
					if (m == fv9BMGKWNo.size()-1) {
						BMGType.append("{y:0, low:0, color:'#FFFFFF'}");
						BFAWE.append("{y:" + BFAWENUM + ", low:0, color:'#FFFFCC'}");
						BFInArbeirt.append("{y:" + BFInArbeirtNUM + ", low:" + BFAWENUM + ", color:'#F9A700'}");
						BFreiSoll.append("{y:" + BFreiSollNUM + ", low:" + (BFInArbeirtNUM+BFAWENUM) + ", color:'#009C0E'}");
						
						if (bmgprognose == 0) {
							PrognoseShow.append("null");
						} else {
							PrognoseShow.append(BMGPrognoseShowNum);
						}
						
					} else {
						BMGType.append("{y:0, low:0, color:'#FFFFFF'},");
						BFAWE.append("{y:" + BFAWENUM + ", low:0, color:'#FFFFCC'},");
						BFInArbeirt.append("{y:" + BFInArbeirtNUM + ", low:" + BFAWENUM + ", color:'#F9A700'},");
						BFreiSoll.append("{y:" + BFreiSollNUM + ", low:" + (BFInArbeirtNUM+BFAWENUM) + ", color:'#009C0E'},");
						
						if (bmgprognose == 0) {
							PrognoseShow.append("null,");
						} else {
							PrognoseShow.append(BMGPrognoseShowNum +",");
						}
					}
				}
			}
			String cat = Web.getStrListStr(categories);
			BMGType.append("]");
			BFreiSoll.append("]");
			BFInArbeirt.append("]");
			BFAWE.append("]");
			PrognoseShow.append("]");
			
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
							fontSize:'12px',
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
							color:'white'
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
					enabled:false
				},
			    series: [{
					name: 'BMGType',
					data: <%=BMGType%>,
					color: '#009C0E',
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
						verticalAlign: 'top',
						color: 'black',
						y:-10
					}
				},{
					name: 'BMG frei Soll',
					data: <%=BFreiSoll%>,
					color: '#009C0E',
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
					name: 'in Arbeit',
					data: <%=BFInArbeirt%>,
					color: '#F9A700',
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
				}, {
					type: 'line',
					name: 'Prognose',
					data: <%=PrognoseShow%>,
					color: '#0000FF',
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'10px'
						},
						x: -15,
						y: 15,
						color: '#0000FF',
						formatter: function() {
							return (<%=temptotal%> -  this.y) + '';
						}
					}
				}
				<%if(vffNum > 0){%>
				,{
					data: [[<%=temp0-1%> + 0.5, -30], [<%=temp0-1%> + 0.5001, <%=total%>]],
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
					data: [[<%=temp1 - 1%> + 0.5, -30], [<%=temp1 - 1%> + 0.5001, <%=total%>]],
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
					data: [[<%=temp2 - 1%> + 0.5, -30], [<%=temp2 - 1%> + 0.5001, <%=total%>]],
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
					data: [[<%=temp3-1%> + 0.5, -30], [<%=temp3-1%> + 0.5001, <%=total%>]],
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
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LC BMG-Teile von ES Teileliste(<%=fv9DisDate%>)</h5>
		 	<br>
		<style>
			.top-table {
				width: 520px; height: 180px; float: left; margin-left: 260px; overflow: hidden; 
			}
			.top-table table {
				width: 520px; height: 180px; float: left; font-size: 9px; 
			}
			.top-table table tr td {
				border: 1px solid #000000;
			}
			.biaoshi{
				width: 180px; height: 180px; float: left; overflow: hidden; margin: 0px; 
			}
		</style>
 
		<%
		List<String> fv9KWNo = (List<String>)form.get("fv9KWNo"); //周数 
		List<String> fv9ZSB = (List<String>)form.get("fv9ZSB"); //零件范围
		List<String> fv9Teil = (List<String>)form.get("fv9Tei"); //零件名称
		List<String> fv9TeilNum = (List<String>)form.get("fv9TeilNum"); //零件数量
		
		int n = fv9KWNo.size() + 3;
		double tdHeight = 170.0/n;
		
		if (Web.getListYesOrNo(fv9KWNo)) {
			
			int teilSumNum = 0; //总零件数
			String tempKWNo = ""; //临时周数
			String tempZBS = "";  //临时零件范围

			int flag = 0;
			List<HashMap> teilList = new ArrayList<HashMap>();
			//周数与零件范围发生变化的位置索引
			List<Integer> indexArr = new ArrayList<Integer>();
			//合并行的值
			List<Integer> rowSpanArr = new ArrayList<Integer>();
			int count = 0;
			
			for (int i=0; i<fv9KWNo.size(); i++) {
				String kw = (String)fv9KWNo.get(i);
				String zsb = (String)fv9ZSB.get(i);
				String teil = (String)fv9Teil.get(i);
				int teilNum = Integer.parseInt((String)fv9TeilNum.get(i));
				teilSumNum = teilSumNum + teilNum;
		//周数和零件范围均不相同的，需合并单元格		
				if (!kw.equalsIgnoreCase(tempKWNo) ||
						!zsb.equalsIgnoreCase(tempZBS)){
					tempKWNo = kw;
					tempZBS = zsb;
//System.out.println("i = " + i + " tempKWNo = " + tempKWNo + " tempZBS = " + tempZBS);
					indexArr.add(i);
				} 
			}
			
			if (indexArr != null && indexArr.size() > 0) {
				for (int index = 1; index < indexArr.size(); index++) {
					count += indexArr.get(index) - indexArr.get(index-1);
					rowSpanArr.add(indexArr.get(index) - indexArr.get(index-1));
//System.out.println(indexArr.get(index) - indexArr.get(index-1));
				}
			}
			
			if (count < fv9KWNo.size()) {
//System.out.println(fv9KWNo.size() - count);
				rowSpanArr.add(fv9KWNo.size() - count);
			}
			
			if (rowSpanArr != null && rowSpanArr.size() > 0) {
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
			//按合并行循环	
			int tempNo = 0;
			int tempNo2 = 0;
			for (int row_index = 0; row_index < rowSpanArr.size(); row_index++) {
					
					int rowcols = rowSpanArr.get(row_index);
					tempNo += rowcols;
//		System.out.println("row_index = " + row_index + " rowcols = " + rowcols + " tempNo = " + tempNo);
					//每合并的所有零件名称行
						for (int row=0; row<rowcols; row++) {
							
							String tempTeil = fv9Teil.get(tempNo2 + row);
							String tempTeilNum = fv9TeilNum.get(tempNo2 + row);
		System.out.println("No = " + (tempNo2 + row) + " tempTeil = " + tempTeil + " tempTeilNum = " + tempTeilNum);
		%>
						<tr>
		<%
							if (row==0) {
		%>
							<td rowspan="<%=rowcols%>" width="15%" style="text-align: center;">
								<%=fv9KWNo.get(tempNo-1) %>
							</td>
							<td rowspan="<%=rowcols%>" width="25%" style="text-align: center;">
								<%=fv9ZSB.get(tempNo-1) %>
							</td>
		<%
							}
		%>
							<td width="60%" height="<%=tdHeight%>px" style="text-align: center;">
								<%=tempTeil %> X<%=tempTeilNum %>
							</td>
						</tr>
							
		<%
						}
						tempNo2 += rowcols;
		%>

						
						
		<%			
				}
		%>
					</table>
				</div>
		<%
			}
		}
		
		%>	
			<div class="biaoshi">
				<div style="width: 180px; height: 90px; margin: 0px;">&nbsp;</div>
				<table style="width: 130px; margin-left: 50px; ">
					<tr>
						<td style="background-color: #009C0E; width: 15px; height: 15px;"></td>
						<td style="font-size: 14px; height: 15px;">BMG frei Soll</td>
					</tr>
					<tr>
						<td style="background-color: #FFFFCC; width: 15px; height: 15px;"></td>
						<td style="font-size: 14px; height: 15px;">AWE</td>
					</tr>
					<tr>
						<td style="background-color: #F9A700; width: 15px; height: 15px;"></td>
						<td style="font-size: 14px; height: 15px;">in Arbeit</td>
					</tr>
				</table>
			</div>
		
		

			<div id="chart1" style="width: 950px; height: 340px; float: left; margin: 0px;  margin-left: 30px;"></div>
		</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>