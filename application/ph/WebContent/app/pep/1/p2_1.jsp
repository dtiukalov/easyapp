<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.web.Web"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/app/pep/include/header.jsp"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><%=title %></title>
	<%
		
		Map form = (Map)request.getAttribute("form");
	
//		List<String> fv9Aktion_CN = (List<String>)form.get("fv9Aktion_CN");
		
		List<String> fv9Aktion_GM = (List<String>)form.get("fv9Aktion_GM");
		
		List<String> fv9Verantwortlich = (List<String>)form.get("fv9Verantwortlich");
		
		List<String> fv9Termin = (List<String>)form.get("fv9Termin");
		
		List<String> fv9Status = (List<String>)form.get("fv9Status");
	%>
	
</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>	
			<div id="content">
				<div id="datatable" style="width: 800px; height: 600px; margin: 0 auto; margin-top: 30px;">
					<table width="80%" cellspacing="2" rules="rows" >
						<tr style="border-bottom:2px solid #333333;">
							<td width="35%">Aktion</td>
							<td width="30%">Verantwortlich</td>
							<td width="18%">Termin</td>
							<td width="17%">Status</td>	
						</tr>
						 <%
						 if(fv9Aktion_GM.size() > 0){
							 for(int i=0; i < fv9Aktion_GM.size(); i++){
						%>
								<tr style="border-collapse: collapse; height: 85px;">
								<td>
									Auftrag <%=i %>: <br><%=fv9Aktion_GM.get(i)%><br>...
								</td>
								<td>
									<%=fv9Verantwortlich.get(i) %>
								</td>
								<td  width="22%">
									<%=fv9Termin.get(i)%>
								</td>
								<td>
									<%=fv9Status.get(i)%>
								</td>
							</tr>
						<%	
							 }
						 }
						%>
						
					</table>
				</div>
			</div>
			
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>