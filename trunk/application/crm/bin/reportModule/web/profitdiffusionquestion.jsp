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
<%
	List carar = new ArrayList();
	carar.add("111001");
	carar.add("111013");
	carar.add("111009");
	carar.add("111007");
	carar.add("111011");
	carar.add("111008");
	carar.add("111006");
	carar.add("111010");
	carar.add("111012");
	carar.add("111014");
	carar.add("111015");
	carar.add("111016");
	List cararname = new ArrayList();
	cararname.add("长春");
	cararname.add("松原");
	cararname.add("通化");
	cararname.add("四平");
	cararname.add("白城");
	cararname.add("辽源");
	cararname.add("吉林");
	cararname.add("白山");
	cararname.add("延吉");
	cararname.add("内蒙");
	cararname.add("辽宁");
	cararname.add("黑龙江");
	
	List brandser = new ArrayList();
	brandser.add("105007");
	brandser.add("105006");
	brandser.add("105008");
	brandser.add("104002");
	brandser.add("1");
	
	List servicety = new ArrayList();
	servicety.add("112005");
	servicety.add("112003");
	
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
	
	List brandfortime =new ArrayList();
	brandfortime.add("2");
	brandfortime.add("105007");
	brandfortime.add("105006");
	brandfortime.add("105008");
	brandfortime.add("1");
%>
<title>售后效益统计</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/ProfitdiffusionQuetion.action">
		<fieldset>
		  <legend>售后效益统计--问题统计</legend>
		
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
	<c:if test="${empty resultcomplaintstatisticmon}">
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
		List<Map<String, Object>> resultcomplaintstatisticmon = (List)request.getAttribute("resultcomplaintstatisticmon");
		if (resultcomplaintstatisticmon != null){
	%>
    <table class="optDiv"  style=''>
		<tr>
			<td><label class="rsTitle" style=''>${statisticdate}售后台前业务分析</label></td>
			<td><div id="paginate"><a href="javascript:$('#exportForm').submit();">导出</a></div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<table style="width: 320px">
			<%
				List<Map<String, Object>> resultcomplaintstatisticday = (List)request.getAttribute("resultcomplaintstatisticday");
				if(resultcomplaintstatisticday == null){
					resultcomplaintstatisticday = new ArrayList();
				}
				if(resultcomplaintstatisticmon == null){
					resultcomplaintstatisticmon = new ArrayList();
				}
			%>
				<tr>
					<td rowspan="15" style="width: 80px">问题统计</td>
					<td style="width: 80px"></td>
					<td style="width: 80px">当日投诉</td>
					<td style="width: 80px">当月投诉</td>
				</tr>
				<%
					for(int i=0;i<cararname.size(); i++){
						out.print("<tr>");
							String a = (String)cararname.get(i);
							String b =(String)carar.get(i);
							out.print("<td>"+a+"</td>");
							out.print("<td>");
								for(int j=0; j<resultcomplaintstatisticday.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticday.get(j);
									if(b.equals(comday.get("cararea"))){
										out.print(comday.get("complaintcount"));
									}
								}
							out.print("</td>");
							out.print("<td>");
								for(int j=0; j<resultcomplaintstatisticmon.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticmon.get(j);
									if(b.equals(comday.get("cararea"))){
										out.print(comday.get("complaintcount"));
									}
								}
							out.print("</td>");
						out.print("</tr>");
					}
				%>
				<tr>
					<td>其他地区</td>
					<td>
						<%
						for(int j=0; j<resultcomplaintstatisticday.size();j++){
							SaturnData comday = (SaturnData)resultcomplaintstatisticday.get(j);
							if("1".equals(comday.get("cararea"))){
								out.print(comday.get("complaintcount"));
							}
						}
						%>
					</td>
					<td>
						<%
						for(int j=0; j<resultcomplaintstatisticmon.size();j++){
							SaturnData comday = (SaturnData)resultcomplaintstatisticmon.get(j);
							if("1".equals(comday.get("cararea"))){
								out.print(comday.get("complaintcount"));
							}
						}
						%>
					</td>
				</tr>
				<tr>
					<td>总计</td>
					<td>
						<%
							int varday =0;
							for(int i=0;i<cararname.size(); i++){
								for(int j=0; j<resultcomplaintstatisticday.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticday.get(j);
									if(comday.get("cararea")!=""){
										varday += Integer.parseInt(comday.get("complaintcount").toString());
									}
									
								}
							}
							out.print(varday);
						%>
					</td>
					<td>
						<%
							int varmon =0;
							for(int i=0;i<cararname.size(); i++){
								String a = (String)cararname.get(i);
								String b =(String)carar.get(i);
								for(int j=0; j<resultcomplaintstatisticmon.size();j++){
									SaturnData comday = (SaturnData)resultcomplaintstatisticmon.get(j);
									if(comday.get("cararea")!= null){
										varmon += Integer.parseInt(comday.get("complaintcount").toString());
									}
								}
							}
							out.print(varmon);
						%>
					</td>
				</tr>
			</table>
		</div>
    </div>
    <%
		}
	%>
</div>
</body>
</html>