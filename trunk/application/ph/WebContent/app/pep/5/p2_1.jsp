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
	<div id="top"><h1>5.2 Logistikkonzept</h1></div>
    <div id="content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		  <tr>
		    <td width="239" class="pg">&nbsp;</td>
		    <td width="311" class="pg"><h2>Status 状态</h2></td>
		    <td width="433" class="pg"><h2>Nächste Schritte下一阶段</h2></td>
		  </tr>
		  
		<tr>
			    <td valign="top" class="pgpg" style="width:239px;">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					  <tr>
			   			 <td valign="top"><h2>Inbound<br />入厂物流</h2></td>
					   	 <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg"><div class="tbnrr">1.&nbsp;&nbsp;Inboundlogistik 入厂物流<br />
				  <img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Vorgaben fuer LKW Inbound erstellt; <br />
				  Grobplanung abgeschlossen卡车入厂物流路线起草；粗略规划已结束
				   </div>
			    </td>
	   			 <td valign="top" class="pgpg"><div class="tbnrr"></div>
				</td>
		</tr>
		
		<tr>
			    <td valign="top" class="pgpg">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					      <tr>
					        <td valign="top"><h2>Inhouse<br />工厂物流</h2></td>
					        <td><img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" /></td>
					      </tr>
			    	</table>
			    </td>
		    	<td valign="top" class="pgpg"><div class="tbnrr">1.&nbsp;&nbsp;Logistikplanung Karobau(Status gruen)焊装物流规划（绿灯）<br />
				  <img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Grobplanung in Arbeit 正在进行粗略规划<br />
				2.&nbsp;&nbsp; Logsitikplanung Montage(Status gelb)总装物流规划（绿灯）<br />
				   Planung in arbeit</div></td>
		    	<td valign="top" class="pgpg"><div class="tbnrr"></div></td>
		</tr>
		
		<tr>
		    <td valign="top" class="pgpg">
			    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
			      <tr>
			        <td valign="top"><h2>Behälter<br />器具</h2></td>
			        <td><img src="<%=request.getContextPath()%>/app/pep/images/hong.jpg" width="30" height="70" /></td>
			      </tr>
			    </table></td>
		    <td valign="top" class="pgpg"><div class="tbnrr">
		    <img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Beginn mit Planung der esten stufigen  Verpackung in KW50/11开始具体零件的详细包装规划
</div></td>
		    <td valign="top" class="pgpg">专用器具样件设计（KW06/12需有零件样件）<br />Design der Bemusterung des spezifischen Behaelter in KW06/12
		    <div class="tbnrr">                                   	    
		    </div></td>
		</tr>
				
	</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
