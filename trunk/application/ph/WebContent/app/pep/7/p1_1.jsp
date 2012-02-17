<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/app/pep/include/header.jsp"%>
<%
	title = "7.1 Reifegradspiegel";
	Map form = (Map)request.getAttribute("form");
	String fv9ProjectStatus = "";

	String fv9ProductstandStatus = (String) form.get("fv9ProductstandStatus");//"绿";  
	out.println("111" + fv9ProductstandStatus);
	String fv9ProdStatusCom = "- DMU von 1.6L MQ200、AQ250 in KW46/11 abgenommen- DMU von 1.4T MQ250、DQ200 in KW49/11 abgenommen- Versuch Gsmt-fzg. planmäßig im Ablauf, aktuell keine Funktionsfehler ";
	// (String) form.get("fv9ProdStatusCom");
	//假数据
	String fv9FunktionStatus = "绿";// (String) form.get("fv9FunktionStatus");
	String fv9FunktionCom = "- HT-Wzg können die VFF-Produktion erfüllen- Umbau der Anlagen von Karosseriebau und Montage ist zum Frühlingsfest geplant, sie können die Produktion von VFF II erfüllen- Die Lackierung sind mehrere Standorte betroffen, Einarbeitungsplan ist in Erstellung";
	// (String) form.get("fv9FunktionCom");
	//假数据
	String fv9ProduktionStatus = "黄";// (String) form.get("fv9ProduktionStatus");
	String fv9ProduktionCom = "- HT-Wzg können die VFF-Produktion erfüllen- Umbau der Anlagen von Karosseriebau und Montage ist zum Frühlingsfest geplant, sie können die Produktion von VFF II erfüllen- Die Lackierung sind mehrere Standorte betroffen, Einarbeitungsplan ist in Erstellung";
	// (String) form.get("fv9ProduktionCom");
	//假数据
	String fv9BeschaffStatus = "红";// (String) form.get("fv9BeschaffStatus");
	String fv9BeschaffCom = "- Alle Teile zu VFF verfügbar - I-Tafel, Miko, TVKL, Sitze sind terminkritisch";
	// (String) form.get("fv9BeschaffCom");
	//假数据
	String fv9QualitStatus = "红";// (String) form.get("fv9QualitStatus");
	String fv9QualitCom = "- B-Frei-Termin Interieur drei Wochen verspätet als Plan- I-Tafel, MiKo, TVK und Sitze sind zum 0S keine Note 3.";
	// (String) form.get("fv9QualitCom");
	//假数据
	String fv9VertriebStatus = "绿";// (String) form.get("fv9VertriebStatus");
	String fv9VertriebCom = "- Volumen, Preis, MIX sind auf Basis PR60.1- Markt Clinic ist in KW07/12 geplant";
	// (String) form.get("fv9VertriebCom");
	//假数据
	String fv9FinanzenStatus = "黄";// (String) form.get("fv9FinanzenStatus");
	String fv9FinanzenCom = "- Das KPE Ø-Palette zu SOP+1 betraegt 12.3%.- Die Kapitalrendite liegt bei 63.8% (JV-Ebene).";
	// (String) form.get("fv9FinanzenCom");
	//假数据
	String fv9GewichtStatus = "绿";// (String) form.get("fv9GewichtStatus");
	String fv9GewichtCom = "- Leergewicht und CO2- Emissionen liegen im Soll";
	// (String) form.get("fv9GewichtCom");
	//假数据
	String fv9DokuStatus = "黄";// (String) form.get("fv9DokuStatus");
	String fv9DokuCom = "Die B-Freigaben sind in KW 41/2011 abgeschlossen, für 307-Bauteile sind die Zeichnungen in Pflege- BMG/OTS Plan wurde erstellt, davon 9 Bauteile vor 0S nicht BMG-frei möglich";
	// (String) form.get("fv9DokuCom");
	//假数据
	String fv9TermineStatus = "黄";// (String) form.get("fv9TermineStatus");
	String fv9TermineCom = "- VFF KW05/12;PVS KW13/12;SOP: KW38/12.";
	// (String) form.get("fv9TermineCom");
	//假数据
%>

<head>
<title><%=title %></title>
</head>

<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1><%=title %></h1></div>
    <div id="content">
     <div class="laguage">
    	<p>
    		<a href='p1_1_1.jsp'>中文</a>
    	</p>
    </div>
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				  <tr>
				    <td width="350" class="pg">&nbsp;</td>
				    <td width="633" class="pg"></td>
				  </tr>
				  
				  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Produktstand</h2></td>
							    <td>
							    <% if(fv9ProductstandStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9FunktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9FunktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
							   	</td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
				    		<%=fv9ProdStatusCom%>
						</div>
					</td>
				  </tr>
				  
				  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
					    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
							  <tr>
							    <td valign="top"><h2>Funktionserfüllung</h2></td>
							    <td>
							    <% if(fv9FunktionStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9FunktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9FunktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
							    </td>
							  </tr>
						</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
				    		<%=fv9FunktionCom %>
						</div>
					</td>
				  </tr>
				  
				  	  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Produktion/ <br />Standardisierung</h2></td>
						    <td>
						    	<% if(fv9ProduktionStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9ProduktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9ProduktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
				    	<%=fv9ProduktionCom%>
						</div>
					</td>
				  </tr>
				  
				  	  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Beschaffung</h2></td>
						    <td>
						    	<% if(fv9BeschaffStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9BeschaffStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9BeschaffStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
				    	<%=fv9BeschaffCom %>
						</div>
					</td>
				  </tr>
				  
				  	  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Qualität</h2></td>
						    <td>
						    	<% if(fv9QualitStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9QualitStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9QualitStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
							<%=fv9QualitCom%>
						</div>
					</td>
				  </tr>
				  
				  	  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Vertrieb/Markt</h2></td>
						    <td>
						    <% if(fv9VertriebStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9VertriebStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9VertriebStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
							<%=fv9VertriebCom %>
						</div>
					</td>
				  </tr>
				  
				  	  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Finanzen</h2></td>
						    <td>
						    <% if(fv9FinanzenStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9FinanzenStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9FinanzenStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
				    		<%=fv9FinanzenCom%>
						</div>
					</td>
				  </tr>
				  
				  	  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Gewicht/CO2</h2></td>
						    <td>
						    <% if(fv9GewichtStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9GewichtStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9GewichtStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
							<%=fv9GewichtCom %>	
						</div>
					</td>
				  </tr>
				  
				  	  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Doku/Freigaben</h2></td>
						    <td>
						    <% if(fv9DokuStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9DokuStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9DokuStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
							<%=fv9DokuCom %>
						</div>
					</td>
				  </tr>
				  
				  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
						  <tr>
						    <td valign="top"><h2>Termine/Orga</h2></td>
						    <td>
						    <% if(fv9TermineStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="8" height="20" />
							    <%} else if(fv9TermineStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="8" height="20" />	
							   	<%} else if(fv9TermineStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="8" height="20" /> 
							   	<%}%>
						    </td>
						  </tr>	
					</table>
					</td>
				    <td valign="top" class="pgpg" style="width:70%;">
				    	<div class="tbnrr">
							<%=fv9TermineCom %>
						</div>
					</td>
				  </tr>
				 
			</table>
 		
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
