<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="top-table">	
<%

	if (fv9KWNo != null && fv9KWNo.size() > 0) {
		
		int total_46 = Web.getTotalNum(fv9TeilNum);
%>
	<table cellspacing="0" style="font-size: 13px;">
		<tr>
			<td width="60%" height="<%=tdHeight%>px" style="text-align: left; background-color: #BBC2C5;">&nbsp;&nbsp;Teil BMG nach <%=milestone %> (<%=total_46 %>)</td>
			<td width="20%" height="<%=tdHeight%>px" style="text-align: center; background-color: #BBC2C5;">AWE Soll Termin</td>
			<td width="20%" height="<%=tdHeight%>px" style="text-align: center; background-color: #BBC2C5;">BMG Soll Termin</td>
		</tr>
<%
		for (int i=0; i<fv9KWNo.size(); i++) {
			String temp_bmg = fv9KWNo.get(i); //BMG认可周数 
			String temp_awe = fv9AWESollTermin.get(i); //AWE认可周数
			String temp_teil = fv9Teil.get(i);//零件名称
			String temp_teilNum = fv9TeilNum.get(i);//零件数量
%>
		<tr>
			<td width="60%" height="<%=tdHeight%>px" style="text-align: left;">&nbsp;&nbsp;<%=temp_teil %> (<%=temp_teilNum %>)</td>
			<td width="20%" height="<%=tdHeight%>px" style="text-align: right;"><%=temp_awe %>&nbsp;&nbsp;</td>
			<td width="20%" height="<%=tdHeight%>px" style="text-align: right;"><%=temp_bmg %>&nbsp;&nbsp;</td>
		</tr>
<%			
		}
	}
	
%>	
	</table>

	
</div>