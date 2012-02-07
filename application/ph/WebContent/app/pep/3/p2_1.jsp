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
		<div id="top"><h1>3.2 Fugen und Radienplan</h1></div>
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
				    		<td valign="top"><h2>Fugen-/<br />Radienplan</h2></td>
				    		<td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
				  		</tr>
					</table>
				</td>
			    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;...</div></td>
			    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;...</div></td>
			  </tr>
			  
			  <tr>
			    <td valign="top" class="pgpg">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
				      <tr>
				        <td valign="top"><h2>Toleranzanalyse<br />( Gutanteile)</h2></td>
				        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
				      </tr>
				    </table>
				</td>
			    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;...</div></td>
			    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;...</div></td>
			  </tr>

			</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
