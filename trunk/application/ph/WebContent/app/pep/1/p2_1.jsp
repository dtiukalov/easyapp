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
		List<String> fv9Aktion_GM = (List<String>)form.get("fv9Aktion_GM");  //德文
		List<String> fv9Aktion_CN = (List<String>)form.get("fv9Aktion_CN"); //中文
		List<String> fv9Verantwortlich = (List<String>)form.get("fv9Verantwortlich");  //责任人
		List<String> fv9Termin = (List<String>)form.get("fv9Termin"); //解决期限
		List<String> fv9Status = (List<String>)form.get("fv9Status"); //状态
	%>
</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>	
			<div id="content">
				<div id="datatable1" style="width: 800px; height: 500px;margin: 50px 150px;">
					<table width="80%" cellspacing="2" rules="rows">
						<tr style="border-bottom:2px solid #333333;font-size:18px;font-weight:bold;">
							<td width="35%">Aktion</td>
							<td width="30%">Verantwortlich</td>
							<td width="18%">Termin</td>
							<td width="17%">Status</td>	
						</tr><br>
						 <%
						 if(fv9Aktion_GM.size() > 0){
							 for(int i=0; i < fv9Aktion_GM.size(); i++){
						%>
								<tr style="border-collapse: collapse; height: 85px;">
								<td><br>
									Auftrag <%=i %>: <br><%=fv9Aktion_GM.get(i)%><br>...
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
					<div style="width: 800px; height: 50px; overflow: hidden; text-align: center; margin:0 -100px">
						<input type="button" class="change" value="切换中文" onclick="changeChinese()"/>
					</div>
				</div>
				
				<div id="datatable2" style="width: 800px; height: 500px;margin: 100px 150px;display: none; ">
					<table width="80%" cellspacing="2" rules="rows">
						<tr style="border-bottom:2px solid #333333;font-size:18px;font-weight:bold;">
							<td width="35%">Aktion</td>
							<td width="30%">Verantwortlich</td>
							<td width="18%">Termin</td>
							<td width="17%">Status</td>	
						</tr>
						<br>
						 <%
						 if(fv9Aktion_CN.size() > 0){
							 for(int i=0; i < fv9Aktion_CN.size(); i++){
						%>
						<tr style="border-collapse: collapse; height: 85px;">
							<td>
								<br>Auftrag <%=i %>: <br><%=fv9Aktion_CN.get(i)%><br>...
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
					<div style="width: 800px; height: 50px; overflow: hidden; text-align: center; margin:0 -100px"">
						<input type="button" class="change" value="切换德文" onclick="changeGerman()"/>
					</div>
				</div>
				
				
			</div>
			
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>