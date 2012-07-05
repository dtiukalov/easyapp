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
$(function() { 
	$('#dutystaff').selectDict({type:'crm_waiter',id:'dutystaff',value:'${dutystaff}'});
});
		function findExcel(){
			$('#exportForm')[0].action = "<%=request.getContextPath()%>/crm::/dutyModule/action/DutyReportAll.action";
			$('#exportForm')[0].submit();
		}	
</script> 
<title>总值综合报表</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/dutyModule/action/DutyReportAll.action">
		<fieldset>
		  <legend>总值综合报表</legend>
		
              <table cellspacing="0" cellpadding="0">
                   <tr style="height:30px;">
                   <td class="colName">进厂日期:</td>
                     <td class="detailColVal">
                     	<input type="text" value="${min_dutyintime}" name="min_dutyintime" id="min_dutyintime" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                     <td>至<input type="text" value="${max_dutyintime}" name="max_dutyintime" id="max_dutyintime" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                   <td class="colName">接待:</td>
                     <td class="detailColVal">
                     	<select id="dutystaff" name="dutystaff" value="${dutystaff}">
         				</select>
                     </td>
                     <td>&nbsp;</td>                    
				  	</tr>
				  	<tr style="height:30px;">
                     <td class="colName">预交车日期:</td>
                     <td class="detailColVal">
                     	<input type="text" value="${min_dutypredelivtime}" name="min_dutypredelivtime" id="min_dutypredelivtime" onfocus="dayCalender(this)" style="width:120px;"/>
                     	 </td>
                     	 <td>至<input type="text" value="${max_dutypredelivtime}" name="max_dutypredelivtime" id="max_dutypredelivtime" onfocus="dayCalender(this)" style="width:120px;"/>
                     </td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                   </tr>
                   <tr style="height:30px;">
                      <td style="text-align:center;">
						<input id="sub" type="submit" value="查询"/>
                      </td>
                      <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
    <table class="optDiv"  style=''>
		<tr>
			<td><label class="rsTitle" style=''>总值综合报表</label></td>
			<td><div id="paginate"><a href="javascript:findExcel();">导出</a></div></td>
		</tr>
	</table>

    <div class="tbDiv">
		<table style='width:1100px;' cellspacing='0' cellpadding='0'>
		<tbody>
			<tr>
                     	<th style="width:30px;">台数</th>
                     	<th style="width:120px;">车牌 VIN</th>
                        <th style="width:200px;padding:0px;">
                        <table cellspacing="0" cellpadding="0" style="border-width: 0;width:200px;table-layout: auto;">
                        <tr>
                        <th colspan="5" style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">车型</th>
                        </tr>
                        <tr>
                        <th style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:40px;">CR-V</th>
						<th style="border-bottom-style: none; border-bottom-width: medium;width:41px;">CIVIC</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;width:40px;">SPR</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;width:40px;">广本</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:40px;">其他</th>
                        </tr>
                        </table>
                        </th>
                        <th style="width:150px;">进厂时间</th>
                     	<th style="width:150px;">预交车时间</th>
						<th style="width:100px;padding:0px;">
                        <table cellspacing="0" cellpadding="0" style="border-width: 0;width:100px;table-layout: auto;">
                        <tr>
                        <th colspan="4" style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">车型分类</th>
                        </tr>
                        <tr>
                        <th style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:50px;">售后部</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:50px;">市场部</th>
                        </tr>
                        </table>
                        </th>
						<th style="width:250px;">大概维系内容</th>
                     	<th style="width:100px;">接待</th>
                    </tr>
                    </tbody>
                    </table>
                    <table style='width:1100px;' cellspacing='0' cellpadding='0'>
		<tbody>
		
			<%
		List<Map<String, Object>> allresult = (List)request.getAttribute("allresult");
	int stanum=1;
		if (allresult != null){
			if (!allresult.isEmpty()) {
				int i = 0;
				for (; i < allresult.size(); ++i) {
					SaturnData data = (SaturnData)allresult.get(i);
					String cp=data.get("carlicenseno")!=null?data.get("carlicenseno")+"":data.get("carvin")!=null?"VIN:"+data.get("carvin").toString().substring(data.get("carvin").toString().length()-4):"";
					String cx1="";
					String cx2="";
					String cx3="";
					String cx4="";
					String cx5="";
					if("105007".equals(data.get("dutycarmodel"))){
						cx1="√";
					}else if("105006".equals(data.get("dutycarmodel"))){
						cx2="√";
					}else if("105008".equals(data.get("dutycarmodel"))){
						cx3="√";
					}else if("105002".equals(data.get("dutycarmodel"))||"105003".equals(data.get("dutycarmodel"))||"105004".equals(data.get("dutycarmodel"))||"105005".equals(data.get("dutycarmodel"))){
						cx4="√";
					}else{
						cx5="√";
					}
					String intime=data.get("dutyintime")!=null?data.get("dutyintime")+"":"";
					String prtime=data.get("dutypredelivtime")!=null?data.get("dutypredelivtime")+"":"";
					String type1="";
					String type2="";
					if("售后".equals(data.get("dutytype"))){
						type1="√";
					}else if("市场".equals(data.get("dutytype"))){
						type2="√";
					}
					String wk=data.get("dutywkcontent")!=null?data.get("dutywkcontent")+"":"";
					String st=data.get("dutystaff_dict")!=null?data.get("dutystaff_dict")+"":"";
					%>
					<tr>
           		<td style="width:30px;">
           			<%=stanum++ %>
           		</td>
           		<td style="width:120px;"><%=cp %></td>
           		<td style="width:39px;"><%=cx1 %></td>
           		<td style="width:41px;"><%=cx2 %></td>
           		<td style="width:39px;"><%=cx3 %></td>
           		<td style="width:38px;"><%=cx4 %></td>
				<td style="width:39px;"><%=cx5 %></td>
           		<td style="width:150px;"><%=intime %></td>
           		<td style="width:150px;"><%=prtime %></td>
           		<td style="width:49px;"><%=type1 %></td>
           		<td style="width:50px;"><%=type2 %></td>
           		<td style="width:250px;"><%=wk %></td>
           		<td style="width:100px;"><%=st %></td>
	         </tr>
					<%
				}
				%>
				<tr><td colspan="13">共有<%=i %>台车</td></tr>
			 	<%
			}
		}
	%>
		</tbody>
		</table>
    </div>
</div>
<div style="display:none;">
	<form id="exportForm" name="exportForm" method="post">
		<input type="hidden" name="dutystaff" value="${dutystaff}">
        <input type="hidden" value="${min_dutyintime}" name="min_dutyintime"/>
        <input type="hidden" value="${max_dutyintime}" name="max_dutyintime"/>
        <input type="hidden" value="${min_dutypredelivtime}" name="min_dutypredelivtime"/>
        <input type="hidden" value="${max_dutypredelivtime}" name="max_dutypredelivtime"/>
		<input type="hidden" name="op" value="excel">
		
	</form>
</div>
</body>
</html>