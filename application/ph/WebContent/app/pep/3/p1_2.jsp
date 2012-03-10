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
	List<String> fv9PrMSBCubStyle = new ArrayList<String>();   // (List<String>)form.get("fv9PrMSBCubStyle"); 检测工具 
	List<String> fv9PrMSBCubStatus = new ArrayList<String>();  //(List<String>)form.get("fv9PrMSBCubStatus");  检测工具状态
	List<String> fv9PrMSBCubStCom_CN = new ArrayList<String>();//(List<String>)form.get("fv9PrMSBCubStCom_CN");  状态描述_中文
	List<String> fv9PrMSBCubStCom_GM = new ArrayList<String>();//(List<String>)form.get("fv9PrMSBCubStCom_GM");  状态描述_德文
	List<String> fv9PrMSBCubMabnh_CN = new ArrayList<String>();//(List<String>)form.get("fv9PrMSBCubMabnh_CN");  措施_中文
	List<String> fv9PrMSBCubMabnh_GM = new ArrayList<String>();//(List<String>)form.get("fv9PrMSBCubMabnh_GM");  措施_德文 

	fv9PrMSBCubStyle.add("PMP/FMK ");
	fv9PrMSBCubStatus.add("黄");
	fv9PrMSBCubStCom_CN.add("&nbsp;&nbsp;PMP文件提供时间由KW41/11推迟到KW48/11;<br />&nbsp;&nbsp;FMK文件无法由规划部发包完成;");
	fv9PrMSBCubMabnh_CN.add("FMK与程序编辑工作由QA-MT同时进行");

	fv9PrMSBCubStyle.add("Messauf-<br />nahmen ET/ZSB");
	fv9PrMSBCubStatus.add("绿");
	fv9PrMSBCubStCom_CN.add("&nbsp;&nbsp;KW36/11提供前、后盖内板支架，KW37/11提供前、后盖外板、翼子板及总成支架，总成支架需要PMP验收");
	fv9PrMSBCubMabnh_CN.add("");

	fv9PrMSBCubStyle.add("Messpro-<br />gramm ET/ZSB");
	fv9PrMSBCubStatus.add("黄");
	fv9PrMSBCubStCom_CN.add("&nbsp;&nbsp;KW41/11开始单件程序编辑，KW49/11完成；<br />FMK与程序编辑工作由QA-MT同时进行<br />&nbsp;&nbsp;由于PMP提供时间推迟8周，导致程序编辑完成时间推迟，已制定措施;");
	fv9PrMSBCubMabnh_CN.add("质保部提前开展程序编辑工作");

	fv9PrMSBCubStyle.add("Meisterbock");
	fv9PrMSBCubStatus.add("绿");
	fv9PrMSBCubStCom_CN.add("&nbsp;&nbsp;正在调试，KW52/11可用；");
	fv9PrMSBCubMabnh_CN.add("");

	fv9PrMSBCubStyle.add("Cubing");
	fv9PrMSBCubStatus.add("绿");
	fv9PrMSBCubStCom_CN.add("&nbsp;&nbsp;Cubing设计已经结束，KW47/11可以使用");
	fv9PrMSBCubMabnh_CN.add("");

%>
<body>
<div id="container">
	<div id="nr">
	<div id="top">
		<div class="fl"><%=status_left %></div>
		<div class="fr"><%=status_right %></div>
		<h1><%=title %></h1>
	</div>
    <div id="content" >
     <div class="laguage">
    	<p>
    		<a href='p1_1.jsp'>德文</a>
    	</p>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		  <tr>
		    <td width="239" class="pg">&nbsp;</td>
		    <td width="311" class="pg"><h2>Status</h2></td>
		    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
		  </tr>
 <%
		  for(int i=0; i<fv9PrMSBCubStyle.size(); i++){
			  %>  
		<tr>
			    <td valign="top" class="pgpg" style="width:239px;">
				    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
					  <tr>
			   			 <td valign="top"><h2><%=fv9PrMSBCubStyle.get(i) %> </h2></td>
					   	 <td>
							<% if(("绿").equals(fv9PrMSBCubStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg" width="30" height="70" />
							<%} else if(("黄").equals(fv9PrMSBCubStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png" width="30" height="70" />	
							<%} else if(("红").equals(fv9PrMSBCubStatus.get(i))){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png" width="30" height="70" /> 
							<%}%>
						</td>
					  </tr>
					</table>
				</td>
	    		<td valign="top" class="pgpg">
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
	   			<td valign="top" class="pgpg">
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
		%>
	</table>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
