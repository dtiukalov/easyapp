<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
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
	<div id="top">
		<div class="fl"><%=status_left %></div>
		<div class="fr"><%=status_right %></div>
		<h1>
			<a href="javascript:changeChinese()" id="german"><%=title %></a>
			<a href="javascript:changeGerman()" id="china" style="display: none;"><%=title %></a>
		</h1>
	</div>
    <div id="content">
		<div id="datatable1" style="font-size:14px; margin:30px 30px auto;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td width="180" class="pg">&nbsp;</td>
				<td width="39" class="pg">&nbsp;</td>
				<td width="331" class="pg"><h2>Status</h2></td>
				<td width="433" class="pg"><h2>Massnahmen</h2></td>
			</tr>
			 <%
			 if (fv9PrMSBCubStyle != null && fv9PrMSBCubStyle.size() > 0) {

//				默认5行数据，如果多余5行，自动计算行的高度
				double sumHeight = 480.0;
				double row_height = 0.0;
				if (fv9PrMSBCubStyle.size() > 5) {
					row_height = sumHeight/fv9PrMSBCubStyle.size();
				} else {
					row_height = sumHeight/5;
				}
				
				for(int i=0; i<fv9PrMSBCubStyle.size(); i++){
				String PrMSBCubStyle = Web.replaceSpecial((String)fv9PrMSBCubStyle.get(i));
				String PrMSBCubStatus = Web.replaceSpecial((String)fv9PrMSBCubStatus.get(i));
				String PrMSBCubStCom_GM = Web.replaceSpecial((String)fv9PrMSBCubStCom_GM.get(i));
				String PrMSBCubMabnh_GM = Web.replaceSpecial((String)fv9PrMSBCubMabnh_GM.get(i));
			 %>  
			 <tr>
			 	<td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 180px; height: <%=row_height%>px;">
			 		<h3><%=Web.replaceSpecial(PrMSBCubStyle) %> </h3>
			 	</td>
			    <td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 39px; height: <%=row_height%>px;">
			    	<% if(("绿").equals(PrMSBCubStatus)){%>
					    	<img src="<%=request.getContextPath()%>/app/pep/images/GreenLight.png" 
					    		style="height:<%=(row_height*2)/3%>px;width:30px;" />
					<%} else if(("黄").equals(PrMSBCubStatus)){%>
					    	<img src="<%=request.getContextPath()%>/app/pep/images/YellowLight.png" 
					    		style="height:<%=(row_height*2)/3%>px;width:30px;" />	
					<%} else if(("红").equals(PrMSBCubStatus)){%>
						   <img src="<%=request.getContextPath()%>/app/pep/images/RedLight.png" 
						   		style="height:<%=(row_height*2)/3%>px;width:30px;" /> 
					<%}%>
			    </td>
			    <td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 331px; height: <%=row_height%>px;">
					<%
    					if (PrMSBCubStCom_GM != null && !"".equals(PrMSBCubStCom_GM)) {
	    			%>
	    				<%=Web.replaceSpecial(PrMSBCubStCom_GM) %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
			    </td>
			    <td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 433px; height: <%=row_height%>px;">
			    	<%
	    				if (PrMSBCubMabnh_GM != null && !"".equals(PrMSBCubMabnh_GM)) {
	    			%>
	    				<%=Web.replaceSpecial(PrMSBCubMabnh_GM) %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
			    </td>
			 </tr>
				<% 
				  }
				 }
				%>
			</table>
		</div>  
		 
		<div id="datatable2" style="font-size:14px; margin:30px 30px auto;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td width="180" class="pg">&nbsp;</td>
				<td width="39" class="pg">&nbsp;</td>
				<td width="331" class="pg"><h2>Status</h2></td>
				<td width="433" class="pg"><h2>Massnahmen</h2></td>
			</tr>
			 <%
			 if (fv9PrMSBCubStyle != null && fv9PrMSBCubStyle.size() > 0) {

//				默认5行数据，如果多余5行，自动计算行的高度
				double sumHeight = 480.0;
				double row_height = 0.0;
				if (fv9PrMSBCubStyle.size() > 5) {
					row_height = sumHeight/fv9PrMSBCubStyle.size();
				} else {
					row_height = sumHeight/5;
				}
				
				for(int i=0; i<fv9PrMSBCubStyle.size(); i++){
					String PrMSBCubStyle = Web.replaceSpecial((String)fv9PrMSBCubStyle.get(i));
					String PrMSBCubStatus = Web.replaceSpecial((String)fv9PrMSBCubStatus.get(i));
					String PrMSBCubStCom_CN = Web.replaceSpecial((String)fv9PrMSBCubStCom_CN.get(i));
					String PrMSBCubMabnh_CN = Web.replaceSpecial((String)fv9PrMSBCubMabnh_CN.get(i));
			 %>  
			 <tr>
			 	<td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 180px; height: <%=row_height%>px;">
			 		<h3><%=Web.replaceSpecial(PrMSBCubStyle) %> </h3>
			 	</td>
			    <td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 39px; height: <%=row_height%>px;">
			    	<% if(("绿").equals(PrMSBCubStatus)){%>
					    	<img src="<%=request.getContextPath()%>/app/pep/images/GreenLight.png" 
					    		style="height:<%=(row_height*2)/3%>px;width:30px;" />
					<%} else if(("黄").equals(PrMSBCubStatus)){%>
					    	<img src="<%=request.getContextPath()%>/app/pep/images/YellowLight.png" 
					    		style="height:<%=(row_height*2)/3%>px;width:30px;" />	
					<%} else if(("红").equals(PrMSBCubStatus)){%>
						   <img src="<%=request.getContextPath()%>/app/pep/images/RedLight.png" 
						   		style="height:<%=(row_height*2)/3%>px;width:30px;" /> 
					<%}%>
			    </td>
			    <td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 331px; height: <%=row_height%>px;">
					<%
    					if (PrMSBCubStCom_CN != null && !"".equals(PrMSBCubStCom_CN)) {
	    			%>
	    				<%=Web.replaceSpecial(PrMSBCubStCom_CN) %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
			    </td>
			    <td style="BORDER-BOTTOM: #7f7f7f 4px solid; width: 433px; height: <%=row_height%>px;">
			    	<%
	    				if (PrMSBCubMabnh_CN != null && !"".equals(PrMSBCubMabnh_CN)) {
	    			%>
	    				<%=Web.replaceSpecial(PrMSBCubMabnh_CN) %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
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
