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
<%!
public static Map<String,Object> getDisplaytd(int i,int size, int temp, List<String> list){
	Map<String,Object> result = new HashMap<String,Object>();
	String td = "";
	
	if(size == 1){
		td = "<td class=\"mytd\" width=\"150px\">" + list.get(i) + "</td>";
	} else {
		if(i == 0){
			for(int t=0; t < size-1-i; t++){
				if(list.get(t).equalsIgnoreCase(list.get(t+1))){
					temp++;
				} else {
					break;
				}
			}
			td = "<td class=\"mytd\" width=\"150px\" rowspan=\"" + temp +"\"> " + list.get(i) + "</td>";
		}
	
	    if(i > 0 && i < size-1){
	    	if(temp == 1){
	    		for(int t=i; t < size-1; t++){
					if(list.get(t).equalsIgnoreCase(list.get(t+1))){
						temp++;
					} else {
						break;
					}
				}
	    		td = "<td class=\"mytd\" width=\"150px\" rowspan=\"" + temp +"\"> " + list.get(i) + "</td>";
	    	} else {
	    		temp--;
	    	}
	    }
	    
	    if(i == size-1) {
	    	if(temp == 1){
	    		td = "<td class=\"mytd\" width=\"150px\" rowspan=\" " + temp +" \"> " + list.get(i) + "</td>";
	    	} else {
	    		temp--;
	    	}
	    }
	}
    result.put("td", td);
    result.put("temp", temp);
	return result;
}
%>
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
	
	String sopdata  = "";
	
	if (session.getAttribute("DATE_SOP") != null) {
	System.out.println("DATE_SOP1 = " +  session.getAttribute("DATE_SOP"));
		sopdata = "KW" + DateUtils.getWeekOfYear((String)session.getAttribute("DATE_SOP")) + "/" + 
				((String)session.getAttribute("DATE_SOP")).split("-")[0].substring(2, 4);
	System.out.println("DATE_SOP2 = " +  sopdata);
	}
%>

	<style type="text/css">
		.mytable {
			width: 100%;
			cellspacing: 0;
			cellpadding: 0;
		}
		.mytable .mytd {
			padding-left: 5px;
			font-size: 13px;
			text-align: center;
			white-space: normal;
			overflow: hidden;
			border-bottom: 1px solid #000000;
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
			<div id="content" style="width: 1000px; height: 500px; margin: 50px auto;">
				<table width="100%"	style="cellspacing: 0; cellpadding: 0; overflow: hidden;">
					<tr>
						<td class="mytd" width="150px">SOP</td>
						<td class="mytd" width="150px">Markt</td>
						<td class="mytd" width="150px">Motor</td>
						<td class="mytd" width="80px">&nbsp;</td>
						<td class="mytd" width="80px">&nbsp;</td>
						<td class="mytd" width="80px">&nbsp;</td>
						<td class="mytd" width="100px">&nbsp;</td>
						<td class="mytd" width="150px">Getreiebe</td>
						<td class="mytd" width="80px">VFF</td>
						<td class="mytd" width="80px">PVS</td>
						<td class="mytd" width="80px">0S</td>
						<td class="mytd" width="80px">SOP</td>
					</tr>
				</table>
				<table class="mytable">
					<tr><td colspan="12" style="width:100%;height:3px; border-bottom: 3px solid black; "></td></tr>
					<tr><td colspan="12" style="width:100%;height:2px; border-bottom: 1px solid black; "></td></tr>
				<%
				int temp1 = 1;
				int temp2 = 1;
				int size = fv9Market.size();
				int height = 60;
				if(size > 4){
					height = 400/size;
				}
				if(fv9Market!=null && size>0){
					for(int i=0;i<size;i++){
				%>
					<tr height="<%=height%>">
						<%
					   if(i == 0){ %>
						<td class="mytd" width="150px" rowspan="<%=fv9Market.size()%>">&nbsp;<%=sopdata %></td>
						<%  }
					   %>
					
					<%
					if(Web.getObjectYesOrNo(fv9Market)){
						Map<String,Object> map = getDisplaytd(i,size,temp1,fv9Market);
						map.get("td");
						temp1 = (Integer)map.get("temp");
						out.println(map.get("td"));
					} else {
						%>	<td class="mytd" width="150px"> &nbsp;&nbsp; </td><%
					}
					%>

					<%
					if(Web.getObjectYesOrNo(fv9Motor)){
						Map<String,Object> map = getDisplaytd(i,size,temp2,fv9Motor);
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
						   %> <%=fv9Getriebe.get(i).replaceAll("\n", "<br>")%> <%
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9VFFStatus)){
					    	if(fv9VFFStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/greenBig.jpg"
							width="30" height="70" /> <%} else if(fv9VFFStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/yellowBig.jpg"
							width="30" height="70" /> <%} else if(fv9VFFStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/redBig.jpg"
							width="30" height="70" /> <%}
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9PVSStatus)){
						   if(fv9PVSStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/greenBig.jpg"
							width="30" height="70" /> <%} else if(fv9PVSStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/yellowBig.jpg"
							width="30" height="70" /> <%} else if(fv9PVSStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/redBig.jpg"
							width="30" height="70" /> <%}
					   } else {
						  %> &nbsp;&nbsp;<%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv90SStatus)){
					    	if(fv90SStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/greenBig.jpg"
							width="30" height="70" /> <%} else if(fv90SStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/yellowBig.jpg"
							width="30" height="70" /> <%} else if(fv90SStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/redBig.jpg"
							width="30" height="70" /> <%}
					   } else {
						  %> &nbsp;&nbsp; <%
					   }
						  %>
						</td>

						<td class="mytd" width="80px">
							<%if(Web.getObjectYesOrNo(fv9SOPStatus)){
						  if(fv9SOPStatus.get(i).equals("绿")){%> <img
							src="<%=request.getContextPath()%>/app/pep/images/greenBig.jpg"
							width="30" height="70" /> <%} else if(fv9SOPStatus.get(i).equals("黄")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/yellowBig.jpg"
							width="30" height="70" /> <%} else if(fv9SOPStatus.get(i).equals("红")){%>
							<img
							src="<%=request.getContextPath()%>/app/pep/images/redBig.jpg"
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
					<tr><td colspan="12" style="width:100%;height:3px; border-bottom: 3px solid black; "></td></tr>
					
				</table>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>
</body>
</html>
