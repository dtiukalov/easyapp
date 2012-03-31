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
					left = marginLeft + MLIndex*(tdWidth+1) - tdWidth/2;
				}
				if (flag == 2) {
					//下旬-菱形处于月末的线上
					left = marginLeft + MLIndex*(tdWidth+1) + tdWidth/2;
				}
				
				div_class += "<div style=\"width: " + tdWidth + "px; height:100px; text-align: center; position: absolute;left: " + left + "px;top: 375px; font-size: 12px; font-weight: bolder;\">";
				div_class += "	<div style=\"width: 100%; height:50px; float: left; font-size:12px; vertical-align: bottom;\">" + ML + "</div>";
				div_class += "	<div style=\"width: 100%; height:22px; float: left; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
									+ request.getContextPath() 
									+ "/app/pep/images/bg.gif', sizingMethod='scale'); \">";
				div_class += "		<span style=\"color:white; font-size:10px; vertical-align: bottom;\">"+MLOrg+"</span>";
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
				<h1><%=title %></h1>
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
			
			int currentIndex = 0;
			String currentDate = DateUtils.getSysDate();
			System.out.println("currentDate = " + currentDate);
			
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
					
					if (getMLIndex(currentDate, temp_date)) {
						currentIndex = n;
					}
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
				
				
				System.out.println("PFIndex = " + PFIndex);
				System.out.println("LFIndex = " + LFIndex);
				System.out.println("SOPIndex = " + SOPIndex);
				
				int month1 = LFIndex - PFIndex; //PF-LF
				int month2 = SOPIndex - LFIndex; //LF-SOP (如果SOP在下旬，多加一个月)
				System.out.println("month1 = " + month1);
				System.out.println("month2 = " + month2);
				//LF在上旬、SOP在下旬，月份+1
			/* 	if ((DateUtils.getTenDays(fv9PFMLDate) == 1 && DateUtils.getTenDays(fv9LFMLDate) == 2) ||
						((Integer.parseInt(fv9PFMLDate.split("-")[2]) > Integer.parseInt(fv9LFMLDate.split("-")[2]))))
					month1 += 1;
				
				if ((DateUtils.getTenDays(fv9LFMLDate) == 1 && DateUtils.getTenDays(fv9SOPMLDate) == 2) ||
						((Integer.parseInt(fv9LFMLDate.split("-")[2]) > Integer.parseInt(fv9SOPMLDate.split("-")[2]))))
					month2 += 1; */
				System.out.println("month11 = " + month1);
				System.out.println("month22 = " + month2);
				/* if (!"1900-01-01 00:00:00".equals(fv9PFMLDate) &&
						!"1900-01-01 00:00:00".equals(fv9LFMLDate)) {
					month1 = DateUtils.getTwoDateSepMonths(fv9PFMLDate, fv9LFMLDate);
					if ((Integer.parseInt(fv9PFMLDate.split("-")[2]) > Integer.parseInt(fv9LFMLDate.split("-")[2])) ||
							(Integer.parseInt(fv9PFMLDate.split("-")[2]) < Integer.parseInt(fv9LFMLDate.split("-")[2]))) {
						month1 += 1;
					}
				}
				if (!"1900-01-01 00:00:00".equals(fv9LFMLDate) &&
						!"1900-01-01 00:00:00".equals(fv9SOPMLDate)) {
					month2 = DateUtils.getTwoDateSepMonths(fv9LFMLDate, fv9SOPMLDate);
					if ((Integer.parseInt(fv9LFMLDate.split("-")[2]) > Integer.parseInt(fv9SOPMLDate.split("-")[2])) ||
							(Integer.parseInt(fv9LFMLDate.split("-")[2]) < Integer.parseInt(fv9SOPMLDate.split("-")[2]))) {
						month2 += 1;
					}
				} */
			%>
				<table style="border: 1px solid; width: 1000px; height: 300px; margin: 100px 0px auto; 
				font-size: 9px; text-align: center; padding: 0px;
				border-collapse:collapse; border:none; border-bottom: 1px solid;">
					<!-- 时间轴 - 年 -->
					<tr>
						<td style="width: 180px; height: 78px; border: 1px solid; 
							text-align: left; font-size: 18px; font-weight: bolder;"  
							rowspan="2">
							&nbsp;&nbsp;Projekt
						</td>
					<%
					for (int l=0; l<yearList.size(); l++) {
						YearInfo y = (YearInfo)yearList.get(l);
					%>
						<td style="height:48px;border: 1px solid; 
							font-size: 15px; font-weight: bolder; background-color: #FFFFC0;" 
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
						<td style="width: <%=tdWidth%>; height:30px; 
							border: 1px solid; background-color: #FFFFC0;">
							<%=month[m]%>
					<%
					//当前月上加红线
						if (m == currentIndex) {
							%>
							<div style="width: 2px; background-color: #FF00FF; 
								height: 195px; 
								position: absolute;
								margin-left:<%=tdWidth/2%>px;">
							</div>
							<%
						}
					
					%>
						</td>
						
					<%
					}
					%>
					
					</tr>
					
					<!-- 里程碑 -->
					<tr>
						<td style="width: 180px; height: 110px; border: 1px solid;
							text-align: left; font-size: 18px; font-weight: bolder; overflow: hidden;">
							&nbsp;&nbsp;<%=project %>
						</td>
					<%
					for (int m=0; m<month.length; m++) {
						//一年的最后一个月用黑线表示
						//最后一列不需要右边框
						boolean flag = false;
						if (month[m]==12) 
							flag = true; 
							 
					%>
						<td style="width: <%=tdWidth%>px; height: 110px;
						border-top: 1px solid white;
						border-left: 1px solid #E0E0E0; 
						
						<%
						if (flag) {
							out.print("border-right: 1px solid;");
						} else if (m == month.length-1) {
							out.print("border-right: 1px solid;");
						} else {
							out.print("border-right: 1px solid #E0E0E0;");
						}
						%>
						">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</td>	

						
					<%
					
					}
					%>
					</tr>
					
					
				</table>
			<%
			//开始写入里程碑，计算绝对位置
			double marginLeft = 180.0;
			
			String PMDiv = "", PPDiv = "", PDDiv = "", PFDiv = "";
			String KEDiv = "", DEDiv = "", DFExtDiv = "", DFIntDiv = "";
			String BFDiv = "", LFDiv = "", VFFDiv = "", PVSDiv = "";
			String OSDiv = "", SOPDiv = "", MEDiv = "";
			
			//判断每个里程碑是否与后一个里程碑在同一个月
			//如果两个里程碑在同一个月，则取前一个里程碑的责任部门显示
			//如果一个里程碑与前面的里程碑在同一个月内，那么不显示后一个里程碑
			//PM
			if (PMIndex != PPIndex) {
				PMDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>PM", fv9PMMLDate, fv9PMMLOrg, PMIndex, tdWidth, marginLeft);
			} else {
				PMDiv = getDiv(request, "PM<br>nbsp;<br>PP", fv9PMMLDate, fv9PMMLOrg, PMIndex, tdWidth, marginLeft);
			}
			//PP
			if (PPIndex != PDIndex && PPIndex != PMIndex) {
				//不与后面的里程碑在相同月份
				PPDiv = getDiv(request, "sp;<br>&nbsp;<br>PP", fv9PPMLDate, fv9PPMLOrg, PPIndex, tdWidth, marginLeft);
			} else if (PPIndex == PMIndex){
				//与前面里程碑在相同月份
				PPDiv = "";
			} else {
				//其他情况-前后里程碑在同一月份内
				PPDiv = getDiv(request, "PP<br>&nbsp;<br>PD", fv9PPMLDate, fv9PPMLOrg, PPIndex, tdWidth, marginLeft);
			}
			//PD
			if (PDIndex != PFIndex && PDIndex != PPIndex) {
				PDDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>PD", fv9PDMLDate, fv9PDMLOrg, PDIndex, tdWidth, marginLeft);
			} else if (PDIndex == PPIndex) {
				PDDiv = "";
			} else {
				PDDiv = getDiv(request, "PD<br>&nbsp;<br>PF", fv9PDMLDate, fv9PDMLOrg, PDIndex, tdWidth, marginLeft);
			}
			//PF
			if (PFIndex != KEIndex && PFIndex != PDIndex) {
				PFDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>PF", fv9PFMLDate, fv9PFMLOrg, PFIndex, tdWidth, marginLeft);
			} else if (PFIndex == PDIndex) {
				PFDiv = "";
			} else {
				PFDiv = getDiv(request, "PF<br>&nbsp;<br>KE", fv9PFMLDate, fv9PFMLOrg, PFIndex, tdWidth, marginLeft);
			}
			//KE
			if (KEIndex != DEIndex && KEIndex != PFIndex) {
				KEDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>KE", fv9KEMLDate, fv9KEMLOrg, KEIndex, tdWidth, marginLeft);
			} else if (KEIndex == PFIndex) {
				KEDiv = "";
			} else {
				KEDiv = getDiv(request, "KE<br>&nbsp;<br>DE", fv9KEMLDate, fv9KEMLOrg, KEIndex, tdWidth, marginLeft);
			}
			//DE
			if (DEIndex != DFExtIndex && DEIndex != KEIndex) {
				DEDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>DE", fv9DEMLDate, fv9DEMLOrg, DEIndex, tdWidth, marginLeft);
			} else if (DEIndex == KEIndex) {
				DEDiv = "";
			} else {
				DEDiv = getDiv(request, "DE<br>&nbsp;<br>DF<span style=\"font-size:8px;\">Ext</span>", fv9DEMLDate, fv9DEMLOrg, DEIndex, tdWidth, marginLeft);
			}
			//DFExt
			if (DFExtIndex != DFIntIndex && DFExtIndex != DEIndex) {
				DFExtDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>DF<span style=\"font-size:8px;\">Ext</span>", fv9DFExtMLDate, fv9DFExtMLOrg, DFExtIndex, tdWidth, marginLeft);
			} else if (DFExtIndex == DEIndex) {
				DFExtDiv = "";
			} else {
				DFExtDiv = getDiv(request, "DFExt<br>&nbsp;<br>DF<span style=\"font-size:8px;\">Int</span>", fv9DFExtMLDate, fv9DFExtMLOrg, DFExtIndex, tdWidth, marginLeft);
			}
			//DFInt
			if (DFIntIndex != DFExtIndex && DFIntIndex != BFIndex) {
				DFIntDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>DF<span style=\"font-size:8px;\">Int</span>", fv9DFIntMLDate, fv9DFIntMLOrg, DFIntIndex, tdWidth, marginLeft);
			} else if (DFIntIndex == DFExtIndex) {
				DFIntDiv = "";
			} else {
				DFIntDiv = getDiv(request, "DFInt<br>&nbsp;<br>BF", fv9DFIntMLDate, fv9DFIntMLOrg, DFIntIndex, tdWidth, marginLeft);
			}
			//BF
			if (BFIndex != LFIndex && BFIndex != DFIntIndex) {
				BFDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>BF", fv9BFMLDate, fv9BFMLOrg, BFIndex, tdWidth, marginLeft);
			} else if (BFIndex == DFIntIndex) {
				BFDiv = "";
			} else {
				BFDiv = getDiv(request, "BF<br>&nbsp;<br>LF", fv9BFMLDate, fv9BFMLOrg, BFIndex, tdWidth, marginLeft);
			}
			//LF
			if (LFIndex != VFFIndex && LFIndex != BFIndex) {
				LFDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>LF", fv9LFMLDate, fv9LFMLOrg, LFIndex, tdWidth, marginLeft);
			} else if (LFIndex == BFIndex) {
				LFDiv = "";
			} else {
				LFDiv = getDiv(request, "LF<br>&nbsp;<br>VFF", fv9LFMLDate, fv9LFMLOrg, LFIndex, tdWidth, marginLeft);
			}
			//VFF
			if (VFFIndex != PVSIndex && VFFIndex != LFIndex) {
				VFFDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>VFF", fv9VFFMLDate, fv9VFFMLOrg, VFFIndex, tdWidth, marginLeft);
			} else if (LFIndex == BFIndex) {
				VFFDiv = "";
			} else {
				VFFDiv = getDiv(request, "VFF<br>&nbsp;<br>PVS", fv9VFFMLDate, fv9VFFMLOrg, VFFIndex, tdWidth, marginLeft);
			}
			//PVS
			if (PVSIndex != OSIndex && PVSIndex != VFFIndex) {
				PVSDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>PVS", fv9PVSMLDate, fv9PVSMLOrg, PVSIndex, tdWidth, marginLeft);
			} else if (PVSIndex == VFFIndex) {
				PVSDiv = "";
			} else {
				PVSDiv = getDiv(request, "PVS<br>&nbsp;<br>0S", fv9PVSMLDate, fv9PVSMLOrg, PVSIndex, tdWidth, marginLeft);
			}
			//0S
			if (OSIndex != SOPIndex && OSIndex != PVSIndex) {
				OSDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>0S", fv90SMLDate, fv90SMLOrg, OSIndex, tdWidth, marginLeft);
			} else if (OSIndex == PVSIndex) {
				OSDiv = "";
			} else {
				OSDiv = getDiv(request, "0S<br>&nbsp;<br>SOP", fv90SMLDate, fv90SMLOrg, OSIndex, tdWidth, marginLeft);
			}
			//SOP
			String sop_time = fv9SOPMLDate.split("-")[1] + "/" + fv9SOPMLDate.split("-")[2];
			if (SOPIndex != MEIndex && SOPIndex != OSIndex) {
				SOPDiv = getDiv(request, "SOP<br>&nbsp;<br>" + sop_time, fv9SOPMLDate, fv9SOPMLOrg, SOPIndex, tdWidth, marginLeft);
			} else if (SOPIndex == OSIndex) {
				SOPDiv = "";
			} else {
				SOPDiv = getDiv(request, "SOP<br>&nbsp;<br>ME", fv9SOPMLDate, fv9SOPMLOrg, SOPIndex, tdWidth, marginLeft);
			}
			//ME
			if (MEIndex != SOPIndex) {
				MEDiv = getDiv(request, "&nbsp;<br>&nbsp;<br>ME", fv9MEMLDate, fv9MEMLOrg, MEIndex, tdWidth, marginLeft);
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
			
			//写入里程碑间距
			int beginPF = PFIndex; //从PF里程碑
			//如果PF在下旬			
			if (DateUtils.getTenDays(fv9PFMLDate) == 2) {
				beginPF = beginPF + 1;
			}
			double width1 = 0.0;
			double width2 = 0.0;
			
	//		MLIndex*(tdWidth+1)
			%>
			<div style="width: 100%;float: left; position: absolute; top:450px;">
				<div style="background-color: #B0B0B0; color: white; border: 1px solid; font-size: 12px; font-weight: bolder;
					text-align: center; float: left;
					width: <%=(month1)*(tdWidth+1)%>px; height: 16px; margin-left: <%=185+beginPF*tdWidth%>px;">
					<%=month1 %>&nbsp;Mo
				</div>
				<div style="background-color: #808080; color: white; border: 1px solid; font-size: 12px; font-weight: bolder;
					text-align: center; float: left;
					width: <%=(month2)*(tdWidth+1)%>px; height: 16px; margin-left: 0px;">
					<%=month2 %>&nbsp;Mo
				</div>
			</div>
			
			<%
			
			
			}
			
			%>
				
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
