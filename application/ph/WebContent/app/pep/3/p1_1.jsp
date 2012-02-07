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
	    		<td valign="top" class="pgpg">
		    		<div class="tbnrr">
		    			<img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />
		    			&nbsp;&nbsp;PMP文件提供时间由KW41/11推迟到KW48/11;<br />
					    <img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />
					    &nbsp;&nbsp;FMK文件无法由规划部发包完成;
					</div>
			    </td>
	   			<td valign="top" class="pgpg">
	   				<div class="tbnrr">FMK与程序编辑工作由QA-MT同时进行</div>
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
		    	<td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;KW36/11提供前、后盖内板支架，KW37/11提供前、后盖外板、翼子板及总成支架，总成支架需要PMP验收</div></td>
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
		    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;KW41/11开始单件程序编辑，KW49/11完成；<br />
		 		<img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;由于PMP提供时间推迟8周，导致程序编辑完成时间推迟，已制定措施；</div></td>
		    <td valign="top" class="pgpg"><div class="tbnrr">质保部提前开展程序编辑工作</div></td>
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
		    <td valign="top" class="pgpg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;正在调试，KW52/11可用；</div></td>
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
		    <td valign="top" class="pg"><div class="tbnrr"><img src="<%=request.getContextPath()%>/app/pep/images/iecool_arrow_056.jpg" width="3" height="3" />&nbsp;&nbsp;Cubing设计已经结束，KW47/11可以使用</div></td>
		    <td valign="top" class="pg"><div class="tbnrr"></td>
		</tr>
	</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
