<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.List"%>
<%
String a ="0";
if(request.getAttribute("result")!=null){
	a=request.getAttribute("result").toString();
}
out.print(a);
%>
