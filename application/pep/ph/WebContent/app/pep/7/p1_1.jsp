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
	<%!
	private static String getSmallImage(String imagePath, Object status) {
		String fv9Status = "";
		fv9Status = (String) status;
		if (!"".equals(fv9Status)) {
			if ("绿".equals(fv9Status)) {
				imagePath = imagePath + "/app/pep/images/greenSmall.jpg";
			}
			if ("黄".equals(fv9Status)) {
				imagePath = imagePath + "/app/pep/images/yellowSmall.jpg";
			}
			if ("红".equals(fv9Status)) {
				imagePath = imagePath + "/app/pep/images/redSmall.jpg";
			}
		} else {
			imagePath = imagePath + "/app/pep/images/defaultStatus.jpg";
		}
		return imagePath;
	}
	
	private static String getContent(Object content) {
		String fv9Content = "";
		if (!"".equals((String) content) && content != null) {
			fv9Content = (String) content;
		} 
		return fv9Content;
	}
	%>
	<%
		//整个项目状态
		String fv9ProjectStatus = "";
		String projectStatusImage = request.getContextPath() + "/app/pep/images/defaultStatus.jpg";
		if(Web.getObjectYesOrNo(form.get("fv9ProjectStatus"))){
			fv9ProjectStatus = (String) form.get("fv9ProjectStatus");
			if (!"".equals(fv9ProjectStatus)) {
				if ("绿".equals(fv9ProjectStatus)) {
					projectStatusImage = request.getContextPath() + "/app/pep/images/greenBig.jpg";
				}
				if ("黄".equals(fv9ProjectStatus)) {
					projectStatusImage = request.getContextPath() + "/app/pep/images/yellowBig.jpg";
				}
				if ("红".equals(fv9ProjectStatus)) {
					projectStatusImage = request.getContextPath() + "/app/pep/images/redBig.jpg";
				}
			}
		}
		
		//会议类型
		String fv9PHMeetStyle_GM = "";
		String fv9PHMeetStyle_CN = "";
		if (Web.getObjectYesOrNo(form.get("fv9PHMeetStyle_GM"))) {
			fv9PHMeetStyle_GM = Web.replaceSpecial((String)form.get("fv9PHMeetStyle_GM"));
		}
		if (Web.getObjectYesOrNo(form.get("fv9PHMeetStyle_CN"))) {
			fv9PHMeetStyle_CN = Web.replaceSpecial((String)form.get("fv9PHMeetStyle_CN"));
		}
		
		//产品
		String fv9ProdStatusImage = getSmallImage(request.getContextPath(), 
				form.get("fv9ProductstandStatus"));
		String fv9ProdStatusCom = getContent(form.get("fv9ProdStatusCom"));
		String fv9ProdStatusComC = getContent(form.get("fv9ProdStatusComC"));
		String fv9ProdMass_GM = getContent(form.get("fv9ProdMass_GM"));
		String fv9ProdMass_CN = getContent(form.get("fv9ProdMass_CN"));
		
		//功能
		String fv9FunktionImage = getSmallImage(request.getContextPath(), 
				form.get("fv9FunktionStatus"));
		String fv9FunktionCom = getContent(form.get("fv9FunktionCom"));
		String fv9FunktionComC = getContent(form.get("fv9FunktionComC"));
		String fv9FunktionMass_GM = getContent(form.get("fv9FunktionMass_GM"));
		String fv9FunktionMass_CN = getContent(form.get("fv9FunktionMass_CN"));
			
		//生产
		String fv9ProduktionImage = getSmallImage(request.getContextPath(), 
				form.get("fv9ProduktionStatus"));
		String fv9ProduktionCom = getContent(form.get("fv9ProduktionCom"));
		String fv9ProduktionComC = getContent(form.get("fv9ProduktionComC"));
		String fv9ProduktionMass_GM = getContent(form.get("fv9ProduktionMass_GM"));
		String fv9ProduktionMass_CN = getContent(form.get("fv9ProduktionMass_CN"));
		
		//采购
		String fv9BeschaffImage = getSmallImage(request.getContextPath(), 
				form.get("fv9BeschaffStatus"));
		String fv9BeschaffCom = getContent(form.get("fv9BeschaffCom"));
		String fv9BeschaffComC = getContent(form.get("fv9BeschaffComC"));
		String fv9BeschaffMass_GM = getContent(form.get("fv9BeschaffMass_GM"));
		String fv9BeschaffMass_CN = getContent(form.get("fv9BeschaffMass_CN"));
			
		//质保
		String fv9QualitImage = getSmallImage(request.getContextPath(), 
				form.get("fv9QualitStatus"));
		String fv9QualitCom = getContent(form.get("fv9QualitCom"));
		String fv9QualitComC = getContent(form.get("fv9QualitComC"));
		String fv9QualitMass_GM = getContent(form.get("fv9QualitMass_GM"));
		String fv9QualitMass_CN = getContent(form.get("fv9QualitMass_CN"));
		
		//销售
		String fv9VertriebImage = getSmallImage(request.getContextPath(), 
				form.get("fv9VertriebStatus"));
		String fv9VertriebCom = getContent(form.get("fv9VertriebCom"));
		String fv9VertriebComC = getContent(form.get("fv9VertriebComC"));
		String fv9VertrieMass_GM = getContent(form.get("fv9VertrieMass_GM"));
		String fv9VertrieMass_CN = getContent(form.get("fv9VertrieMass_CN"));
		
		//财务
		String fv9FinanzenImage = getSmallImage(request.getContextPath(), 
				form.get("fv9FinanzenStatus"));
		String fv9FinanzenCom = getContent(form.get("fv9FinanzenCom"));
		String fv9FinanzenComC = getContent(form.get("fv9FinanzenComC"));
		String fv9FinanzenMass_GM = getContent(form.get("fv9FinanzenMass_GM"));
		String fv9FinanzenMass_CN = getContent(form.get("fv9FinanzenMass_CN"));
		
		//CO2 
		String fv9GewichtImage = getSmallImage(request.getContextPath(), 
				form.get("fv9GewichtStatus"));
		String fv9GewichtCom = getContent(form.get("fv9GewichtCom"));
		String fv9GewichtComC = getContent(form.get("fv9GewichtComC"));
		String fv9GewichtMass_GM = getContent(form.get("fv9GewichtMass_GM"));
		String fv9GewichtMass_CN = getContent(form.get("fv9GewichtMass_CN"));
		
		//文件/认可
		String fv9DokuImage = getSmallImage(request.getContextPath(), 
				form.get("fv9DokuStatus"));
		String fv9DokuCom = getContent(form.get("fv9DokuCom"));
		String fv9DokuComC = getContent(form.get("fv9DokuComC"));
		String fv9DokuMass_GM = getContent(form.get("fv9DokuMass_GM"));
		String fv9DokuMass_CN = getContent(form.get("fv9DokuMass_CN"));
		
		//进度
		String fv9TermineImage = getSmallImage(request.getContextPath(), 
				form.get("fv9TermineStatus"));
		String fv9TermineCom = getContent(form.get("fv9TermineCom"));
		String fv9TermineComC = getContent(form.get("fv9TermineComC"));
		String fv9TerminMass_GM = getContent(form.get("fv9TerminMass_GM"));
		String fv9TerminMass_CN = getContent(form.get("fv9TerminMass_CN"));
	%>
	<style type="text/css">
		.Reifegrads {
			height: 520px;
			width: 940px;
			overflow: hidden;
		}
		.Reifegrads tr td{
			overflow: hidden;
		}
		.mileStone{
			text-align: center;
			vertical-align: middle;
			padding-top: 20px;
		}
		.titleStyleTD {
			padding-left: 5px;
			font-weight: bolder;
			font-size: 13px;
			text-align: left;
			white-space: normal;
			height: 45px;
			overflow: hidden;
			border: 1px solid #000000;
		}
		.statusTD {
			height: 45px;
			overflow: hidden;
			text-align: center;
			font-size: 8px;
		}
		.massTD {
			padding-left: 5px;
			height: 45px;
			overflow: hidden;
			text-align: left;
			font-size: 11px;
			border: 1px solid #000000;
		}
	</style>
