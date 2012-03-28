<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%!
		public static String getBorderDate(String date, String mlDate) {
			if ("".equals(date) && !"1900-01-01 00:00:00".equals(mlDate)) {
				date = mlDate;
			}
			return date;
		}
		
		public class YearInfo {
			int year;
			int month;
			int cols;
		}
		
		public static boolean getMLIndex(String MLDate, String compareDate) {
			if (!"".equals(MLDate) && !"".equals(compareDate)) {
				int MLYear = Integer.parseInt(MLDate.split("-")[0]);
				int MLMonth = Integer.parseInt(MLDate.split("-")[1]);
				
				int comYear = Integer.parseInt(compareDate.split("-")[0]);
				int comMonth = Integer.parseInt(compareDate.split("-")[1]);
				
				if ((MLYear == comYear) && (MLMonth == comMonth)) {
					return true;
				}
			}
			return false;
		}
		
		public static String getDiv(HttpServletRequest request,
				String ML, String MLDate, String MLOrg, 
				int MLIndex, double tdWidth, double marginLeft) {
			String div_class = "";
			
			//此里程碑存在时间
			if (MLIndex > 0) {
				double left = 0.0; //
				int flag = DateUtils.getTenDays(MLDate);
				if (flag == 1) {
					//上旬-菱形处于月前的线上
					left = marginLeft + MLIndex*(tdWidth+1.5) - tdWidth/2;
				}
				if (flag == 2) {
					//下旬-菱形处于月末的线上
					left = marginLeft + MLIndex*(tdWidth+1.5) + tdWidth/2;
				}
				
				div_class += "<div style=\"width: " + tdWidth + "px; height:100px; position: absolute;left: " + left + "px;top: 410px;\">";
				div_class += "	<div style=\"width: 100%; float: left; text-align:center; font-size:10px;\">" + ML + "</div>";
				div_class += "	<div style=\"width: 100%; float: left;\">";
				div_class += "		<img src=\"" + request.getContextPath() + "/app/pep/images/bg.gif\" width=\"" + tdWidth + "\" height=\""+tdWidth+"\">";
				div_class += "	</div>";
				div_class += "</div>";
			}
		
			return div_class;
		}
		
		
		%>
		<%
		String project = "";
		if (!"".equals((String)request.getSession().getAttribute("project"))) {
			project = (String)request.getSession().getAttribute("project");
		}
		
		String startDate = "";
		String endDate = "";
		
		String fv9PMMLDate = (String)form.get("fv9PMMLDate");//	里程碑日期_PM
		String fv9PMMLOrg = (String)form.get("fv9PMMLOrg");//	验收机构_PM
		
		String fv9PPMLDate = (String)form.get("fv9PPMLDate");//	里程碑日期_PP
		String fv9PPMLOrg = (String)form.get("fv9PPMLOrg");//	验收机构_PP
		
		String fv9PDMLDate = (String)form.get("fv9PDMLDate");//	里程碑日期_PD
		String fv9PDMLOrg = (String)form.get("fv9PDMLOrg");//	验收机构_PD
		
		String fv9PFMLDate = (String)form.get("fv9PFMLDate");//	里程碑日期_PF
		String fv9PFMLOrg = (String)form.get("fv9PFMLOrg");//	验收机构_PF
		
		String fv9KEMLDate = (String)form.get("fv9KEMLDate");//	里程碑日期_KE
		String fv9KEMLOrg = (String)form.get("fv9KEMLOrg");//	验收机构_KE
		
		String fv9DEMLDate = (String)form.get("fv9DEMLDate");//	里程碑日期_DE
		String fv9DEMLOrg = (String)form.get("fv9DEMLOrg");//	验收机构_DE
		
		String fv9DFExtMLDate = (String)form.get("fv9DFExtMLDate");//	里程碑日期_DF Ext
		String fv9DFExtMLOrg = (String)form.get("fv9DFExtMLOrg");//	验收机构_DF Ext
		
		String fv9DFIntMLDate = (String)form.get("fv9DFIntMLDate");//	里程碑日期_DF Int
		String fv9DFIntMLOrg = (String)form.get("fv9DFIntMLOrg");//	验收机构_DF Int
		
		String fv9BFMLDate = (String)form.get("fv9BFMLDate");//	里程碑日期_BF
		String fv9BFMLOrg = (String)form.get("fv9BFMLOrg");//	验收机构_BF
		
		String fv9LFMLDate = (String)form.get("fv9LFMLDate");//	里程碑日期_LF
		String fv9LFMLOrg = (String)form.get("fv9LFMLOrg");//	验收机构_LF
		
		String fv9VFFMLDate = (String)form.get("fv9VFFMLDate");//	里程碑日期_VFF
		String fv9VFFMLOrg = (String)form.get("fv9VFFMLOrg");//	验收机构_VFF
		
		String fv9PVSMLDate = (String)form.get("fv9PVSMLDate");//	里程碑日期_PVS
		String fv9PVSMLOrg = (String)form.get("fv9PVSMLOrg");//	验收机构_PVS
		
		String fv90SMLDate = (String)form.get("fv90SMLDate");//	里程碑日期_0S
		String fv90SMLOrg = (String)form.get("fv90SMLOrg");//	验收机构_0S
		
		String fv9SOPMLDate = (String)form.get("fv9SOPMLDate");//	里程碑日期_SOP
		String fv9SOPMLOrg = (String)form.get("fv9SOPMLOrg");//	验收机构_SOP
		
		String fv9MEMLDate = (String)form.get("fv9MEMLDate");//	里程碑日期_ME
		String fv9MEMLOrg = (String)form.get("fv9MEMLOrg");//	验收机构_ME
		
		//默认为开始时间为PM时间
		if (!"1900-01-01 00:00:00".equals(fv9PMMLDate)) {
			startDate = fv9PMMLDate;
		}
		startDate = getBorderDate(startDate, fv9PPMLDate);
		startDate = getBorderDate(startDate, fv9PDMLDate);
		startDate = getBorderDate(startDate, fv9PFMLDate);
		startDate = getBorderDate(startDate, fv9KEMLDate);
		startDate = getBorderDate(startDate, fv9DEMLDate);
		startDate = getBorderDate(startDate, fv9DFExtMLDate);
		startDate = getBorderDate(startDate, fv9DFIntMLDate);
		startDate = getBorderDate(startDate, fv9BFMLDate);
		startDate = getBorderDate(startDate, fv9LFMLDate);
		startDate = getBorderDate(startDate, fv9VFFMLDate);
		startDate = getBorderDate(startDate, fv9PVSMLDate);
		startDate = getBorderDate(startDate, fv90SMLDate);
		startDate = getBorderDate(startDate, fv9SOPMLDate);
		startDate = getBorderDate(startDate, fv9MEMLDate);
		
		//默认为结束时间为ME时间
		if (!"1900-01-01 00:00:00".equals(fv9MEMLDate)) {
			endDate = fv9MEMLDate;
		}
		endDate = getBorderDate(endDate, fv9SOPMLDate);
		endDate = getBorderDate(endDate, fv90SMLDate);
		endDate = getBorderDate(endDate, fv9PVSMLDate);
		endDate = getBorderDate(endDate, fv9VFFMLDate);
		endDate = getBorderDate(endDate, fv9LFMLDate);
		endDate = getBorderDate(endDate, fv9BFMLDate);
		endDate = getBorderDate(endDate, fv9DFIntMLDate);
		endDate = getBorderDate(endDate, fv9DFExtMLDate);
		endDate = getBorderDate(endDate, fv9DEMLDate);
		endDate = getBorderDate(endDate, fv9KEMLDate);
		endDate = getBorderDate(endDate, fv9PFMLDate);
		endDate = getBorderDate(endDate, fv9PDMLDate);
		endDate = getBorderDate(endDate, fv9PPMLDate);
		
		%>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top">
				<div class="fl"><%=status_left %></div>
				<div class="fr"><%=status_right %></div>
				<h1><%=title %>11111111</h1>
			</div>
			<div id="content">
			<%
			//最早时间与最晚时间前后各加4个月
			startDate = DateUtils.getDateAddMonth(startDate, 4, "-");
			endDate = DateUtils.getDateAddMonth(endDate, 4, "+");
			System.out.println("startDate = " + startDate);
			System.out.println("endDate = " + endDate);
			
			int tdNum = 0;
			if (!"".equals(startDate) && !"".endsWith(endDate)) {
				tdNum = DateUtils.getTwoDateSepMonths(startDate, endDate) + 1;
			}
			int PMIndex=0, PPIndex=0, PDIndex=0, PFIndex=0, KEIndex=0, DEIndex = 0;
			int DFExtIndex=0, DFIntIndex=0, BFIndex=0, LFIndex=0, VFFIndex=0, PVSIndex = 0;
			int OSIndex=0, SOPIndex=0, MEIndex = 0;

			if (tdNum > 0) {
				double tdWidth = 780.0/tdNum;
				System.out.println("tdWidth = " + tdWidth);
				
				int[] year = new int[tdNum + 1]; //多写一年为了合并单元格时做比较
				int[] month = new int[tdNum];
				String temp_date = "";
				for (int n=0; n<tdNum; n++) {
					temp_date = DateUtils.getDateAddMonth(startDate, n, "+"); //循环增加一个月
					year[n] = Integer.parseInt(temp_date.split("-")[0]);
					month[n] = Integer.parseInt(temp_date.split("-")[1]);
					
					//获得每个里程碑所在TD的索引
					if (getMLIndex(fv9PMMLDate, temp_date)) 
						PMIndex = n;
					if (getMLIndex(fv9PPMLDate, temp_date))
						PPIndex = n;
					if (getMLIndex(fv9PDMLDate, temp_date))
						PDIndex = n;
					if (getMLIndex(fv9PFMLDate, temp_date))
						PFIndex = n;
					if (getMLIndex(fv9KEMLDate, temp_date))
						KEIndex = n;
					if (getMLIndex(fv9DEMLDate, temp_date))
						DEIndex = n;
					if (getMLIndex(fv9DFExtMLDate, temp_date))
						DFExtIndex = n;
					if (getMLIndex(fv9DFIntMLDate, temp_date))
						DFIntIndex = n;
					if (getMLIndex(fv9BFMLDate, temp_date))
						BFIndex = n;
					if (getMLIndex(fv9LFMLDate, temp_date))
						LFIndex = n;
					if (getMLIndex(fv9VFFMLDate, temp_date))
						VFFIndex = n;
					if (getMLIndex(fv9PVSMLDate, temp_date))
						PVSIndex = n;
					if (getMLIndex(fv90SMLDate, temp_date))
						OSIndex = n;
					if (getMLIndex(fv9SOPMLDate, temp_date))
						SOPIndex = n;
					if (getMLIndex(fv9MEMLDate, temp_date))
						MEIndex = n;
				}

				year[tdNum] = 1900; //添加最后一年的信息，用来比较
				
				int count = 0;
				int	tempYear = year[0];
				YearInfo yearinfo = new YearInfo();
				List<YearInfo> yearList = new ArrayList<YearInfo>();
				
				for (int y=0; y<year.length; y++) {
					//不同年
					if (tempYear != year[y]) {
						//将前一年的信息添加到LIST中
						yearList.add(yearinfo);
						//重新计算下一年
						yearinfo = new YearInfo();
						count = 0;
						yearinfo.year = year[y];
						tempYear = year[y];
						yearinfo.cols = count;
					} 
					
					//同一年
					if (tempYear == year[y]){
						count++;
						yearinfo.year = year[y];
						yearinfo.cols = count;
					}
					
				}
				
				int month1 = 0; //PF-LF
				int month2 = 0; //LF-SOP
				if (!"1900-01-01 00:00:00".equals(fv9PFMLDate) &&
						!"1900-01-01 00:00:00".equals(fv9LFMLDate)) {
					month1 = DateUtils.getTwoDateSepMonths(fv9PFMLDate, fv9LFMLDate);
				}
				if (!"1900-01-01 00:00:00".equals(fv9LFMLDate) &&
						!"1900-01-01 00:00:00".equals(fv9SOPMLDate)) {
					month2 = DateUtils.getTwoDateSepMonths(fv9LFMLDate, fv9SOPMLDate);
				}
				
				
				
				
			%>
				<table style="border: 1px solid; width: 1000px; height: 300px; margin: 100px 0px auto; 
				font-size: 9px; text-align: center; padding: 0px;">
					<!-- 时间轴 - 年 -->
					<tr>
						<td style="width: 180px; height: 78px; border: 1px solid;" 
							rowspan="2">
							Projekt
						</td>
					<%
					for (int l=0; l<yearList.size(); l++) {
						YearInfo y = (YearInfo)yearList.get(l);
					%>
						<td style="height:48px;border: 1px solid;" 
							colspan="<%=y.cols%>">
						<%=y.year %>
						</td>
					<%
					}
					%>
					</tr>
					
					<!-- 时间轴 - 月 -->
					<tr>
					<%
					for (int m=0; m<month.length; m++) {
					%>
						<td style="width: <%=tdWidth%>; height:30px; border: 1px solid;">
							<%=month[m]%>
						</td>
						
					<%
					}
					%>
					
					</tr>
					
					<!-- 里程碑 -->
					<tr>
						<td style="width: 180px; height: 140px; border: 1px solid;" rowspan="3">
							<%=project %>
						</td>
					<%
					for (int m=0; m<month.length; m++) {
						
					%>
						<td style="width: <%=tdWidth%>px; height: 107px;border: 1px solid;">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</td>	

						
					<%
					
					}
					%>
					</tr>
					
					<!-- 合并里程碑 -->
					<tr>
					<%
						for (int m=0; m<PFIndex; m++) {
					%>
						<td style="width: <%=tdWidth%>px; height: 16px;border: 1px solid;">
						
						</td>
					<%
						}
					%>
						<td colspan="<%=month1%>" style="background-color: #B0B0B0; color: white; border: 1px solid;"><%=month1 %>&nbsp;Mo</td>
						<td colspan="<%=month2%>" style="background-color: #808080; color: white; border: 1px solid;"><%=month2 %>&nbsp;Mo</td>
					<%
						int last = month.length - PFIndex - month1 - month2;
						for (int m=0; m<last; m++) {
					%>
						<td style="width: <%=tdWidth%>px; height: 16px;border: 1px solid;">
						
						</td>
					<%
						}
					%>
						
						<td colspan="<%=tdNum - PFIndex - month1 - month2%>" style=""></td>
					</tr>
					
					<!-- 空白处 -->
					<tr>
					<%
					for (int m=0; m<month.length; m++) {
					%>
						<td style="width: <%=tdWidth%>; height:17px; border: 1px solid;">
							
						</td>
					<%
					}
					%>
						
					</tr>
				</table>
				<!-- 开始写入里程碑，计算绝对位置 -->
			<%
			double marginLeft = 136.0;
			
			String PMDiv = "", PPDiv = "", PDDiv = "", PFDiv = "";
			String KEDiv = "", DEDiv = "", DFExtDiv = "", DFIntDiv = "";
			String BFDiv = "", LFDiv = "", VFFDiv = "", PVSDiv = "";
			String OSDiv = "", SOPDiv = "", MEDiv = "";
			
			//判断每个里程碑是否与后一个里程碑在同一个月
			//如果两个里程碑在同一个月，则取前一个里程碑的责任部门显示
			//如果一个里程碑与前面的里程碑在同一个月内，那么不显示后一个里程碑
			//PM
			if (PMIndex != PPIndex) {
				PMDiv = getDiv(request, "PM", fv9PMMLDate, fv9PMMLOrg, PMIndex, tdWidth, marginLeft);
			} else {
				PMDiv = getDiv(request, "PM<br>PP", fv9PMMLDate, fv9PMMLOrg, PMIndex, tdWidth, marginLeft);
			}
			//PP
			if (PPIndex != PDIndex && PPIndex != PMIndex) {
				//不与后面的里程碑在相同月份
				PPDiv = getDiv(request, "PP", fv9PPMLDate, fv9PPMLOrg, PPIndex, tdWidth, marginLeft);
			} else if (PPIndex == PMIndex){
				//与前面里程碑在相同月份
				PPDiv = "";
			} else {
				//其他情况-前后里程碑在同一月份内
				PPDiv = getDiv(request, "PP<br>PD", fv9PPMLDate, fv9PPMLOrg, PPIndex, tdWidth, marginLeft);
			}
			//PD
			if (PDIndex != PFIndex && PDIndex != PPIndex) {
				PDDiv = getDiv(request, "PD", fv9PDMLDate, fv9PDMLOrg, PDIndex, tdWidth, marginLeft);
			} else if (PDIndex == PPIndex) {
				PDDiv = "";
			} else {
				PDDiv = getDiv(request, "PD<br>PF", fv9PDMLDate, fv9PDMLOrg, PDIndex, tdWidth, marginLeft);
			}
			//PF
			if (PFIndex != KEIndex && PFIndex != PDIndex) {
				PFDiv = getDiv(request, "PF", fv9PFMLDate, fv9PFMLOrg, PFIndex, tdWidth, marginLeft);
			} else if (PFIndex == PDIndex) {
				PFDiv = "";
			} else {
				PFDiv = getDiv(request, "PF<br>KE", fv9PFMLDate, fv9PFMLOrg, PFIndex, tdWidth, marginLeft);
			}
			//KE
			if (KEIndex != DEIndex && KEIndex != PFIndex) {
				KEDiv = getDiv(request, "KE", fv9KEMLDate, fv9KEMLOrg, KEIndex, tdWidth, marginLeft);
			} else if (KEIndex == PFIndex) {
				KEDiv = "";
			} else {
				KEDiv = getDiv(request, "KE<br>DE", fv9KEMLDate, fv9KEMLOrg, KEIndex, tdWidth, marginLeft);
			}
			//DE
			if (DEIndex != DFExtIndex && DEIndex != KEIndex) {
				DEDiv = getDiv(request, "DE", fv9DEMLDate, fv9DEMLOrg, DEIndex, tdWidth, marginLeft);
			} else if (DEIndex == KEIndex) {
				DEDiv = "";
			} else {
				DEDiv = getDiv(request, "DE<br>DFExt", fv9DEMLDate, fv9DEMLOrg, DEIndex, tdWidth, marginLeft);
			}
			//DFExt
			if (DFExtIndex != DFIntIndex && DFExtIndex != DEIndex) {
				DFExtDiv = getDiv(request, "DFExt", fv9DFExtMLDate, fv9DFExtMLOrg, DFExtIndex, tdWidth, marginLeft);
			} else if (DFExtIndex == DEIndex) {
				DFExtDiv = "";
			} else {
				DFExtDiv = getDiv(request, "DFExt<br>DFInt", fv9DFExtMLDate, fv9DFExtMLOrg, DFExtIndex, tdWidth, marginLeft);
			}
			//DFInt
			if (DFIntIndex != DFExtIndex && DFIntIndex != BFIndex) {
				DFIntDiv = getDiv(request, "DFInt", fv9DFIntMLDate, fv9DFIntMLOrg, DFIntIndex, tdWidth, marginLeft);
			} else if (DFIntIndex == DFExtIndex) {
				DFIntDiv = "";
			} else {
				DFIntDiv = getDiv(request, "DFInt<br>BF", fv9DFIntMLDate, fv9DFIntMLOrg, DFIntIndex, tdWidth, marginLeft);
			}
			//BF
			if (BFIndex != LFIndex && BFIndex != DFIntIndex) {
				BFDiv = getDiv(request, "BF", fv9BFMLDate, fv9BFMLOrg, BFIndex, tdWidth, marginLeft);
			} else if (BFIndex == DFIntIndex) {
				BFDiv = "";
			} else {
				BFDiv = getDiv(request, "BF<br>LF", fv9BFMLDate, fv9BFMLOrg, BFIndex, tdWidth, marginLeft);
			}
			//LF
			if (LFIndex != VFFIndex && LFIndex != BFIndex) {
				LFDiv = getDiv(request, "LF", fv9LFMLDate, fv9LFMLOrg, LFIndex, tdWidth, marginLeft);
			} else if (LFIndex == BFIndex) {
				LFDiv = "";
			} else {
				LFDiv = getDiv(request, "LF<br>VFF", fv9LFMLDate, fv9LFMLOrg, LFIndex, tdWidth, marginLeft);
			}
			//VFF
			if (VFFIndex != PVSIndex && VFFIndex != LFIndex) {
				VFFDiv = getDiv(request, "VFF", fv9VFFMLDate, fv9VFFMLOrg, VFFIndex, tdWidth, marginLeft);
			} else if (LFIndex == BFIndex) {
				VFFDiv = "";
			} else {
				VFFDiv = getDiv(request, "VFF<br>PVS", fv9VFFMLDate, fv9VFFMLOrg, VFFIndex, tdWidth, marginLeft);
			}
			//PVS
			if (PVSIndex != OSIndex && PVSIndex != VFFIndex) {
				PVSDiv = getDiv(request, "PVS", fv9PVSMLDate, fv9PVSMLOrg, PVSIndex, tdWidth, marginLeft);
			} else if (PVSIndex == VFFIndex) {
				PVSDiv = "";
			} else {
				PVSDiv = getDiv(request, "PVS<br>0-S", fv9PVSMLDate, fv9PVSMLOrg, PVSIndex, tdWidth, marginLeft);
			}
			//0S
			if (OSIndex != SOPIndex && OSIndex != PVSIndex) {
				OSDiv = getDiv(request, "0-S", fv90SMLDate, fv90SMLOrg, OSIndex, tdWidth, marginLeft);
			} else if (OSIndex == PVSIndex) {
				OSDiv = "";
			} else {
				OSDiv = getDiv(request, "0-S<br>SOP", fv90SMLDate, fv90SMLOrg, OSIndex, tdWidth, marginLeft);
			}
			//SOP
			if (SOPIndex != MEIndex && SOPIndex != OSIndex) {
				SOPDiv = getDiv(request, "SOP", fv9SOPMLDate, fv9SOPMLOrg, SOPIndex, tdWidth, marginLeft);
			} else if (SOPIndex == OSIndex) {
				SOPDiv = "";
			} else {
				SOPDiv = getDiv(request, "SOP<br>ME", fv9SOPMLDate, fv9SOPMLOrg, SOPIndex, tdWidth, marginLeft);
			}
			//ME
			if (MEIndex != SOPIndex) {
				MEDiv = getDiv(request, "ME", fv9MEMLDate, fv9MEMLOrg, MEIndex, tdWidth, marginLeft);
			} else {
				MEDiv = "";
			} 
			
			%>

			<%=PMDiv %>
			<%=PPDiv %>
			<%=PDDiv %>
			<%=PFDiv %>
			<%=KEDiv %>
			<%=DEDiv %>
			<%=DFExtDiv %>
			<%=DFIntDiv %>
			<%=BFDiv %>
			<%=LFDiv %>
			<%=VFFDiv %>
			<%=PVSDiv %>
			<%=OSDiv %>
			<%=SOPDiv %>
			<%=MEDiv %>
			<%
			
			}
			%>
				
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
