<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.ph.FormManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/app/pep/include/header.jsp"%>
<%
	title = "5.2 Logistikkonzept";
	Map form = (Map)request.getAttribute("form");	
	List<String> fv9LogistikStyle = new ArrayList<String>();//(List<String>)form.get("fv9LogistikStyle");
	List<String> fv9LogistikStatus = new ArrayList<String>();//(List<String>)form.get("fv9LogistikStatus");
	List<String> fv9LogistikStCom_GM = new ArrayList<String>();//(List<String>)form.get("fv9LogistikStCom_GM");
	List<String> fv9LogistikMab_GM = new ArrayList<String>();//(List<String>)form.get("fv9LogistikMab_GM");
	
	fv9LogistikStyle.add("Inbound 入厂物流");//假数据
	fv9LogistikStyle.add("Inhouse工厂物流");//假数据
	fv9LogistikStyle.add("Behälter器具");//假数据
	
	fv9LogistikStatus.add("绿");//假数据
	fv9LogistikStatus.add("绿");//假数据
	fv9LogistikStatus.add("黄");//假数据
	
	fv9LogistikStCom_GM.add("1.Inboundlogistik 入厂物流Vorgaben fuer LKW Inbound erstellt; Grobplanung abgeschlossen卡车入厂物流路线起草；粗略规划已结束");
	//假数据
	fv9LogistikStCom_GM.add("1.Logistikplanung Karobau(Status gruen)焊装物流规划（绿灯）Grobplanung in Arbeit 正在进行粗略规划2.Logsitikplanung Montage(Status gelb)总装物流规划（绿灯）Planung in arbeit");
	//假数据
	fv9LogistikStCom_GM.add("Beginn mit Planung der esten stufigen  Verpackung in KW50/11开始具体零件的详细包装规划");
	//假数据
	fv9LogistikMab_GM.add("");//假数据
	fv9LogistikMab_GM.add("");//假数据
	fv9LogistikMab_GM.add("专用器具样件设计（KW06/12需有零件样件）Design der Bemusterung des spezifischen Behaelter in KW06/12");
	//假数据
%>

<head>
<title><%=title %></title>
</head>

<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1><%=title %></h1></div>
    <div id="content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		  <tr>
		    <td width="239" class="pg">&nbsp;</td>
		    <td width="311" class="pg"><h2>Status 状态</h2></td>
		    <td width="433" class="pg"><h2>Nächste Schritte下一阶段</h2></td>
		  </tr>
		  <%
		  for(int i=0; i<fv9LogistikStyle.size(); i++){
			  %>
			  <tr>
			    <td valign="top" class="pgpg" style="width:239px;">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					  <tr>
			   			 <td valign="top"><h2> <%=fv9LogistikStyle.get(i) %></h2></td>
					   	 <td>
					   		<% if(("绿").equals(fv9LogistikStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
							<%} else if(("黄").equals(fv9LogistikStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
							<%} else if(("红").equals(fv9LogistikStatus.get(i))){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
							<%}%>
					   	 </td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg">
	    			<div class="tbnrr">
	    			<%
	    				if (fv9LogistikStCom_GM.get(i) != null && !"".equals(fv9LogistikStCom_GM.get(i))) {
	    			%>
	    				<%=fv9LogistikStCom_GM.get(i) %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
	    			</div>
			    </td>
	   			<td valign="top" class="pgpg">
	   			 	<div class="tbnrr">
	   			 	<%
	    				if (fv9LogistikMab_GM.get(i) != null && !"".equals(fv9LogistikMab_GM.get(i))) {
	    			%>
	    				<%=fv9LogistikMab_GM.get(i) %>
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
		  %>
				
	</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
