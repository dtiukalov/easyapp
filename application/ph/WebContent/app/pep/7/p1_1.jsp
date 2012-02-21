<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<%
		Map form = (Map)request.getAttribute("form");
		String milepost = (String)request.getSession().getAttribute("milepost");
		String fv9ProjectStatus = (String) form.get("fv9FunktionStatus");
	
		String fv9ProductstandStatus = (String) form.get("fv9ProductstandStatus");
		String fv9ProdStatusCom = (String) form.get("fv9ProdStatusCom");
		
		String fv9FunktionStatus =(String) form.get("fv9FunktionStatus");
		String fv9FunktionCom = (String) form.get("fv9FunktionCom");
		
		String fv9ProduktionStatus = (String) form.get("fv9ProduktionStatus");
		String fv9ProduktionCom =  (String) form.get("fv9ProduktionCom");
		
		String fv9BeschaffStatus = (String) form.get("fv9BeschaffStatus");
		String fv9BeschaffCom =  (String) form.get("fv9BeschaffCom");
		
		String fv9QualitStatus = (String) form.get("fv9QualitStatus");
		String fv9QualitCom =  (String) form.get("fv9QualitCom");
		
		String fv9VertriebStatus = (String) form.get("fv9VertriebStatus");
		String fv9VertriebCom =  (String) form.get("fv9VertriebCom");
		
		String fv9FinanzenStatus = (String) form.get("fv9FinanzenStatus");
		String fv9FinanzenCom =  (String) form.get("fv9FinanzenCom");
		
		String fv9GewichtStatus =  (String) form.get("fv9GewichtStatus");
		String fv9GewichtCom =  (String) form.get("fv9GewichtCom");
		
		String fv9DokuStatus = (String) form.get("fv9DokuStatus");
		String fv9DokuCom = (String) form.get("fv9DokuCom");
		
		String fv9TermineStatus = (String) form.get("fv9TermineStatus");
		String fv9TermineCom =  (String) form.get("fv9TermineCom");
	%>
</head>
<body>
<div id="container" style="font-size:12px;padding:10px">
	<div id="nr">
	<div id="top" >
		<div style="width: 80%;float: left;margin: 0 auto;"><h1><%=title %></h1></div>
		
		<div style="width: 20%;float: left;margin: 0 auto; text-align: right;">
   			<% if(fv9ProjectStatus.equals("绿")){%>
		    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="16" height="45" />
		    <%} else if(fv9ProjectStatus.equals("黄")){%>
		    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="16" height="45" />	
		   	<%} else if(fv9ProjectStatus.equals("红")){%>
			   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="16" height="45" /> 
		   	<%}%>
		   	<%=milepost %>
   		</div>
	</div>
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
 		</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
