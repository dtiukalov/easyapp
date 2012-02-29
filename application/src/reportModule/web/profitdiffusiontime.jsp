<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>

<style>
.dataDiv tr td{vertical-align: middle;}
.zongji{width:100px; line-height: 18px; text-align: center;}
.popname{width:70px; line-height: 18px; text-align: center;}
</style>
<script type="text/javascript">
function doSelect(){
	var value = document.getElementById("statisticdate").value;
	//var value = $('#statisticdate :input').val();
	if(value==''||value ==null){
		$('#sub').attr("disabled","disabled");
	}else{
		$('#sub').removeAttr("disabled");
	}
}
function findExcel(){
			$('#crmform')[0].action = "${pageContext.request.contextPath}/crm::/reportModule/action/ProfitdiffusionTimeExcel.action";
			$('#crmform')[0].submit();
		}	
</script>
<%
	class FlowStatic {
		public String type;

		public int[] dayNumStatic = new int[5]; //CIVIC, CR-V, SPIRIOR, 其他, 总计
		public int[] monthNumStatic = new int[5]; //CIVIC, CR-V, SPIRIOR, 其他, 总计
		public int[] monthAreaStatic = new int[14]; //长春、松原、通化、四平、白城、辽源、吉林、白山、延吉、内蒙、辽宁、黑龙江、其他,非长春总计
		
		public FlowStatic(String type) {
			this.type = type;
		}
		
		public void add(Map vo, String currentDay) {
			String level = (String)vo.get("carCardLevel");
			String series = (String)vo.get("carSeries");
			String servInTime = (String)vo.get("servInTime");
			String servType = (String)vo.get("servType");
			String carArea = (String)vo.get("carArea");
			
			if (servInTime.startsWith(currentDay)) {//日统计
				if (series != null && series.length() == 6) {
					int index = series.charAt(5) - '6';
					if (index >= 0 && index <= 2) {
						dayNumStatic[index]++;
					} else {
						dayNumStatic[3]++;
					}
					
					dayNumStatic[4]++;
				}
			}
			//月统计
			if (series != null && series.length() == 6) {
				int index = series.charAt(5) - '6';
				if (index >= 0 && index <= 2) {
					monthNumStatic[index]++;
				} else {
					monthNumStatic[3]++;
				}
				
				monthNumStatic[4]++;
			}
			
			if (carArea != null) {
				if("111001".equals(carArea)) { monthAreaStatic[0]++;} else
				if("111013".equals(carArea)) { monthAreaStatic[1]++;} else
				if("111009".equals(carArea)) { monthAreaStatic[2]++;} else
				if("111007".equals(carArea)) { monthAreaStatic[3]++;} else
				if("111011".equals(carArea)) { monthAreaStatic[4]++;} else
				if("111008".equals(carArea)) { monthAreaStatic[5]++;} else
				if("111006".equals(carArea)) { monthAreaStatic[6]++;} else
				if("111010".equals(carArea)) { monthAreaStatic[7]++;} else
				if("111012".equals(carArea)) { monthAreaStatic[8]++;} else
				if("111014".equals(carArea)) { monthAreaStatic[9]++;} else
				if("111015".equals(carArea)) { monthAreaStatic[10]++;} else
				if("111016".equals(carArea)) { monthAreaStatic[11]++;} else {
					monthAreaStatic[12]++;
				}
				
				if (!"111001".equals(carArea)) {
					monthAreaStatic[13]++;
				}
			}
		}
		
		public int getDaySum(int type) {
			int sum = 0;
			for (int i = 0; i < dayNumStatic.length; ++i) {
				sum += dayNumStatic[i];
			}
			
			return sum;
		}
		
		public int getMonthSum(int type) {
			int sum = 0;
			for (int i = 0; i < monthNumStatic.length; ++i) {
				sum += monthNumStatic[i];
			}
			
			return sum;
		}
		
		public String toTdStr() {
			StringBuffer buffer = new StringBuffer();
			
			buffer.append("<td>" + this.dayNumStatic[4]+ "</td>");
			buffer.append("<td>" + this.monthNumStatic[4]+ "</td>");
			
			for (int j = 0; j < 4; ++j) {
				buffer.append("<td>" + this.dayNumStatic[j]+ "</td>");
				buffer.append("<td>" + this.monthNumStatic[j]+ "</td>");
			}
			
			for (int j = 0; j < 13; ++j) {
				buffer.append("<td style=\"background-color:#e3f2fb;\">" + this.monthAreaStatic[j]+ "</td>");
			}
			
			buffer.append("<td style=\"background-color:#e3f2fb;\">" + this.monthAreaStatic[0]+ "</td>");
			buffer.append("<td style=\"background-color:#e3f2fb;\">" + this.monthAreaStatic[13]+ "</td>");
			return buffer.toString();
		}
 	}
	
	FlowStatic sum = new FlowStatic("总计");

	Map sourceMap = new HashMap();
	sourceMap.put("103001", new FlowStatic("103001"));//自店
	sourceMap.put("103002", new FlowStatic("103002"));//它店
	
	Map areaMap = new HashMap();
	areaMap.put("<8", new FlowStatic( "8点之前"));
	areaMap.put("08", new FlowStatic( "8-9点"));
	areaMap.put("09", new FlowStatic( "9-10点"));
	areaMap.put("10", new FlowStatic( "10-11点"));
	areaMap.put("11", new FlowStatic( "11-12点"));
	areaMap.put("12", new FlowStatic( "12-13点"));
	areaMap.put("13", new FlowStatic( "13-14点"));
	areaMap.put("14", new FlowStatic( "14-15点"));
	areaMap.put("15", new FlowStatic( "15-16点"));
	areaMap.put("16", new FlowStatic( "16-17点"));
	areaMap.put(">17", new FlowStatic( "17点之后"));
	
	List result = (List)request.getAttribute("result_time");
	List filter = new ArrayList();
	String statisticdate = (String)request.getAttribute("statisticdate");
	
	if (result != null) {
		String currentVin = null;
		String currentTime = null;
		for (int i = 0; i < result.size(); ++i) {
			Map vo = (Map) result.get(i);
			String carVin = (String)vo.get("carVin");
			String servInTime = ((String)vo.get("servInTime")).substring(0, 10);//2010-11-11
			
			if (currentVin == null || !currentVin.equals(carVin)) {
				filter.add(vo);
				currentTime = servInTime;
				currentVin = carVin;
			} 
		}
		
		for (int i = 0; i < filter.size(); ++i) {
			Map vo = (Map) filter.get(i);
			
			String servInTime = ((String)vo.get("servInTime")).substring(11, 13);
			sum.add(vo, statisticdate);
			
			FlowStatic areaStatic = (FlowStatic)areaMap.get(servInTime);
			if (areaStatic != null) {
				areaStatic.add(vo, statisticdate);
			} else {
				if (servInTime.compareTo("08") <= 0) {
					((FlowStatic)areaMap.get("<8")).add(vo, statisticdate);
				} else if (servInTime.compareTo("17") >= 0) {
					((FlowStatic)areaMap.get(">17")).add(vo, statisticdate);
				}
			}
		}
	}
	
	List areaList = new ArrayList();
	areaList.add(areaMap.get("<8"));
	areaList.add(areaMap.get("08"));
	areaList.add(areaMap.get("09"));
	areaList.add(areaMap.get("10"));
	areaList.add(areaMap.get("11"));
	areaList.add(areaMap.get("12"));
	areaList.add(areaMap.get("13"));
	areaList.add(areaMap.get("14"));
	areaList.add(areaMap.get("15"));
	areaList.add(areaMap.get("16"));
	areaList.add(areaMap.get(">17"));
