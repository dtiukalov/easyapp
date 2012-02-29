<%@page import="edu.ccut.saturn.component.SaturnData"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.List"%>
<%
String a ="";
if(request.getAttribute("cardresult")!=null){
	List res = (List)request.getAttribute("cardresult");
	int i=0;
	for(Object obj:res){
		SaturnData sd=(SaturnData)obj;
		if(i==0){
			a+=sd.get("c_card");
		}else{
			a+=","+sd.get("c_card");
		}
		i++;
	}
}
out.print(a);
%>
