<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/app/pep/include/header.jsp"%>
</head>
<%
		Map form = (Map)request.getAttribute("form");
out.print(Web.getStrListStr(form.get("fv9KarosserStyle")));
out.print(Web.getNumberListStr(form.get("fv9KarosserStatus")));
out.print(Web.getStrListStr(form.get("fv9KarossStatusCom")));
out.print(Web.getNumberListStr(form.get("fv9KarossStatusMab")));
		String[] fv9KarosserStyle = Web.getStrListStr(form.get("fv9KarosserStyle")).split(",");
		String[] fv9KarosserStatus = Web.getNumberListStr(form.get("fv9KarosserStatus")).split(",");
		String[] fv9KarossStatusCom = Web.getStrListStr(form.get("fv9KarossStatusCom")).split(",");
		String[] fv9KarossStatusMab = Web.getNumberListStr(form.get("fv9KarossStatusMab")).split(",");
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		
		for(int i=0; i<fv9KarosserStyle.length; i++){
			Map<String,String> map = new HashMap<String,String>();
			map.put("fv9KarosserStyle",fv9KarosserStyle[i]);
			map.put("fv9KarosserStatus",fv9KarosserStatus[i]);
			map.put("fv9KarossStatusCom",fv9KarossStatusCom[i]);
			map.put("fv9KarossStatusMab",fv9KarossStatusMab[i]);
			list.add(map);
		}
%>
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
		  if(list != null){
			  for(int j=0; j<list.size(); j++){
				  Map<String,String> value = new HashMap<String,String>();
			  %>
			  <tr>
			    <td valign="top" class="pgpg" style="width:239px;">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					  <tr>
			   			 <td valign="top"><h2><%=value.get("fv9KarosserStyle") %></h2></td>
					   	 <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg"><div class="tbnrr"><%=value.get("fv9KarossStatusCom")  %>
				   </div>
			    </td>
	   			 <td valign="top" class="pgpg"><div class="tbnrr"><%=value.get("fv9KarossStatusMab")  %></div>
				</td>
		</tr>
			  <%
			  }
		  }
		  %>
		<tr>
			    <td valign="top" class="pgpg" style="width:239px;">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					  <tr>
			   			 <td valign="top"><h2>Unterbau I </h2></td>
					   	 <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg"><div class="tbnrr">合同已签订，设备清单已完成,<br />
				  设备正在制造中; <br />
				  Vertrag schon unterschrieben， Anlageliste fertig,  <br />
				   Anlagen sind in Prozess der Bearbeitungen.
				   </div>
			    </td>
	   			 <td valign="top" class="pgpg"><div class="tbnrr"></div>
				</td>
		</tr>
		
		<tr>
			    <td valign="top" class="pgpg">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					      <tr>
					        <td valign="top"><h2>Unterbau II</h2></td>
					        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
					      </tr>
			    	</table>
			    </td>
		    	<td valign="top" class="pgpg"><div class="tbnrr">合同已签订，设备清单已完成,<br />
				  设备正在制造中; <br />
				  Vertrag schon unterschrieben， Anlageliste fertig,  <br />
				   Anlagen sind in Prozess der Bearbeitungen.</div></td>
		    	<td valign="top" class="pgpg"><div class="tbnrr"></div></td>
		</tr>
		
		<tr>
		    <td valign="top" class="pgpg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Seitenteil</h2></td>
			        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
			      </tr>
			    </table></td>
		    <td valign="top" class="pgpg"><div class="tbnrr">合同已签订，设备清单已完成,<br />
				  设备正在制造中; <br />
				  Vertrag schon unterschrieben， Anlageliste fertig,  <br />
				   Anlagen sind in Prozess der Bearbeitungen.</div></td>
		    <td valign="top" class="pgpg"><div class="tbnrr">                                   	    
		    </div></td>
		</tr>
		
		<tr>
		    <td valign="top" class="pgpg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Aufbau I, II, III</h2></td>
			        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
			      </tr>
			    </table>
		    </td>
		    <td valign="top" class="pgpg"><div class="tbnrr">合同已签订，设备清单已完成,<br />
				  设备正在制造中; <br />
				  Vertrag schon unterschrieben， Anlageliste fertig,  <br />
				   Anlagen sind in Prozess der Bearbeitungen.</div></td>
		    <td valign="top" class="pgpg"><div class="tbnrr"></div></td>
		</tr>
		
		<tr>
		    <td valign="top" class="pg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Anbauteile1</h2></td>
			        <td><img src="<%=request.getContextPath()%>/app/pep/images/hong.jpg" width="30" height="70" /></td>
			      </tr>
			    </table>
		    </td>
		    <td valign="top" class="pg"><div class="tbnrr">合同已签订，设备清单已完成,<br />
				  设备正在制造中;压合设备预计KW07/12到货 <br />
				   Vertrag schon unterschrieben， Anlageliste fertig, Anlagen sind in Prozess der Bearbeitungen,<br />
				   Falzanlagen vor Ort im KW07/12</div></td>
		    <td valign="top" class="pg"><div class="tbnrr">1.采用滚边压合的方法生产阶段装车所需的前后盖总成；
Fertigung Zsb FK/HK fuer VFF mit Methoden Roboter-Rollfalzen<br />2.压缩供应商运输周期,确保压合设备KW07/12到达现场； 
Verkuerzen der Transportzeit von Lieferant, um die Falzanlagen in KW07/12 in vor Ort sicherzustellen 

		    </td>
		</tr>
		
	</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
