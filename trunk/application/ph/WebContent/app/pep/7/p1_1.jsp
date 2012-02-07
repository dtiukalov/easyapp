<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<%
	Map<String, String> form = new HashMap<String, String>();//(Map<String, String>)request.getAttribute("form");

	form.put("fv9ProductstandStatus","Produktstand");
	form.put("fv9ProdStatusCom","- Ein Prototypfzg. auf MMD in KW42/11 als GFA-PVS-Standdarstellung- Es ist geplant, WIFA in KW03/12  als GFA-PVS-Abnahme darzustellen");
	
	form.put("fv9FunktionStatus","Funktionserfüllung");
	form.put("fv9FunktionCom","- DMU von 1.6L MQ200、AQ250 in KW46/11 abgenommen- DMU von 1.4T MQ250、DQ200 in KW49/11 abgenommen- Versuch Gsmt-fzg. planmäßig im Ablauf, aktuell keine Funktionsfehler ");
	
	form.put("fv9ProduktionStatus","Produktion/Standardisierung");
	form.put("fv9ProduktionCom","- HT-Wzg können die VFF-Produktion erfüllen- Umbau der Anlagen von Karosseriebau und Montage ist zum Frühlingsfest geplant, sie können die Produktion von VFF II erfüllen- Die Lackierung sind mehrere Standorte betroffen, Einarbeitungsplan ist in Erstellung");
	
	form.put("fv9BeschaffStatus","Beschaffung");
	form.put("fv9BeschaffCom","- Alle Teile zu VFF verfügbar - I-Tafel, Miko, TVKL, Sitze sind terminkritisch");
	
	form.put("fv9QualitStatus","Qualität");
	form.put("fv9QualitCom","- B-Frei-Termin Interieur drei Wochen verspätet als Plan- I-Tafel, MiKo, TVK und Sitze sind zum 0S keine Note 3.");
	
	form.put("fv9VertriebStatus","Vertrieb/Markt");
	form.put("fv9VertriebCom","- Volumen, Preis, MIX sind auf Basis PR60.1- Markt Clinic ist in KW07/12 geplant");
	
	form.put("fv9FinanzenStatus","Finanzen");
	form.put("fv9FinanzenCom","- Das KPE Ø-Palette zu SOP+1 betraegt 12.3%.- Die Kapitalrendite liegt bei 63.8% (JV-Ebene).");
	
	form.put("fv9GewichtStatus","Gewicht/CO2");
	form.put("fv9GewichtCom","- Leergewicht und CO2- Emissionen liegen im Soll");
	
	form.put("fv9DokuStatus","Doku/Freigaben");
	form.put("fv9DokuCom","Die B-Freigaben sind in KW 41/2011 abgeschlossen, für 307-Bauteile sind die Zeichnungen in Pflege- BMG/OTS Plan wurde erstellt, davon 9 Bauteile vor 0S nicht BMG-frei möglich");
	
	form.put("fv9TermineStatus","Termine/Orga");
	form.put("fv9TermineCom","- VFF KW05/12;PVS KW13/12;SOP: KW38/12.");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/app/pep/include/header.jsp"%>
</head>

<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1>7.1 Reifegradspiegel</h1></div>
    <div id="content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
	  <tr>
	    <td width="350" class="pg">&nbsp;</td>
	    <td width="633" class="pg"></td>
	  </tr>
	  
	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9ProductstandStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
	    		<%=form.get("fv9ProdStatusCom") %>
			</div>
		</td>
	  </tr>
	  
	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
		    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
				  <tr>
				    <td valign="top"><h2><%=form.get("fv9FunktionStatus") %></h2></td>
				    <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
				  </tr>
			</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
	    		<%=form.get("fv9FunktionCom") %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9ProduktionStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
	    	<%=form.get("fv9ProduktionCom") %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9BeschaffStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
	    	<%=form.get("fv9BeschaffCom") %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9QualitStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
				<%=form.get("fv9QualitCom") %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9VertriebStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
				<%=form.get("fv9VertriebCom") %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9FinanzenStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
	    		<%=form.get("fv9FinanzenCom") %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9GewichtStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
				<%=form.get("fv9GewichtCom") %>	
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9DokuStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
				<%=form.get("fv9DokuCom") %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2><%=form.get("fv9TermineStatus") %></h2></td>
			    <td><img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" /></td>
			  </tr>
		</table>
		</td>
	    <td valign="top" class="pgpg" style="width:70%;">
	    	<div class="tbnrr">
				<%=form.get("fv9TermineCom") %>
			</div>
		</td>
	  </tr>
	 
</table>
</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
