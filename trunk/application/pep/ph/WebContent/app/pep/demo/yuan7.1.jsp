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
		String milepost = "";
	
		if(request.getSession().getAttribute("milepost") != null){
			milepost = (String)request.getSession().getAttribute("milepost");
		}
		
		String fv9ProjectStatus = "";
		if(form.get("fv9FunktionStatus") != null){
			fv9ProjectStatus = (String) form.get("fv9FunktionStatus");
		}
		String fv9ProductstandStatus = "";
		if(form.get("fv9ProductstandStatus") != null){
			 fv9ProductstandStatus = (String) form.get("fv9ProductstandStatus");
		}
		String fv9ProdStatusCom = "";
		if(form.get("fv9ProdStatusCom") != null){
		 	 fv9ProdStatusCom = (String) form.get("fv9ProdStatusCom");
		}
		String fv9ProdStatusComC = "";
		if(form.get("fv9ProdStatusComC") != null){		
			 fv9ProdStatusComC = (String) form.get("fv9ProdStatusComC");
		}
		String fv9FunktionStatus ="";
		if(form.get("fv9FunktionStatus") != null){		
			 fv9FunktionStatus =(String) form.get("fv9FunktionStatus");
		}
		String fv9FunktionCom = "";
		if(form.get("fv9FunktionCom") != null){		
			 fv9FunktionCom = (String) form.get("fv9FunktionCom");
		}
		String fv9FunktionComC = "";
		if(form.get("fv9FunktionComC") != null){	
			 fv9FunktionComC = (String) form.get("fv9FunktionComC");
		}
		String fv9ProduktionStatus ="";
		if(form.get("fv9ProduktionStatus") != null){	
			 fv9ProduktionStatus = (String) form.get("fv9ProduktionStatus");
		}
		String fv9ProduktionCom = "";
		if(form.get("fv9ProduktionCom") != null){	
			 fv9ProduktionCom =  (String) form.get("fv9ProduktionCom");
		}
		String fv9ProduktionComC = "";
		if(form.get("fv9ProduktionComC") != null){	
			 fv9ProduktionComC =  (String) form.get("fv9ProduktionComC");
		}
		String fv9BeschaffStatus ="";
		if(form.get("fv9BeschaffStatus") != null){	
			 fv9BeschaffStatus = (String) form.get("fv9BeschaffStatus");
		}
		String fv9BeschaffCom ="";
		if(form.get("fv9BeschaffCom") != null){	
			 fv9BeschaffCom =  (String) form.get("fv9BeschaffCom");
		}
		String fv9BeschaffComC ="";
		if(form.get("fv9BeschaffComC") != null){	
			 fv9BeschaffComC =  (String) form.get("fv9BeschaffComC");
		}
		String fv9QualitStatus = "";
		if(form.get("fv9QualitStatus") != null){	
			 fv9QualitStatus = (String) form.get("fv9QualitStatus");
		}
		String fv9QualitCom = "";
		if(form.get("fv9QualitCom") != null){	
			 fv9QualitCom =  (String) form.get("fv9QualitCom");
		}
		String fv9QualitComC ="";
		if(form.get("fv9QualitComC") != null){	
			 fv9QualitComC =  (String) form.get("fv9QualitComC");
		}
		String fv9VertriebStatus ="";
		if(form.get("fv9VertriebStatus") != null){	
			 fv9VertriebStatus = (String) form.get("fv9VertriebStatus");
		}
		String fv9VertriebCom = "";
		if(form.get("fv9VertriebCom") != null){	
			 fv9VertriebCom =  (String) form.get("fv9VertriebCom");
		}
		String fv9VertriebComC ="";
		if(form.get("fv9VertriebComC") != null){	
			 fv9VertriebComC =  (String) form.get("fv9VertriebComC");
		}
		String fv9FinanzenStatus = "";
		if(form.get("fv9FinanzenStatus") != null){	
			 fv9FinanzenStatus = (String) form.get("fv9FinanzenStatus");
		}
		String fv9FinanzenCom ="";
		if(form.get("fv9FinanzenCom") != null){	
			 fv9FinanzenCom =  (String) form.get("fv9FinanzenCom");
		}
		String fv9FinanzenComC ="";
		if(form.get("fv9FinanzenComC") != null){	
			 fv9FinanzenComC =  (String) form.get("fv9FinanzenComC");
		}
		String fv9GewichtStatus = "";
		if(form.get("fv9GewichtStatus") != null){	
			 fv9GewichtStatus =  (String) form.get("fv9GewichtStatus");
		}
		String fv9GewichtCom ="";
		if(form.get("fv9GewichtCom") != null){	
			 fv9GewichtCom =  (String) form.get("fv9GewichtCom");
		}
		String fv9GewichtComC ="";
		if(form.get("fv9GewichtComC") != null){	
			 fv9GewichtComC =  (String) form.get("fv9GewichtComC");
		}
		String fv9DokuStatus ="";
		if(form.get("fv9DokuStatus") != null){	
			 fv9DokuStatus = (String) form.get("fv9DokuStatus");
		}
		String fv9DokuCom = "";
		if(form.get("fv9DokuCom") != null){	
			 fv9DokuCom = (String) form.get("fv9DokuCom");
		}
		String fv9DokuComC = "";
		if(form.get("fv9DokuComC") != null){	
			 fv9DokuComC = (String) form.get("fv9DokuComC");
		}
		String fv9TermineStatus ="";
		if(form.get("fv9TermineStatus") != null){	
			 fv9TermineStatus = (String) form.get("fv9TermineStatus");
		}
		String fv9TermineCom = "";
		if(form.get("fv9TermineCom") != null){	
			 fv9TermineCom =  (String) form.get("fv9TermineCom");
		}
		String fv9TermineComC = "";
		if(form.get("fv9TermineComC") != null){	
			 fv9TermineComC = (String) form.get("fv9TermineComC");
		}
		
	%>
