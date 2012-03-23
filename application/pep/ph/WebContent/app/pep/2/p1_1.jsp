<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<%
	List<String> fv9FreigabeStyle = new ArrayList<String>();
	List<String> fv9FreigabeStatus = new ArrayList<String>();
	List<String> fv9AnzahlNum = new ArrayList<String>();
	List<String> fv9FreigSollNum = new ArrayList<String>();
	List<String> fv9FreiglstNum = new ArrayList<String>();
	List<String> fv9FreigCom_CN = new ArrayList<String>();
	List<String> fv9FreigCom_GM = new ArrayList<String>();
	
	if(form.get("fv9FreigabeStyle") != null){
		fv9FreigabeStyle = (List<String>)form.get("fv9FreigabeStyle");
	}
	if(form.get("fv9FreigabeStatus") != null){
		fv9FreigabeStatus = (List<String>)form.get("fv9FreigabeStatus");
	}
	if(form.get("fv9AnzahlNum") != null){
		fv9AnzahlNum = (List<String>)form.get("fv9AnzahlNum");
	}
	if(form.get("fv9FreigSollNum") != null){		
		fv9FreigSollNum = (List<String>)form.get("fv9FreigSollNum");
	}
	if(form.get("fv9FreiglstNum") != null){		
		fv9FreiglstNum = (List<String>)form.get("fv9FreiglstNum");
	}
	if(form.get("fv9FreigCom_CN") != null){		
		fv9FreigCom_CN = (List<String>)form.get("fv9FreigCom_CN");
	}
	if(form.get("fv9FreigCom_GM") != null){		
		fv9FreigCom_GM = (List<String>)form.get("fv9FreigCom_GM");
	}		
	
	List<Integer> fv9OffenNum = new ArrayList<Integer>();
	if (fv9AnzahlNum != null && fv9AnzahlNum.size() > 0) {
		for(int i=0; i<fv9AnzahlNum.size(); i++) {
			fv9OffenNum.add(Integer.parseInt(fv9FreigSollNum.get(i)) - Integer.parseInt(fv9FreiglstNum.get(i)));
		}
	}
	%>
	<%!
	
	public static String getAnzahl(String anzahl) {
		if (!"0".equals(anzahl) && !"".equals(anzahl)) {
			return "<tr><td>Anzahl</td><td>&nbsp;=&nbsp;</td><td>" + anzahl + "</td></tr>";
		} else {
			return "<tr><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;</td><td>&nbsp;</td></tr>";
		}
	}
	%>
</head>
<body>
	<div id="container">
		<div id="nr">
		<div id="top">
			<div class="fl"><%=status_left %></div>
			<div class="fr"><%=status_right %></div>
			<h1>
				<%=title %>
				<span style="font-size: 16px;">
					<a href="javascript:changeChinese()" id="german">C</a>
					<a href="javascript:changeGerman()" id="china" style="display: none;">D</a>
				</span>
			</h1>
		</div>
		<div id="content">
			<div id="datatable1" style="font-size:15px; margin: 30px 30px auto;">
				<table width="100%" cellspacing="2" rules="rows" >
					<tr style="border-bottom:2px solid #333333;font-weight:bold;">
						<td>&nbsp;</td>
						<td>Kennzahlen</td>
						<td>Bemerkung</td>	
					</tr>
					<%
					if (fv9FreigabeStyle != null && fv9FreigabeStyle.size() > 0) {
						for(int i=0; i<fv9FreigabeStyle.size(); i++) {
							String imagePath = request.getContextPath() + "/app/pep/images/";	
							if ("红".equals(fv9FreigabeStatus.get(i))) {
								imagePath += "light_red.jpg";
							}
							if ("黄".equals(fv9FreigabeStatus.get(i))) {
								imagePath += "light_yellow.jpg";
							}
							if ("绿".equals(fv9FreigabeStatus.get(i))) {
								imagePath += "light_green.jpg";
							}
					%>
					<tr border="2" border-collapse: collapse" bordercolor="#333333">
						<td width="30%" style="font-weight:bold; font-size: 15px;">
							<%=fv9FreigabeStyle.get(i) %>
							<img src="<%=imagePath %>" align="right" border=0 width=50 height=56 style="margin-right:50px"> 
						</td>
						<td width="22%">
							<table style="padding:5px; font-size: 14px;" >
								<%=getAnzahl(fv9AnzahlNum.get(i)) %>
								<tr><td>Soll</td><td>&nbsp;=&nbsp;</td><td><%=fv9FreigSollNum.get(i) %></td></tr>
								<tr><td>Ist</td><td>&nbsp;=&nbsp;</td><td><%=fv9FreiglstNum.get(i) %></td></tr>
								<tr><td>offen</td><td>&nbsp;=&nbsp;</td><td><%=fv9OffenNum.get(i)%></td></tr>
							</table>
						</td>
						<td width="48%" style="font-size: 14px; vertical-align: top;">
							<%= Web.replaceSpecial(fv9FreigCom_GM.get(i))%>
						</td>
					</tr>
					<%		
						}
					}
					%>
					<tr></tr>
				</table>
			</div>
			<div id="datatable2" style="font-size:15px; margin: 30px 30px auto; display: none;">
				<table width="100%" cellspacing="2" rules="rows" >
					<tr style="border-bottom:2px solid #333333;font-weight:bold;">
						<td>&nbsp;</td>
						<td>认可数量</td>
						<td>认可描述</td>	
					</tr>
					<%
					if (fv9FreigabeStyle != null && fv9FreigabeStyle.size() > 0) {
						for(int i=0; i<fv9FreigabeStyle.size(); i++) {
							String imagePath = request.getContextPath() + "/app/pep/images/";	
							if ("红".equals(fv9FreigabeStatus.get(i))) {
								imagePath += "light_red.jpg";
							}
							if ("黄".equals(fv9FreigabeStatus.get(i))) {
								imagePath += "light_yellow.jpg";
							}
							if ("绿".equals(fv9FreigabeStatus.get(i))) {
								imagePath += "light_green.jpg";
							}
					%>
					<tr border="2" border-collapse: collapse" bordercolor="#333333">
						<td width="30%" style="font-weight:bold; font-size: 15px;">
							<%=fv9FreigabeStyle.get(i) %>
							<img src="<%=imagePath %>" align="right" border=0 width=50 height=56 style="margin-right:50px"> 
						</td>
						<td width="22%">
							<table style="padding:5px; font-size: 14px;">
								<%=getAnzahl(fv9AnzahlNum.get(i)) %>
								<tr><td>Soll</td><td>&nbsp;=&nbsp;</td><td><%=fv9FreigSollNum.get(i) %></td></tr>
								<tr><td>Ist</td><td>&nbsp;=&nbsp;</td><td><%=fv9FreiglstNum.get(i) %></td></tr>
								<tr><td>offen</td><td>&nbsp;=&nbsp;</td><td><%=fv9OffenNum.get(i)%></td></tr>
							</table>
						</td>
						<td  width="48%" style="font-size: 14px; vertical-align: top;">
							<%= Web.replaceSpecial(fv9FreigCom_CN.get(i))%>
						</td>
					</tr>
					<%		
						}
					}
					%>
					<tr></tr>
				</table>
			</div>
		</div>
		
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>