<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@page import="java.util.ArrayList"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>

	</head>
	<body>
		<%
			Map form = (Map)request.getAttribute("form");		
		
			List fv9ErprobStyle = new ArrayList(); //(List)form.get("fv9ErprobStyle");
			List fv9ErprobStatus = new ArrayList();  //(List)form.get("fv9ErprobStatus");
			List fv9ErprobStCom_GM = new ArrayList();  //(List)form.get("fv9ErprobStCom_GM");
			List fv9ErprobNachSch_GM = new ArrayList();  //(List)form.get("fv9ErprobNachSch_GM");
			
			fv9ErprobStyle.add("Geometris che Absicherung");
			fv9ErprobStyle.add("Gesamtfzg.-Erprobung");
			fv9ErprobStyle.add("Vorstellung SoFa/WiFa");
			fv9ErprobStyle.add("Fahrzeug-Dauerlauf");
			fv9ErprobStyle.add("Versychtrafer management");
			
			fv9ErprobStatus.add("绿");
			fv9ErprobStatus.add("黄");
			fv9ErprobStatus.add("黄");
			fv9ErprobStatus.add("绿");
			fv9ErprobStatus.add("绿");
			
			fv9ErprobStCom_GM.add("DMU von 1.61/MQ200 und 1.6K/AQ250 abgenommen.<br>DMU von 1.4L/MQ200 und 1.4K/AQ250 abgenommen.");
			fv9ErprobStCom_GM.add("Defrosterprobung am Fahrzugmit.<br>Wasserrfurchfahrt von 1.4T i.O. in KW25/11.<br>Stauberprobung Ergebnis in KW50/11.");
			fv9ErprobStCom_GM.add("Defrosterprobung am Fahrzugmit.<br>Wasserrfurchfahrt von 1.4T i.O. in KW25/11.<br>Stauberprobung Ergebnis in KW50/11.");
			fv9ErprobStCom_GM.add("Defrosterprobung am Fahrzugmit.<br>Wasserrfurchfahrt von 1.4T i.O. in KW25/11.<br>Stauberprobung Ergebnis in KW50/11.");
			fv9ErprobStCom_GM.add("Defrosterprobung am Fahrzugmit.<br>Wasserrfurchfahrt von 1.4T i.O. in KW25/11.<br>Stauberprobung Ergebnis in KW50/11.");
			
			fv9ErprobNachSch_GM.add("Stauberprobung Ergebnis in KW50/11.");
			fv9ErprobNachSch_GM.add("Stauberprobung Ergebnis in KW50/11.");
			fv9ErprobNachSch_GM.add("Stauberprobung Ergebnis in KW50/11.");
			fv9ErprobNachSch_GM.add("Stauberprobung Ergebnis in KW50/11.");
			fv9ErprobNachSch_GM.add("Stauberprobung Ergebnis in KW50/11.");
			
		%>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>2.2 Erprobung und Dauerlauf</h1></div>
			<div id="contentt">
				<table width="96%" border="0" cellspacing="5" cellpadding="0" class="ed">
			        <tr>
			        	<td width="19%">&nbsp;</td>
			        	<td width="81%"  style="border-bottom:1px solid #424242;">
				        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>
						            <td>Aktueller Status</td>
						            <td>Nachste Status</td>
					            </tr>
				            </table>
				        </td>
			        </tr>
			        <%
						if (fv9ErprobStyle != null && fv9ErprobStyle.size() >0) {
							for (int i=0; i<fv9ErprobStyle.size(); i++){
								String Style = (String)fv9ErprobStyle.get(i);
								String status = (String)fv9ErprobStatus.get(i);
								String stcom_gm = (String)fv9ErprobStCom_GM.get(i);
								String nachsch_gm = (String)fv9ErprobNachSch_GM.get(i);
					%>
					 <tr>
			          <td width="19%">
				          <div class="kbg">
				          	<div class="he">
					          	<div class="wz"><h2><%=Style %></h2></div>
					          	<div class="tupian">
					          	<%
					          	if ("红".equals(status)) {
					          	%>
					          		<img src="../images/red.png" />
					          	<%
					          	}
					          	if ("黄".equals(status)) {
					          	%>
					          		<img src="../images/yellow.png" />
					          	<%
						        }
					          	if ("绿".equals(status)) {
					          	%>
					          		<img src="../images/green.png" />
					          	<%
					          	}
					          	%>
					          	</div>
					          	<div class="clear"></div>
					          </div>
				          </div>
			          </td>
			          <td width="81%" valign="top" class="xx"><table width="98%" border="0" cellspacing="2" cellpadding="0">
			            <tr>
			              <td height="25">
			              	<table width="98%" border="0" cellspacing="2" cellpadding="0">
					            <tr>
					              <td width="49%" height="25"><%=stcom_gm %></td>
					              <td width="51%" valign="top"><%=nachsch_gm %></td>
					            </tr>
					          </table>
			              </td>
			            </tr>
			          </table></td>
			        </tr>
					<%
							}
						}
			        %>		
			       
			        
			      </table>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
