<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@ page import="net.sf.jasperreports.j2ee.servlets.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.saturn.app.db.DatabaseManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打印</title>
<%
	String template = request.getParameter("template");
	String params = request.getParameter("params");
	
	String args = "template=" + template + "&params=" + params;
%>
<script type="text/javascript" defer="defer">
	function exp() {
		var param = document.getElementById('file_source').value;
		window.open('<%=request.getContextPath()%>/app/report/export.do?type=' + param + '&<%=args%>');
	}
	
	function print() {
		document.JrPrt.btnPrint();
		document.JrPrt.repaint();
		return true;
	}
	
	function review() {
		document.JrPrt.btnReview();
		document.JrPrt.repaint();
		return true;
	}
</script>
</head>
<body>
	<table width="95%" style="text-align: center">
		<tr>
			<td>
				<APPLET ID="JrPrt" CODE="com.saturn.report.applet.JPrintApplet"
					CODEBASE="./"
					ARCHIVE="reportprint.jar"
					WIDTH="0" HEIGHT="0">
					<PARAM NAME="type" VALUE="application/x-java-applet;version=1.2.2">
					<param name="url" 
					
					value="http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/app/report/print.do?<%=args%>">
				</APPLET>
				<button onclick="print();">打印</button>
				<button onclick="review();">预览</button>
				<select id="file_source" name="file_source" size="1"
					id="file_source" onChange="">
						<option value="pdf" selected>PDF</option>
						<option value="xls">XLS</option>
				</select>
				<button onclick="exp();">导出</button>
			</td>
		</tr>
		<tr>
			<td>
				<iframe src="<%=request.getContextPath()%>/app/report/export.do?type=review&<%=args%>" width="95%" height="700" frameborder="0"> </iframe>
			</td>
		</tr>
	</table>
	
</body>
</html>