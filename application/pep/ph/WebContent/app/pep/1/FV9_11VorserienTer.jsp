<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
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
		public class TimeInfo {
			int year;
			int month;
			int kw;
			String date;
		}
		public class YearInfo {
			int year;
			int month;
			int cols;
		}
		public static int getIndex(String date, int index, int year, int kw) {
			if (year == Integer.parseInt(date.split("-")[0]) &&
					kw == DateUtils.getWeekOfYear(date + " 00:00")) {
				return index;
			}
			return 0;
		}
		public static boolean getYesOrNo(int l, List<Integer> indexlist){
			if (indexlist != null && indexlist.size() > 0) {
				for(Integer i : indexlist) {
					if (l == i) {
						return false;
					}
				}
			}
			return true;
		}
		%>
		<%
		String fv9Status = "V3"; //(String)form.get("fv9Status");
		String fv9Ausgabe = "30.01.12"; //(String)form.get("fv9Ausgabe");

		//VFF阶段信息
		String fv9VFFTBTZP5 = (String)form.get("fv9VFFTBTZP5");
		String fv9VFFTBTZP7 = (String)form.get("fv9VFFTBTZP7");
		String fv9VFFVorStart = (String)form.get("fv9VFFVorStart");
		String fv9VFFVorEnd = (String)form.get("fv9VFFVorEnd");
		String fv9VFFAbsStart = (String)form.get("fv9VFFAbsStart");
		String fv9VFFAbsEnd = (String)form.get("fv9VFFAbsEnd");
		int fv9VFFVorBatches = 0;
		if (Web.getObjectYesOrNo(form.get("fv9VFFVorBatches"))) {
			fv9VFFVorBatches = Integer.parseInt((String)form.get("fv9VFFVorBatches"));
		}
		int fv9VFFVorFzg = 0;
		if (Web.getObjectYesOrNo(form.get("fv9VFFVorFzg"))) {
			fv9VFFVorFzg = Integer.parseInt((String)form.get("fv9VFFVorFzg"));	
		}
		int fv9VFFAbsMeter = 0;
		if (Web.getObjectYesOrNo(form.get("fv9VFFAbsMeter"))) {
			fv9VFFAbsMeter = Integer.parseInt((String)form.get("fv9VFFAbsMeter"));
		}
		String fv9VFFDesc = ""; //(String)form.get("fv9VFFDesc");
		
		//PVS阶段信息
		String fv9PVSTBTZP5 = (String)form.get("fv9PVSTBTZP5");
		String fv9PVSTBTZP7 = (String)form.get("fv9PVSTBTZP7");
		String fv9PVSVorStart = (String)form.get("fv9PVSVorStart");
		String fv9PVSVorEnd = (String)form.get("fv9PVSVorEnd");
		String fv9PVSAbsStart = (String)form.get("fv9PVSAbsStart");
		String fv9PVSAbsEnd = (String)form.get("fv9PVSAbsEnd");
		int fv9PVSVorBatches = 0;
		if (Web.getObjectYesOrNo(form.get("fv9PVSVorBatches"))) {
			fv9PVSVorBatches = Integer.parseInt((String)form.get("fv9PVSVorBatches"));
		}
		int fv9PVSVorFzg = 0;
		if (Web.getObjectYesOrNo(form.get("fv9PVSVorFzg"))) {
			fv9PVSVorFzg = Integer.parseInt((String)form.get("fv9PVSVorFzg"));
		}
		int fv9PVSAbsMeter = 0;
		if (Web.getObjectYesOrNo(form.get("fv9PVSAbsMeter"))) {
			fv9PVSAbsMeter = Integer.parseInt((String)form.get("fv9PVSAbsMeter"));
		}
		String fv9PVSDesc = "14PVS-Fahrzeug  (inkl.TE 13,QA 1 )fuer EU5 Projekt"; //(String)form.get("fv9PVSDesc");
		
		//0S阶段信息
		String fv90STBTZP5 = (String)form.get("fv90STBTZP5");
		String fv90STBTZP7 = (String)form.get("fv90STBTZP7");
		String fv90SVorStart = (String)form.get("fv90SVorStart");
		String fv90SVorEnd = (String)form.get("fv90SVorEnd");
		String fv90SAbsStart = (String)form.get("fv90SAbsStart");
		String fv90SAbsEnd = (String)form.get("fv90SAbsEnd");
		int fv90SVorBatches = 0;
		if (Web.getObjectYesOrNo(form.get("fv90SVorBatches"))) {
			fv90SVorBatches = Integer.parseInt((String)form.get("fv90SVorBatches"));
		}
		int fv90SVorFzg = 0;
		if (Web.getObjectYesOrNo(form.get("fv90SVorFzg"))) {
			fv90SVorFzg = Integer.parseInt((String)form.get("fv90SVorFzg"));
		}
		int fv90SAbsMeter = 0;
		if (Web.getObjectYesOrNo(form.get("fv90SAbsMeter"))) {
			fv90SAbsMeter = Integer.parseInt((String)form.get("fv90SAbsMeter"));
		}
		String fv90SDesc = " QA 3 PVS-Fahrzeug ,2 0S-Fahrzeug fuer MQ200 Projekt"; // (String)form.get("fv90SDesc");
		
		//SOP时间
		String DATE_SOP = (String)session.getAttribute("DATE_SOP");
		
		int SOP_KW = DateUtils.getWeekOfYear(DATE_SOP);
		int SOP_Year = Integer.parseInt(DATE_SOP.split("-")[0]);
		
		//认可信息
		String fv9TPPA_ME = (String)form.get("fv9TPPA_ME");
		String fv9QFTPPA_Kunde = (String) form.get("fv9QFTPPA_Kunde");
		
		//项目信息
		String project = "";
		if (!"".equals((String)request.getSession().getAttribute("project"))) {
			project = (String)request.getSession().getAttribute("project");
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
			<%
			//各个关键点所在单元格的索引
			int VFFTBTZP5 = 0; int VFFTBTZP7 = 0; int VFFVORSTART = 0; int VFFVOREND = 0; int VFFABSSTART = 0; int VFFABSEND = 0;
			int PVSTBTZP5 = 0; int PVSTBTZP7 = 0; int PVSVORSTART = 0; int PVSVOREND = 0; int PVSABSSTART = 0; int PVSABSEND = 0;
			int OSTBTZP5 = 0; int OSTBTZP7 = 0; int OSVORSTART = 0; int OSVOREND = 0; int OSABSSTART = 0; int OSABSEND = 0;
			int sopIndex = 0;
			int TPPA_ME = 0; int QFTPPA_Kunde = 0;
			
			//开始时间为VFF TBT ZP5时间前4个月
			//结束时间为SOP后四个月
			String startDate = "";
			String endDate = "";
			if (!"1900-01-01 00:00:00".equals(fv9VFFTBTZP5) && !"".equals(fv9VFFTBTZP5)) {
				startDate = DateUtils.getDateAddMonth(fv9VFFTBTZP5, 1, "-");
			}
			if (!"1900-01-01 00:00:00".equals(DATE_SOP) && !"".equals(DATE_SOP)) {
				endDate = DateUtils.getDateAddMonth(DATE_SOP, 1, "+");
			}
			System.out.println("startDate = " + startDate);
			System.out.println("endDate = " + endDate);
			//转换成日期
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date start = sdf.parse(startDate);
			Date end = sdf.parse(endDate);
			
			//取得开始时间与结束时间所在的周
			int startKW = 0;
			int endKW = 0;
			//开始时间与结束时间存在才显示甘特图
			if (!"".equals(startDate) && !"".equals(endDate)) {
				
				startKW = DateUtils.getWeekOfYear(startDate + " 00:00");
				endKW = DateUtils.getWeekOfYear(endDate + " 00:00");
				System.out.println("startDate = " + startDate + " - endDate = " + endDate);
				System.out.println("startKW = " + startKW + " - endKW = " + endKW);
				
				//取得开始时间与结束时间所在的周一日期
				Date startMonday = DateUtils.getFirstDayOfWeek(start);
				Date endMonday = DateUtils.getFirstDayOfWeek(end);
				System.out.println("startMonday = " + startMonday);
				System.out.println("endMonday = " + endMonday);
				
				//计算结束时间的周一与开始时间的周一所差的天数
				int days = DateUtils.dateDiff(startMonday, endMonday);
				
				//计算结束时间的周一与开始时间的周一所差的天数
				int weeks = days/7;
				double totalWidth = 1000.0;
				double tdWidth = totalWidth/weeks;
				
				//循环周数，每次循环，从开始日期+(week*7)天，获取日期所在的年、周、日期等信息
				//合并年的单元格
				//获取SOP所在的索引
				//获取每年的最后一周的索引
				List<TimeInfo> timeList = new ArrayList<TimeInfo>(); //记录周信息
				List<YearInfo> yearList = new ArrayList<YearInfo>(); //记录年信息
				List<Integer> indexList = new ArrayList<Integer>(); //记录每年的最后一周的索引
				String beginTime = format.format(startMonday);
				int	tempYear = Integer.parseInt(beginTime.split("-")[0]); //初始年
				int count = 0; //计数器：时间轴内每一年的周数
				YearInfo yearinfo = new YearInfo(); //初始年信息
				for (int w=0; w<weeks+1; w++) {  //多加一次循环，是为了计算年合并单元格数
					TimeInfo timeinfo = new TimeInfo();
					String date = DateUtils.oneDateAddOrSubDays(beginTime, (w*7), "+");
					int year = Integer.parseInt(date.split("-")[0]);
					int month = Integer.parseInt(date.split("-")[1]);
					int kw = DateUtils.getWeekOfYear(date + " 00:00");
					
					if (kw == 1) {
						indexList.add(w-1); 
					}
					
					//设置年与最后一年不一样
					if (w==weeks) {
						year = 1900;
					} else {
						timeinfo.date = date;
						timeinfo.year = year;
						timeinfo.month = month;
						timeinfo.kw = DateUtils.getWeekOfYear(date + " 00:00");
						timeList.add(timeinfo);
					
					}
					
					//不同年
					if (tempYear != timeinfo.year) {
						//将前一年的信息添加到LIST中
						yearList.add(yearinfo);
						//重新计算下一年
						yearinfo = new YearInfo();
						count = 0;
						yearinfo.year = timeinfo.year;
						tempYear = timeinfo.year;
						yearinfo.cols = count;
					} 
					
					//同一年
					if (tempYear == timeinfo.year){
						count++;
						yearinfo.year = timeinfo.year;
						yearinfo.cols = count;
					}
					
					//获取各个关键点的索引
					if (VFFTBTZP5 == 0) 
						VFFTBTZP5 = getIndex(fv9VFFTBTZP5, w, year, kw);
					if (VFFTBTZP7 == 0)
						VFFTBTZP7 = getIndex(fv9VFFTBTZP7, w, year, kw);
					if (VFFVORSTART == 0)
						VFFVORSTART = getIndex(fv9VFFVorStart, w, year, kw);
					if (VFFVOREND == 0) 
						VFFVOREND = getIndex(fv9VFFVorEnd, w, year, kw);
					if (VFFABSSTART == 0)
						VFFABSSTART = getIndex(fv9VFFAbsStart, w, year, kw);
					if (VFFABSEND == 0)
						VFFABSEND = getIndex(fv9VFFAbsEnd, w, year, kw);
					
					if (PVSTBTZP5 == 0)
						PVSTBTZP5 = getIndex(fv9PVSTBTZP5, w, year, kw);
					if (PVSTBTZP7 == 0) 
						PVSTBTZP7 = getIndex(fv9PVSTBTZP7, w, year, kw);
					if (PVSVORSTART == 0)
						PVSVORSTART = getIndex(fv9PVSVorStart, w, year, kw);
					if (PVSVOREND == 0) 
						PVSVOREND = getIndex(fv9PVSVorEnd, w, year, kw);
					if (PVSABSSTART == 0)
						PVSABSSTART = getIndex(fv9PVSAbsStart, w, year, kw);
					if (PVSABSEND == 0)
						PVSABSEND = getIndex(fv9PVSAbsEnd, w, year, kw);
					
					if (OSTBTZP5 == 0)
						OSTBTZP5 = getIndex(fv90STBTZP5, w, year, kw);
					if (OSTBTZP7 == 0)
						OSTBTZP7 = getIndex(fv90STBTZP7, w, year, kw);
					if (OSVORSTART == 0) 
						OSVORSTART = getIndex(fv90SVorStart, w, year, kw);
					if (OSVOREND == 0)
						OSVOREND = getIndex(fv90SVorEnd, w, year, kw);
					if (OSABSSTART == 0)
						OSABSSTART = getIndex(fv90SAbsStart, w, year, kw);
					if (OSABSEND == 0) 
						OSABSEND = getIndex(fv90SAbsEnd, w, year, kw);
					
					if (sopIndex == 0)
						sopIndex = getIndex(DATE_SOP, w, year, kw);
					
					if (TPPA_ME == 0)
						TPPA_ME = getIndex(fv9TPPA_ME, w, year, kw);
					
					if (QFTPPA_Kunde == 0) 
						QFTPPA_Kunde = getIndex(fv9QFTPPA_Kunde, w, year, kw);
					
				}
			%>
			
				<table style="border: 1px solid; width: <%=totalWidth%>px; height: 530px; margin: 20px 0px auto; 
					font-size: 10px; text-align: center; padding: 0px; overflow: hidden;
					border-collapse:collapse; border:1px solid;">
					<tr>
						<!-- 合并单元格，写入一汽大众logo+项目以及sop时间+状态 -->
						<td style="border: 1px solid; width: <%=totalWidth%>px; height:60px;" colspan="<%=weeks%>">
							<div style="float: left; width: 20%; height: 100%; margin: 0px; padding: 0px; overflow: hidden;">
								<img src="<%=request.getContextPath()%>/app/pep/images/FAWVW-logo.jpg">
							</div>
							<div style="float: left; width: 60%; height: 100%; margin: 0px; padding: 0px; 
								text-align: center; font-size: 24px;">
								<%=project %>&nbsp; Vorserien-Ablauf<br>
								SOP&nbsp;<%=SOP_KW %>/<%=SOP_Year %>
							</div>
							<div style="float: left; width: 20%; height: 100%; margin: 0px; padding: 0px; 
									text-align: right; vertical-align:middle;  font-size: 14px; ">
								<br>Status:(<%=fv9Status %>)&nbsp;&nbsp;<br>
								Ausgabe:<%=fv9Ausgabe %>&nbsp;&nbsp;
							</div>
						</td>
					</tr>
					<tr>
					<!-- 年信息  合并单元格 -->
					<%
					for(int i=0; i<yearList.size(); i++) {
						YearInfo year = yearList.get(i);
					%>
						<td style="border: 1px solid; width: <%=year.cols * tdWidth%>px; height:18px; font-size:12px; 
							font-weight: bolder; background-color: #FFFFC0;" 
							colspan="<%=year.cols%>">
							<%=year.year %>
						</td>
					<%
					}
					%>
					</tr>
					<tr>
					<%
					for(TimeInfo timeinfo: timeList) {
					%>
						<td style="border: 1px solid;width: <%=tdWidth%>px; height:15px; background-color: #FFFFC0;">
							 <%=timeinfo.kw %>
						</td>
					<%
					}
					%>
					</tr>
					<tr>
					<!-- 按SOP时间倒数周数 -->
					<%
					for(int i=sopIndex+1; i>0; i--) {
						//奇数为灰色
					%>
						<td style="border: 1px solid;width: <%=tdWidth%>px; height:15px; 
							<%if (i%2!=0) out.print("background-color: #C0C0C0;");%>">
							<%=i %>
						</td>
					<%
					}
					for (int i=0; i>sopIndex-weeks+1; i--) {
					%>
						<td style="border: 1px solid;width: <%=tdWidth%>px; height:15px; 
							<%if (i%2!=0) out.print("background-color: #C0C0C0;");%>">
							<%=i-1 %>
						</td>
					<%	
					}
					%>
					</tr>
					<!-- VFF装车信息 -->	
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height: 15px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>	
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
					<%
						if (l == VFFTBTZP5) {out.print(kw);}
						if (l == VFFTBTZP7) {out.print(kw);}
						if (l == VFFVORSTART) {out.print(kw);}
						if (l == VFFVOREND) {out.print(kw);}
					%>
						</td>
					<%
					}
					%>
					</tr>
					<tr>
					<%
					
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="border-bottom: 1px solid;width: <%=tdWidth%>px; height: 30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%
					}
					%>
					</tr>
					
					<!-- VFF路试信息 -->		
					<tr>			
					<%
					if (fv9VFFAbsMeter != 0 && 
							!"1900-01-01 00:00:00".equals(fv9VFFAbsStart) &&
							!"1900-01-01 00:00:00".equals(fv9VFFAbsEnd)) {
						for(int l=0; l<timeList.size(); l++) {
							TimeInfo timeinfo = timeList.get(l);
							int year = timeinfo.year;
							int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height: 15px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
					<%
						if (l == VFFABSSTART) {out.print(kw);}
						if (l == VFFABSEND) {out.print(kw);}
					%>
						</td>
					<%	
						}
					}
					%>
					</tr>
					<tr>			
					<%
					if (fv9VFFAbsMeter != 0 && 
							!"1900-01-01 00:00:00".equals(fv9VFFAbsStart) &&
							!"1900-01-01 00:00:00".equals(fv9VFFAbsEnd)) {
						
						for(int l=0; l<timeList.size(); l++) {
							TimeInfo timeinfo = timeList.get(l);
							int year = timeinfo.year;
							int kw = timeinfo.kw;
					%>
						<td style="border-bottom: 1px solid;width: <%=tdWidth%>px; height: 30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%	
						}
					} 
					%>
					</tr>
					
					<!-- PVS装车信息 -->		
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height: 15px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
					<%
						if (l == PVSTBTZP5) {out.print(kw);}
						if (l == PVSTBTZP7) {out.print(kw);}
						if (l == PVSVORSTART) {out.print(kw);}
						if (l == PVSVOREND) {out.print(kw);}
					%>
						</td>
					<%
					}
					%>
					</tr>
					<tr>
					<%
					
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="border-bottom: 1px solid;width: <%=tdWidth%>px; height: 30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%
					}
					%>
					</tr>
					
					<!-- PVS路试信息 -->		
					<tr>			
					<%
					if (fv9PVSAbsMeter != 0 && 
							!"1900-01-01 00:00:00".equals(fv9PVSAbsStart) &&
							!"1900-01-01 00:00:00".equals(fv9PVSAbsEnd)) {
						for(int l=0; l<timeList.size(); l++) {
							TimeInfo timeinfo = timeList.get(l);
							int year = timeinfo.year;
							int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height: 15px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
					<%
						if (l == PVSABSSTART) {out.print(kw);}
						if (l == PVSABSEND) {out.print(kw);}
					%>
						</td>
					<%	
						}
					}
					%>
					</tr>
					<tr>			
					<%
					if (fv9PVSAbsMeter != 0 && 
							!"1900-01-01 00:00:00".equals(fv9PVSAbsStart) &&
							!"1900-01-01 00:00:00".equals(fv9PVSAbsEnd)) {
						for(int l=0; l<timeList.size(); l++) {
							TimeInfo timeinfo = timeList.get(l);
							int year = timeinfo.year;
							int kw = timeinfo.kw;
					%>
						<td style="border-bottom: 1px solid;width: <%=tdWidth%>px; height: 30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%	
						}
					}
					%>
					</tr>
					
					<!-- 0S装车信息 -->		
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth %>px; height: 15px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");} %>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
					<%
						if (l == OSTBTZP5) {out.print(kw);}
						if (l == OSTBTZP7) {out.print(kw);}
						if (l == OSVORSTART) {out.print(kw);}
						if (l == OSVOREND) {out.print(kw);}
					%>
						</td>
					<%
					}
					%>
					</tr>
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="border-bottom: 1px solid;width: <%=tdWidth%>px; height: 30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%
					}
					%>
					</tr>
					
					<!-- 0S路试信息 -->		
					<tr>			
					<%
					if (fv90SAbsMeter != 0 && 
							!"1900-01-01 00:00:00".equals(fv90SAbsStart) &&
							!"1900-01-01 00:00:00".equals(fv90SAbsEnd)) {
						for(int l=0; l<timeList.size(); l++) {
							TimeInfo timeinfo = timeList.get(l);
							int year = timeinfo.year;
							int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height: 15px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
					<%
						if (l == OSABSSTART) {out.print(kw);}
						if (l == OSABSEND) {out.print(kw);}
					%>
						</td>
					<%	
						}
					}
					%>
					</tr>
					<tr>			
					<%
					if (fv90SAbsMeter != 0 && 
							!"1900-01-01 00:00:00".equals(fv90SAbsStart) &&
							!"1900-01-01 00:00:00".equals(fv90SAbsEnd)) {
						for(int l=0; l<timeList.size(); l++) {
							TimeInfo timeinfo = timeList.get(l);
							int year = timeinfo.year;
							int kw = timeinfo.kw;
					%>
						<td style="border-bottom: 1px solid;width: <%=tdWidth%>px; height: 30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%	
						}
					} 
					%>
					</tr>
					
					<!-- 市场认可 + 质保认可 -->
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height: 15px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
					<%
						if (l == TPPA_ME) {out.print(kw);}
						if (l == QFTPPA_Kunde) {out.print(kw);}
					%>
						</td>
					<%
					}
					%>
					</tr>
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height: 30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%
					}
					%>
					</tr>
					
					<!-- SOP-->
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; height:30px;
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%
					}
					%>
					</tr>
					
					<!-- blank -->
					<tr>
					<%
					for(int l=0; l<timeList.size(); l++) {
						TimeInfo timeinfo = timeList.get(l);
						int year = timeinfo.year;
						int kw = timeinfo.kw;
					%>
						<td style="width: <%=tdWidth%>px; 
						<%if (kw == 1) {out.print("border-left: 1px solid;");}%>
						<%if ((l != timeList.size()-1) && (getYesOrNo(l, indexList))) {out.print("border-right: 1px solid #E0E0E0; ");}%>
						">
						</td>
					<%
					}
					%>
					</tr>
					
				</table>
				<!--  
				通过绝对位置控制TBT、装车时间、路试时间等信息
				-->
				<%
				//关键点的绝对高度
	//			int baseTop = 110 + 20 + 60 + 18 + 15 + 15; //title(100) + 表格与上面的空白（20） + 表格LOGO（60） + 年（18） + 周（15） + 与SOP倒数的周数（15）
				int baseTop = 110 + 20 + 60 + 18 + 15 + 5; 
				int level1 = baseTop + 15;
				int level2 = level1;
				if (VFFABSSTART != 0 && VFFABSEND != 0) 
					level2 = level1 + 15 + 30;
				int level3 = level2 + 15 + 30;
				int level4 = level3;
				if (PVSABSSTART != 0 && PVSABSEND != 0) 
					level4 = level3 + 15 + 30;
				int level5 = level4 + 15 + 30;
				int level6 = level5;
				if (OSABSSTART != 0 && OSABSEND != 0)
					level6 = level5 + 15 + 30;
				int level7 = level6 + 15 + 30;
				int level8 = level7 + 30;
				int level9 = level8 + 35;
				
				if (VFFTBTZP5 != 0)
				%>
					<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
					top: <%=level1%>px; margin-left: <%=VFFTBTZP5*tdWidth - tdWidth/4%>px; word-wrap:break-word;
					filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/tbt_logo.png', 
					sizingMethod='scale');">
					TBT<br>ZP5
					</div>
				<%
				if (VFFTBTZP7 != 0)
				%>
					<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
					top: <%=level1%>px; margin-left: <%=VFFTBTZP7*tdWidth - tdWidth/4%>px; word-wrap:break-word;
					filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/tbt_logo.png', 
					sizingMethod='scale');">
					TBT ZP7
					</div>
				<%
				if (VFFVORSTART != 0 && VFFVOREND != 0) {
					String vffdesc = fv9VFFVorBatches + "&nbsp;Batches(" + fv9VFFVorFzg + " Fzg.)";
					if (!"".equals(fv9VFFDesc)) {
						vffdesc += "*";
					}
				%>
					<div style="width: <%=(VFFVOREND-VFFVORSTART+1)*tdWidth%>px; height: 19px; position: absolute; font-size: 12px; 
					text-align: center;  border: 0.01px solid black; padding-top: 9px;
					top: <%=level1%>px; margin-left: <%=VFFVORSTART*tdWidth%>px; word-wrap:break-word; background-color: #808080; color: white; font-weight: bolder;
					">
					VFF Fzge. fertig
					</div>
					<div style="width: 120px; height: 19px; position: absolute; font-size: 12px; text-align: center;
						padding-top: 9px; top: <%=level1%>px; margin-left: <%=(VFFVOREND+1)*tdWidth %>px;">
						<%=vffdesc %>
					</div>
				<%
				}
				if (VFFABSSTART != 0 && VFFABSEND != 0) {
				%>
					<div style="width: <%=(VFFABSEND-VFFABSSTART+1)*tdWidth%>px; height: 19px; position: absolute; font-size: 12px; 
					text-align: center;  border: 0.01px solid black; padding-top: 9px;
					top: <%=level2%>px; margin-left: <%=VFFABSSTART*tdWidth%>px; word-wrap:break-word; background-color: #83ABFE; color: white; font-weight: bolder;
					">
						Absicherungslauf VFF <%=fv9VFFAbsMeter %> km
					</div>
				<%
				}
				if (PVSTBTZP5 != 0)
				%>
						<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
						top: <%=level3%>px; margin-left: <%=PVSTBTZP5*tdWidth - tdWidth/4%>px; word-wrap:break-word;
						filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/tbt_logo.png', 
						sizingMethod='scale');">
						TBT ZP7
						</div>
				<%
				if (PVSTBTZP7 != 0)
				%>
						<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
						top: <%=level3%>px; margin-left: <%=PVSTBTZP7*tdWidth - tdWidth/4%>px; word-wrap:break-word;
						filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/tbt_logo.png', 
						sizingMethod='scale');">
						TBT ZP7
						</div>
				<%
				if (PVSVORSTART != 0 && PVSVOREND != 0) {
					String pvsdesc = fv9PVSVorBatches + "&nbsp;Batches(" + fv9PVSVorFzg + " Fzg.)";
					if (!"".equals(fv9PVSDesc)) {
						pvsdesc += "*";
					}
				%>
						<div style="width: <%=(PVSVOREND-PVSVORSTART+1)*tdWidth%>px; height: 19px; position: absolute; font-size: 12px; 
						text-align: center; border: 0.01px solid black; padding-top: 9px;
						top: <%=level3%>px; margin-left: <%=PVSVORSTART*tdWidth%>px; word-wrap:break-word; background-color: #808080; color: white; font-weight: bolder;
						">
						PVS Fzge. fertig
						</div>
						<div style="width: 120px; height: 19px; position: absolute; font-size: 12px; text-align: center;
						padding-top: 9px; top: <%=level3%>px; margin-left: <%=(PVSVOREND+1)*tdWidth%>px;">
							<%=pvsdesc %>
						</div>
				<%
				}
				if (PVSABSSTART != 0 && PVSABSEND != 0) {
					%>
						<div style="width: <%=(PVSABSEND-PVSABSSTART+1)*tdWidth%>px; height: 19px; position: absolute; font-size: 12px; 
						text-align: center;  border: 0.01px solid black; padding-top: 9px;
						top: <%=level4%>px; margin-left: <%=PVSABSSTART*tdWidth%>px; word-wrap:break-word; background-color: #83ABFE; color: white; font-weight: bolder;
						">
							Absicherungslauf PVS <%=fv9PVSAbsMeter %> km
						</div>
				<%
				}
				if (OSTBTZP5 != 0)
				%>
						<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
						top: <%=level5%>px; margin-left: <%=OSTBTZP5*tdWidth - tdWidth/4%>px; word-wrap:break-word;
						filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/tbt_logo.png', 
						sizingMethod='scale');">
						TBT ZP7
						</div>
				<%
				if (OSTBTZP7 != 0)
				%>
						<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
						top: <%=level5%>px; margin-left: <%=OSTBTZP7*tdWidth - tdWidth/4%>px; word-wrap:break-word;
						filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/tbt_logo.png', 
						sizingMethod='scale');">
						TBT ZP7
						</div>
				<%
				if (OSVORSTART != 0 && OSVOREND != 0) {
					String osdesc = fv90SVorBatches + "&nbsp;Batches(" + fv90SVorFzg + " Fzg.)";
					if (!"".equals(fv9PVSDesc)) {
						osdesc += "*";
					}
				%>
						<div style="width: <%=(OSVOREND-OSVORSTART+1)*tdWidth%>px;  height: 19px; position: absolute; font-size: 12px; 
						text-align: center; border: 0.01px solid black; padding-top: 9px;
						top: <%=level5%>px; margin-left: <%=OSVORSTART*tdWidth%>px; word-wrap:break-word; background-color: #808080; color: white; font-weight: bolder;
						">
						0S Fzge. fertig
						</div>
						<div style="width: 120px; height: 19px; position: absolute; font-size: 12px; text-align: center;
						padding-top: 9px; top: <%=level5%>px; margin-left: <%=(OSVOREND+1)*tdWidth%>px;">
							<%=osdesc %>
						</div>
				<%
				}
				if (OSABSSTART != 0 && OSABSEND != 0) {
				%>
						<div style="width: <%=(OSABSEND-OSABSSTART+1)*tdWidth%>px; height: 19px; position: absolute; font-size: 12px; 
						text-align: center;  border: 0.01px solid black; padding-top: 9px;
						top: <%=level6%>px; margin-left: <%=OSABSSTART*tdWidth%>px; word-wrap:break-word; background-color: #83ABFE; color: white; font-weight: bolder;
						">
							Absicherungslauf 0S <%=fv90SAbsMeter %> km
						</div>
				<%
				}
				if (TPPA_ME != 0) {
				%>
						<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
							top: <%=level7%>px; margin-left: <%=TPPA_ME*tdWidth - tdWidth/4%>px; word-wrap:break-word;
							filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/bg2.gif', 
							sizingMethod='scale');">
						</div>
						<div style="width: <%=tdWidth*3%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
							top: <%=level8%>px; margin-left: <%=TPPA_ME*tdWidth - tdWidth%>px; word-wrap:break-word;
							background-color: white;">
							T-PPA ME Volumen 
						</div>
				<%	
				}
				if (QFTPPA_Kunde != 0) {
				%>
						<div style="width: <%=tdWidth*1.5%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
							top: <%=level7%>px; margin-left: <%=QFTPPA_Kunde*tdWidth - tdWidth/4%>px; word-wrap:break-word;
							filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/bg2.gif', 
							sizingMethod='scale');">
						</div>
						<div style="width: <%=tdWidth*3%>px; height: 30px; position: absolute; font-size: 10px; text-align: center;
							top: <%=level8%>px; margin-left: <%=QFTPPA_Kunde*tdWidth - tdWidth%>px; word-wrap:break-word;
							background-color: white;">
							Q-Freigabe T-PPA Kunde
						</div>
				<%	
				}
				if (sopIndex != 0) {
				%>
						<div style="width: <%=tdWidth*1.5%>px; height: 21px; position: absolute; font-size: 10px; text-align: center;
							top: <%=level9%>px; margin-left: <%=sopIndex*tdWidth%>px; word-wrap:break-word; color:white; padding-top:9px;
							filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%=request.getContextPath() %>/app/pep/images/ml.png', 
							sizingMethod='scale');">
							SOP
						</div>
				<%	
				}
				if (!"".equals(fv9VFFDesc) || !"".equals(fv9PVSDesc) || !"".equals(fv90SDesc)) {
					String desc = fv9VFFDesc + "<br>" + fv9PVSDesc + "<br>" + fv90SDesc;
				%>
						<div style="width: 300px; height: 60px; position: absolute; font-size: 10px; 
							word-wrap:break-word; background-color: white;
							top: <%=level8%>px; margin-left: 100px; ">
							<%=desc %>
						</div>
				<%	
				}
				
			}
			%>
			
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
