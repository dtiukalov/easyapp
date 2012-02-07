<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/app/pep/include/header.jsp"%>
</head>

<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1>3.1 Prüfmittel, Meisterbock/Cubing</h1></div>
    <div id="content">
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
			   			 <td valign="top"><h2>PMP/FMK </h2></td>
					   	 <td><img src="<%=request.getContextPath()%>/app/pep/images/hong.jpg" width="30" height="70" /></td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Lieferungstermin von PMP wird von KW41 auf KW48 verschoben.<br />
				    <img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Vergabe von FMK kann PL nicht machen. 
				    </div>
			    </td>
	   			 <td valign="top" class="pgpg"><div class="tbnrr">FMK und Bearbeitung des Programmes werden von QA-MT parallel abgewickelt.</div>
				</td>
		</tr>
		<tr>
			    <td valign="top" class="pgpg">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					      <tr>
					        <td valign="top"><h2>Messauf-<br />
					          nahmen ET/ZSB</h2></td>
					        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
					      </tr>
			    	</table>
			    </td>
		    	<td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Vor KW36/11 wurde Aufnahme fuer Innenblech von Front-und Heckklappe geliefert, vor KW37 werden Aufnahmen fuer Aussenblech von Front-unf Heckklappe, Kotfluegel und ZSB. ZSB Aufnahme muss PMP abgenommen werden.</div></td>
		    	<td valign="top" class="pgpg"><div class="tbnrr"></div></td>
		</tr>
		<tr>
		    <td valign="top" class="pgpg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Messpro-<br />
			          gramm ET/ZSB</h2></td>
			        <td><img src="<%=request.getContextPath()%>/app/pep/images/hong.jpg" width="30" height="70" /></td>
			      </tr>
			    </table></td>
		    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;KW41 faengt Bearbeitung des Einzelteilsystems an, bis KW49 fertig; <br />
		 		<img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Weil Anlieferungstermin von PMP um 8 Wochen verzoegert, wird Termin von Bearbeitung des Messprogrammes verschoben, Massnahme liegt vor.</div></td>
		    <td valign="top" class="pgpg"><div class="tbnrr">QA vorzeitig startet Bearbeitung des Messprogrammes.</div></td>
		</tr>
		<tr>
		    <td valign="top" class="pgpg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Meisterbock<br /></h2></td>
			        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
			      </tr>
			    </table>
		    </td>
		    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;momentan in Verstellung, KW51 ist benutzbar</div></td>
		    <td valign="top" class="pgpg"><div class="tbnrr"></div></td>
		</tr>
		<tr>
		    <td valign="top" class="pg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Cubing</h2></td>
			        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
			      </tr>
			    </table>
		    </td>
		    <td valign="top" class="pg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Cubing Design war schon fertig, in KW47in Einsatz
		   </div></td>
		    <td valign="top" class="pg"><div class="tbnrr"></td>
		</tr>
	</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
