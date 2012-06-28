<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.web.Web"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/app/pep/include/header.jsp"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><%=title %></title>
	<%
		List<String> fv9Aktion_GM = new ArrayList<String>();
		if(form.get("fv9Aktion_GM") != null){
			fv9Aktion_GM = (List<String>)form.get("fv9Aktion_GM");  //德文
		}
		
		List<String> fv9Aktion_CN = new ArrayList<String>();
		if(form.get("fv9Aktion_CN") != null){
			fv9Aktion_CN = (List<String>)form.get("fv9Aktion_CN"); //中文
		}
		
		List<String> fv9Verantwortlich = new ArrayList<String>();
		if(form.get("fv9Verantwortlich") != null){
			fv9Verantwortlich =(List<String>)form.get("fv9Verantwortlich");  //责任�?
		}
		
		List<String> fv9Termin = new ArrayList<String>();
		if(form.get("fv9Termin") != null){
			 fv9Termin = (List<String>)form.get("fv9Termin"); //解决期限
		}
		
		List<String> fv9Status = new ArrayList<String>();
		if(form.get("fv9Status") != null){
			fv9Status = (List<String>)form.get("fv9Status"); //状�?
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
				
				<div id="datatable1" style="height: 500px; margin: 30px 50px; font-size: 18px;">
					<table width="100%" cellspacing="2" rules="rows">
						<tr style="border-bottom:2px solid #333333; font-weight:bold;">
							<td width="40%">Aktion</td>
							<td width="30%">Verantwortlich</td>
							<td width="13%">Termin</td>
							<td width="17%">Status</td>	
						</tr>
						 <%
						 if(fv9Aktion_GM.size() > 0){
							 for(int i=0; i < fv9Aktion_GM.size(); i++){
						%>
								<tr style="border-collapse: collapse; height: 85px;">
								<td>
									Auftrag <%=i+1 %>: <br><%=fv9Aktion_GM.get(i)%>
								</td>
								<td><br>
									<%=fv9Verantwortlich.get(i) %>
								</td>
								<td  width="22%"><br>
									<%=fv9Termin.get(i)%>
								</td>
								<td><br>
									<%=fv9Status.get(i)%>
								</td>
							</tr>
						<%	
							 }
						 }
						%>
					</table>
				</div>
				
				<div id="datatable2" style=" height: 500px; margin: 30px 50px; font-size:18px; display: none; ">
					<table width="100%" cellspacing="2" rules="rows">
						<tr style="border-bottom:2px solid #333333;font-weight:bold;">
							<td width="40%">Aktion</td>
							<td width="30%">Verantwortlich</td>
							<td width="13%">Termin</td>
							<td width="17%">Status</td>	
						</tr>
						
						 <%
						 if(fv9Aktion_CN.size() > 0){
							 for(int i=0; i < fv9Aktion_CN.size(); i++){
						%>
						<tr style="border-collapse: collapse; height: 85px;">
							<td>
								Auftrag <%=i+1 %>: <br><%=fv9Aktion_CN.get(i)%>
							</td>
							<td>
								<br><%=fv9Verantwortlich.get(i) %>
							</td>
							<td width="22%">
								<br><%=fv9Termin.get(i)%>
							</td>
							<td>
								<br><%=fv9Status.get(i)%>
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