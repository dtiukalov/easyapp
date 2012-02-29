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
		function findExcel(){
			$('#exportForm')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/QueryNewExcel.action";
			$('#exportForm')[0].submit();
		}
</script> 
<title>售后前台--接车情况</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/QueryService.action">
		<fieldset>
		  <legend>售后前台--接车情况</legend>
		
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
			<td><div id="paginate"><a href="javascript:findExcel();">导出</a></div></td>
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
           		<td rowspan="6">接车情况</td>
				<td rowspan="3">当日接车</td>
				<td>台次</td>
				<td>
				<%
					int j = 0;
					float s = 0;
					int n = 0;
					float m = 0;
					for(int i=0; i<result.size(); i++){
						SaturnData sumid = (SaturnData)result.get(i);
						if(sumid.get("countid")!=null){
							j+= Integer.parseInt(sumid.get("countid").toString());
						}
						if(sumid.get("sumexp")!=null){
							s+= Float.parseFloat(sumid.get("sumexp").toString());
						}
						if(sumid.get("countnoid")!=null){
							n+= Integer.parseInt(sumid.get("countnoid").toString());
						}
						if(sumid.get("partsExpense")!=null){
							m+= Float.parseFloat(sumid.get("partsExpense").toString());
						}
					}
					out.print(j);
				%>
				</td>
	           	<c:forEach items="${result}" var="var">	
	           			<td>${var.countid}</td>
	           	</c:forEach>
           	</tr>
           	<tr>
           		<td>金额</td>
           		<td>
           		<%
           			out.print(s+m);
           		%>
           		</td>
           		<%
				List<Map<String, Object>> result1 = (List)request.getAttribute("result");
					
					for(int i=0; i<result1.size(); i++){
						float aa = 0;
						float bb = 0;
						SaturnData sumid = (SaturnData)result1.get(i);
						if(sumid.get("sumexp")!=null){
							aa= Float.parseFloat(sumid.get("sumexp").toString());
						}
						if(sumid.get("partsExpense")!=null){
							bb= Float.parseFloat(sumid.get("partsExpense").toString());
						}
						out.print("<td>"+ (aa+bb) +"</td>");
					}
           		%>
           	</tr>
           	<tr>
           		<td>未录</td>
           		<td>
           		<%
           			out.print(n);
           		%>
           		</td>
	           	<c:forEach items="${result}" var="var">	
	           			<td>${var.countnoid}</td>
	           	</c:forEach>
           	</tr>
           	<tr>
				<td rowspan="3">当月接车</td>
				<td>台次</td>
				<td>
				<%
				List<Map<String, Object>> resultmonth = (List)request.getAttribute("resultmonth");
					int jm = 0;
					float sm = 0;
					int nm = 0;
					float mm = 0;
					for(int i=0; i<resultmonth.size(); i++){
						SaturnData sumid = (SaturnData)resultmonth.get(i);
						if(sumid.get("countid")!=null){
							jm+= Integer.parseInt(sumid.get("countid").toString());
						}
						if(sumid.get("sumexp")!=null){
							sm+= Float.parseFloat(sumid.get("sumexp").toString());
						}
						if(sumid.get("countnoid")!=null){
							nm+= Integer.parseInt(sumid.get("countnoid").toString());
						}
						if(sumid.get("partsExpense")!=null){
							mm+= Float.parseFloat(sumid.get("partsExpense").toString());
						}
					}
					out.print(jm);
				%>
				</td>
	           	<c:forEach items="${resultmonth}" var="var">	
	           			<td>${var.countid}</td>
	           	</c:forEach>
           	</tr>
           	<tr>
           		<td>金额</td>
           		<td>
           		<%
           			out.print(sm+mm);
           		%>
           		</td>
           		<%
				List<Map<String, Object>> resultmonth1 = (List)request.getAttribute("resultmonth");
					
					for(int i=0; i<resultmonth1.size(); i++){
						float aa = 0;
						float bb = 0;
						SaturnData sumid = (SaturnData)resultmonth1.get(i);
						if(sumid.get("sumexp")!=null){
							aa= Float.parseFloat(sumid.get("sumexp").toString());
						}
						if(sumid.get("partsExpense")!=null){
							bb= Float.parseFloat(sumid.get("partsExpense").toString());
						}
						out.print("<td>"+ (aa+bb) +"</td>");
					}
           		%>
           	</tr>
           	<tr>
           		<td>未录</td>
           		<td>
           		<%
           			out.print(nm);
           		%>
           		</td>
	           	<c:forEach items="${resultmonth}" var="var">	
	           			<td>${var.countnoid}</td>
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