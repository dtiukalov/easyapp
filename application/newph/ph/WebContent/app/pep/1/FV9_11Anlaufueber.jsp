<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.ParseException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<style>
			.odd {background-color: #CCFFFF;} /*奇数*/
			.even {background-color: #FFFF99;} /*偶数*/
		</style>
		<%!
		public static Map<String, Object> getMonthArr(String startDate) {
			Map<String, Object> datemap = new HashMap<String, Object>();
			String year[] = new String[2];
			String month[] = new String[24];
			int count[] = new int[2];
			int index_m = 0;
			int begin_year = 2012;
			int begin_month = 1;
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date beginDate = sdf.parse(startDate);
		System.out.println("startDate = " + startDate);
				begin_year = beginDate.getYear() + 1900;
				begin_month = beginDate.getMonth() + 1; 
				
				if (begin_month != 1) {
					year = new String[3];
					count = new int[3];
				}

				for (int m=begin_month; m<13; m++) {
					year[0] = begin_year + "";
					month[index_m] = begin_year + "-" + m;
					count[0] = 13 - begin_month;
					index_m++;
				}
				for (int m=1; m<13; m++) {
					year[1] = (begin_year+1) + "";
					month[index_m] = (begin_year+1) + "-" + m;
					count[1] = 12;
					index_m++;
				}
				for (int m=1; m<begin_month; m++) {
					if (begin_month != 1){
						year[2] = (begin_year+2) + "";
						count[2] = begin_month -1;
					}
					month[index_m] = (begin_year+2) + "-" + m;
					index_m++;
				}
			} catch(ParseException e) {
				e.printStackTrace();
			}
			
			datemap.put("year", year);
			datemap.put("month", month);
			datemap.put("count", count);
			return datemap;
		}
		%>
		
		<%
		String project = "";
		if (!"".equals((String)request.getSession().getAttribute("project"))) {
			project = (String)request.getSession().getAttribute("project");
		}
		
		List<String> derviantList = (List<String>)form.get("fv9ProjectDerivat");
		List<String> stufeList = (List<String>)form.get("fv9ProjectStufe");
		List<String> vffList = (List<String>)form.get("fv9ProjectVFF");
		List<String> pvsList = (List<String>)form.get("fv9ProjectPVS");
		List<String> osList = (List<String>)form.get("fv9Project0S");
		List<String> sopList = (List<String>)form.get("fv9ProjectSOP");
		List<String> mixList = (List<String>)form.get("fv9ProjectMix");
		
		//获取最早的VFF时间，以其前一个月作为开始日期，共显示2年
		String startDate = DateUtils.getSysDate();
		//当前日期晚于VFF时间，则以VFF日期的前一个月作为开始日期，否则以当前日期的前一个月作为开始日期
		if (vffList.get(0)!= null && DateUtils.compareDaysBetweenTwoDate(startDate, (String)vffList.get(0)) > 0) {
			startDate = DateUtils.getDateAddMonth((String)vffList.get(0), 1, "-");
		} else {
			startDate = DateUtils.getDateAddMonth(startDate, 1, "-");
		}
		Map<String, Object> dateMap = getMonthArr(startDate);
		
		
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
				
				<table style="border: 2px solid black; width: 1000px;  margin: 20px 0px auto; 
					font-size: 14px; text-align: center; padding: 0px; overflow: hidden;
					border-collapse:collapse; border:1px solid;">
					<tr>
						<td colspan="32" style="height: 55px;">
							<div style="float: left; width: 230px; margin: 0px; padding: 0px; overflow: hidden; text-align: left;">
								&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/app/pep/images/FAWVW-logo.jpg" width="62" height="50">
							</div>
							<div style="float: left; margin: 0px; padding: 5px; width: 495px; height:55px;  
								text-align: center; font-size: 20px; font-weight: bolder; vertical-align: middle;
								BACKGROUND: url(<%=request.getContextPath() %>/app/pep/images/table_title.jpg) no-repeat 0px 0px;">
								<div style="margin-top:15px;"><%=project %>&nbsp; Anlaufuebersicht</div>
							</div>
							<div style="float: left; width: 150px; margin: 0px; padding: 0px; 
									text-align: left; vertical-align:middle;  font-size: 14px; ">
								<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Version:6.0<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ausgabe:18.10.2011
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="2" style="width:93px; height: 20px; border: 1px solid; font-weight: bolder;" >Projeckt</td>
						<td rowspan="2" style="width: 120px; height: 20px; border: 1px solid;font-weight: bolder;">DERVIANT</td>
						<td rowspan="2" style="width: 50px; height: 20px; border: 1px solid;font-weight: bolder;">Stufe</td>
						<td rowspan="2" style="53px; height: 20px; border: 1px solid;font-weight: bolder;">VFF</td>
						<td rowspan="2" style="53px; height: 20px; border: 1px solid;font-weight: bolder;">PVS</td>
						<td rowspan="2" style="53px; height: 20px; border: 1px solid;font-weight: bolder;">0S</td>
						<td rowspan="2" style="53px; height: 20px; border: 1px solid;font-weight: bolder;">SOP</td>
						<td rowspan="2" style="57px; height: 20px; border: 1px solid;font-weight: bolder;">Mix</td>
					<%
					String yearArr[] = (String[])dateMap.get("year");
					int countArr[] = (int[])dateMap.get("count");
  					for (int i=0; i<yearArr.length; i++) {
						String year = yearArr[i];
						int count = countArr[i];
					%>
						<td colspan="<%=count%>" style="234px; height: 20px; border: 1px solid; background-color: #FFCC00;">
							<%
							if (count >= 2) { //一年中只有一个月的话不显示年
								out.print(year);
							} 
							%>
						</td>
					<%
						
					}
					%>
					</tr>
					<tr>
					<%
					for (int i=0; i<24; i++) {
						String month_show = ((String[])dateMap.get("month"))[i].split("-")[1];
					%>
						<td style="border: 1px solid; height: 15px; width: 19.5px; background-color: #FFFF00;"><%=month_show %></td>
					<%	
					}
					%>
					</tr>
				<%
				if (derviantList != null && derviantList.size() > 0) {
					int defaultLength = 8;
					if (derviantList.size() > defaultLength)
						defaultLength = derviantList.size();
					double height = 400.0/defaultLength;
					
					String standardDate = startDate.split("-")[0] + "-" + startDate.split("-")[1] + "-15"; //以每个月的15为基准进行对比
					
					for (int l=0; l<derviantList.size(); l++) {
						String vffshow = "";
						String pvsshow = "";
						String osshow = "";
						String sopshow = "";
						String row_class = "odd";
						int meilsteinNo = 0; //里程碑所在列的索引 
						if (vffList.get(l) != null) 
							vffshow = ((String)vffList.get(l)).substring(5, 7) + "/" + ((String)vffList.get(l)).substring(2, 4);
						if (pvsList.get(l) != null)
							pvsshow = ((String)pvsList.get(l)).substring(5, 7) + "/" + ((String)pvsList.get(l)).substring(2, 4);
						if (osList.get(l) != null)
							osshow = ((String)osList.get(l)).substring(5, 7) + "/" + ((String)osList.get(l)).substring(2, 4);
						if (sopList.get(l) != null)
							sopshow = ((String)sopList.get(l)).substring(5, 7) + "/" + ((String)sopList.get(l)).substring(2, 4);
						if (Integer.parseInt((String)stufeList.get(l))%2 == 0)
							row_class = "even";
						
						int vffIndex = DateUtils.getTwoDateSepMonths(standardDate, 
								((String)vffList.get(l)).split("-")[0] + "-" + ((String)vffList.get(l)).split("-")[1] + "-15");
						
						int pvsIndex = DateUtils.getTwoDateSepMonths(standardDate, 
								((String)pvsList.get(l)).split("-")[0] + "-" + ((String)pvsList.get(l)).split("-")[1] + "-15");
						
						int osIndex = DateUtils.getTwoDateSepMonths(standardDate, 
								((String)osList.get(l)).split("-")[0] + "-" + ((String)osList.get(l)).split("-")[1] + "-15");
						
						int sopIndex = DateUtils.getTwoDateSepMonths(standardDate, 
								((String)sopList.get(l)).split("-")[0] + "-" + ((String)sopList.get(l)).split("-")[1] + "-15");
						
						System.out.println("vffIndex = " + vffIndex + " pvsIndex = " + pvsIndex + " osIndex = " + osIndex + " sopIndex = " + sopIndex);
						
						double top = 220.0 + 52*l;
						
						int ten_vff = DateUtils.getThreeTenDays((String)vffList.get(l));
						int ten_pvs = DateUtils.getThreeTenDays((String)pvsList.get(l));
						int ten_os = DateUtils.getThreeTenDays((String)osList.get(l));
						int ten_sop = DateUtils.getThreeTenDays((String)sopList.get(l));
				%>
					
					<tr>
						<td class="<%=row_class %>" style="width:93px; height: <%=height%>px; border: 1px solid;" ><%=project %></td>
						<td class="<%=row_class %>" style="width: 120px; height: <%=height%>px; border: 1px solid;"><%=(String)derviantList.get(l) %></td>
						<td class="<%=row_class %>" style="width: 50px; height: <%=height%>px; border: 1px solid;"><%=(String)stufeList.get(l) %></td>
						<td class="<%=row_class %>" style="width: 53px; height: <%=height%>px; border: 1px solid;"><%=vffshow %></td>
						<td class="<%=row_class %>" style="width: 53px; height: <%=height%>px; border: 1px solid;"><%=pvsshow %></td>
						<td class="<%=row_class %>" style="width: 53px; height: <%=height%>px; border: 1px solid;"><%=osshow %></td>
						<td class="<%=row_class %>" style="width: 53px; height: <%=height%>px; border: 1px solid;"><%=sopshow %></td>
						<td class="<%=row_class %>" style="width: 57px; height: <%=height%>px; border: 1px solid;"><%=(String)mixList.get(l) %>%</td>
						
					<%
						for (int m=0; m<24; m++) {
							double left = 527 + 19.5*m;
							double com_sep = 19.5;
							//VFF PVS 0S
							//里程碑时间处于上旬，从月初开始画一个月
							//里程碑时间处于中旬，从一个月的三分之一处开始画一个月
							//里程碑时间处于下旬，从一个月的三分之二处开始画一个月
							
							
							if (vffIndex == m) {
								String text = "";
								if (ten_vff == 1) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left) + "px;'>VFF</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_vff == 2) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left+com_sep/3) + "px;'>VFF</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left+com_sep/3) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_vff == 3) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left+com_sep/3*2) + "px;'>VFF</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left+com_sep/3*2) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								out.print(text);
							}
							
							if (pvsIndex == m) {
								String text = "";
								if (ten_pvs == 1) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left) + "px;'>PVS</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_pvs == 2) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left+com_sep/3) + "px;'>PVS</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left+com_sep/3) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_pvs == 3) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left+com_sep/3*2) + "px;'>PVS</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left+com_sep/3*2) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								out.print(text);
							}
							
							if (osIndex == m) {
								String text = "";
								if (ten_os == 1) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left) + "px;'>&nbsp;0S</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_os == 2) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left+com_sep/3) + "px;'>&nbsp;0S</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left+com_sep/3) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_os == 3) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left+com_sep/3*2) + "px;'>&nbsp;0S</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left+com_sep/3*2) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/rectangle.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								out.print(text);
							}
							/*
							if (sopIndex == m) {
								String text = "";
								if (ten_sop == 1) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left-com_sep/2) + "px;'>SOP</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left-com_sep/2) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/diamond_red.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_sop == 2) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left) + "px;'>SOP</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/diamond_red.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								if (ten_sop == 3) {
									text += "	<div style='color:black; font-size:10px; vertical-align: top; position: absolute; top:" 
										+ top + "px; left:" + (left+com_sep/2) + "px;'>SOP</div>";
									text += "<div style=\"width: 19.5px; height:" + (height/3) + "px; position: absolute; top:" 
										+ (top+11) + "px; left:" + (left+com_sep/2) + "px; float: left; vertical-align: middle; padding-top: 5px; "
										+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
										+ request.getContextPath() 
										+ "/app/pep/images/diamond_red.png', sizingMethod='scale'); \">";
									text += "</div>";
								}
								out.print(text);
							}*/
					%>
						<td class="<%=row_class %>" style="border: 1px solid; height: <%=height%>px; width: 19.5px;">
					<%
					//SOP - 计划
					//里程碑时间处于上旬，菱形的尖对应一个月的开始处
					//里程碑时间处于中旬，菱形的尖对应一个月的二分之一处
					//里程碑时间处于下旬，菱形的尖对应一个月的结束处
					
					//SOP - 实际
					//菱形的尖对应一个月的二分之一处
					if (sopIndex == m) {
						String text = "";
						text += "	<span style='color:black; font-size:10px; vertical-align: top;'>SOP</span>";
						text += "<div style=\"width: 100%; height:" + (height/2.5) + "px; float: left; vertical-align: middle; padding-top: 5px;"
							+ "filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" 
							+ request.getContextPath() 
							+ "/app/pep/images/diamond_red.png', sizingMethod='scale'); \">";
						text += "</div>";
						out.print(text);
					}
					%>
						</td>
						
					<%		
						}
					%>
						
					</tr>
					
					
				<%
					}
				}
				%>
					
				</table>
				
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>