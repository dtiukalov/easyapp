<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<%
		List<String> fv9FugRadName = (List<String>)form.get("fv9FugRadName"); //名称 
		List<String> fv9FugRadStatus = (List<String>)form.get("fv9FugRadStatus"); // 状态
		List<String> fv9FugRadCom_CN = (List<String>)form.get("fv9FugRadCom_CN");  //状态描述_中文
		List<String> fv9FugRadCom_GM = (List<String>)form.get("fv9FugRadCom_GM");  //状态描述_德文
		List<String> fv9FugRadMabnh_CN = (List<String>)form.get("fv9FugRadMabnh_CN");  //措施_中文
		List<String> fv9FugRadMabnh_GM = (List<String>)form.get("fv9FugRadMabnh_GM");  //措施_德文 
	
	%>
</head>
<body>
<div id="container">
	<div id="nr">
		<div id="top">
				<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
				<div class="fr"> STATUS 19.10.2010</div>
				<h1><%=title %></h1>
			</div>
    	<div id="content">
    	<div id="german">
			<input type="button" class="china" onclick="changeChinese()" />
		</div>
    	<div id="datatable1" style="width: 800px; margin:0 50px">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
			  <tr>
			    <td width="239" class="pg">&nbsp;</td>
			    <td width="311" class="pg"><h2>Status</h2></td>
			    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
			  </tr>
			   <%
			   if (Web.getListYesOrNo(fv9FugRadName)) {
		  		for(int i=0; i<fv9FugRadName.size(); i++){
		  			String FugRadName = Web.replaceSpecial(fv9FugRadName.get(i)); //名称 
		  			String FugRadStatus = Web.replaceSpecial(fv9FugRadStatus.get(i)); // 状态
		  			String FugRadCom_GM = Web.replaceSpecial(fv9FugRadCom_GM.get(i));  //状态描述_德文
		  			String FugRadMabnh_GM = Web.replaceSpecial(fv9FugRadMabnh_GM.get(i));  //措施_德文 
			  %>  
			  <tr>
			    <td valign="top" class="pgpg" style="width:239px;">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
				  		<tr>
				    		<td valign="top"><h2><%=FugRadName %> </h2></td>
				    		<td>
				    			<% if(("绿").equals(FugRadStatus)){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="30" height="70" />
							<%} else if(("黄").equals(FugRadStatus)){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="30" height="70" />	
							<%} else if(("红").equals(FugRadStatus)){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="30" height="70" /> 
							<%}%>
				    		</td>
				  		</tr>
					</table>
				</td>
			    <td width="60%" valign="top" class="pgpg"><div class="tbnrr">
			    <%
   				if (FugRadCom_GM != null && !"".equals(FugRadCom_GM)) {
    			%>
    				<%=FugRadCom_GM %>
    			<%
    				} else {
  					%>
  	    				&nbsp;
  	    			<%		
    				}
    			%>
			    </div></td>
			    <td width="40%" valign="top" class="pgpg"><div class="tbnrr">
			    	<%
	    				if (FugRadMabnh_GM != null && !"".equals(FugRadMabnh_GM)) {
	    			%>
	    				<%=FugRadMabnh_GM %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
			    </div></td>
			  </tr>
				<% 
		  			}
			   }
				%>  
			</table>
		</div>
		<div id="china" style="display: none;">
			<input type="button" class="german" onclick="changeGerman()"/>
		</div>
		<div id="datatable2" style="width: 800px; display: none;margin:0 50px">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
			  <tr>
			    <td width="239" class="pg">&nbsp;</td>
			    <td width="311" class="pg"><h2>Status</h2></td>
			    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
			  </tr>
			   <%
			   if (Web.getListYesOrNo(fv9FugRadName)) {
		  		for(int i=0; i<fv9FugRadName.size(); i++){
		  			String FugRadName = Web.replaceSpecial(fv9FugRadName.get(i)); //名称 
		  			String FugRadStatus = Web.replaceSpecial(fv9FugRadStatus.get(i)); // 状态
		  			String FugRadCom_CN = Web.replaceSpecial(fv9FugRadCom_CN.get(i));  //状态描述_中文
		  			String FugRadMabnh_CN = Web.replaceSpecial(fv9FugRadMabnh_CN.get(i));  //措施_中文
			  %>  
			  <tr>
			    <td valign="top" class="pgpg" style="width:239px;">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
				  		<tr>
				    		<td valign="top"><h2><%=FugRadName %> </h2></td>
				    		<td>
				    			<% if(("绿").equals(FugRadStatus)){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="30" height="70" />
							<%} else if(("黄").equals(FugRadStatus)){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="30" height="70" />	
							<%} else if(("红").equals(FugRadStatus)){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="30" height="70" /> 
							<%}%>
				    		</td>
				  		</tr>
					</table>
				</td>
			    <td width="60%" valign="top" class="pgpg"><div class="tbnrr">
			    <%
   				if (FugRadCom_CN != null && !"".equals(FugRadCom_CN)) {
    			%>
    				<%=FugRadCom_CN %>
    			<%
    				} else {
  					%>
  	    				&nbsp;
  	    			<%		
    				}
    			%>
			    </div></td>
			    <td width="40%" valign="top" class="pgpg"><div class="tbnrr">
			    	<%
	    				if (FugRadMabnh_CN != null && !"".equals(FugRadMabnh_CN)) {
	    			%>
	    				<%=FugRadMabnh_CN %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
			    </div></td>
			  </tr>
				<% 
		  			}
			   }
				%>  
			</table>
		</div>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
