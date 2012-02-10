<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%
	Map form = (Map)request.getAttribute("form");

	Integer[] fv9KWNoarr = new Integer[]          {39,40,42,43,44,45,46,47,48,49,52,54};//"['40', '42', '43', '44', '45', '46', '47', '48', '49']";
	Integer[] fv9AekoAbgescharr = new Integer[]   {1, 5,  5, 7,10,15,16,16,17,18,18,9};//"[5,5,7,10,15,16,16,17,18,18]";//已关闭的AEKO
	Integer[] fv9AekoSmall2Wocharr = new Integer[]{1, 1,  2, 2, 1, 1, 0, 5, 3, 3, 4,8};//"[1,2,2,1,1,0,5,3,3,4]";//(< 2 Wochen)在计划中的AEKO(短于2周)
	Integer[] fv9AekoBig2Wocharr = new Integer[]  {1, 1,  1, 1, 0, 0, 0, 0, 2, 1, 1,7};//"[1,1,1,0,0,0,0,2,1,0]";//> 2 Wochen	
	
	Integer[] fv9KWNo= new Integer[fv9KWNoarr.length-1];
	Integer[] fv9AekoAbgesch= new Integer[fv9KWNoarr.length-1];
	Integer[] fv9AekoSmall2Woch= new Integer[fv9KWNoarr.length-1];
	Integer[] fv9AekoBig2Woch= new Integer[fv9KWNoarr.length-1];
	Integer[] labelvalue= new Integer[fv9KWNoarr.length-1];
	
	StringBuffer KWNo = new StringBuffer();
	StringBuffer AekoAbgesch = new StringBuffer();//已关闭的AEKO
	StringBuffer AekoSmall2Woch = new StringBuffer();//(< 2 Wochen)在计划中的AEKO(短于2周)
	StringBuffer AekoBig2Woch = new StringBuffer();//> 2 Wochen
	StringBuffer value =  new StringBuffer();
	
	KWNo.append("[");
	AekoAbgesch.append("[");
	AekoSmall2Woch.append("[");
	AekoBig2Woch.append("[");
	value.append("[");
	
	for(int i=0; i<fv9KWNoarr.length; i++){
		if(i == 0){
			labelvalue[i] = (fv9AekoAbgescharr[i+1] + fv9AekoSmall2Wocharr[i+1] + fv9AekoBig2Wocharr[i+1]) - 
							(fv9AekoAbgescharr[i] + fv9AekoSmall2Wocharr[i] + fv9AekoBig2Wocharr[i]);
			value.append(labelvalue[i]+ ",");
		} else if(i == fv9KWNoarr.length-1){
			fv9KWNo[i-1] = fv9KWNoarr[i];
			fv9AekoAbgesch[i-1] = fv9AekoAbgescharr[i];
			fv9AekoSmall2Woch[i-1] = fv9AekoSmall2Wocharr[i];
			fv9AekoBig2Woch[i-1] = fv9AekoBig2Wocharr[i];
			labelvalue[i-1] = fv9AekoAbgescharr[i] + fv9AekoSmall2Wocharr[i] + fv9AekoBig2Wocharr[i] - 
			fv9AekoAbgescharr[i-1] + fv9AekoSmall2Wocharr[i-1] + fv9AekoBig2Wocharr[i-1];
			
			KWNo.append(fv9KWNo[i-1] + ",");
			AekoAbgesch.append(fv9AekoAbgesch[i-1]+ ",");
			AekoSmall2Woch.append(fv9AekoSmall2Woch[i-1]+ ",");
			AekoBig2Woch.append(fv9AekoBig2Woch[i-1]+ ",");
			value.append(labelvalue[i-1]+ ","); 
		} else {
			fv9KWNo[i-1] = fv9KWNoarr[i];
			fv9AekoAbgesch[i-1] = fv9AekoAbgescharr[i];
			fv9AekoSmall2Woch[i-1] = fv9AekoSmall2Wocharr[i];
			fv9AekoBig2Woch[i-1] = fv9AekoBig2Wocharr[i];
			labelvalue[i] = (fv9AekoAbgescharr[i+1] + fv9AekoSmall2Wocharr[i+1] + fv9AekoBig2Wocharr[i+1]) - 
			(fv9AekoAbgescharr[i] + fv9AekoSmall2Wocharr[i] + fv9AekoBig2Wocharr[i]);
			
			KWNo.append(fv9KWNo[i-1] + ",");
			AekoAbgesch.append(fv9AekoAbgesch[i-1]+ ",");
			AekoSmall2Woch.append(fv9AekoSmall2Woch[i-1]+ ",");
			AekoBig2Woch.append(fv9AekoBig2Woch[i-1]+ ",");
			value.append(labelvalue[i]+ ",");
		}
	}
	
	KWNo.append("]");
	AekoAbgesch.append("]");
	AekoSmall2Woch.append("]");
	AekoBig2Woch.append("]");
	value.append("]");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts2.1.9/highcharts.src2.1.4.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css"></link>
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<title>Insert title here</title>

		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart',
						defaultSeriesType: 'column'
					},
					title: {
						text: 'Anzahl Änderungen'
					},
					xAxis: [{
						categories: <%=KWNo.toString()%>
						
					},{ // mirror axis on right side
						opposite: false,
						reversed: false,
						categories: <%=value%>,
						linkedTo: 0,
						title: {
							text: '2011 Anzahl neuer ÄKOs'
						}
					}],
					yAxis: {
						min: 0,
						title: {
							text: ' '
						},
						stackLabels: {
							enabled: true,
							style: {
								fontWeight: 'bold',
								color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
							}
						}
					},
					legend: {
						enabled: true,
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 100,
						backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
						borderWidth: 1,
						borderColor: '#CCC',
						shadow: false
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
							dataLabels: {
								enabled: true,
								color:  '#333333'
							}
						}
					},
				    series: [
				     {
						name: 'ÄKO,AeA  im Durchlauf (> 2 Wochen)',
						data: <%=AekoBig2Woch.toString()%>,
						color: '#E63110'
					}, {
						name: 'ÄKO,AeA im Durchlauf (< 2 Wochen)',
						data: <%=AekoSmall2Woch.toString()%>,
						color: '#F9A700'
					},{
						name: 'ÄKO,AeA Vorschau',
						data: [],
						color: 'white'
					},{
						name: 'ÄKO,AeA abgeschlossen',
						data: <%=AekoAbgesch.toString()%>,
						color: '#009C0E'
					},{
						name: 'Prognosen',
						data: [],
						color: '#99FF99'
					}]
				});
		});
		</script>
</head>
<body>		
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.4 Status ÄKO </h1></div>
			<div id="chart" style="width: 800px; height: 400px; margin: 0 auto;"></div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
</body>
</html>