</head>
<body>
<div id="container" style="font-size:12px;">
	<div id="nr">
	<div id="top" >
		<div class="fl"><%=status_left %></div>
		<div class="fr"><%=status_right %></div>
		<h1><%=title %></h1>
	</div>
    <div id="content">
   		<div id="german">
			<input type="button" class="china" onclick="changeChinese()" />
		</div>
		<div id="datatable1"  cellspacing="2" style="margin:0px;">
		<table class="Reifegrads" cellspacing="2">
			<tr>
				<td width="5%" height="12">&nbsp;</td>
				<td width="18%" height="12">&nbsp;</td>
			  	<td width="3.5%" height="12">&nbsp;</td>
			    <td width="34%" height="12" style="font-weight: bolder;">&nbsp;Kritische Berichtspunkte:</td>
			    <td width="34%" height="12" style="font-weight: bolder;">&nbsp;Massnahmen: </td>
			</tr>
			<tr>
			  <td width="5%" rowspan="11" class="mileStone">
				  	<img src="<%=projectStatusImage %>" alt="里程碑状态" width="50" height="118"/>
				 	<br>
				 	<div style="width: 80px;"><%=fv9PHMeetStyle_GM %></div>
			  </td>
			  <td width="18%" class="titleStyleTD">Produktstand</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9ProdStatusImage %>" width="23" height="50"/>
			  </td>
			  <td width="34%" class="massTD"><%=fv9ProdStatusCom %></td>
			   <td width="34%" class="massTD"><%=fv9ProdMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Funktionserfuellung</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9FunktionImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9FunktionCom %></td>
			   <td width="34%" class="massTD"><%=fv9FunktionMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Produktion/<br>Standardisierung</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9ProduktionImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9ProduktionCom %></td>
			   <td width="34%" class="massTD"><%=fv9ProduktionMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Beschaffung</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9BeschaffImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9BeschaffCom %></td>
			   <td width="34%" class="massTD"><%=fv9BeschaffMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Qualitaet</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9QualitImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9QualitCom %></td>
			   <td width="34%" class="massTD"><%=fv9QualitMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Vertrieb / Markt</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9VertriebImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9VertriebCom %></td>
			   <td width="34%" class="massTD"><%=fv9VertrieMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Finanzen</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9FinanzenImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9FinanzenCom %></td>
			   <td width="34%" class="massTD"><%=fv9FinanzenMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Gewicht / CO2</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9GewichtImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9GewichtCom %></td>
			   <td width="34%" class="massTD"><%=fv9GewichtMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Doku / Freigaben</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9DokuImage%>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9DokuCom %></td>
			   <td width="34%" class="massTD"><%=fv9DokuMass_GM %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">Termine / Orga</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9TermineImage%>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9TermineCom %></td>
			   <td width="34%" class="massTD"><%=fv9TerminMass_GM %></td>
			</tr>
		</table>
		</div>

		<div id="china" style="display: none;">
			<input type="button" class="german" onclick="changeGerman()"/>
		</div>
		<div id="datatable2" style="display: none;">
		   <table class="Reifegrads" cellspacing="2">
			<tr>
				<td width="5%" height="12">&nbsp;</td>
				<td width="18%" height="12">&nbsp;</td>
			  	<td width="3.5%" height="12">&nbsp;</td>
			    <td width="34%" height="12" style="font-weight: bolder;">&nbsp;重要汇报点:</td>
			    <td width="34%" height="12" style="font-weight: bolder;">&nbsp;措施: </td>
			</tr>
			<tr>
			  <td width="5%" rowspan="11" class="mileStone">
				  	<img src="<%=projectStatusImage %>" alt="里程碑状态" width="50" height="118"/>
				 	<br>
				 	<div style="width: 80px;"><%=fv9PHMeetStyle_CN %></div>
			  </td>
			  <td width="18%" class="titleStyleTD">产品状态</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9ProdStatusImage %>" width="23" height="50"/>
			  </td>
			  <td width="34%" class="massTD"><%=fv9ProdStatusComC %></td>
			   <td width="34%" class="massTD"><%=fv9ProdMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">功能</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9FunktionImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9FunktionComC %></td>
			   <td width="34%" class="massTD"><%=fv9FunktionMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">生产</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9ProduktionImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9ProduktionComC %></td>
			   <td width="34%" class="massTD"><%=fv9ProduktionMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">采购</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9BeschaffImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9BeschaffComC %></td>
			   <td width="34%" class="massTD"><%=fv9BeschaffMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">质量</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9QualitImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9QualitComC %></td>
			   <td width="34%" class="massTD"><%=fv9QualitMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">销售/市场</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9VertriebImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9VertriebComC %></td>
			   <td width="34%" class="massTD"><%=fv9VertrieMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">财务</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9FinanzenImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9FinanzenComC %></td>
			   <td width="34%" class="massTD"><%=fv9FinanzenMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">重量/CO2</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9GewichtImage %>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9GewichtComC %></td>
			   <td width="34%" class="massTD"><%=fv9GewichtMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">文件/认可</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9DokuImage%>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9DokuComC %></td>
			   <td width="34%" class="massTD"><%=fv9DokuMass_CN %></td>
			</tr>
			<tr>
			  <td width="18%" class="titleStyleTD">进度/组织</td>
			  <td width="3.5%" class="statusTD">
			  	<img src="<%=fv9TermineImage%>" width="23" height="50"/>
			  </td>
			   <td width="34%" class="massTD"><%=fv9TermineComC %></td>
			   <td width="34%" class="massTD"><%=fv9TerminMass_CN %></td>
			</tr>
		</table>
		</div>
 	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
