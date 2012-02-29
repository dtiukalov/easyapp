<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@page import="java.io.PrintWriter"%>
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
			$('#crmform')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/HondaFlowstatisticExcel.action";
			$('#crmform')[0].submit();
		}	
</script>
<%
	class FlowStatic {
		public String type;
		public int[] dayLevelStatic = new int[6]; //优，良，中，差，新，死档
		public int[] daySeriesStatic = new int[3]; //CIVIC, CR-V, SPIRIOR
		public int[] monthLevelStatic = new int[6]; //优，良，中，差，新，死档
		public int[] monthSeriesStatic = new int[3]; //CIVIC, CR-V, SPIRIOR
		
		public FlowStatic(String type) {
			this.type = type;
		}
		
		public void add(Map vo, String currentDay) {
			String level = (String)vo.get("carCardLevel");
			String series = (String)vo.get("carSeries");
			String servInTime = (String)vo.get("servInTime");
			
			if (servInTime.startsWith(currentDay)) {//日统计
				if (level != null && level.length() == 6) {
					int index = level.charAt(5) - '1';
					dayLevelStatic[index]++;
				}
				
				if (series != null && series.length() == 6) {
					int index = series.charAt(5) - '6';
					if (index >= 0 && index <= 2) {
						daySeriesStatic[index]++;
					}
				}
			}
			//月统计
			if (level != null && level.length() == 6) {
				int index = level.charAt(5) - '1';
				monthLevelStatic[index]++;
			}
			
			if (series != null && series.length() == 6) {
				int index = series.charAt(5) - '6';
				if (index >= 0 && index <= 2) {
					monthSeriesStatic[index]++;
				}
			}
		}
		
		public int getDaySum() {
			int sum = 0;
			for (int i = 0; i < dayLevelStatic.length; ++i) {
				sum += dayLevelStatic[i];
			}
			
			return sum;
		}
		
		public int getMonthSum() {
			int sum = 0;
			for (int i = 0; i < monthLevelStatic.length; ++i) {
				sum += monthLevelStatic[i];
			}
			
			return sum;
		}
		
		public String toTdStr() {
			StringBuffer buffer = new StringBuffer();
			
			for (int i = 0; i < this.dayLevelStatic.length; ++i) {
				buffer.append("<td>" + this.dayLevelStatic[i]+ "</td>");
			}
			
			buffer.append("<td>" + this.getDaySum()+ "</td>");
			
			for (int i = 0; i < this.daySeriesStatic.length; ++i) {
				buffer.append("<td>" + this.daySeriesStatic[i]+ "</td>");
			}
			
			for (int i = 0; i < this.monthLevelStatic.length; ++i) {
				buffer.append("<td>" + this.monthLevelStatic[i]+ "</td>");
			}
			
			buffer.append("<td>" + this.getMonthSum()+ "</td>");
			
			for (int i = 0; i < this.monthSeriesStatic.length; ++i) {
				buffer.append("<td>" + this.monthSeriesStatic[i]+ "</td>");
			}
			
			return buffer.toString();
		}
 	}
	
	FlowStatic sum = new FlowStatic("总计");

	Map sourceMap = new HashMap();
	sourceMap.put("103001", new FlowStatic("103001"));//自店
	sourceMap.put("103002", new FlowStatic("103002"));//它店
	
	Map areaMap = new HashMap();
	areaMap.put("111001", new FlowStatic( "长春"));
	areaMap.put("111013", new FlowStatic( "松原"));
	areaMap.put("111009", new FlowStatic( "通化"));
	areaMap.put("111007", new FlowStatic( "四平"));
	areaMap.put("111011", new FlowStatic( "白城"));
	areaMap.put("111008", new FlowStatic( "辽源"));
	areaMap.put("111006", new FlowStatic( "吉林"));
	areaMap.put("111010", new FlowStatic( "白山"));
	areaMap.put("111012", new FlowStatic( "延吉"));
	areaMap.put("111014", new FlowStatic( "内蒙"));
	areaMap.put("111015", new FlowStatic( "辽宁"));
	areaMap.put("111016", new FlowStatic( "黑龙江"));
	areaMap.put("其他", new FlowStatic("其他"));
	
	List result = (List)request.getAttribute("result");
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
			
			sum.add(vo, statisticdate);
			
			String source = (String)vo.get("carSource");
			String area = (String)vo.get("carArea");
			
			FlowStatic sourceStatic = (FlowStatic)sourceMap.get(source);
			if (sourceStatic != null) {
				sourceStatic.add(vo, statisticdate);
			}
			
			FlowStatic areaStatic = (FlowStatic)areaMap.get(area);
			if (areaStatic != null) {
				areaStatic.add(vo, statisticdate);
			} else {
				((FlowStatic)areaMap.get("其他")).add(vo, statisticdate);
			}
		}
	}
	
	List areaList = new ArrayList();
	areaList.add(areaMap.get("111001"));
	areaList.add(areaMap.get("111013"));
	areaList.add(areaMap.get("111009"));
	areaList.add(areaMap.get("111007"));
	areaList.add(areaMap.get("111011"));
	areaList.add(areaMap.get("111008"));
	areaList.add(areaMap.get("111006"));
	areaList.add(areaMap.get("111010"));
	areaList.add(areaMap.get("111012"));
	areaList.add(areaMap.get("111014"));	areaList.add(areaMap.get("111015"));
	areaList.add(areaMap.get("111016"));
	areaList.add(areaMap.get("其他"));
