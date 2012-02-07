<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%
	Map<String, String> form = new HashMap<String, String>();//(Map<String, String>)request.getAttribute("form");

	form.put("fv9ReportMeil","ReportMeil");form.put("fv9ReportDept","ReportDept");
	form.put("fv9Benennung0","Benennung");form.put("fv9Ergebnis0","Ergebnis");form.put("fv9Verantwortlich0","Name, (OE)");form.put("fv9Termin0","KWXX/YY");form.put("fv9Status0","offen");
	form.put("fv9Benennung1","Benennung");form.put("fv9Ergebnis1","Ergebnis");form.put("fv9Verantwortlich1","Name, (OE)");form.put("fv9Termin1","KWXX/YY");form.put("fv9Status1","erledigt");
	form.put("fv9Benennung2","Benennung");form.put("fv9Ergebnis2","Ergebnis");form.put("fv9Verantwortlich2","Name, (OE)");form.put("fv9Termin2","KWXX/YY");form.put("fv9Status2","erledigt");
	
	form.put("fv9Benennung3","");form.put("fv9Ergebnis3","");form.put("fv9Verantwortlich3","");form.put("fv9Termin3","");form.put("fv9Status3","");
	form.put("fv9Benennung4","");form.put("fv9Ergebnis4","");form.put("fv9Verantwortlich4","");form.put("fv9Termin4","");form.put("fv9Status4","");
	form.put("fv9Benennung5","");form.put("fv9Ergebnis5","");form.put("fv9Verantwortlich5","");form.put("fv9Termin5","");form.put("fv9Status5","");
	form.put("fv9Benennung6","");form.put("fv9Ergebnis6","");form.put("fv9Verantwortlich6","");form.put("fv9Termin6","");form.put("fv9Status6","");
	form.put("fv9Benennung7","");form.put("fv9Ergebnis7","");form.put("fv9Verantwortlich7","");form.put("fv9Termin7","");form.put("fv9Status7","");
	form.put("fv9Benennung8","");form.put("fv9Ergebnis8","");form.put("fv9Verantwortlich8","");form.put("fv9Termin8","");form.put("fv9Status8","");
	form.put("fv9Benennung9","");form.put("fv9Ergebnis9","");form.put("fv9Verantwortlich9","");form.put("fv9Termin9","");form.put("fv9Status9","");

	List<Map<String, String>> list = new ArrayList<Map<String, String>>();
	
	for(int i=0; i < 10; i++){
		String value = form.get("fv9Benennung" + i);
			if(value != null && !"".equals(value)){
				Map <String, String> map = new HashMap <String, String>();
				
				map.put("Benennung" + i, form.get("fv9Benennung" + i));
				map.put("Ergebnis" + i, form.get("fv9Ergebnis" + i));
				map.put("Verantwortlich" + i, form.get("fv9Verantwortlich" + i));
				map.put("Termin" + i, form.get("fv9Termin" + i));
				map.put("Status" + i, form.get("fv9Status" + i));	
				list.add(map);
		}
	}
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
			<div id="datatable" style="width: 800px; height: 350px; margin: 0 auto">
				<table width="80%" cellspacing="2" rules="rows" >
					<tr style="border-bottom:2px solid #333333;">
						<td width="35%">Aktion</td>
						<td width="30%">Verantwortlich</td>
						<td width="18%">Termin</td>
						<td width="17%">Status</td>	
					</tr>
					 <%
					 if(list != null){
						 for(int i=0; i < list.size(); i++){
							Map <String, String> values = list.get(i);
					%>
							<tr style="border-collapse: collapse; height: 85px;">
							<td>
								Auftrag <%=i %>: <br><%=values.get("Benennung" + i) %>/<%=values.get("Ergebnis" + i) %><br>...
							</td>
							<td>
								<%=values.get("Verantwortlich" + i) %>
							</td>
							<td  width="22%">
								<%=values.get("Termin" + i) %>
							</td>
							<td>
								<%=values.get("Status" + i) %>
							</td>
						</tr>
					<%	
						 }
					 }
					%>
					
				</table>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>