%>
<title>售后效益统计--时间分布</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/ProfitdiffusionTime.action">
		<fieldset>
		  <legend>售后效益统计--时间分布</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">统计日期:</td>
                     <td class="detailColVal" colspan="10">
                     	<input type="text" value="${statisticdate}" name="statisticdate" id="statisticdate" onchange="javascript:doSelect(this);" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                   </tr>
                   <tr>
                      <td colspan="8" style="text-align:center;">
						<input id="sub" type="submit" value="查询"  disabled="disabled"/>
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
	<c:if test="${empty result_time}">
		<table>
			<tr><td colspan="30">
				<div class="clb-nodata">
					没有符合条件的数据！
				</div>	
				</td>
			</tr>
		</table>	
	</c:if>
	<%
		List<Map<String, Object>> result_time = (List)request.getAttribute("result_time");
		if (result_time != null){
	%>
    <table class="optDiv"  style=''>
		<tr>
			<td><label class="rsTitle" style=''>${statisticdate}售后台前业务分析</label></td>
			<td><div id="paginate"><a href="javascript:findExcel();">导出</a></div></td>
		</tr>
	</table>

    <div class="tbDiv">
		<div style="border: none;">
			<div style="float: left;">
			<table style="">
				<tr>
					<td rowspan="14" colspan="1"  style="width: 40px">时间分布</td>
					<td rowspan="2" style="width: 80px"></td>
					<td rowspan="1" colspan="2" style="width: 80px">小计</td>
					<td rowspan="1" colspan="2" style="width: 80px">CIVIC</td>
					<td rowspan="1" colspan="2" style="width: 80px">CRV</td>
					<td rowspan="1" colspan="2" style="width: 80px">SPIRIOR</td>
					<td rowspan="1" colspan="2" style="width: 80px">其他</td>
					<td rowspan="1" colspan="13" style="width: 480px;background-color:#e3f2fb;">地区分布（累计）</td>
					<td rowspan="1" colspan="2" style="width: 80px;background-color:#e3f2fb;">总计</td>
				</tr>
				<tr>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					<td>当日</td>
					<td>累计</td>
					
					
					<td style="background-color:#e3f2fb;">长春</td>
					<td style="background-color:#e3f2fb;">松原</td>
					<td style="background-color:#e3f2fb;">通化</td>
					<td style="background-color:#e3f2fb;">四平</td>
					<td style="background-color:#e3f2fb;">白城</td>
					<td style="background-color:#e3f2fb;">辽源</td>
					<td style="background-color:#e3f2fb;">吉林</td>
					<td style="background-color:#e3f2fb;">白山</td>
					<td style="background-color:#e3f2fb;">延吉</td>
					<td style="background-color:#e3f2fb;">内蒙</td>
					<td style="background-color:#e3f2fb;">辽宁</td>
					<td style="background-color:#e3f2fb;">黑龙江</td>
					<td style="background-color:#e3f2fb;">其他</td>
					<td style="background-color:#e3f2fb;">长春</td>
					<td style="background-color:#e3f2fb;">其他</td>
				</tr>
				<%
					for (int i = 0; i < areaList.size(); ++i) {
						out.println("<tr>");
						FlowStatic sub = (FlowStatic)areaList.get(i);
						out.println("<td>" + sub.type + "</td>");
						out.println(sub.toTdStr());
						out.println("</tr>");
					}
				
					out.println("<td>" + sum.type + "</td>");
					out.println(sum.toTdStr());
				%>
				<tr>
					<td></td>
				</tr>
			</table>
			</div>
		</div>
    </div>
    <%
		}
	%>
</div>
</body>
</html>