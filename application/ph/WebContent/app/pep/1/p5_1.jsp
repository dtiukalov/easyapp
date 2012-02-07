<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%
	Map<String, String> form = new HashMap<String, String>();//(Map<String, String>)request.getAttribute("form");
	form.put("fv9ReportMeil","ReportMeil");form.put("fv9ReportDept","ReportDept");
%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>1.5 Bauprogramm VFF</title>
	<%@ include file="/app/pep/include/header.jsp"%>

</head>

<body>
	<div id="container">
		<div id="nr">
		<div id="top"><h1>1.5  Bauprogramm VFF</h1>
		</div>
	    <div id="content">
	      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="db">
	        <tr>
	          <td class="x"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="xb">
	  <tr>
	    <td width="140">Stufe</td>
	    <td width="83">KW02/12</td>
	    <td width="83">KW03/12</td>
	    <td width="83">KW05/12</td>
	    <td width="83">KW06/12</td>
	    <td width="83">KW07/12</td>
	    <td width="83">KW08/12</td>
	    <td width="83">KW9/12</td>
	    <td width="83">KW10/12</td>
	    <td width="83">KW11/12</td>
	    <td width="83">KW12/12</td>
	  </tr>
	</table>
	</td>
	        </tr>
	        <tr>
	          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="line">
	              <tr>
	                <td width="140" rowspan="3" style="font-size:16px;"><span style="font-weight:bold; font-size:16px;">1</span>Fahrzeuge<br />
	                 &nbsp;&nbsp;Soll:7lst:<br />
	                 &nbsp;&nbsp;Karosserien<br />
	                 &nbsp;&nbsp;Soll:11 lst:</td>
	                <td width="85%" height="21" class="lst"><div class="lanse"></div></td>
	              </tr>
	              <tr>
	                <td height="21" class="lst"><div class="lansez"></div></td>
	              </tr>
	              <tr>
	                <td class="lst"><div class="lanses"></div><div class="lansess"></div><div class="clear"></div></td>
	              </tr>
	          </table></td>
	        </tr>
	        <tr>
	          <td valign="top"  class="x"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="line">
	            <tr>
	              <td width="140" rowspan="3" style="font-size:16px;"><span style="font-weight:bold; font-size:16px;">2</span>Fahrzeuge<br />
	                &nbsp;&nbsp;Soll:12lst:<br />
	                &nbsp;&nbsp;Karosserien<br />
	                &nbsp;&nbsp;Soll:7 lst:</td>
	              <td width="85%" height="21" class="lst"><div class="lansea"></div></td>
	            </tr>
	            <tr>
	              <td height="21" class="lst"><div class="lanseza"></div></td>
	            </tr>
	            <tr>
	              <td class="lst"><div class="lansesa"></div>
	                <div class="lansessa"></div>
	                <div class="clear"></div></td>
	            </tr>
	          </table></td>
	        </tr>
	      </table>
	    </div>
	    <table width="200" border="0" cellspacing="2" cellpadding="0">
	  <tr>
	    <td width="22"><img src="../images/karosseriebau.jpg" /></td>
	    <td width="98">Karosseriebau</td>
	    <td width="76"><img src="../images/montage.jpg" /></td>
	    <td width="104">Montage</td>
	  </tr>
	  <tr>
	    <td><img src="../images/lack.jpg" /></td>
	    <td>Lack</td>
	    <td><img src="../images/ubergabe.jpg" /></td>
	    <td><p>Übergabe</p></td>
	  </tr>
	</table>
	
	   <%@ include file="/app/pep/include/foot.jsp"%>
	    </div>
	</div>
</body>
</html>
