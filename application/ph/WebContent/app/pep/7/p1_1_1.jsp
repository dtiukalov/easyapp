<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<%
	Map form = (Map)request.getAttribute("form");
	String fv9ProductstandStatus = "绿";
	String fv9ProdStatusComC = "- DMU von 1.6L MQ200、AQ250 in KW46/11 abgenommen- DMU von 1.4T MQ250、DQ200 in KW49/11 abgenommen- Versuch Gsmt-fzg. planmäßig im Ablauf, aktuell keine Funktionsfehler ";
	
	String fv9FunktionStatus = "绿";
	String fv9FunktionComC = "- HT-Wzg können die VFF-Produktion erfüllen- Umbau der Anlagen von Karosseriebau und Montage ist zum Frühlingsfest geplant, sie können die Produktion von VFF II erfüllen- Die Lackierung sind mehrere Standorte betroffen, Einarbeitungsplan ist in Erstellung";
	
	String fv9ProduktionStatus = "黄";
	String fv9ProduktionComC = "- HT-Wzg können die VFF-Produktion erfüllen- Umbau der Anlagen von Karosseriebau und Montage ist zum Frühlingsfest geplant, sie können die Produktion von VFF II erfüllen- Die Lackierung sind mehrere Standorte betroffen, Einarbeitungsplan ist in Erstellung";
	
	String fv9BeschaffStatus = "红";
	String fv9BeschaffComC = "- Alle Teile zu VFF verfügbar - I-Tafel, Miko, TVKL, Sitze sind terminkritisch";
	
	String fv9QualitStatus = "红";
	String fv9QualitComC = "- B-Frei-Termin Interieur drei Wochen verspätet als Plan- I-Tafel, MiKo, TVK und Sitze sind zum 0S keine Note 3.";
	
	String fv9VertriebStatus = "绿";
	String fv9VertriebComC = "- Volumen, Preis, MIX sind auf Basis PR60.1- Markt Clinic ist in KW07/12 geplant";
	
	String fv9FinanzenStatus = "黄";
	String fv9FinanzenComC = "- Das KPE Ø-Palette zu SOP+1 betraegt 12.3%.- Die Kapitalrendite liegt bei 63.8% (JV-Ebene).";
	
	String fv9GewichtStatus = "绿";
	String fv9GewichtComC = "- Leergewicht und CO2- Emissionen liegen im Soll";
	
	String fv9DokuStatus = "黄";
	String fv9DokuComC = "Die B-Freigaben sind in KW 41/2011 abgeschlossen, für 307-Bauteile sind die Zeichnungen in Pflege- BMG/OTS Plan wurde erstellt, davon 9 Bauteile vor 0S nicht BMG-frei möglich";
	
	String fv9TermineStatus = "黄";
	String fv9TermineComC = "- VFF KW05/12;PVS KW13/12;SOP: KW38/12.";
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
    <div class="laguage">
    	<p>
    		<a href='p1_1.jsp'>德文</a>
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
			    <td valign="top"><h2>产品</h2></td>
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
	    		<%=fv9ProdStatusComC%>
			</div>
		</td>
	  </tr>
	  
	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
		    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
				  <tr>
				    <td valign="top"><h2>功能</h2></td>
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
	    		<%=fv9FunktionComC %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>生产</h2></td>
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
	    	<%=fv9ProduktionComC%>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>采购</h2></td>
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
	    	<%=fv9BeschaffComC %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>质保</h2></td>
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
				<%=fv9QualitComC%>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>销售</h2></td>
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
				<%=fv9VertriebComC %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>财务</h2></td>
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
	    		<%=fv9FinanzenComC%>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>CO2</h2></td>
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
				<%=fv9GewichtComC %>	
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>文件/认可</h2></td>
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
				<%=fv9DokuComC %>
			</div>
		</td>
	  </tr>
	  
	  	  <tr>
	    <td valign="top" class="pgpg" style="width:30%">
	    
	    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			  <tr>
			    <td valign="top"><h2>进度 </h2></td>
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
				<%=fv9TermineComC %>
			</div>
		</td>
	  </tr>
	 
</table>

    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
