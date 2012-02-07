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
			Map values = new HashMap();
			Map map1 = new HashMap();
			Map map2 = new HashMap();
			Map map3 = new HashMap();
			Map map4 = new HashMap();
			Map map5 = new HashMap();
			
			List list11 = new ArrayList<String>(); list11.add("DMU von 1.61/MQ200 und 1.6K/AQ250 abgenommen.");list11.add("DMU von 1.4L/MQ200 und 1.4K/AQ250 abgenommen.");
			List list12 = new ArrayList<String>(); list12.add("");
			
			List list21 = new ArrayList<String>(); list21.add("Defrosterprobung am Fahrzugmit"); list21.add("Wasserrfurchfahrt von 1.4T i.O. in KW25/11.");
			List list22 = new ArrayList<String>(); list22.add("Stauberprobung Ergebnis in KW50/11.");
			
			List list31 = new ArrayList<String>();
			List list32 = new ArrayList<String>();
			
			List list41 = new ArrayList<String>();
			List list42 = new ArrayList<String>();
			
			List list51 = new ArrayList<String>();
			List list52 = new ArrayList<String>();
			
			map1.put("Aktueller Status", list11);
			map1.put("Nachste Status", list12);
			
			map2.put("Aktueller Status", list21);
			map2.put("Nachste Status", list22);
			
			map3.put("Aktueller Status", list31);
			map3.put("Nachste Status", list32);
			
			map4.put("Aktueller Status", list41);
			map4.put("Nachste Status", list42);
			
			map5.put("Aktueller Status", list51);
			map5.put("Nachste Status", list52);
			
			values.put("Geometris che Absicherung", map1);
			values.put("Gesamtfzg.-Erprobung", map2);
			values.put("Vorstellung SoFa/WiFa", map3);
			values.put("Fahrzeug-Dauerlauf", map4);
			values.put("Versychtrafer management", map5);
			
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
			        	Iterator it = values.entrySet().iterator();
			        	while (it.hasNext()) {
			        		Map.Entry value = (Map.Entry)it.next();
			        		
			        %>		
			        <tr>
			          <td width="19%">
				          <div class="kbg">
				          	<div class="he">
					          	<div class="wz"><h2><%=value.getKey() %></h2></div>
					          	<div class="tupian"><img src="../images/2012-01-17_125230.png" /></div>
					          	<div class="clear"></div>
					          </div>
				          </div>
			          </td>
			          <td width="81%" valign="top" class="xx"><table width="98%" border="0" cellspacing="2" cellpadding="0">
			            <tr>
			              <td height="25">
			              	<table width="98%" border="0" cellspacing="2" cellpadding="0">
					            <tr>
					              <td width="49%" height="25">
					              <%
					              	Map tempmap = (HashMap)value.getValue();
					              	List templist1 = (ArrayList)tempmap.get("Aktueller Status");
					              	List templist2 = (ArrayList)tempmap.get("Nachste Status");
					              	
					              	if (templist1 != null && templist1.size() > 0) {
					              		for(String temp : (List<String>)templist1) {
					              %>
					              		·<%=temp %><br />
					              <%		
					              		}
					              	} else {
					              %>
						           		&nbsp;
						          <%	
					              	}
					              %>
					              
					              </td>
					              <td width="51%" valign="top">
					               <%
					              	if (templist2 != null && templist2.size() > 0) {
					              		for(String temp : (List<String>)templist2) {
					              %>
					              		·<%=temp %><br />
					              <%		
					              		}
					              	} else {
					              %>
						           		&nbsp;
						          <%	
					              	}
					              %>
					              </td>
					            </tr>
					          </table>
			              </td>
			            </tr>
			          </table></td>
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
