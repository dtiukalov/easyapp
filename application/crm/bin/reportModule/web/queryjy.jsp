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
<script type="text/javascript">
		function exportExcel(){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/reportModule/action/qujy.action";
			$('#hiddenForm')[0].submit();
		}
</script> 
<title>机油</title>
</head>
<body>
<div id="man_zone">
	<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/reportModule/action/queryjysec.action">
		<fieldset>
		  <legend>机油</legend>
              <table cellspacing="0" cellpadding="0">
                   <tr>                    
				  	<td class="colName">日期:</td>
                     <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_careOutTime" value="${min_careOutTime}" id="min_careOutTime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="max_careOutTime" value="${max_careOutTime}" id="max_careOutTime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td style="text-align:center;">
						<input id="sub" type="submit" value="查询"/>
                      </td>
                   </tr>
             </table> 
		</fieldset>           
	</form>
	<c:if test="${empty resultlist}">
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
		List<Map<String, Object>> resultlist = (List)request.getAttribute("resultlist");
		if (resultlist != null){
	%>
    <table class="optDiv"  style=''>
		<tr>
			<td><div id="paginate">机油</div></td>
			<td><div class="optAdd"><a href="javascript:exportExcel();">导出</a></div></td>
		</tr>
	</table>
    <div class="tbDiv">
		<table style="width: 320px">
			<%
				List aaa = new ArrayList();
					aaa.add("180001");
					aaa.add("180002");
					aaa.add("180003");
					aaa.add("180004");
			%>
			<%
				if(resultlist == null){
					resultlist = new ArrayList();
				}
			%>
			<tr>
				<td rowspan="2" style="width: 80px">服务顾问</td>
				<td rowspan="1" colspan="2" style="width: 120px">金桶</td>
				<td rowspan="1" colspan="2" style="width: 120px">绿桶</td>
				<td rowspan="1" colspan="2" style="width: 120px">蓝桶</td>
				<td rowspan="1" colspan="2" style="width: 120px">白桶</td>
				<td colspan="2" style="width: 120px">小计</td>
			</tr>
			<tr>
				<td>大</td>
				<td>小</td>
				<td>大</td>
				<td>小</td>
				<td>大</td>
				<td>小</td>
				<td>大</td>
				<td>小</td>
				<td>大</td>
				<td>小</td>
			</tr>
			<%
			List<Map<String, Object>> result= (List)request.getAttribute("result");
			for(int i=0;i<result.size();i++){
				SaturnData rowst = (SaturnData)result.get(i);
				out.print("<tr>");
					out.print("<td>");
						out.print(rowst.get("value"));
					out.print("</td>");
					int cexpense = 0;
					int cbtnum = 0;
					for(int j=0;j<aaa.size();j++){
						int xf = 0;
						int xi = 0;
						for(int a = 0;a<resultlist.size();a++){
							SaturnData ai = (SaturnData)resultlist.get(a);
							if(rowst.get("jystaff").equals(ai.get("jystaff"))){
								if(aaa.get(j).equals(ai.get("jytype"))){
									xf = Integer.parseInt(ai.get("jybignum").toString());
									cexpense += Integer.parseInt(ai.get("jybignum").toString());
									xi = Integer.parseInt(ai.get("jysmallnum").toString());
									cbtnum += Integer.parseInt(ai.get("jysmallnum").toString());
								}
							}
						}
						out.print("<td>");
						if(xf != 0){
							out.print(xf);	
						}
						out.print("</td>");
						out.print("<td>");
						if(xi != 0){
							out.print(xi);	
						}
						out.print("</td>");
					}
					out.print("<td>");
					if(cexpense != 0){
						out.print(cexpense);	
					}
					out.print("</td>");
					out.print("<td>");
					if(cbtnum != 0){
						out.print(cbtnum);	
					}
					out.print("</td>");
				out.print("</tr>");
			}
			%>
			<tr>
				<td>总计</td>
				<%
				int fa = 0;
				int ia = 0;
				for(int j=0;j<aaa.size();j++){
					int cexpense = 0;
					int cbtnum = 0;		
					for(int i=0;i<result.size();i++){
						SaturnData rowst = (SaturnData)result.get(i);
							for(int a = 0;a<resultlist.size();a++){
								SaturnData ai = (SaturnData)resultlist.get(a);
								if(rowst.get("jystaff").equals(ai.get("jystaff"))){
									if(aaa.get(j).equals(ai.get("jytype"))){
										cexpense += Integer.parseInt(ai.get("jybignum").toString());
										fa += Integer.parseInt(ai.get("jybignum").toString());
										cbtnum += Integer.parseInt(ai.get("jysmallnum").toString());
										ia += Integer.parseInt(ai.get("jysmallnum").toString());
									}
								}
							}
						}
						out.print("<td>");
						if(cexpense != 0){
							out.print(cexpense);	
						}
						out.print("</td>");
						out.print("<td>");
						if(cbtnum != 0){
							out.print(cbtnum);	
						}
						out.print("</td>");
					}
					out.print("<td>");
					if(fa != 0){
						out.print(fa);	
					}
					out.print("</td>");
					out.print("<td>");
					if(ia != 0){
						out.print(ia);	
					}
					out.print("</td>");
				%>	
			</tr>	
		</table>
    </div>
    <%
		}
	%>
</div>

<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="min_careOutTime" id="min_careOutTime" value='${min_careOutTime}'>
		<input type="hidden" name="max_careOutTime" id="max_careOutTime" value='${max_careOutTime}'>
	</form>
</body>
</html>