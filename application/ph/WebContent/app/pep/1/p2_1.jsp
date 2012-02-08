<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.web.Web"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%
	
	Map form = (Map)request.getAttribute("form");

//	String	fv9Aktion = "Benennung/Ergebnis,Benennung/Ergebnis,Benennung/Ergebnis";//Web.getStrListStr(form.get("fv9Aktion"));
//	String	fv9Verantwortlich = "Name (OE),Name (OE),Name (OE)";//Web.getStrListStr(form.get("fv9Verantwortlich"));
//	String	fv9Termin = "KWXX/YY,KWXX/YY,KWXX/YY";//Web.getStrListStr(form.get("fv9Termin"));
//	String	fv9Status = "offen,erledigt,offen";//Web.getStrListStr(form.get("fv9Status"));

//	String[] fv9Aktionarr = fv9Aktion.split(",");
//	String[] fv9Verantwortlicharr = fv9Verantwortlich.split(",");
//	String[] fv9Terminarr = fv9Termin.split(",");
//	String[] fv9Statusarr = fv9Status.split(",");
		
//	List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	
//	for(int i=0; i<fv9Aktionarr.length; i++){
//		Map<String,String> map = new HashMap<String,String>();
//		map.put("fv9Aktion",fv9Aktionarr[i]);
//		map.put("fv9Verantwortlich",fv9Verantwortlicharr[i]);
//		map.put("fv9Termin",fv9Terminarr[i]);
//		map.put("fv9Status",fv9Statusarr[i]);
//		list.add(map);
//	}
	String[] fv9Aktion = {"Benennung/Ergebnis", "Benennung/Ergebnis", "Benennung/Ergebnis"};//form.get("fv9Aktion");
	String[] fv9Verantwortlich = {"Name (OE)", "Name (OE)", "Name (OE)"};//form.get("fv9Aktion");
	String[] fv9Termin = {"KWXX/YY", "KWXX/YY", "KWXX/YY"};//form.get("fv9Aktion");
	String[] fv9Status = {"offen", "erledigt", "offen"};//form.get("fv9Aktion");
	
	
	//http://localhost:8080/ph/app/pep/do/preview.do?uid=wRL9yykp6MzGwB
%>
<%@ include file="/app/pep/include/header.jsp"%>
<title></title>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<script type="text/javascript">

		</script>

</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>1.2 Aktionspunkte aus letzter Pilothalle</h1></div>	
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
						 if(fv9Aktion.length > 0){
							 for(int i=0; i < fv9Aktion.length; i++){
						%>
								<tr style="border-collapse: collapse; height: 85px;">
								<td>
									Auftrag <%=i %>: <br><%=fv9Aktion[i]%><br>...
								</td>
								<td>
									<%=fv9Verantwortlich[i] %>
								</td>
								<td  width="22%">
									<%=fv9Termin[i]%>
								</td>
								<td>
									<%=fv9Status[i]%>
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