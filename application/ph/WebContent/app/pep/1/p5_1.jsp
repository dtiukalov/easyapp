<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="java.util.Date"%>	
<%@page import="java.text.SimpleDateFormat"%>	
<%@page import="java.text.DateFormat"%>	
<%@page import="com.saturn.tc.utils.DateUtils"%>	
<%@page import="java.util.ArrayList"%>	
<%@page import="java.util.Arrays"%>	
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/app/pep/include/header.jsp"%>
<%
	title =  "1.5  Bauprogramm ";
	Map form = (Map)request.getAttribute("form");

	List<String> fv9Stufe = new ArrayList<String>(); // (List<String>)form.get("fv9Status");
	fv9Stufe.add("1");//假数据
	fv9Stufe.add("2");//假数据
	fv9Stufe.add("3");//假数据
	List<String> fv9FahrSoll = new ArrayList<String>(); // (List<String>)form.get("fv9FahrSoll");
	fv9FahrSoll.add("7");//假数据
	fv9FahrSoll.add("8");//假数据
	fv9FahrSoll.add("9");//假数据
	List<String> fv9Fahrlst = new ArrayList<String>();  // (List<String>)form.get("fv9Fahrlst");
	fv9Fahrlst.add("6");//假数据
	fv9Fahrlst.add("8");//假数据
	fv9Fahrlst.add("8");//假数据
	List<String> fv9KarossSoll = new ArrayList<String>(); // (List<String>)form.get("fv9KarossSoll");
	fv9KarossSoll.add("6");//假数据
	fv9KarossSoll.add("8");//假数据
	fv9KarossSoll.add("8");//假数据
	List<String> fv9Karosslst = new ArrayList<String>(); // (List<String>)form.get("fv9Karosslst");
	fv9Karosslst.add("5");//假数据
	fv9Karosslst.add("7");//假数据
	fv9Karosslst.add("8");//假数据

	//Todo:看取回来的时间数据格式再做调整
	Date[] fv9KarossStart = {DateUtils.getDate(2011, 12, 10), DateUtils.getDate(2011, 12, 30), DateUtils.getDate(2012, 2, 1)};
	//(List<String>)form.get("fv9KarossStart");
	Date[] fv9KarossEnd = {DateUtils.getDate(2011, 12, 20), DateUtils.getDate(2012, 1, 10), DateUtils.getDate(2012, 2, 20)};
	//(List<String>)form.get("fv9KarossEnd");
	Date[] fv9LackStart = {DateUtils.getDate(2011, 12, 21), DateUtils.getDate(2012, 1, 11), DateUtils.getDate(2012, 2, 21)};
	//(List<String>)form.get("fv9LackStart");
	Date[] fv9LackEnd = {DateUtils.getDate(2011, 12, 30), DateUtils.getDate(2012, 1, 30), DateUtils.getDate(2012, 3, 5)};
	//(List<String>)form.get("fv9LackEnd");
	Date[] fv9MontageStart = {DateUtils.getDate(2012, 1, 1), DateUtils.getDate(2012, 2, 1), DateUtils.getDate(2012, 3, 1)};
	//(List<String>)form.get("fv9MontageStart");
	Date[] fv9MontageEnd = {DateUtils.getDate(2012, 1, 10), DateUtils.getDate(2012, 2, 29), DateUtils.getDate(2012, 3, 25)};
	//(List<String>)form.get("fv9MontageEnd");
	Date[] fv9ObergabeStart = {DateUtils.getDate(2012, 1, 11), DateUtils.getDate(2012, 3, 1), DateUtils.getDate(2012, 3, 26)};
	//(List<String>)form.get("fv9ObergabeStart");
	Date[] fv9ObergabeEnd = {DateUtils.getDate(2012, 1, 30), DateUtils.getDate(2012, 3, 28), DateUtils.getDate(2012, 4, 15)};
	//(List<String>)form.get("fv9ObergabeEnd");
	
