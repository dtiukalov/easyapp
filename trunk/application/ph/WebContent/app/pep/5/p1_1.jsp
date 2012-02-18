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
	//title = "5.1 Status Presswerk, Karosseriebau, Lack, Montage,Electric";
	Map form = (Map)request.getAttribute("form");

	String  fv9PressStatus = (String)form.get("fv9PressStatus");  //冲压状态 
	String 	fv9PressStCom_CN = (String)form.get("fv9PressStCom_CN"); //冲压状态备注
	String 	fv9PressStCom_GM = 	(String)form.get("fv9PressStCom_GM");// 冲压状态备注
	String 	fv9PressStMab_CN = (String)form.get("fv9PressStMab_CN"); //	冲压措施
	String 	fv9PressStMab_GM =(String)form.get("fv9PressStMab_GM"); //	冲压措施
	
	String 	fv9KarossStatus = (String)form.get("fv9KarossStatus"); //	焊装状态
	String 	fv9KarossStCom_CN = (String)form.get("fv9KarossStCom_CN"); 
	String 	fv9KarossStCom_GM = (String)form.get("fv9KarossStCom_GM"); 	//焊装状态备注
	String 	fv9KarossStMab_CN = (String)form.get("fv9KarossStMab_CN"); //	焊装措施
	String 	fv9KarossStMab_GM = (String)form.get("fv9KarossStMab_GM"); //焊装措施
	
	String 	fv9LackStatus = (String)form.get("fv9LackStatus"); 
	String 	fv9LackStCom_CN = (String)form.get("fv9LackStCom_CN"); 
	String 	fv9LackStCom_GM = (String)form.get("fv9LackStCom_GM"); 
	String 	fv9LackStMab_CN = (String)form.get("fv9LackStMab_CN"); 
	String 	fv9LackStMab_GM = (String)form.get("fv9LackStMab_GM"); 	
	
	String 	fv9MontStatus = (String)form.get("fv9MontStatus"); 
	String 	fv9MontStCom_CN = (String)form.get("fv9MontStCom_CN");// 总装状态备注
	String 	fv9MontStCom_GM = (String)form.get("fv9MontStCom_GM"); //总装状态备注
	String 	fv9MontStMab_CN = (String)form.get("fv9MontStMab_CN"); //总装措施
	String 	fv9MontStMab_GM = (String)form.get("fv9MontStMab_GM"); //总装措施
	
	String 	fv9ElectStatus = (String)form.get("fv9ElectStatus"); 
	String 	fv9ElectStCom_CN = (String)form.get("fv9ElectStCom_CN"); 
	String 	fv9ElectStCom_GM = (String)form.get("fv9ElectStCom_GM"); 
	String 	fv9ElectStMab_CN = (String)form.get("fv9ElectStMab_CN"); 
	String 	fv9ElectStMab_GM = (String)form.get("fv9ElectStMab_GM"); 
%>
<head>
<title><%=title %></title>
</head>
<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1><%=title %></h1></div>
    <div id="content" style="margin-top:20px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		  <tr>
		    <td width="239" class="pg">&nbsp;</td>
		    <td width="311" class="pg"><h2>Status</h2></td>
		    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
		  </tr>
		  
		<tr>
			    <td valign="top" class="pgpg" style="width:239px;">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					  <tr>
			   			 <td valign="top"><h2>Presswerk </h2></td>
					   	 <td>
					   	  <% if(fv9PressStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9PressStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9PressStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					   	 </td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg"><div class="tbnrr"><%=fv9PressStCom_CN %><br /><%=fv9PressStCom_GM %></div>
			    </td>
	   			 <td valign="top" class="pgpg"><div class="tbnrr"><%=fv9PressStMab_CN %><br /><%=fv9PressStMab_GM %></div>
				</td>
		</tr>
		
		<tr>
			    <td valign="top" class="pgpg">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					      <tr>
					        <td valign="top"><h2>Karosseriebau</h2></td>
					        <td>
					         <% if(fv9KarossStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9KarossStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9KarossStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					        </td>
					      </tr>
			    	</table>
			    </td>
		    	<td valign="top" class="pgpg"><div class="tbnrr"><%=fv9KarossStCom_CN %><br /><%=fv9KarossStCom_GM %></div></td>
		    	<td valign="top" class="pgpg"><div class="tbnrr"><%=fv9KarossStMab_CN %><br /><%=fv9KarossStMab_GM %></div></td>
		</tr>
		
		<tr>
		    <td valign="top" class="pgpg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Lack</h2></td>
			        <td>
			         <% if(fv9LackStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9LackStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9LackStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
			        </td>
			      </tr>
			    </table></td>
		    <td valign="top" class="pgpg"><div class="tbnrr"><%=fv9LackStCom_CN %><br /><%=fv9LackStCom_GM %></div></td>
		    <td valign="top" class="pgpg"><div class="tbnrr"><%=fv9LackStMab_CN %><br /><%=fv9LackStMab_GM %></div></td>
		</tr>
		
		<tr>
		    <td valign="top" class="pgpg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Montage</h2></td>
			        <td>
			         <% if(fv9MontStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9MontStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9MontStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
			        </td>
			      </tr>
			    </table>
		    </td>
		    <td valign="top" class="pgpg"><div class="tbnrr"><%=fv9MontStCom_CN %><br /><%=fv9MontStCom_GM %></div></td>
		    <td valign="top" class="pgpg"><div class="tbnrr"><%=fv9MontStMab_CN %><br /><%=fv9MontStMab_GM %></div></td>
		</tr>
		
		<tr>
		    <td valign="top" class="pg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Electric</h2></td>
			        <td>
			         <% if(fv9ElectStatus.equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9ElectStatus.equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9ElectStatus.equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
			        </td>
			      </tr>
			    </table>
		    </td>
		    <td valign="top" class="pg"><div class="tbnrr"><%=fv9ElectStCom_CN %><br /><%=fv9ElectStCom_GM %></div></td>
		    <td valign="top" class="pg"><div class="tbnrr"><%=fv9ElectStMab_CN %><br /><%=fv9ElectStMab_GM %></div></td>
		</tr>
	</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