</head>
<body>
<div id="container" style="font-size:12px;">
	<div id="nr">
	<div id="top" >
		<div class="fl"><%=status_left %></div>
		<div class="fr"><%=status_right %></div>
		<h1><%=title %></h1>
		<div style="width: 20%;float: right;margin: -45px auto; text-align: left;">
   			<% if(fv9ProjectStatus.equals("绿")){%>
		    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40" />
		    <%} else if(fv9ProjectStatus.equals("黄")){%>
		    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40" />	
		   	<%} else if(fv9ProjectStatus.equals("红")){%>
			   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40" /> 
		   	<%}%>
		   	<%=milepost %>
   		</div>
	</div>
    <div id="content" style="height:590px;margin:6px auto;">
   		<div id="german">
			<input type="button" class="china" onclick="changeChinese()" />
		</div>
     	 <div id="datatable1" style="margin:0 60px;">
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				  <tr>
				    <td width="350" class="pg">&nbsp;</td>
				    <td width="633" class="pg"></td>
				  </tr>
				  
				  <tr>
				    <td valign="top" class="pgpg" style="width:30%;">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Produktstand</h2></td>
							    <td>
							    <% if(fv9ProductstandStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40" />
							    <%} else if(fv9FunktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9FunktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    <td valign="top" class="pgpg" style="width:30%;">
				    
					    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
							  <tr>
							    <td valign="top"><h2>Funktionserfüllung</h2></td>
							    <td>
							    <% if(fv9FunktionStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9FunktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9FunktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    <td valign="top" class="pgpg" style="width:30%;height: 45px;">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Produktion/ <br />Standardisierung</h2></td>
						    <td>
						    	<% if(fv9ProduktionStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9ProduktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9ProduktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Beschaffung</h2></td>
						    <td>
						    	<% if(fv9BeschaffStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9BeschaffStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9BeschaffStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Qualität</h2></td>
						    <td>
						    	<% if(fv9QualitStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9QualitStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9QualitStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Vertrieb/Markt</h2></td>
						    <td>
						    <% if(fv9VertriebStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9VertriebStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9VertriebStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Finanzen</h2></td>
						    <td>
						    <% if(fv9FinanzenStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9FinanzenStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9FinanzenStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Gewicht/CO2</h2></td>
						    <td>
						    <% if(fv9GewichtStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9GewichtStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9GewichtStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Doku/Freigaben</h2></td>
						    <td>
						    <% if(fv9DokuStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9DokuStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9DokuStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Termine/Orga</h2></td>
						    <td>
						    <% if(fv9TermineStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9TermineStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9TermineStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
			
			<div id="china" style="display: none;">
				<input type="button" class="german" onclick="changeGerman()"/>
			</div>
			<div id="datatable2" style="margin:0 60px; display: none;">
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				  <tr>
				    <td width="350" class="pg">&nbsp;</td>
				    <td width="633" class="pg"></td>
				  </tr>
				  
				  <tr>
				    <td valign="top" class="pgpg" style="width:30%">
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Produktstand</h2></td>
							    <td>
							    <% if(fv9ProductstandStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9FunktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9FunktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
					    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
							  <tr>
							    <td valign="top"><h2>Funktionserfüllung</h2></td>
							    <td>
							    <% if(fv9FunktionStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9FunktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9FunktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Produktion/ <br />Standardisierung</h2></td>
						    <td>
						    	<% if(fv9ProduktionStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9ProduktionStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9ProduktionStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Beschaffung</h2></td>
						    <td>
						    	<% if(fv9BeschaffStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9BeschaffStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9BeschaffStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Qualität</h2></td>
						    <td>
						    	<% if(fv9QualitStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9QualitStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9QualitStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Vertrieb/Markt</h2></td>
						    <td>
						    <% if(fv9VertriebStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9VertriebStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9VertriebStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Finanzen</h2></td>
						    <td>
						    <% if(fv9FinanzenStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9FinanzenStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9FinanzenStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Gewicht/CO2</h2></td>
						    <td>
						    <% if(fv9GewichtStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40"  />
							    <%} else if(fv9GewichtStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40"  />	
							   	<%} else if(fv9GewichtStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40"  /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Doku/Freigaben</h2></td>
						    <td>
						    <% if(fv9DokuStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40" />
							    <%} else if(fv9DokuStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40" />	
							   	<%} else if(fv9DokuStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40" /> 
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
				    
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0;">
						  <tr>
						    <td valign="top"><h2>Termine/Orga</h2></td>
						    <td>
						    <% if(fv9TermineStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="16" height="40" />
							    <%} else if(fv9TermineStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="16" height="40" />	
							   	<%} else if(fv9TermineStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="16" height="40" /> 
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
			</div>
 		</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
