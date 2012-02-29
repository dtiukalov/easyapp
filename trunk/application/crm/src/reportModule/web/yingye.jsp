<%@ page contentType="application/vnd.ms-excel; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.ccut.saturn.component.SaturnData"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>


</head>
<body>
	<c:if test="${empty resultout}">
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
		List<Map<String, Object>> resultout = (List)request.getAttribute("resultout");
		if (resultout != null){
	%>
    
    <div class="tbDiv">
		<table style="width: 320px; color: #000" border="1" >
			<%
				if(resultout == null){
					resultout = new ArrayList();
				}
			%>
				<tr>
					<td style="width: 80px" rowspan="2">服务顾问</td>
					<td colspan="2" style="width: 120px">首保</td>
					<td colspan="2" style="width: 120px">定保</td>
					<td colspan="2" style="width: 120px">一般维修</td>
					<td colspan="2" style="width: 120px">钣喷</td>
					<td colspan="2" style="width: 120px">保险</td>
					<td colspan="2" style="width: 120px">其他</td>
					<td colspan="2" style="width: 120px">小计</td>
					<td colspan="1" rowspan="2" style="width: 80px">总计</td>
				</tr>
				<tr>
					<td colspan="1" >零部件</td>
					<td colspan="1" >工时</td>
					<td colspan="1" >零部件</td>
					<td colspan="1" >工时</td>
					<td colspan="1" >零部件</td>
					<td colspan="1" >工时</td>
					<td colspan="1" >零部件</td>
					<td colspan="1" >工时</td>
					<td colspan="1" >零部件</td>
					<td colspan="1" >工时</td>
					<td colspan="1" >零部件</td>
					<td colspan="1" >工时</td>
					<td colspan="1" >零部件</td>
					<td colspan="1" >工时</td>
				</tr>
			<%
				List aaa = new ArrayList();
				aaa.add("112004");
				aaa.add("112001");
				aaa.add("112005");
				aaa.add("112002");
				aaa.add("112009");
			%>
			<%
			List<Map<String, Object>> result= (List)request.getAttribute("result");
			DecimalFormat formater = new DecimalFormat("#.##");
			
			for(int i=0;i<result.size();i++){
				SaturnData rowst = (SaturnData)result.get(i);
				out.print("<tr>");
					out.print("<td>");
						out.print(rowst.get("value"));
					out.print("</td>");
					double cexpense = 0;
					double cbtnum = 0;
					for(int j=0;j<aaa.size();j++){
						double xf = 0;
						double xi = 0;
						for(int a = 0;a<resultout.size();a++){
							SaturnData ai = (SaturnData)resultout.get(a);
							if(rowst.get("servstaff").equals(ai.get("servstaff"))){
								if(aaa.get(j).equals(ai.get("servtype"))){
									xf = Double.parseDouble(ai.get("servpartsexp").toString());
									xi = Double.parseDouble(ai.get("servhoursexp").toString());
								}
							}
						}
						out.print("<td>");
						if(xi != 0){
							out.print(formater.format(xf));	
						}
						out.print("</td>");
						out.print("<td>");
						if(xi != 0){
							out.print(formater.format(xi));	
						}
						out.print("</td>");
					}
					
					double qitaa = 0;
					double qitab = 0;
					for(int a = 0;a<resultout.size();a++){
						SaturnData ai = (SaturnData)resultout.get(a);
						if(rowst.get("servstaff").equals(ai.get("servstaff"))){
							if(ai.get("servtype") == null){
								qitaa += Double.parseDouble(ai.get("servpartsexp").toString());
								qitab += Double.parseDouble(ai.get("servhoursexp").toString());
							}
							cexpense += Double.parseDouble(ai.get("servpartsexp").toString());
							cbtnum += Double.parseDouble(ai.get("servhoursexp").toString());
						}
					}
					out.print("<td>");
					if(qitaa != 0){
						out.print(formater.format(qitaa));	
					}
					out.print("</td>");
					out.print("<td>");
					if(qitab != 0){
						out.print(formater.format(qitab));	
					}
					out.print("</td>");
					
					out.print("<td>");
					if(cbtnum != 0){
						out.print(formater.format(cbtnum));	
					}
					out.print("</td>");
					out.print("<td>");
					if(cbtnum != 0){
						out.print(formater.format(cbtnum));	
					}
					out.print("</td>");
					
					out.print("<td>");
					if(cexpense+cbtnum != 0){
						out.print(formater.format(cexpense+cbtnum));	
					}
					out.print("</td>");
				out.print("</tr>");
			}
			%>
			<tr>
				<td>总计</td>
				<%
				double fa = 0;
				double ia = 0;
				for(int j=0;j<aaa.size();j++){
					double zjcexpense = 0;
					double zjcbtnum = 0;		
						for(int a = 0;a<resultout.size();a++){
							SaturnData ai = (SaturnData)resultout.get(a);
							if(aaa.get(j).equals(ai.get("servtype"))){
								zjcexpense += Double.parseDouble(ai.get("servpartsexp").toString());
								zjcbtnum += Double.parseDouble(ai.get("servhoursexp").toString());
							}
						}
						out.print("<td>");
						if(zjcexpense != 0){
							out.print(formater.format(zjcexpense));	
						}
						out.print("</td>");
						out.print("<td>");
						if(zjcbtnum != 0){
							out.print(formater.format(zjcbtnum));	
						}
						out.print("</td>");
					}
					
					double zjqitaa = 0;
					double zjqitab = 0;
					for(int a = 0;a<resultout.size();a++){
						SaturnData ai = (SaturnData)resultout.get(a);
						if(ai.get("servtype")==null){
							zjqitaa += Double.parseDouble(ai.get("servpartsexp").toString());
							zjqitab += Double.parseDouble(ai.get("servhoursexp").toString());
						}
						fa += Double.parseDouble(ai.get("servpartsexp").toString());
						ia += Double.parseDouble(ai.get("servhoursexp").toString());
					}
					out.print("<td>");
					if(zjqitaa != 0){
						out.print(formater.format(zjqitaa));	
					}
					out.print("</td>");
					out.print("<td>");
					if(zjqitab != 0){
						out.print(formater.format(zjqitab));	
					}
					out.print("</td>");
					
						
					out.print("<td>");
					if(fa != 0){
						out.print(formater.format(fa));	
					}
					out.print("</td>");
					out.print("<td>");
					if(ia != 0){
						out.print(formater.format(ia));	
					}
					out.print("</td>");
					out.print("<td>");
					if(ia+fa != 0){
						out.print(formater.format(ia+fa));	
					}
					out.print("</td>");
				%>	
			</tr>	
		</table>
   
    <%
		}
	%>
</div>


</body>
</html>