<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.tc.utils.ColorUtils"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		
		List<String> fv9ThemaNoList = (List<String>)form.get("fv9ThemaNo");  //ThemaNo
		List<String> fv9ThemaList = (List<String>)form.get("fv9Thema");//Thema
		List<String> fv9VortragenderList = (List<String>)form.get("fv9Vortragender");//Vortragender
		List<String> fv9InBFList = (List<String>)form.get("fv9InBF");//BF
		List<String> fv9InLFList = (List<String>)form.get("fv9InLF");//LF
		List<String> fv9InVFFList = (List<String>)form.get("fv9InVFF");//VFF
		List<String> fv9InPVSList = (List<String>)form.get("fv9InPVS");//PVS
		List<String> fv9In0SList = (List<String>)form.get("fv9In0S");//0-S
		List<String> fv9InSOPList = (List<String>)form.get("fv9InSOP");//SOP
		%>
		<%!
		public static String getColorByStatus(String status) {
			String color = "";
			if ("Backup".equals(status)){
				color = ColorUtils.Backup;
			}
			if ("Erforderlich".equals(status)) {
				color = ColorUtils.Erforderlich;
			}
			if ("nicht relevant".equals(status)) {
				color = ColorUtils.NichtRelevant;
			}
			return color;
		}
		%>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %></h1>
			</div>
			<div id="content">
				<table style="width: 900px; height: 500px; margin-top: 20px; overflow: hidden; margin-left: 50px; font-size: 12px;">
					<tr style="height: 20px;">
						<td colspan="9" style="padding-left: 530px; ">
							<div style="width: 18px; height: 15px; background-color: <%=ColorUtils.Backup %>; float: left; border: 1px solid;">&nbsp;</div>
							<div style="width: 60px; height: 15px; float: left; margin-left: 5px;">Backup&nbsp;&nbsp;</div>
							<div style="width: 18px; height: 15px; background-color: <%=ColorUtils.Erforderlich %>; float: left; border: 1px solid;">&nbsp;</div>
							<div style="width: 90px; height: 15px; float: left; margin-left: 5px;">Erforderlich&nbsp;&nbsp;</div>
							<div style="width: 18px; height: 15px; background-color: <%=ColorUtils.NichtRelevant %>; float: left; border: 1px solid;">&nbsp;</div>
							<div style="width: 100px; height: 15px; float: left; margin-left: 5px;">nicht relevant&nbsp;&nbsp;</div>
						</td>
					</tr>
					<tr style="height: 20px;">
						<td style="width: 50px;">&nbsp;</td>
						<td style="width: 350px;">&nbsp;</td>
						<td style="width: 200px;">&nbsp;</td>
						<td colspan="6" style="border-bottom: 1px solid;">Phase bis...</td>
					</tr>
					<tr style="height: 20px;">
						<td style="width: 40px;">&nbsp;</td>
						<td style="width: 430px; text-align: left;">Thema</td>
						<td style="width: 250px; text-align: left;">Vortragender</td>
						<td style="width: 30px; text-align: center;">BF</td>
						<td style="width: 30px; text-align: center;">LF</td>
						<td style="width: 30px; text-align: center;">VFF</td>
						<td style="width: 30px; text-align: center;">PVS</td>
						<td style="width: 30px; text-align: center;">0-S</td>
						<td style="width: 30px; text-align: center;">SOP</td>
					</tr>
					<tr>
						<td colspan="9" style="border-bottom: 1px solid; height: 1px;"></td>
					</tr>
					<%
					if (fv9ThemaNoList != null && fv9ThemaNoList.size() > 0) {
						double height = 400.0/fv9ThemaNoList.size();
						double mm = height-2; //里程碑方框的边长
						for (int i=0; i<fv9ThemaNoList.size(); i++) {
					%>
					<tr>
						<td style="height: <%=height%>px;"><%=fv9ThemaNoList.get(i) %></td>
						<td style="height: <%=height%>px;"><%=fv9ThemaList.get(i) %></td>
						<td style="height: <%=height%>px;"><%=fv9VortragenderList.get(i) %></td>
						<td style="height: <%=height%>px;">
							<%
							if (Web.getObjectYesOrNo(fv9InBFList.get(i))) {
							%>
							<div style="width: <%=mm%>px; height: <%=mm%>px; background-color: <%=getColorByStatus(fv9InBFList.get(i)) %>; float: left; border: 1px solid;">
								&nbsp;
							</div>
							<%	
							}
							%>
						</td>
						<td style="height: <%=height%>px;">
							<%
							if (Web.getObjectYesOrNo(fv9InLFList.get(i))) {
							%>
							<div style="width: <%=mm%>px; height: <%=mm%>px; background-color: <%=getColorByStatus(fv9InLFList.get(i)) %>; float: left; border: 1px solid;">
								&nbsp;
							</div>
							<%	
							}
							%>
						</td>
						<td style="height: <%=height%>px;">
							<%
							if (Web.getObjectYesOrNo(fv9InVFFList.get(i))) {
							%>
							<div style="width: <%=mm%>px; height: <%=mm%>px; background-color: <%=getColorByStatus(fv9InVFFList.get(i)) %>; float: left; border: 1px solid;">
								&nbsp;
							</div>
							<%	
							}
							%>
						</td>
						<td style="height: <%=height%>px;">
							<%
							if (Web.getObjectYesOrNo(fv9InPVSList.get(i))) {
							%>
							<div style="width: <%=mm%>px; height: <%=mm%>px; background-color: <%=getColorByStatus(fv9InPVSList.get(i)) %>; float: left; border: 1px solid;">
								&nbsp;
							</div>
							<%	
							}
							%>
						</td>
						<td style="height: <%=height%>px;">
							<%
							if (Web.getObjectYesOrNo(fv9In0SList.get(i))) {
							%>
							<div style="width: <%=mm%>px; height: <%=mm%>px; background-color: <%=getColorByStatus(fv9In0SList.get(i)) %>; float: left; border: 1px solid;">
								&nbsp;
							</div>
							<%	
							}
							%>
						</td>
						<td style="height: <%=height%>px;">
							<%
							if (Web.getObjectYesOrNo(fv9InSOPList.get(i))) {
							%>
							<div style="width: <%=mm%>px; height: <%=mm%>px; background-color: <%=getColorByStatus(fv9InSOPList.get(i)) %>; float: left; border: 1px solid;">
								&nbsp;
							</div>
							<%	
							}
							%>
						</td>
					</tr>
					<%		
						}
					} else {
					%>
					<tr>
						<td colspan="9" style="text-align: center; font-size: 16px; font-weight: bold;">
							请编辑目录!
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