//	int tdNum = DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2012-05-30 00:00");
	String[] kws = DateUtils.getKWArray("2011-12-10 00:00", "2012-04-15 00:00");
	int min_week = DateUtils.getWeekOfYear("2011-12-10 00:00"); 
	int max_week = DateUtils.getWeekOfYear("2012-04-15 00:00");	 
	System.out.println("kws = " + Arrays.toString(kws));
	int num = kws.length;
	System.out.println("num = " + num);
	int px = Math.round(830/num);
	System.out.println("px = " + px);
	
	int[] Kaross = {DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2011-12-20 00:00"), 
			DateUtils.getWeekNumBetweenStartAndEnd("2011-12-30 00:00", "2012-01-10 00:00"),
			DateUtils.getWeekNumBetweenStartAndEnd("2012-02-01 00:00", "2012-02-20 00:00")};
	
	int[] beforeKaross = {DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2011-12-10 00:00"), 
			DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2011-12-30 00:00"),
			DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2012-02-01 00:00")};
	
	int[] Lack = {DateUtils.getWeekNumBetweenStartAndEnd("2011-12-21 00:00", "2011-12-30 00:00"), 
			DateUtils.getWeekNumBetweenStartAndEnd("2012-01-11 00:00", "2012-01-30 00:00"),
			DateUtils.getWeekNumBetweenStartAndEnd("2012-02-21 00:00", "2012-03-05 00:00")};
	
	int[] beforeLack = {DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2011-12-21 00:00"), 
			DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2012-01-11 00:00"),
			DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2012-02-21 00:00")};
	
	int[] Montage = {DateUtils.getWeekNumBetweenStartAndEnd("2012-01-01 00:00", "2012-01-16 00:00"), 
			DateUtils.getWeekNumBetweenStartAndEnd("2012-02-01 00:00", "2012-02-29 00:00"),
			DateUtils.getWeekNumBetweenStartAndEnd("2012-03-01 00:00", "2012-03-25 00:00")};
	
	int[] beforeMontage = {DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2012-01-01 00:00"), 
			DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2012-02-01 00:00"),
			DateUtils.getWeekNumBetweenStartAndEnd("2011-12-10 00:00", "2012-03-01 00:00")};
	
	int[] Obergabe = {DateUtils.getWeekNumBetweenStartAndEnd("2012-01-11 00:00", "2012-01-30 00:00"), 
			DateUtils.getWeekNumBetweenStartAndEnd("2012-03-01 00:00", "2012-03-28 00:00"),
			DateUtils.getWeekNumBetweenStartAndEnd("2012-03-26 00:00", "2012-04-15 00:00")};
	//http://localhost:8080/ph/app/pep/do/preview.do?uid=wRL9yykp6MzGwB
%>
	<title><%=title %></title>
</head>

<body>
	<div id="container">
		<div id="nr">
		<div id="top"><h1><%=title %></h1></div>
	    <div id="content">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="db">
		        <tr>
					<td width="140" class="x">Stufe</td>
					<% 
						for(int i=0; i<num; i++) {
					%>
						<td width="<%=px%>"  class="x"><%=kws[i] %></td>
					<%
						}
					%>
		        	</td>
		        </tr>
		        <%
		        if (fv9Stufe.size() > 0) {
		        	for(int i=0; i<fv9Stufe.size(); i++) {
		        %>		
		        <tr>
		        	<td width="140"  style="font-size:16px;" rowspan="4" class="line">
						<span style="font-weight:bold; font-size:16px;"><%=fv9Stufe.get(i) %></span>
						Fahrzeuge<br />
						&nbsp;&nbsp;Soll:<%=fv9FahrSoll.get(i) %>&nbsp;lst:<%=fv9Fahrlst.get(i) %><br />
						&nbsp;&nbsp;Karosserien<br />&nbsp;&nbsp;Soll:<%=fv9KarossSoll.get(i) %>&nbsp;lst:<%=fv9Karosslst.get(i) %>
					</td>
				</tr>	
				<tr>
					<td colspan="<%=beforeKaross[i] %>" class="line">&nbsp;</td>
					<td colspan="<%=Kaross[i] %>" style="background-color: #aed4f8;" class="line">&nbsp;</td>
					<td colspan="<%=num - beforeKaross[i] - Kaross[i] %>" class="line">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="<%=beforeLack[i] %>" class="line">&nbsp;</td>
					<td colspan="<%=Lack[i] %>" style="background-color: #8994A0;" class="line">&nbsp;</td>
					<td colspan="<%=num - beforeLack[i] - Lack[i] %>" class="line">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="<%=beforeMontage[i] %>" class="line">&nbsp;</td>
					<td colspan="<%=Montage[i] %>" style="background-color: #00235A;" class="line">&nbsp;</td>
					<td colspan="<%=Obergabe[i] %>" style="background-color: #91AFFF;" class="line">&nbsp;</td>
					<td colspan="<%=num - beforeMontage[i] - Montage[i] - Obergabe[i] %>" class="line">&nbsp;</td>
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
