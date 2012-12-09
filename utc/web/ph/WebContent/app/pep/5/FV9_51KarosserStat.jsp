<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			List<String> fv9KarosserStyle = new ArrayList<String>();
			List<String> fv9KarosserStatus = new ArrayList<String>();
			List<String> fv9KarossStCom_GM = new ArrayList<String>();
			List<String> fv9KarossMab_GM = new ArrayList<String>();
			List<String> fv9KarossStCom_CN = new ArrayList<String>();
			List<String> fv9KarossMab_CN = new ArrayList<String>();
			
			if(form.get("fv9KarosserStyle") != null){
				fv9KarosserStyle = (List<String>)form.get("fv9KarosserStyle");
			}
			if(form.get("fv9KarosserStatus") != null){	
				fv9KarosserStatus = (List<String>)form.get("fv9KarosserStatus");
			}
			if(form.get("fv9KarossStCom_GM") != null){
				fv9KarossStCom_GM = (List<String>)form.get("fv9KarossStCom_GM");
			}
			if(form.get("fv9KarossMab_GM") != null){					
				fv9KarossMab_GM = (List<String>)form.get("fv9KarossMab_GM");
			}
			if(form.get("fv9KarossStCom_CN") != null){					
				fv9KarossStCom_CN = (List<String>)form.get("fv9KarossStCom_CN");
			}
			if(form.get("fv9KarossMab_CN") != null){					
				fv9KarossMab_CN = (List<String>)form.get("fv9KarossMab_CN");
			}
			
		%>
	</head>

<body>
<div id="container">
	<div id="nr">
	<div id="top">
		<div class="fl"><%=status_left %></div>
		<div class="fr"><%=status_right %></div>
		<h1>
			<a href="javascript:changeChinese()" id="german"><%=title %></a>
			<a href="javascript:changeGerman()" id="china" style="display: none;"><%=title %></a>
		</h1>
	</div>
    <div id="content">
   
    	<div id="datatable1" style="width: 980px;margin:5px auto; margin-top: 30px;">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				<tr>
					<td width="239" class="pg" colspan="2">&nbsp;</td>
					<td width="311" class="pg"><h2>Status</h2></td>
					<td width="433" class="pg"><h2>Massnahmen</h2></td>
				</tr>
				  
				<%
				if (fv9KarosserStyle != null && fv9KarosserStyle.size() > 0) {
				  for(int i=0; i<fv9KarosserStyle.size(); i++){
				%>
				<tr>
					<td valign="top" class="pgpg" style="width:100px;padding:10px; font-size: 14px;">
						<h2> <%= Web.replaceSpecial(fv9KarosserStyle.get(i)) %></h2>
					</td>
					<td valign="top" class="pgpg" style="width: 39px;padding:10px">
						<% if(fv9KarosserStatus.get(i).equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/GreenLight.png" width="30" height="70" />
						<%} else if(fv9KarosserStatus.get(i).equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/YellowLight.png" width="30" height="70" />	
						<%} else if(fv9KarosserStatus.get(i).equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/RedLight.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td width="60%" valign="top" class="pgpg" style="padding:12px">
						<div class="tbnrr">
						<div>
						<%if (fv9KarossStCom_GM.get(i) != null && !"".equals(fv9KarossStCom_GM.get(i))) {
						%> <%=Web.replaceSpecial(fv9KarossStCom_GM.get(i)) %>
						</div>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
					<td width="40%" valign="top" class="pgpg" style="padding:12px">
						<div class="tbnrr">
						<div>
						<%if (fv9KarossMab_GM.get(i) != null && !"".equals(fv9KarossMab_GM.get(i))) {
						%> <%=Web.replaceSpecial(fv9KarossMab_GM.get(i)) %></div>
						<%} else {%>
						&nbsp;
						<%}%>
						</div>
					</td>
				</tr>
				<% 
				  }
				}
				%>
			</table>
		</div>
		
		<div id="datatable2" style="width: 980px;display: none; margin:5px auto; margin-top: 30px;">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				<tr>
					<td width="239" class="pg" colspan="2">&nbsp;</td>
					<td width="311" class="pg"><h2>Status</h2></td>
					<td width="433" class="pg"><h2>Massnahmen</h2></td>
				</tr>
				  
				<%
				if (fv9KarosserStyle != null && fv9KarosserStyle.size() > 0) {
				  for(int i=0; i<fv9KarosserStyle.size(); i++){
				%>
				<tr>
					<td valign="top" class="pgpg" style="width:100px;padding:10px; font-size: 14px;">
						<h2> <%= Web.replaceSpecial(fv9KarosserStyle.get(i)) %></h2>
					</td>
					<td valign="top" class="pgpg" style="width: 39px;padding:10px">
						<% if(fv9KarosserStatus.get(i).equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/GreenLight.png" width="30" height="70" />
						<%} else if(fv9KarosserStatus.get(i).equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/YellowLight.png" width="30" height="70" />	
						<%} else if(fv9KarosserStatus.get(i).equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/RedLight.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td width="60%" valign="top" class="pgpg" style="padding:12px">
						<div>
						<%
						if (fv9KarossStCom_CN.get(i) != null && !"".equals(fv9KarossStCom_CN.get(i))) {
						%> 
						<%=Web.replaceSpecial(fv9KarossStCom_CN.get(i)) %>
						</div>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
					<td width="40%" valign="top" class="pgpg" style="padding:12px">
						<div>
						<%
						if (fv9KarossMab_CN.get(i) != null && !"".equals(fv9KarossMab_CN.get(i))) {
						%> 
						<%=Web.replaceSpecial(fv9KarossMab_CN.get(i)) %>
						</div>
						<%} else {%>
						&nbsp;
						<%}%>
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
