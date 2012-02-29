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
</script>
<title>售后效益统计</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/QueryStaffBussinessStatistic.action">
		<fieldset>
		  <legend>售后效益统计</legend>
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
    <table class="optDiv" style='width:1100px;'>
		<tr>
			<td><label class="rsTitle" style='width:1000px;'>${statisticdate}售后台前业务分析</label></td>
			<td><div id="paginate"><a href="javascript:$('#exportForm').submit();">导出</a></div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<table style='width:1100px;' cellspacing='0' cellpadding='0'>
		<tbody>
			<tr>
				<td rowspan="2"  colspan='3'></td>
				<td colspan='1'></td>
				<td colspan='3' style="line-height:18px; text-align: center;">第一组</td>
				<td colspan='2' style="line-height:18px; text-align: center;">第二组</td>
				<td colspan='2' style="line-height:18px; text-align: center;">第三组</td>		
				<td colspan='2' style="line-height:18px; text-align: center;">第四组</td>
				<td colspan='1' style="line-height:18px; text-align: center;">第五组</td>						
			</tr>
			<tr>
				<td colspan='1' class="zongji" align="center">总计</td>
				<td colspan='1' class="popname">张策</td>
				<td colspan='1' class="popname">赵晓亮</td>
				<td colspan='1' class="popname">郑秋月</td>
				<td colspan='1' class="popname">梁天依</td>
				<td colspan='1' class="popname">郑爽</td>
				<td colspan='1' class="popname">张景辉</td>
				<td colspan='1' class="popname">邓然</td>
				<td colspan='1' class="popname">王晶晶</td>
				<td colspan='1' class="popname">战洪新</td>
				<td colspan='1' class="popname">王中恺</td>
			</tr>
			<tr>
				<td rowspan="6" colspan='1'>接车情况</td>
				<td rowspan="3" colspan='1'>当日接车</td>
				<td colspan='1'>台次</td>
				<% 
					List list = (List)request.getAttribute("result");
					int j0 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j0 += Integer.parseInt(row1.get("carcount").toString());
				    }
				    out.print("<td>"+j0+"</td>");
				    System.out.println(j0);
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.carcount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>金额</td>
				<% 
					float j1 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j1 += Float.parseFloat(row1.get("carmoney").toString());
				    }
				    out.print("<td>"+j1+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.carmoney}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>未录</td>
				<% 
					int j2 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j2 += Integer.parseInt(row1.get("norecordcarcount").toString());
				    }
				    out.print("<td>"+j2+"</td>");
				    System.out.println(j2);
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.norecordcarcount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="3" colspan='1'>当月累计</td>
				<td colspan='1'>台次</td>
				<% 
					int j3 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j3 += Integer.parseInt(row1.get("mcarcount").toString());
				    }
				    out.print("<td>"+j3+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mcarcount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>金额</td>
				<% 
					float j4 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j4 += Float.parseFloat(row1.get("mcarmoney").toString());
				    }
				    out.print("<td>"+j4+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mcarmoney}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>未录</td>
				<% 
					int j5 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j5 += Integer.parseInt(row1.get("mnorecordcarcount").toString());
				    }
				    out.print("<td>"+j5+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mnorecordcarcount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="4" colspan='1'>招揽预约</td>
				<td rowspan="2" colspan='1'>预约</td>
				<td colspan='1'>当日</td>
				<% 
					int j6= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j6 += Integer.parseInt(row1.get("reservecount").toString());
				    }
				    out.print("<td>"+j6+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.reservecount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>月累</td>
				<% 
					int j7= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j7 += Integer.parseInt(row1.get("mreservecount").toString());
				    }
				    out.print("<td>"+j7+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mreservecount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="2" colspan='1'>成功预约</td>
				<td colspan='1'>当日</td>
				<% 
					int j8= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j8 += Integer.parseInt(row1.get("reservesuccesscount").toString());
				    }
				    out.print("<td>"+j8+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.reservesuccesscount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>月累</td>
				<% 
					int j9= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j9 += Integer.parseInt(row1.get("mreservesuccesscount").toString());
				    }
				    out.print("<td>"+j9+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mreservesuccesscount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="2" colspan='1'>节余机油</td>
				<td rowspan="1" colspan='1'>现存</td>
				<td colspan='1'>当日</td>
				<% 
					int j10= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j10 += Integer.parseInt(row1.get("oilcount").toString());
				    }
				    out.print("<td>"+j10+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.oilcount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="1" colspan='1'>${count}</td>
				<td colspan='1'>月累</td>
				<% 
					int j11= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j11 += Integer.parseInt(row1.get("moilcount").toString());
				    }
				    out.print("<td>"+j11+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.moilcount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="2" colspan='2'>投保台次</td>
				<td colspan='1'>当日</td>
				<% 
					int j12= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j12 += Integer.parseInt(row1.get("insurancecount").toString());
				    }
				    out.print("<td>"+j12+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.insurancecount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>月累</td>
				<% 
					int j13= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j13 += Integer.parseInt(row1.get("minsurancecount").toString());
				    }
				    out.print("<td>"+j13+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.minsurancecount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="2" colspan='2'>精品金额</td>
				<td colspan='1'>当日</td>
				<% 
					float j14 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j14 += Float.parseFloat(row1.get("partsmoney").toString());
				    }
				    out.print("<td>"+j14+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.partsmoney}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>月累</td>
				<% 
					float j15 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j15 += Float.parseFloat(row1.get("mpartsmoney").toString());
				    }
				    out.print("<td>"+j15+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mpartsmoney}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="2" colspan='2'>养护品金额</td>
				<td colspan='1'>当日</td>
				<% 
					float j16 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j16 += Float.parseFloat(row1.get("caremoney").toString());
				    }
				    out.print("<td>"+j16+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.caremoney}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>月累</td>
				<% 
					float j17 = 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j17 += Float.parseFloat(row1.get("mcaremoney").toString());
				    }
				    out.print("<td>"+j17+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mcaremoney}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="2" colspan='2'>索赔台次</td>
				<td colspan='1'>当日</td>
				<% 
					int j18= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j18 += Integer.parseInt(row1.get("factoryrepaircount").toString());
				    }
				    out.print("<td>"+j18+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.factoryrepaircount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>月累</td>
				<% 
					int j19= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j19 += Integer.parseInt(row1.get("mfactoryrepaircount").toString());
				    }
				    out.print("<td>"+j19+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mfactoryrepaircount}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td rowspan="2" colspan='2'>顾客投诉和解决</td>
				<td colspan='1'>当日</td>
				<% 
					int j20= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j20 += Integer.parseInt(row1.get("complaintsolve").toString());
				    }
				    out.print("<td>"+j20+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.complaintsolve}</td>	
				</c:forEach>
			</tr>
			<tr>
				<td colspan='1'>月累</td>
				<% 
					int j21= 0;
				    for(int i=0;i<list.size();i++){
				    	SaturnData row1 = (SaturnData)list.get(i);
				    	j21 += Integer.parseInt(row1.get("mcomplaintsolve").toString());
				    }
				    out.print("<td>"+j21+"</td>");
				%>
				<c:forEach items="${result}" var="var">
					<td colspan='1'>${var.mcomplaintsolve}</td>	
				</c:forEach>
			</tr>
			<%
				}
			%>
		<form id="exportForm" method="post" action="<%=request.getContextPath()%>/crm::/reportModule/action/StaffBussStatisticExecl.action" style="display:none;">
			<input type="hidden" name="statisticdate" value="${statisticdate}"/>
		</form>	
		</tbody>
		</table>	
    </div>
</div>
</body>
</html>