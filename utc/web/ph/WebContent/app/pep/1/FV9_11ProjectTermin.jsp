<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title%></title> <%!public static String getBorderDate(String date, String mlDate) {
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

	public static String getDiv(HttpServletRequest request, String ML,
			String MLDate, String MLOrg, int MLIndex, double tdWidth,
			double marginLeft) {
		String div_class = "";

		//此里程碑存在时间
		if (MLIndex > 0) {
			double left = 0.0; //
			int flag = DateUtils.getTenDays(MLDate);
			if (flag == 1) {
				//上旬-菱形处于月前的线上
				left = marginLeft + MLIndex * (tdWidth + 1) - tdWidth / 2;
			}
			if (flag == 2) {
				//下旬-菱形处于月末的线上
				left = marginLeft + MLIndex * (tdWidth + 1) + tdWidth / 2;
			}

			div_class += "<div style=\"width: "
					+ tdWidth
					+ "px; height:100px; text-align: center; position: absolute;left: "
					+ left
					+ "px;top: 340px; font-size: 12px; font-weight: bolder;\">";
			div_class += "	<div style=\"width: 100%; height:50px; float: left; font-size:14px; vertical-align: bottom;\">"
					+ ML + "</div>";
			div_class += "	<div style=\"width: 100%; height:26px; float: left; vertical-align: middle; padding-top: 5px;"
					+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
					+ request.getContextPath()
					+ "/app/pep/images/diamond_red.png', sizingMethod='scale'); \">";
			div_class += "		<span style=\"color:white; font-size:10px; vertical-align: bottom;\">"
					+ MLOrg + "</span>";
			div_class += "	</div>";
			div_class += "</div>";
		}

		return div_class;
	}

	public static double getLeftWidth(double marginLeft, double tdWidth,
			int MLIndex, String MLDate) {
		double left = 0.0;
		int flag = DateUtils.getTenDays(MLDate);
		if (flag == 1) {
			//上旬-菱形处于月前的线上
			left = marginLeft + MLIndex * (tdWidth + 1) - tdWidth / 2;
		}
		if (flag == 2) {
			//下旬-菱形处于月末的线上
			left = marginLeft + MLIndex * (tdWidth + 1) + tdWidth / 2;
		}
		return left;
	}%>

	<%
		String project = "";
		if (!"".equals((String) request.getSession()
				.getAttribute("project"))) {
			project = (String) request.getSession().getAttribute("project");
		}

		String startDate = "";
		String endDate = "";

		String fv9PMMLDate = (String) form.get("fv9PMMLDate");//	里程碑日期_PM
		String fv9PMMLOrg = (String) form.get("fv9PMMLOrg");//	验收机构_PM

		String fv9PPMLDate = (String) form.get("fv9PPMLDate");//	里程碑日期_PP
		String fv9PPMLOrg = (String) form.get("fv9PPMLOrg");//	验收机构_PP

		String fv9PDMLDate = (String) form.get("fv9PDMLDate");//	里程碑日期_PD
		String fv9PDMLOrg = (String) form.get("fv9PDMLOrg");//	验收机构_PD

		String fv9PFMLDate = (String) form.get("fv9PFMLDate");//	里程碑日期_PF
		String fv9PFMLOrg = (String) form.get("fv9PFMLOrg");//	验收机构_PF

		String fv9KEMLDate = (String) form.get("fv9KEMLDate");//	里程碑日期_KE
		String fv9KEMLOrg = (String) form.get("fv9KEMLOrg");//	验收机构_KE

		String fv9DEMLDate = (String) form.get("fv9DEMLDate");//	里程碑日期_DE
		String fv9DEMLOrg = (String) form.get("fv9DEMLOrg");//	验收机构_DE

		String fv9DFExtMLDate = (String) form.get("fv9DFExtMLDate");//	里程碑日期_DF Ext
		String fv9DFExtMLOrg = (String) form.get("fv9DFExtMLOrg");//	验收机构_DF Ext

		String fv9DFIntMLDate = (String) form.get("fv9DFIntMLDate");//	里程碑日期_DF Int
		String fv9DFIntMLOrg = (String) form.get("fv9DFIntMLOrg");//	验收机构_DF Int

		String fv9BFMLDate = (String) form.get("fv9BFMLDate");//	里程碑日期_BF
		String fv9BFMLOrg = (String) form.get("fv9BFMLOrg");//	验收机构_BF

		String fv9LFMLDate = (String) form.get("fv9LFMLDate");//	里程碑日期_LF
		String fv9LFMLOrg = (String) form.get("fv9LFMLOrg");//	验收机构_LF

		String fv9VFFMLDate = (String) form.get("fv9VFFMLDate");//	里程碑日期_VFF
		String fv9VFFMLOrg = (String) form.get("fv9VFFMLOrg");//	验收机构_VFF

		String fv9PVSMLDate = (String) form.get("fv9PVSMLDate");//	里程碑日期_PVS
		String fv9PVSMLOrg = (String) form.get("fv9PVSMLOrg");//	验收机构_PVS

		String fv90SMLDate = (String) form.get("fv90SMLDate");//	里程碑日期_0S
		String fv90SMLOrg = (String) form.get("fv90SMLOrg");//	验收机构_0S

		String fv9SOPMLDate = (String) form.get("fv9SOPMLDate");//	里程碑日期_SOP
		String fv9SOPMLOrg = (String) form.get("fv9SOPMLOrg");//	验收机构_SOP

		String fv9MEMLDate = (String) form.get("fv9MEMLDate");//	里程碑日期_ME
		String fv9MEMLOrg = (String) form.get("fv9MEMLOrg");//	验收机构_ME
		System.out.println("fv9PMMLDate = " + fv9PMMLDate);

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
				<div class="fl"><%=status_left%></div>
				<div class="fr"><%=status_right%></div>
				<h1><%=title%></h1>
			</div>
			<div id="content">
				<%
					//最早时间与最晚时间前后各加2个月
					startDate = DateUtils.getDateAddMonth(startDate, 2, "-");
					endDate = DateUtils.getDateAddMonth(endDate, 2, "+");
					System.out.println("startDate = " + startDate);
					System.out.println("endDate = " + endDate);

					int tdNum = 0;
					if (!"".equals(startDate) && !"".endsWith(endDate)) {
						tdNum = DateUtils.getTwoDateSepMonths(startDate, endDate) + 1;
					}
					int PMIndex = 0, PPIndex = 0, PDIndex = 0, PFIndex = 0, KEIndex = 0, DEIndex = 0;
					int DFExtIndex = 0, DFIntIndex = 0, BFIndex = 0, LFIndex = 0, VFFIndex = 0, PVSIndex = 0;
					int OSIndex = 0, SOPIndex = 0, MEIndex = 0;

					int currentIndex = 0;
					String currentDate = DateUtils.getSysDate();
					System.out.println("currentDate = " + currentDate);
					
					List<Integer> index_list = new ArrayList<Integer>();
					List<Map<String, Integer>> mmIndex = new ArrayList<Map<String, Integer>>();
					List<Map<String, String>> mmDate = new ArrayList<Map<String, String>>();
					List<Map<String, String>> mmOrg = new ArrayList<Map<String, String>>();

					if (tdNum > 0) {
						double tdWidth = 780.0 / tdNum;
						System.out.println("tdWidth = " + tdWidth);

						int[] year = new int[tdNum + 1]; //多写一年为了合并单元格时做比较
						int[] month = new int[tdNum];
						String temp_date = "";
						
						for (int n = 0; n < tdNum; n++) {
							temp_date = DateUtils.getDateAddMonth(startDate, n, "+"); //循环增加一个月
							year[n] = Integer.parseInt(temp_date.split("-")[0]);
							month[n] = Integer.parseInt(temp_date.split("-")[1]);

							//获得每个里程碑所在TD的索引
							if (getMLIndex(fv9PMMLDate, temp_date)) {
								PMIndex = n; 
								if (n != 0) {
									index_list.add(PMIndex);
									Map map1 = new HashMap<String, Integer>();
									map1.put(n, "PM");
									mmIndex.add(map1);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9PMMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9PMMLOrg);
									mmOrg.add(map3);
								}
							}
							
							if (getMLIndex(fv9PPMLDate, temp_date)) {
								PPIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "PP");
									mmIndex.add(map);
									index_list.add(PPIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9PPMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9PPMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9PDMLDate, temp_date)) {
								PDIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "PD");
									mmIndex.add(map);
									index_list.add(PDIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9PDMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9PDMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9PFMLDate, temp_date)) {
								PFIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "PF");
									mmIndex.add(map);
									index_list.add(PFIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9PFMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9PFMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9KEMLDate, temp_date)) {
								KEIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "KE");
									mmIndex.add(map);
									index_list.add(KEIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9KEMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9KEMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9DEMLDate, temp_date)) {
								DEIndex = n;
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "DE");
									mmIndex.add(map);
									index_list.add(DEIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9DEMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9DEMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9DFExtMLDate, temp_date)) {
								DFExtIndex = n;
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "DF"); //DFExt
									mmIndex.add(map);
									index_list.add(DFExtIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9DFExtMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9DFExtMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9DFIntMLDate, temp_date)) {
								DFIntIndex = n;
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "DF"); //DFInt
									mmIndex.add(map);
									index_list.add(DFIntIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9DFIntMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9DFIntMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9BFMLDate, temp_date)) {
								BFIndex = n;
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "BF");
									mmIndex.add(map);
									index_list.add(BFIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9BFMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9BFMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9LFMLDate, temp_date)) {
								LFIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "LF");
									mmIndex.add(map);
									index_list.add(LFIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9LFMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9LFMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9VFFMLDate, temp_date)) {
								VFFIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "VFF");
									mmIndex.add(map);
									index_list.add(VFFIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9VFFMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9VFFMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9PVSMLDate, temp_date)) {
								PVSIndex = n;
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "PVS");
									mmIndex.add(map);
									index_list.add(PVSIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9PVSMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9PVSMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv90SMLDate, temp_date)) {
								OSIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "OS");
									mmIndex.add(map);
									index_list.add(OSIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv90SMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv90SMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9SOPMLDate, temp_date)) {
								SOPIndex = n; 
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "SOP");
									mmIndex.add(map);
									index_list.add(SOPIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9SOPMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9SOPMLOrg);
									mmOrg.add(map3);
								}
							}
								
							if (getMLIndex(fv9MEMLDate, temp_date)) {
								MEIndex = n;
								if (n != 0) {
									Map map = new HashMap<String, Integer>();
									map.put(n, "ME");
									mmIndex.add(map);
									index_list.add(MEIndex);
									Map map2 = new HashMap<String, String>();
									map2.put(n, fv9MEMLDate);
									mmDate.add(map2);
									Map map3 = new HashMap<String, String>();
									map3.put(n, fv9MEMLOrg);
									mmOrg.add(map3);
								}
							}

							if (getMLIndex(currentDate, temp_date)) {
								currentIndex = n;
							}
						}

						year[tdNum] = 1900; //添加最后一年的信息，用来比较

						int count = 0;
						int tempYear = year[0];
						YearInfo yearinfo = new YearInfo();
						List<YearInfo> yearList = new ArrayList<YearInfo>();

						for (int y = 0; y < year.length; y++) {
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
							if (tempYear == year[y]) {
								count++;
								yearinfo.year = year[y];
								yearinfo.cols = count;
							}

						}
				%>
				<table
					style="border: 1px solid; width: 1000px; height: 230px; margin: 150px 0px auto; font-size: 9px; text-align: center; padding: 0px; border-collapse: collapse; border: none; border-bottom: 1px solid;">
					<!-- 时间轴 - 年 -->
					<tr>
						<td
							style="width: 180px; height: 60px; border: 1px solid; text-align: left; font-size: 18px; font-weight: bolder;"
							rowspan="2">&nbsp;&nbsp;Projekt</td>
						<%
							for (int l = 0; l < yearList.size(); l++) {
									YearInfo y = (YearInfo) yearList.get(l);
						%>
						<td
							style="height: 40px; border: 1px solid; font-size: 15px; font-weight: bolder; background-color: #FFFFC0;"
							colspan="<%=y.cols%>"><%=y.year%></td>
						<%
							}
						%>
					</tr>

					<!-- 时间轴 - 月 -->
					<tr>
						<%
							for (int m = 0; m < month.length; m++) {
						%>
						<td
							style="width: <%=tdWidth%>; height:20px; 
							border: 1px solid; background-color: #FFFFC0;">
							<%=month[m]%> <%
 	//当前月上加红线
 			if (m == currentIndex) {
 				double currentWidth = 0.0;
 				if (!"".equals(currentDate)
 						&& DateUtils.getThreeTenDays(currentDate) == 1)
 					currentWidth = tdWidth / 3;
 				if (!"".equals(currentDate)
 						&& DateUtils.getThreeTenDays(currentDate) == 2)
 					currentWidth = tdWidth / 2;
 				if (!"".equals(currentDate)
 						&& DateUtils.getThreeTenDays(currentDate) == 3)
 					currentWidth = 2 * tdWidth / 3;
 %>
							<div
								style="width: 2px; background-color: #FF00FF; 
								height: 170px; 
								position: absolute;
								margin-left:<%=currentWidth%>px;">
							</div> <%
 	}
 %>
						</td>

						<%
							}
						%>

					</tr>

					<!-- 里程碑 -->
					<tr>
						<td
							style="width: 180px; height: 110px; border: 1px solid; text-align: left; font-size: 18px; font-weight: bolder; overflow: hidden;">
							&nbsp;&nbsp;<%=project%></td>
						<%
							for (int m = 0; m < month.length; m++) {
									//一年的最后一个月用黑线表示
									//最后一列不需要右边框
									boolean flag = false;
									if (month[m] == 12)
										flag = true;
						%>
						<td
							style="width: <%=tdWidth%>px; height: 110px;
						border-top: 1px solid white;
						border-left: 1px solid #E0E0E0; 
						
						<%if (flag) {
						out.print("border-right: 1px solid;");
					} else if (m == month.length - 1) {
						out.print("border-right: 1px solid;");
					} else {
						out.print("border-right: 1px solid #E0E0E0;");
					}%>
						">
							&nbsp;&nbsp;&nbsp;&nbsp;</td>


						<%
							}
						%>
					</tr>


				</table>
				<%!
				/*
				input:mmIndex 为里程碑所在表格的index（index!=0）
				output:每个里程碑DIV的字符串
				*/
				public List<String> getMMDiv(
						HttpServletRequest request,
						HttpServletResponse response,
						int SOPIndex,
						List<Integer> index, 
						List<Map<String, Integer>> mmIndex,
						List<Map<String, String>> mmDate,
						List<Map<String, String>> mmOrg,
						double tdWidth,
						double marginLeft
				) {
					
					//去掉重复值
					List<Integer> new_index = removeDuplicate(index);
					List<String> div_str = new ArrayList<String>();
					if(new_index != null && new_index.size() > 0) {
						for (int i=0; i<new_index.size()-1; i++) {
							int pos = new_index.get(i);
							System.out.println(pos);
							String mm = "&nbsp;<br>&nbsp;<br>"; //
							String mldate = "";
							String mlorg = "";
							int standIndex = 0; //以哪个index为基准
							int count = 0;
							for (int j=0; j<mmIndex.size()-1; j++) {
								Map map1 = mmIndex.get(j);
								Map map2 = mmDate.get(j);
								Map map3 = mmOrg.get(j);
								
								if (map1.containsKey(pos) && map2.containsKey(pos) && map3.containsKey(pos)) {
									System.out.println(map1);
									count++;
									if (count > 1){
										mm = mm.replace("&nbsp;<br>&nbsp;<br>", "");
										mm += "<br>";
									}
									if (SOPIndex == pos) {
										mm = mm.replace("&nbsp;<br>&nbsp;<br>", "");
										mm += map1.get(pos) + "<br><br>" +
												map2.get(pos).toString().split("-")[1] + "/" + 
												map2.get(pos).toString().split("-")[0].substring(2, 4) + "<br>";
									} else {
										mm += map1.get(pos) + "<br>";
									}
									
									standIndex = pos;
									mldate = map2.get(pos).toString();
									mlorg = map3.get(pos).toString();
									
									
								}
							}
							count = 0;
		
							String div = getDiv(
									request, 
									mm,
									mldate,
									mlorg,
									standIndex, 
									tdWidth,
									marginLeft);
							div_str.add(div); 
							
						}
					}
					System.out.println(div_str);
					
					return div_str;
				}
				
				//去掉重复值
				public List<Integer> removeDuplicate(List list) {
					Set set = new HashSet();  
					List newList = new ArrayList();  
					for (Iterator iter = list.iterator(); iter.hasNext();) {  
						Object element = iter.next();  
						if (set.add(element))  
							newList.add(element);  
					}  
					return newList;  
				}
				
				
				%>
				<%
					//开始写入里程碑，计算绝对位置
						double marginLeft = 180.0;

				List<String> test_list = getMMDiv(request, response, SOPIndex, index_list, mmIndex, mmDate, mmOrg, tdWidth, marginLeft);
				if (test_list != null && test_list.size() > 0) {
					for (String str : test_list) {
				%>
					<%=str %>
				<%
					}
				}
						
				%>

				
				<%
					//写入里程碑间距 
						//PF及以后的里程碑时间必须输入
						int beginPM = PMIndex; //从pm里程碑开始
						double width0 = 0.0, width1 = 0.0, width2 = 0.0;
						int month00 = 0, month01 = 0, month02 = 0;
						
						int BeginIndex = PFIndex;
						String date_string = fv9PFMLDate;
						if (PFIndex == 0 && KEIndex != 0) {
							BeginIndex = KEIndex;
							date_string = fv9KEMLDate;
						}
							
						
						if (beginPM != 0) {
							System.out.print("fv9PMMLDate+++++++++++ = " + fv9PMMLDate);
							if (DateUtils.getTenDays(fv9PMMLDate) == 2) {
								beginPM = beginPM + 1;
							}
							if (BeginIndex != 0) {
								width0 = getLeftWidth(0, tdWidth, BeginIndex, date_string)
										- getLeftWidth(0, tdWidth, PMIndex, fv9PMMLDate);
								month00 = (int) (width0 / tdWidth);
								if (LFIndex != 0 && SOPIndex != 0) {

									width1 = getLeftWidth(0, tdWidth, LFIndex,
											fv9LFMLDate)
											- getLeftWidth(0, tdWidth, BeginIndex,
													date_string);
									month01 = (int) (width1 / tdWidth);
									width2 = getLeftWidth(0, tdWidth, SOPIndex,
											fv9SOPMLDate)
											- getLeftWidth(0, tdWidth, LFIndex,
													fv9LFMLDate);
									month02 = (int) (width2 / tdWidth);
								}
								if (LFIndex != 0 && SOPIndex == 0) {
									
									width1 = getLeftWidth(0, tdWidth, LFIndex,
											fv9LFMLDate)
											- getLeftWidth(0, tdWidth, BeginIndex,
													date_string);
									month01 = (int) (width1 / tdWidth);
									width2 = 0.0;
									month02 = 0;
								}
								if (LFIndex == 0) {
									width1 = 0.0;
									month01 = 0;
									width2 = 0.0;
									month02 = 0;
								}

							} else {
								width0 = 0.0;
								month00 = 0;
								if (LFIndex != 0) {
									if (SOPIndex != 0) {
										width1 = 0.0;
										month01 = 0;
										width2 = getLeftWidth(0, tdWidth, SOPIndex,
												fv9SOPMLDate)
												- getLeftWidth(0, tdWidth, LFIndex,
														fv9LFMLDate);
										month02 = (int) (width2 / tdWidth);
									}
								} else {
									width1 = 0.0;
									month01 = 0;
									width2 = 0.0;
									month02 = 0;
								}
							}
						} else {
							width0 = 0.0;
							month00 = 0;
							if (BeginIndex != 0) {
								if (LFIndex != 0) {
									if (SOPIndex != 0) {
										width1 = getLeftWidth(0, tdWidth, LFIndex,
												fv9LFMLDate)
												- getLeftWidth(0, tdWidth, BeginIndex,
														date_string);
										month01 = (int) (width1 / tdWidth);
										width2 = getLeftWidth(0, tdWidth, SOPIndex,
												fv9SOPMLDate)
												- getLeftWidth(0, tdWidth, LFIndex,
														fv9LFMLDate);
										month02 = (int) (width2 / tdWidth);
									} else {
										width1 = getLeftWidth(0, tdWidth, LFIndex,
												fv9LFMLDate)
												- getLeftWidth(0, tdWidth, BeginIndex,
														date_string);
										month01 = (int) (width1 / tdWidth);
										width2 = 0.0;
										month02 = 0;
									}
								} else {
									width1 = 0.0;
									month01 = 0;
									width2 = 0.0;
									month02 = 0;
								}
							} else {
								if (LFIndex != 0) {
									if (SOPIndex != 0) {
										width1 = 0.0;
										month01 = 0;
										width2 = getLeftWidth(0, tdWidth, SOPIndex,
												fv9SOPMLDate)
												- getLeftWidth(0, tdWidth, LFIndex,
														fv9LFMLDate);
										month02 = (int) (width2 / tdWidth);
									}
								} else {
									width1 = 0.0;
									month01 = 0;
									width2 = 0.0;
									month02 = 0;

								}
							}
						}
				%>
				<div
					style="width: 100%; float: left; position: absolute; top: 422px; margin: 0px; padding: 0px;">
					<%
						if (beginPM != 0 && BeginIndex !=0) {
					%><div
						style="background-color: #F3F3F3; color: black; border: 1px white; font-size: 12px; font-weight: bolder;
					text-align: center; float: left;
					width: <%=width0%>px; height: 16px; margin-left: <%=180 + beginPM * tdWidth%>px;">
						<%=month00%>&nbsp;Mo.
					</div>
					<%
						} else {
					%>
					<%
						}
							if (PMIndex == 0 && BeginIndex != 0) {
					%><div
						style="background-color: #B0B0B0; color: white; border: 1px solid; font-size: 12px; font-weight: bolder;
					text-align: center; float: left;
					width: <%=width1%>px; height: 16px; margin-left: <%=180 + BeginIndex * tdWidth%>px;">
						<%=month01%>&nbsp;Mo.
					</div>
					<%
						}else {
					%>
					<%
						} if (PMIndex != 0 && BeginIndex != 0) {
					%><div
						style="background-color: #B0B0B0; color: white; border: 1px solid; font-size: 12px; font-weight: bolder;
					text-align: center; float: left;
					width: <%=width1%>px; height: 16px; margin-left: 0px;">
						<%=month01%>&nbsp;Mo.
					</div>
					<%
						}
					%>


					<div
						style="background-color: #808080; color: white; border: 1px solid; font-size: 12px; font-weight: bolder;
					text-align: center; float: left;
					width: <%=width2%>px; height: 16px; margin-left: <%if ((PMIndex == 0 && BeginIndex == 0 && LFIndex != 0)||(PMIndex != 0 && BeginIndex == 0 && LFIndex != 0)) {%><%=220 + LFIndex * tdWidth%><%} else {%>0<%}%>px;">
						<%=month02%>&nbsp;Mo.
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
