<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
String a ="";
if(request.getAttribute("result")!=null){
a = request.getAttribute("result").toString();
}
out.print(a);
%>
