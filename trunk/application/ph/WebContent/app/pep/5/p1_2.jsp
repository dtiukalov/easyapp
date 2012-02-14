<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<%
	Map form = (Map)request.getAttribute("form");	

	List<String> fv9KarosserStyle = new ArrayList<String>();//(List<String>)form.get("fv9KarosserStyle");
	List<String> fv9KarosserStatus = new ArrayList<String>();//(List<String>)form.get("fv9KarosserStatus");
	List<String> fv9KarossStatusCom = new ArrayList<String>();//(List<String>)form.get("fv9KarossStatusCom");
	List<String> fv9KarossStatusMab = new ArrayList<String>();//(List<String>)form.get("fv9KarossStatusMab");
	
	fv9KarosserStyle.add("Unterbau I ");
	fv9KarosserStyle.add("Unterbau II");
	fv9KarosserStyle.add("Seitenteil");
	fv9KarosserStyle.add("Aufbau I, II, III");
	fv9KarosserStyle.add("Anbauteile1");
	
	fv9KarosserStatus.add("绿");
	fv9KarosserStatus.add("绿");
	fv9KarosserStatus.add("绿");
	fv9KarosserStatus.add("绿");
	fv9KarosserStatus.add("黄");
	
	fv9KarossStatusCom.add("合同已签订，设备清单已完成,设备正在制造中;Vertrag schon unterschrieben， Anlageliste fertig,  Anlagen sind in Prozess der Bearbeitungen.");
	fv9KarossStatusCom.add("合同已签订，设备清单已完成,设备正在制造中;Vertrag schon unterschrieben， Anlageliste fertig,  Anlagen sind in Prozess der Bearbeitungen.");
	fv9KarossStatusCom.add("合同已签订，设备清单已完成,设备正在制造中;Vertrag schon unterschrieben， Anlageliste fertig,  Anlagen sind in Prozess der Bearbeitungen.");
	fv9KarossStatusCom.add("合同已签订，设备清单已完成,设备正在制造中;Vertrag schon unterschrieben， Anlageliste fertig,  Anlagen sind in Prozess der Bearbeitungen.");
	fv9KarossStatusCom.add("合同已签订，设备清单已完成,设备正在制造中;压合设备预计KW07/12到货Vertrag schon unterschrieben， Anlageliste fertig, Anlagen sind in Prozess der Bearbeitungen,Falzanlagen vor Ort im KW07/12");
	
	fv9KarossStatusMab.add("");
	fv9KarossStatusMab.add("");
	fv9KarossStatusMab.add("");
	fv9KarossStatusMab.add("");
	fv9KarossStatusMab.add("1.采用滚边压合的方法生产阶段装车所需的前后盖总成；Fertigung Zsb FK/HK fuer VFF mit Methoden Roboter-Rollfalzen2.压缩供应商运输周期,确保压合设备KW07/12到达现场； Verkuerzen der Transportzeit von Lieferant, um die Falzanlagen in KW07/12 in vor Ort sicherzustellen ");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/app/pep/include/header.jsp"%>
</head>

<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1>5.1 Status Karosseriebau</h1></div>
    <div id="content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		  <tr>
		    <td width="239" class="pg">&nbsp;</td>
		    <td width="311" class="pg"><h2>Status</h2></td>
		    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
		  </tr>
		  
		<%
		  for(int i=0; i<fv9KarosserStyle.size(); i++){
			  %>
			  <tr>
			    <td valign="top" class="pgpg" style="width:239px;">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					  <tr>
			   			 <td valign="top"><h2> <%= fv9KarosserStyle.get(i) %></h2></td>
					   	 <td>
					   	  <% if(fv9KarosserStatus.get(i).equals("绿")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9KarosserStatus.get(i).equals("黄")){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9KarosserStatus.get(i).equals("红")){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					   	 </td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg"><div class="tbnrr"><%=fv9KarossStatusCom.get(i) %></div>
			    </td>
	   			 <td valign="top" class="pgpg"><div class="tbnrr"><%=fv9KarossStatusMab.get(i) %></div>
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
