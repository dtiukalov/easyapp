<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.List"%>
<%
String a ="";
if(request.getAttribute("b_card")!=null){
a = request.getAttribute("b_card").toString();
}
out.print("error"+a);
%>
