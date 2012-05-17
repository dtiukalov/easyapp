<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/app/pep/include/header.jsp"%>
<title><%=title %></title>
<%
			List<String> fv9Market = (List<String>)form.get("fv9Market");
			List<String> fv9Motor = (List<String>)form.get("fv9Motor");
			List<String> fv9MotorTech = (List<String>)form.get("fv9MotorTech");
			List<String> fv9CylinderNo = (List<String>)form.get("fv9CylinderNo");
			
			List<String> fv9Emission = (List<String>)form.get("fv9Emission");
			List<String> fv9Parameter = (List<String>)form.get("fv9Parameter");
			List<String> fv9EmissionStandards = (List<String>)form.get("fv9EmissionStandards");
			List<String> fv9Getriebe = (List<String>)form.get("fv9Getriebe");
			
			List<String> fv9VFFStatus = (List<String>)form.get("fv9VFFStatus");
			List<String> fv9PVSStatus = (List<String>)form.get("fv9PVSStatus");
			List<String> fv90SStatus = (List<String>)form.get("fv90SStatus");
			List<String> fv9SOPStatus = (List<String>)form.get("fv9SOPStatus");
			
			String sopdata  = (String)request.getSession().getAttribute("SOP_DATE");
	/* 		fv9Motor.set(0,"EA111");
			fv9Motor.set(1,"EA112");
			fv9Motor.set(2,"EA112"); */
		%>
<script type="text/javascript">
	
</script>
<style type="text/css">
.mytable {
	width: 100%;
	overflow: hidden;
	cellspacing: 0;
	cellpadding: 0;
	border-top: 1px #000000 double;
	border-bottom: 1px #000000 double;
}

.mytable .mytr {
	
}

.mytable .mytd {
	padding-left: 5px;
	font-size: 13px;
	text-align: center;
	white-space: normal;
	overflow: hidden;
	border-bottom: 1px solid #000000;
	border-top: 1px solid #000000;
}

.mytd {
	padding-left: 5px;
	font-weight: bolder;
	font-size: 13px;
	text-align: center;
	white-space: normal;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="container">
		<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content"
				style="width: 1000px; height: 500px; margin: 50px auto;">
				<table width="100%"
					style="cellspacing: 0; cellpadding: 0; overflow: hidden;">
					<tr>
						<td class="mytd" width="150px">SOP</td>
						<td class="mytd" width="150px">Markt</td>
						<td class="mytd" width="150px">Motor</td>
						<td class="mytd" width="80px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="mytd" width="80px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="mytd" width="80px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="mytd" width="100px">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="mytd" width="150px">Getreiebe</td>
						<td class="mytd" width="80px">VFF</td>
						<td class="mytd" width="80px">PVS</td>
						<td class="mytd" width="80px">0S</td>
						<td class="mytd" width="80px">SOP</td>
					</tr>
				</table>

				<HR SIZE=3 color=000000>
				<table class="mytable">
				<%
				int temp1 = 1;
				int temp2 = 1;
				int size = fv9Market.size();
				if(fv9Market!=null && size>0){
					for(int i=0;i<size;i++){
				%>
					<tr>
						<%
					   if(i == 0){ %>
						<td class="mytd" width="150px" rowspan="<%=fv9Market.size()%>">&nbsp;<%=sopdata %></td>
						<%  }
					   %>
					
					<%
					if(Web.getObjectYesOrNo(fv9Market)){
						Map<String,Object> map = Web.getDisplaytd(i,size,temp1,fv9Market);
						map.get("td");
						temp1 = (Integer)map.get("temp");
						out.println(map.get("td"));
					} else {
						%>	<td class="mytd" width="150px"> &nbsp;&nbsp; </td><%
					}
					%>

					<%
					if(Web.getObjectYesOrNo(fv9Motor)){
						Map<String,Object> map = Web.getDisplaytd(i,size,temp2,fv9Motor);
						map.get("td");
						temp2 = (Integer)map.get("temp");
						out.println(map.get("td"));
					} else {
						%>	<td class="mytd" width="150px"> &nbsp;&nbsp; </td><%
					}
					%>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9MotorTech)){
						   %> <%=fv9MotorTech.get(i)%> <%
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9CylinderNo)){
						   %> <%=fv9CylinderNo.get(i)%> <%
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9Emission)){
						   %> <%=fv9Emission.get(i)%> <%
					   } else {
						  %>&nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="100px">
							<%if(Web.getObjectYesOrNo(fv9Parameter)){
						   %> <%=fv9Parameter.get(i)%> <%
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %> <br> <%if(Web.getObjectYesOrNo(fv9EmissionStandards)){
						   %> <%=fv9EmissionStandards.get(i)%> <%
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="150px">
							<%if(Web.getObjectYesOrNo(fv9Getriebe)){
						   %> <%=fv9Getriebe.get(i)%> <%
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9VFFStatus)){
					    	if(fv9VFFStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg"
							width="30" height="70" /> <%} else if(fv9VFFStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png"
							width="30" height="70" /> <%} else if(fv9VFFStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png"
							width="30" height="70" /> <%}
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9PVSStatus)){
						   if(fv9PVSStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg"
							width="30" height="70" /> <%} else if(fv9PVSStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png"
							width="30" height="70" /> <%} else if(fv9PVSStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png"
							width="30" height="70" /> <%}
					   } else {
						  %> &nbsp;&nbsp;<%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv90SStatus)){
					    	if(fv90SStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg"
							width="30" height="70" /> <%} else if(fv90SStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png"
							width="30" height="70" /> <%} else if(fv90SStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png"
							width="30" height="70" /> <%}
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9SOPStatus)){
						  if(fv9SOPStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/GREENSTATUS.jpg"
							width="30" height="70" /> <%} else if(fv9SOPStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/YELLOWSTATUS2.png"
							width="30" height="70" /> <%} else if(fv9SOPStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/REDSTATUS2.png"
							width="30" height="70" /> <%}
					   } else {
						  %> &nbsp; <%
					   }
						  %>
						</td>
					</tr>

					<%
					}
				}	
				%>
				</table>

				<HR SIZE=3 color=000000>

			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>
</body>
</html>