%>
<title>售后车辆当日流量表</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/HondaFlowstatistic1.action">
		<fieldset>
		  <legend>售后车辆当日流量表</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">统计日期:</td>
                     <td class="detailColVal" colspan="10">
                     	<input type="text" value="${statisticdate}" name="statisticdate" id="statisticdate" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                   </tr>
                   <tr>
                      <td colspan="8" style="text-align:center;">
						<input id="sub" type="submit" value="查询" />
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
	<c:if test="${empty resultmon}">
		<table>
			<tr><td colspan="30">
				<div style="width: 200px;height: auto;">
					没有符合条件的数据！
				</div>	
				</td>
			</tr>
		</table>	
	</c:if>
	<%
		if (result != null){
	  %>
    <table class="optDiv" style='width:1100px;'>
		<tr>
			<td><label class="rsTitle" style='width:900px;'>${statisticdate}售后车辆当日流量</label></td>
			<td><div id="paginate"><a href="javascript:findExcel();">导出</a></div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<table  style="width:1100px;">
			<tr>
				<td rowspan="37" colspan="1"  style='width:20px;'>东本</td>
				<td rowspan="3" colspan="2"  style='width:40px;'></td>
				<td colspan="10">当日流量</td>
				<td colspan="10">当月流量</td>
			</tr>
			<tr>
				<td rowspan="2" colspan="1">优</td>
				<td rowspan="2">良</td>
				<td rowspan="2">中</td>
				<td rowspan="2">差</td>
				<td rowspan="2">新</td>
				<td rowspan="2">死档</td>
				<td rowspan="1" colspan="4">小计</td>
				
				
				<td rowspan="2" colspan="1">优</td>
				<td rowspan="2">良</td>
				<td rowspan="2">中</td>
				<td rowspan="2">差</td>
				<td rowspan="2">新</td>
				<td rowspan="2">死档</td>
				<td rowspan="1" colspan="4">小计</td>
			</tr>
			<tr>
				<td>总台次</td>
				<td>CIVIC</td>
				<td>CRV</td>
				<td>SPIROR</td>
				
				
				<td>总台次</td>
				<td>CIVIC</td>
				<td>CRV</td>
				<td>SPIROR</td>
			</tr>
			<tr>
				<td colspan="2" style='width:60px;'>当日\当月总计</td>
				<%
					out.println(sum.toTdStr());
				%>
			</tr>
			<tr>
				<td rowspan="2">东本</td>
				<td>自店</td>
				<%
					FlowStatic self = (FlowStatic)sourceMap.get("103001");
					
					out.println(self.toTdStr());
				%>
			<tr>
				<td>它店</td>
				<%
					FlowStatic other = (FlowStatic)sourceMap.get("103002");
					
					out.println(other.toTdStr());
				%>
			</tr>
			<tr>
				<td rowspan="13">地区分布</td>
				<td>长春</td>
				<%
					FlowStatic changchun = (FlowStatic)areaList.get(0);
					out.println(changchun.toTdStr());
				%>
			</tr>
			<%
				for (int i = 1; i < areaList.size(); ++i) {
					out.println("<tr>");
					FlowStatic sub = (FlowStatic)areaList.get(i);
					out.println("<td>" + sub.type + "</td>");
					out.println(sub.toTdStr());
					out.println("</tr>");
				}
			%>
		</table>
		<div style="height: 20px;width: auto; border: 1px solid #ccc;">
		</div>
    </div>
    <%
		}
	%>
</div>
</body>
</html>