<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>

	<%
		title = "";
		Map<String, Object> form = new HashMap<String, Object>();
		
		List<String>  fv9FreigabeStyle = (List<String>)form.get("fv9FreigabeStyle");
			fv9FreigabeStyle.add("MBT");
			fv9FreigabeStyle.add("FAKOM");
			fv9FreigabeStyle.add("Stuckliste");
			fv9FreigabeStyle.add("P/B-Freigaben");
			fv9FreigabeStyle.add("BMG");
		List<String>  fv9FreigabeStatus = (List<String>)form.get("fv9FreigabeStatus");
			fv9FreigabeStatus.add("绿");
			fv9FreigabeStatus.add("绿");
			fv9FreigabeStatus.add("黄");
			fv9FreigabeStatus.add("黄");
			fv9FreigabeStatus.add("黄");
		List<String>  fv9AnzahlNum = (List<String>)form.get("fv9AnzahlNum");
			fv9AnzahlNum.add("0");
			fv9AnzahlNum.add("0");
			fv9AnzahlNum.add("711");
			fv9AnzahlNum.add("719");
			fv9AnzahlNum.add("120");
		List<String>  fv9FreigSollNum = (List<String>)form.get("fv9FreigSollNum");
			fv9FreigSollNum.add("38");
			fv9FreigSollNum.add("526");
			fv9FreigSollNum.add("711");
			fv9FreigSollNum.add("719");
			fv9FreigSollNum.add("120");
		List<String>  fv9FreiglstNum = (List<String>)form.get("fv9FreiglstNum");
			fv9FreiglstNum.add("38");
			fv9FreiglstNum.add("524");
			fv9FreiglstNum.add("679");
			fv9FreiglstNum.add("412");
			fv9FreiglstNum.add("3");
		List<String>  fv9FreigCom_CN = (List<String>)form.get("fv9FreigCom_CN");
		List<String>  fv9FreigCom_GM = (List<String>)form.get("fv9FreigCom_GM");
		
		
		Map<String, Object> MBT = new HashMap<String, Object>();
		Map<String, Object> FAKOM = new HashMap<String, Object>();
		Map<String, Object> Stuckliste = new HashMap<String, Object>();
		Map<String, Object> PB = new HashMap<String, Object>();
		Map<String, Object> BMG = new HashMap<String, Object>();
		MBT.put("MBTSoll", 38);
		MBT.put("MBTIst", 38);
		MBT.put("MBTStatus", "绿");
		MBT.put("MBTBemerkung", "Alle PRNR sind schon in MBT freigegeben.");
		form.put("MBT", MBT);
		FAKOM.put("FAKOMSoll", 526);
		FAKOM.put("FAKOMIst", 524);
		FAKOM.put("FAKOMStatus", "绿");
		FAKOM.put("FAKOMBemerkung", "Die 2x Teile sind noch nicht fertig wegen den faschen  PRNR Beschreibung, schon  in Arbeitung durch AeKO.");
		form.put("FAKOM", FAKOM);
		Stuckliste.put("StucklisteSoll", 711);
		Stuckliste.put("StucklisteIst", 697);
		Stuckliste.put("StucklisteStatus", "黄");
		Stuckliste.put("StucklisteBemerkung", "Platform Teile fehlt noch;  Die 14x fehlenden Teile ist ueber Raeder und ist noch in der Verbindung mit VW（Neueste Info. VW erstellt, ueberpruefung nochmal）.");
		form.put("Stuckliste", Stuckliste);
		PB.put("PBSoll", 179);
		PB.put("PBIst", 412);
		PB.put("PBStatus", "黄");
		PB.put("PBBemerkung", "Alle B-frei 3D-Daten sind schon fertig, die 307x Teile sind noch fehlen die 2D-Zeichnung, vor VFF wird alle 2D-Zeichnung fertig.");
		form.put("PB", PB);
		BMG.put("BMGSoll", 120);
		BMG.put("BMGIst", 3);
		BMG.put("BMGStatus", "黄");
		BMG.put("BMGBemerkung", "LC Teile: 116, SKD Teile: 1, CKD Teile:3,SUM: 120; 9x Teile AWE vor 0S, BMG vor SOP.");
		form.put("BMG", BMG);
		form.put("fv9ReportDept", "Entwicklung");
		
	%>
<title><%=title %></title>
</head>
<body>
	<div id="container">
		<div id="nr">
		<div id="top"><h1>2.1 P/B Freigabe und BMG</h1></div>	
		<div id="datatable" style="width: 800px; height: 350px; margin: 0 auto;margin-top: 30px;">
			<table width="80%" cellspacing="2" rules="rows" >
				<tr style="border-bottom:2px solid #333333;">
					<td></td>
					<td>Kennzahlen</td>
					<td>Bemerkung</td>	
				</tr>
				<%
					String[] keys = {"MBT", "FAKOM", "Stuckliste", "PB", "BMG"};
					for(int i=0; i<keys.length; i++) {
						HashMap map = (HashMap)form.get(keys[i]);
						String soll = keys[i] + "Soll";
						String ist = keys[i] + "Ist";
						String status = keys[i] + "Status";
						String bemerkung = keys[i] + "Bemerkung";
						String imagePath = "../images/";
						if ("红".equals(map.get(status))) {
							imagePath += "light_red.jpg";
						}
						if ("黄".equals(map.get(status))) {
							imagePath += "light_yellow.jpg";
						}
						if ("绿".equals(map.get(status))) {
							imagePath += "light_green.jpg";
						}
				%>
				<tr border="2" style="border-collapse: collapse" bordercolor="#333333">
					<td  width="30%" ><%=keys[i] %>
						<img src="<%=imagePath %>" align="right" border=0 width=50 height=56> 
					</td>
					<td  width="22%">
						<table>
							<tr><td>Anzahl</td><td>&nbsp;=&nbsp;</td><td><%=(Integer)map.get(soll) %></td></tr>
							<tr><td>Soll</td><td>&nbsp;=&nbsp;</td><td><%=(Integer)map.get(soll) %></td></tr>
							<tr><td>Ist</td><td>&nbsp;=&nbsp;</td><td><%=(Integer)map.get(ist) %></td></tr>
							<tr><td>offen</td><td>&nbsp;=&nbsp;</td><td><%=(Integer)map.get(soll) - (Integer)map.get(ist)%></td></tr>
						</table>
					</td>
					<td  width="48%" >
						<%=(String)map.get(bemerkung) %>
					</td>
				</tr>
				<%		
					}
				%>
				
			</table>
		</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>