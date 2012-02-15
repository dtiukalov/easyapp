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
<%
	
	Map form = (Map)request.getAttribute("form");
	title = "1.2 Aktionspunkte aus letzter Pilothalle";
	
	List<String> fv9Aktion_CN = new ArrayList<String>();//(List<String>)form.get("fv9Aktion_CN");
	
	List<String> fv9Aktion_GM = new ArrayList<String>();//(List<String>)form.get("fv9Aktion_GM");
	fv9Aktion_GM.add("Benennung/Ergebnis");fv9Aktion_GM.add("Benennung/Ergebnis");fv9Aktion_GM.add("Benennung/Ergebnis");
	
	List<String> fv9Verantwortlich = new ArrayList<String>();//(List<String>)form.get("fv9Verantwortlich");
	fv9Verantwortlich.add("Name (OE)");fv9Verantwortlich.add("Name (OE)");fv9Verantwortlich.add("Name (OE)");
	
	List<String> fv9Termin = new ArrayList<String>();//(List<String>)form.get("fv9Termin");
	fv9Termin.add("KWXX/Y");fv9Termin.add("KWXX/Y");fv9Termin.add("KWXX/Y");
	
	List<String> fv9Status = new ArrayList<String>();//(List<String>)form.get("fv9Status");
	fv9Status.add("offen");fv9Status.add("erledigt");fv9Status.add("offen");
%>

<title></title>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript">
		</script>
	<title><%=title %></title>
</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>	
			<div id="content">
				<div id="datatable" style="width: 800px; height: 350px; margin: 0 auto">
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