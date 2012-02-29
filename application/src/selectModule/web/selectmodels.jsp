<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*"%>
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>车型时间段分布</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/selectModule/action/SelectModel.action">
		<fieldset id="formFiled">
		  	<legend>车型时间区间分布</legend>
             	<table cellspacing="5" cellpadding="0">
                   	<tr class="rowClass">
                     	<td class="colName">进厂日期:</td>
                     	<td class="detailColVal" style="width: 340px;height: 22px;">
                     		<input type="text" name="min_servintime" id="min_servintime" value="${min_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                     		<span>至</span>
                     		<input type="text" name="max_servintime" id="max_servintime" value="${max_servintime}" onfocus="dayCalender(this)" class="Wdate"/>
                     	</td>
                	</tr>
            </table>   
             <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="查询" />
                    <input type="reset" value="重置" />
             </div>   
		</fieldset>           
	</form>
	<table class="optDiv">
		<tr>
			<td><div id="paginate"></div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<div>
			<table cellspacing="0" cellpadding="0">
            	<tr>
                   	<th>时间分布</th>
                   	<th>全部</th>
                   	<th>CIVIC</th>
                   	<th>CR-V</th>
                   	<th>SPIPIOR</th>
                   	<th>其他</th>                 
            	</tr>
           	</table>
		</div>
		<div id="dataDiv">
			<c:if test="${empty result}">
				没有符合条件的数据！
			</c:if>
			<table id="dataTb" cellspacing="0" cellpadding="0">
				<% 
				List timemates =new ArrayList();
					timemates.add("8点之前");
					timemates.add("8-9点");
					timemates.add("9-10点");
					timemates.add("10-11点");
					timemates.add("11-12点");
					timemates.add("12-13点");
					timemates.add("13-14点");
					timemates.add("14-15点");
					timemates.add("15-16点");
					timemates.add("16-17点");
					timemates.add("17点之后");
					List<Map<String, Object>> result = (List)request.getAttribute("result"); 
					if(result != null){
						int numtime = timemates.size();
						int numrel = result.size();
						for(int i=0;i<numtime;i++){
							out.print("<tr>");
							out.print("<td>"+timemates.get(i)+"</td>");
							int ii = (i+1);
							int numcount =0;
							int onecount =0;
							int seccount =0;
							int thrcount =0;
							int othcount =0;
							for(int j=0; j<numrel;j++){
								SaturnData sa = (SaturnData)result.get(j);
								if((ii+"").equals(sa.get("time_hour").toString())){
									numcount += Integer.parseInt(sa.get("num").toString());
									if("105006".equals(sa.get("carseries"))){
										onecount += Integer.parseInt(sa.get("num").toString());
									}
									if("105007".equals(sa.get("carseries"))){
										seccount += Integer.parseInt(sa.get("num").toString());
									}
									if("105008".equals(sa.get("carseries"))){
										thrcount += Integer.parseInt(sa.get("num").toString());
									}
								}
							}
							othcount = numcount - (onecount + seccount + thrcount);
							out.print("<td>"+numcount+"</td>");
							out.print("<td>"+onecount+"</td>");
							out.print("<td>"+seccount+"</td>");
							out.print("<td>"+thrcount+"</td>");
							out.print("<td>"+othcount+"</td>");
							out.print("</tr>");
						}
					}
				%>
	        </table>
    	</div>
	</div>
</body>
</html>