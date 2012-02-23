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
</head>

<%
	List<String> fv9PrMSBCubStyle = (List<String>)form.get("fv9PrMSBCubStyle"); // 检测工具 
	List<String> fv9PrMSBCubStatus = (List<String>)form.get("fv9PrMSBCubStatus"); // 检测工具状态
	List<String> fv9PrMSBCubStCom_CN = (List<String>)form.get("fv9PrMSBCubStCom_CN");  //状态描述_中文
	List<String> fv9PrMSBCubStCom_GM = (List<String>)form.get("fv9PrMSBCubStCom_GM");  //状态描述_德文
	List<String> fv9PrMSBCubMabnh_CN = (List<String>)form.get("fv9PrMSBCubMabnh_CN");  //措施_中文
	List<String> fv9PrMSBCubMabnh_GM = (List<String>)form.get("fv9PrMSBCubMabnh_GM");  //措施_德文 
%>
<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1>3.1 Prüfmittel, Meisterbock/Cubing</h1></div>
    <div id="content">
    	<div id="german">
			<input type="button" class="china" onclick="changeChinese()" />
		</div>
		<div id="datatable1" style="width: 800px;font-size:12px;margin:0 50px">
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				  <tr>
				    <td width="239" class="pg">&nbsp;</td>
				    <td width="311" class="pg"><h2>Status</h2></td>
				    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
				  </tr>
				 <%
				 if (fv9PrMSBCubStyle != null && fv9PrMSBCubStyle.size() > 0) {
				  for(int i=0; i<fv9PrMSBCubStyle.size(); i++){
					  %>  
				<tr>
					    <td valign="top" class="pgpg" style="width:239px;">
						    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
							  <tr>
					   			 <td width="70%" valign="top"><h2><%=fv9PrMSBCubStyle.get(i) %> </h2></td>
							   	 <td>
									<% if(("绿").equals(fv9PrMSBCubStatus.get(i))){%>
									    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" style="height:70px;width:25px;" />
									<%} else if(("黄").equals(fv9PrMSBCubStatus.get(i))){%>
									    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" style="height:70px;width:25px;" />	
									<%} else if(("红").equals(fv9PrMSBCubStatus.get(i))){%>
										   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" style="height:70px;width:25px;" /> 
									<%}%>
								</td>
							  </tr>
							</table>
						</td>
			    		<td width="60%" valign="top" class="pgpg">
				    		<div class="tbnrr">
				    			<%
			    				if (fv9PrMSBCubStCom_GM.get(i) != null && !"".equals(fv9PrMSBCubStCom_GM.get(i))) {
				    			%>
				    				<%=fv9PrMSBCubStCom_GM.get(i) %>
				    			<%
				    				} else {
			   					%>
			   	    				&nbsp;
			   	    			<%		
				    				}
				    			%>
				    			
							</div>
					    </td>
			   			<td width="40%" valign="top" class="pgpg">
			   				<div class="tbnrr">
			   				<%
			    				if (fv9PrMSBCubMabnh_GM.get(i) != null && !"".equals(fv9PrMSBCubMabnh_GM.get(i))) {
			    			%>
			    				<%=fv9PrMSBCubMabnh_GM.get(i) %>
			    			<%
			    				} else {
		   					%>
		   	    				&nbsp;
		   	    			<%		
			    				}
			    			%>
			    			</div>
						</td>
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
				 if (fv9PrMSBCubStyle != null && fv9PrMSBCubStyle.size() > 0) {
				  for(int i=0; i<fv9PrMSBCubStyle.size(); i++){
					  %>  
				<tr>
					    <td valign="top" class="pgpg" style="width:239px;">
						    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
							  <tr>
					   			 <td width="70%" valign="top"><h2><%=fv9PrMSBCubStyle.get(i) %> </h2></td>
							   	 <td>
									<% if(("绿").equals(fv9PrMSBCubStatus.get(i))){%>
									    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" style="height:70px;width:25px;"/>
									<%} else if(("黄").equals(fv9PrMSBCubStatus.get(i))){%>
									    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" style="height:70px;width:25px;" />	
									<%} else if(("红").equals(fv9PrMSBCubStatus.get(i))){%>
										   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" style="height:70px;width:25px;" /> 
									<%}%>
								</td>
							  </tr>
							</table>
						</td>
			    		<td width="60%" valign="top" class="pgpg">
				    		<div class="tbnrr">
				    			<%
			    				if (fv9PrMSBCubStCom_CN.get(i) != null && !"".equals(fv9PrMSBCubStCom_CN.get(i))) {
				    			%>
				    				<%=fv9PrMSBCubStCom_CN.get(i) %>
				    			<%
				    				} else {
			   					%>
			   	    				&nbsp;
			   	    			<%		
				    				}
				    			%>
				    			
							</div>
					    </td>
			   			<td width="40%" valign="top" class="pgpg">
			   				<div class="tbnrr">
			   				<%
			    				if (fv9PrMSBCubMabnh_CN.get(i) != null && !"".equals(fv9PrMSBCubMabnh_CN.get(i))) {
			    			%>
			    				<%=fv9PrMSBCubMabnh_CN.get(i) %>
			    			<%
			    				} else {
		   					%>
		   	    				&nbsp;
		   	    			<%		
			    				}
			    			%>
			    			</div>
						</td>
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
