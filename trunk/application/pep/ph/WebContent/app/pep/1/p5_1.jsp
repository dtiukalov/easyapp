<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="java.util.ArrayList"%>	
<%@page import="java.util.Arrays"%>	
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	
	<%
	String uid = (String)request.getAttribute("uid");
	List<String> fv9Stufe = (List)form.get("fv9Stufe"); //轮次
	List<String> fv9FahrSoll = (List)form.get("fv9FahrSoll");  //计划装车数量
	List<String> fv9Fahrlst = (List)form.get("fv9Fahrlst"); //实际装车数量
	List<String> fv9KarossSoll = (List)form.get("fv9KarossSoll"); //计划车身数量
	List<String> fv9Karosslst = (List)form.get("fv9Karosslst");  //实际车身数量
	List<String> fv9KarossStart = (List)form.get("fv9KarossStart"); //焊装开始日期
	List<String> fv9KarossEnd = (List)form.get("fv9KarossEnd");  //焊装结束日期
	List<String> fv9LackStart = (List)form.get("fv9LackStart");  //油漆开始日期
	List<String> fv9LackEnd = (List)form.get("fv9LackEnd"); //油漆结束日期
	List<String> fv9MontageStart = (List)form.get("fv9MontageStart"); //总装日期
	List<String> fv9MontageEnd = (List)form.get("fv9MontageEnd"); //总装结束日期
	List<String> fv9ObergabeStart = (List)form.get("fv9ObergabeStart"); //交车开始日期
	List<String> fv9ObergabeEnd = (List)form.get("fv9ObergabeEnd"); //交车结束日期
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
	    <!-- 
	    <iframe id="ff" name= "ff" frameborder="0"  scrolling="no"
				    src="<%=request.getContextPath() %>/app/pep/1/GanttChart4.jsp?uid=<%=uid %>" 
				    style="width:850px;height:400px;margin:50px 10px">
			</iframe>
	     -->
	     
			<%
			if (Web.getListYesOrNo(fv9Stufe)) {
				String beginDate = getTime(fv9KarossStart.get(0) + " 00:00");
				String endDate = getTime(fv9ObergabeEnd.get(fv9Stufe.size()-1) + " 00:00");
				
				Date firstDate = DateUtils.transStringToDate(beginDate);
				Date lastDate = DateUtils.transStringToDate(endDate);
		//		String[] tdKW = DateUtils.getKWArray(beginDate, endDate);
				int tdNum = DateUtils.dateDiff(firstDate, lastDate);
	//			System.out.println("tdNum = " + tdNum);
				double tdWidth = 905.0/tdNum; 
	//			System.out.println("tdWidth = " + tdWidth);
				
				
			%>
			<style>
		     	.stufeTable {
					width: 900px; height: auto; font-size: 10px; overflow: hidden; margin: 0px; padding: 0px;
				}
				.stufeTable td {
					height: 30px;  width: <%=tdWidth%>px;
				}
		    </style>
			<table class="stufeTable">
				<tr>
					<td style="width: 20px; text-align: center;">&nbsp;</td>
					<td style="width: 100px;">&nbsp;</td>

			<% 
				String temp = "";
				List<String> kws = new ArrayList();
				for (int m=0; m<=tdNum; m++) {
				 	String datestr = DateUtils.oneDateAddOrSubDays(beginDate, m, "+") + " 00:00";
				 	//System.out.println("datestr = " + datestr);
					String kw_info = DateUtils.getKWByDate(datestr);
					//System.out.println("kw_info = " + kw_info);
					kws.add(kw_info);
				}
				
				List<Bauprogramm> list = new ArrayList<Bauprogramm>();
				int count = 0;
				for(int k = 1; k < kws.size(); k++) {
					//周数发生变化(如此循环缺少最后一周)
					count++;
		//			System.out.println("count = " + count);
					
					if (!kws.get(k).equals(kws.get(k-1))) {
						Bauprogramm b = new Bauprogramm();
						b.kw = kws.get(k-1);
						b.num = count;
						count = 0;
						list.add(b);
					}
				}
				String lastKW = DateUtils.getKWByDate(endDate);
	//			System.out.println("lastKW = " + lastKW);
				Date lastMonday = DateUtils.getFirstDayOfWeek(lastDate); //最后一天所在的周一日期
				int lastKWDays = DateUtils.dateDiff(lastMonday, lastDate); //最后一周的天数
	//			System.out.println("lastKWDays = " + lastKWDays);
				if (lastKWDays > 0) {
					Bauprogramm b = new Bauprogramm();
					b.kw = lastKW;
					b.num = lastKWDays;
					list.add(b);
				}
				
				
		//		System.out.println("list.size = " + list.size());
				if (list != null && list.size() > 0) {
					for (int kw=0; kw<list.size(); kw++) {
						Bauprogramm bb = list.get(kw);
		//				System.out.println("bb.kw = " + bb.kw + "  bb.num = " + bb.num);
			%>
					<td colspan="<%=bb.num%>" style="text-align: center; vertical-align: bottom; font-weight: bold;"><%=bb.kw %></td>
			<%			
					}
				}
			%>
					
				</tr>
				<tr><td colspan="<%=tdNum+2%>" style="border-bottom: 2px solid; height: 0px;"></td></tr>
			<%
				for (int i=0; i<fv9Stufe.size(); i++) {
					String KarossStart = getTime(fv9KarossStart.get(i));
					String KarossEnd = getTime(fv9KarossEnd.get(i));
					String LackStart = getTime(fv9LackStart.get(i));
					String LackEnd = getTime(fv9LackEnd.get(i));
					String MontageStart = getTime(fv9MontageStart.get(i));
					String MontageEnd = getTime(fv9MontageEnd.get(i));
					String ObergabeStart = getTime(fv9ObergabeStart.get(i));
					String ObergabeEnd = getTime(fv9ObergabeEnd.get(i));
					
					String Fahrzeuge = "";
					if (Integer.parseInt((String)fv9Fahrlst.get(i)) > 0) {
						Fahrzeuge = "Fahrzeuge<br>Soll: " + fv9FahrSoll.get(i) + " Ist:" + fv9Fahrlst.get(i);
					} else {
						Fahrzeuge = "Fahrzeuge<br>Soll: " + fv9FahrSoll.get(i) + " Ist:";
					}
					 
					String Karosserien = "";
					if (Integer.parseInt((String)fv9Karosslst.get(i)) > 0) {
						Karosserien = "Karosserien<br>Soll: " + fv9KarossSoll.get(i) + " Ist: " + fv9Karosslst.get(i);
					} else {
						Karosserien = "Karosserien<br>Soll: " + fv9KarossSoll.get(i) + " Ist: ";
					}
					
					int colspan11 = DateUtils.dateDiff(DateUtils.transStringToDate(beginDate), DateUtils.transStringToDate(KarossStart));
					int colspan12 = DateUtils.dateDiff(DateUtils.transStringToDate(KarossStart), DateUtils.transStringToDate(KarossEnd));
					int colspan13 = tdNum - colspan11 - colspan12;
	//				System.out.println("colspan11 = " + colspan11 + " colspan12 = " + colspan12 + " colspan13 = " + colspan13);
					
					int colspan21 = DateUtils.dateDiff(DateUtils.transStringToDate(beginDate), DateUtils.transStringToDate(LackStart));
					int colspan22 = DateUtils.dateDiff(DateUtils.transStringToDate(LackStart), DateUtils.transStringToDate(LackEnd));
					int colspan23 = tdNum - colspan21 - colspan22;
	//				System.out.println("colspan21 = " + colspan21 + " colspan22 = " + colspan22 + " colspan23 = " + colspan23);
					
					int colspan31 = DateUtils.dateDiff(DateUtils.transStringToDate(beginDate), DateUtils.transStringToDate(MontageStart));
					int colspan32 = DateUtils.dateDiff(DateUtils.transStringToDate(MontageStart), DateUtils.transStringToDate(MontageEnd));
					int colspan33 = DateUtils.dateDiff(DateUtils.transStringToDate(ObergabeStart), DateUtils.transStringToDate(ObergabeEnd));
					int colspan34 = tdNum - colspan31 - colspan32 - colspan33;
	//				System.out.println("colspan31 = " + colspan31 + " colspan32 = " + colspan32 + " colspan33 = " + colspan33 + " colspan34 = " + colspan34);

			%>
				<tr>
					<td style="width: 20px; height:30px; text-align: center; font-weight: bolder;"><%=i + 1%></td>
					<td style="width: 100px;"><%=Fahrzeuge %></td>
					<%
					if (colspan11 > 0) {
					%>
					<td colspan="<%=colspan11%>" style="border-bottom: 0.01px solid gray; ">&nbsp;</td>
					<%
					}
					%>
					
					<td colspan="<%=colspan12%>" style="background-color: #AED4F8; border-bottom: 0.01px solid gray; ">&nbsp;</td>
					<td colspan="<%=colspan13%>" style="border-bottom: 0.01px solid gray; ">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 20px; height:30px;">&nbsp;</td>
					<td style="width: 100px;"><%=Karosserien %></td>
					<%
					if (colspan21 > 0) {
					%>
					<td colspan="<%=colspan21%>" style="border-bottom: 0.01px solid gray; ">&nbsp;</td>
					<%
					}
					%>
					
					<td colspan="<%=colspan22%>" style="background-color: #8994A0; border-bottom: 0.01px solid gray; ">&nbsp;</td>
					<td colspan="<%=colspan23%>" style="border-bottom: 0.01px solid gray; ">&nbsp;</td>
					
				</tr>
				<tr>
					<td style="width: 20px; height:30px;">&nbsp;</td>
					<td style="width: 100px;">&nbsp;</td>
					<%
					if (colspan31 > 0) {
					%>
					<td colspan="<%=colspan31%>" >&nbsp;</td>
					<%
					}
					%>
					
					<td colspan="<%=colspan32%>" style="background-color: #00235A;">&nbsp;</td>
					<td colspan="<%=colspan33%>" style="background-color: #91AFFF;">&nbsp;</td>
					<td colspan="<%=colspan34%>" >&nbsp;</td>
					
				</tr>
			<%
					if (i<fv9Stufe.size()-1) {
			%>
				<tr><td colspan="<%=tdNum+2%>" style="border-bottom: 0.01px solid; height: 0.01px; "></td></tr>
			<%	
					}

				}
			%>
				<tr><td colspan="<%=tdNum+2%>" style="border-bottom: 2px solid; height: 0px; "></td></tr>
			</table>
			<%
			}
			%>
	   
	    </div>
	    <%@ include file="/app/pep/include/foot.jsp"%>
	     </div>
	</div>
</body>
</html>
