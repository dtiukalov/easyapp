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

<title>售后前台--招揽预约</title>
</head>
<script type="text/javascript">
		function findExcel(){
			$('#exportForm')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/SolicitNewAppointment.action";
			$('#exportForm')[0].submit();
		}
		
		
</script> 
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/SolicitAppointment.action">
		<fieldset>
		  <legend>售后前台--招揽预约</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">统计日期:</td>
                     <td class="detailColVal" colspan="10">
                     	<input type="text" value="${servintime}" name="servintime" id="servintime" onfocus="dayCalender(this)" style="width:120px;"/>
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
	<c:if test="${empty result}">
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
		List<Map<String, Object>> result = (List)request.getAttribute("result");
		if (result != null){
	%>
    <table class="optDiv"  style=''>
		<tr>
			<td><label class="rsTitle" style=''>${statisticdate}售后台前业务分析</label></td>
			<td><div id="paginate"><a href="javascript:findExcel()">导出</a></div></td>
		</tr>
	</table>

    <div class="tbDiv">
		<table style='width:1500px;' cellspacing='0' cellpadding='0'>
		<tbody>
			<tr>
				<td colspan="3"></td>
				<td>总计</td>
				<c:forEach items="${result}" var="var">	
	           		<td>${var.value}</td>
	           	</c:forEach>
           	</tr>
           	<tr>
           		<td rowspan="4">招揽预约</td>
				<td rowspan="2">预约</td>
				<td>当日</td>
				<td>
				<%
					int j = 0;
					int s = 0;
					int n = 0;
					int m = 0; 
					for(int i=0; i<result.size(); i++){
						SaturnData sumid = (SaturnData)result.get(i);
						if(sumid.get("staffdaycount")!=null){
							j+= Integer.parseInt(sumid.get("staffdaycount").toString());
						}
						if(sumid.get("staffmoncount")!=null){
							s+= Integer.parseInt(sumid.get("staffmoncount").toString());
						}
						if(sumid.get("staffsucdaycount")!=null){
							n+= Integer.parseInt(sumid.get("staffsucdaycount").toString());
						}
						if(sumid.get("staffsucmoncount")!=null){
							m+= Integer.parseInt(sumid.get("staffsucmoncount").toString());
						}
					}
					out.print(j);
				%>
				</td>
	           	<c:forEach items="${result}" var="var">	
	           			<td>${var.staffdaycount}</td>
	           	</c:forEach>
           	</tr>
           	<tr>
           		<td>月累</td>
           		<td>
           		<%
           			out.print(s);
           		%>
           		</td>
	           	<c:forEach items="${result}" var="var">	
	           			<td>${var.staffmoncount}</td>
	           	</c:forEach>
           	</tr>
           	<tr>
				<td rowspan="2">成功预约</td>
				<td>当日</td>
				<td>
				<%
					out.print(n);
				%>
				</td>
	           	<c:forEach items="${result}" var="var">	
	           			<td>${var.staffsucdaycount}</td>
	           	</c:forEach>
           	</tr>
           	<tr>
           		<td>月累</td>
           		<td>
           		<%
           			out.print(m);
           		%>
           		</td>
	           	<c:forEach items="${result}" var="var">	
	           			<td>${var.staffsucmoncount}</td>
	           	</c:forEach>
           	</tr>
		</tbody>
		</table>
		<table style="border-bottom-style: none;height: 10px;width: 1500px; margin-top: 10px;">&nbsp;</table>
    </div>
 	<%
		}
	%>
</div>
<div style="display:none;">
	<form id="exportForm" name="exportForm" method="post">
		<input type="hidden" name="servintime" value="${servintime}">
		
	</form>
</div>

</body>
</html>