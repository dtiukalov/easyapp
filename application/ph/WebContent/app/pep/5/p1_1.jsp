<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		Map form = (Map)request.getAttribute("form");
	
		String fv9PressStatus = (String)form.get("fv9PressStatus");  //冲压状态 
		String fv9PressStCom_CN = (String)form.get("fv9PressStCom_CN"); //冲压状态备注
		String fv9PressStCom_GM = 	(String)form.get("fv9PressStCom_GM");// 冲压状态备注
		String fv9PressStMab_CN = (String)form.get("fv9PressStMab_CN"); //	冲压措施
		String fv9PressStMab_GM =(String)form.get("fv9PressStMab_GM"); //	冲压措施
		
		String fv9KarossStatus = (String)form.get("fv9KarossStatus"); //	焊装状态
		String fv9KarossStCom_CN = (String)form.get("fv9KarossStCom_CN"); 
		String fv9KarossStCom_GM = (String)form.get("fv9KarossStCom_GM"); 	//焊装状态备注
		String fv9KarossStMab_CN = (String)form.get("fv9KarossStMab_CN"); //	焊装措施
		String fv9KarossStMab_GM = (String)form.get("fv9KarossStMab_GM"); //焊装措施
		
		String fv9LackStatus = (String)form.get("fv9LackStatus"); 
		String fv9LackStCom_CN = (String)form.get("fv9LackStCom_CN"); 
		String fv9LackStCom_GM = (String)form.get("fv9LackStCom_GM"); 
		String fv9LackStMab_CN = (String)form.get("fv9LackStMab_CN"); 
		String fv9LackStMab_GM = (String)form.get("fv9LackStMab_GM"); 	
		
		String fv9MontStatus = (String)form.get("fv9MontStatus"); 
		String fv9MontStCom_CN = (String)form.get("fv9MontStCom_CN");// 总装状态备注
		String fv9MontStCom_GM = (String)form.get("fv9MontStCom_GM"); //总装状态备注
		String fv9MontStMab_CN = (String)form.get("fv9MontStMab_CN"); //总装措施
		String fv9MontStMab_GM = (String)form.get("fv9MontStMab_GM"); //总装措施
		
		String fv9ElectStatus = (String)form.get("fv9ElectStatus"); 
		String fv9ElectStCom_CN = (String)form.get("fv9ElectStCom_CN"); 
		String fv9ElectStCom_GM = (String)form.get("fv9ElectStCom_GM"); 
		String fv9ElectStMab_CN = (String)form.get("fv9ElectStMab_CN"); 
		String fv9ElectStMab_GM = (String)form.get("fv9ElectStMab_GM"); 
	%>
</head>
<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1><%=title %></h1></div>
    <div id="content" style="margin-top:20px;font-size:12px;">
	    <div id="datatable1" style="width: 800px;margin:20px 50px">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table" >
				<tr>
					<td width="239" class="pg" colspan="2">&nbsp;</td>
					<td width="311" class="pg"><h2>Status</h2></td>
					<td width="433" class="pg"><h2>Maßnahmen</h2></td>
				</tr>
				<tr >
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Presswerk</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9PressStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9PressStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9PressStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr" >
						<%
							if (fv9PressStCom_GM != null && !"".equals(fv9PressStCom_GM)) {
						%>
							<%=fv9PressStCom_GM %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9PressStMab_GM != null && !"".equals(fv9PressStMab_GM)) {
						%><%=fv9PressStMab_GM %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Karosseriebau</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9KarossStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9KarossStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9KarossStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9KarossStCom_GM != null && !"".equals(fv9KarossStCom_GM)) {
						%>
							<%=fv9KarossStCom_GM %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9KarossStMab_GM != null && !"".equals(fv9KarossStMab_GM)) {
						%><%=fv9KarossStMab_GM %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Lack</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9LackStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9LackStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9LackStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9LackStCom_GM != null && !"".equals(fv9LackStCom_GM)) {
						%>
							<%=fv9LackStCom_GM %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9LackStMab_GM != null && !"".equals(fv9LackStMab_GM)) {
						%><%=fv9LackStMab_GM %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Montage</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9MontStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9MontStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9MontStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9MontStCom_GM != null && !"".equals(fv9MontStCom_GM)) {
						%>
							<%=fv9MontStCom_GM %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9MontStMab_GM != null && !"".equals(fv9MontStMab_GM)) {
						%><%=fv9MontStMab_GM %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Electric</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9ElectStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9ElectStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9ElectStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9ElectStCom_GM != null && !"".equals(fv9ElectStCom_GM)) {
						%>
							<%=fv9ElectStCom_GM %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9ElectStMab_GM != null && !"".equals(fv9ElectStMab_GM)) {
						%><%=fv9ElectStMab_GM %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
			</table>
			<div style="width: 800px; height: 50px; overflow: hidden; text-align: center;">
				<input type="button" class="change" value="切换中文" onclick="changeChinese()" />
			</div>
	    </div>
	    
	    <div id="datatable2" style="width: 800px;display: none;margin:20px 50px">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				<tr>
					<td width="239" class="pg" colspan="2">&nbsp;</td>
					<td width="311" class="pg"><h2>Status</h2></td>
					<td width="433" class="pg"><h2>Maßnahmen</h2></td>
				</tr>
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Presswerk</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9PressStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9PressStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9PressStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9PressStCom_CN != null && !"".equals(fv9PressStCom_CN)) {
						%>
							<%=fv9PressStCom_CN %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9PressStMab_CN != null && !"".equals(fv9PressStMab_CN)) {
						%><%=fv9PressStMab_CN %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Karosseriebau</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9KarossStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9KarossStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9KarossStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9KarossStCom_CN != null && !"".equals(fv9KarossStCom_CN)) {
						%>
							<%=fv9KarossStCom_CN %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9KarossStMab_CN != null && !"".equals(fv9KarossStMab_CN)) {
						%><%=fv9KarossStMab_CN %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Lack</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9LackStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9LackStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9LackStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9LackStCom_CN != null && !"".equals(fv9LackStCom_CN)) {
						%>
							<%=fv9LackStCom_CN %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9LackStMab_CN != null && !"".equals(fv9LackStMab_CN)) {
						%><%=fv9LackStMab_CN %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Montage</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9MontStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9MontStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9MontStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9MontStCom_CN != null && !"".equals(fv9MontStCom_CN)) {
						%>
							<%=fv9MontStCom_CN %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9MontStMab_CN != null && !"".equals(fv9MontStMab_CN)) {
						%><%=fv9MontStMab_CN %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
				
				<tr>
					<td valign="top" class="pgpg" style="width:200px;padding:10px">
						<h2>Electric</h2>
					</td>
					<td valign="top" class="pgpg" style="width:39px;padding:10px">
						<% if(fv9ElectStatus.equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9ElectStatus.equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9ElectStatus.equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div class="tbnrr">
						<%
							if (fv9ElectStCom_CN != null && !"".equals(fv9ElectStCom_CN)) {
						%>
							<%=fv9ElectStCom_CN %>
						<%
							} else {
						%>
							&nbsp;
						<%
							}
						%>
					</td>
					<td valign="top" class="pgpg"><div class="tbnrr">
						<%if (fv9ElectStMab_CN != null && !"".equals(fv9ElectStMab_CN)) {
						%><%=fv9ElectStMab_CN %>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
				</tr>
			</table>
			<div style="width: 800px; height: 50px; overflow: hidden; text-align: center;">
				<input type="button" class="change" value="切换德文" onclick="changeGerman()"/>
			</div>
	    </div>
    
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
