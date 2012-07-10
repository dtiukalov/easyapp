<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String type = request.getParameter("type");
	String path = request.getContextPath() + "/app/pep/logout.do";
	if(type.contains("init")){
		path =  request.getContextPath() + "/app/pep/initworkspace.jsp";
	} 
%>

Response.Write("<script>parent.location.href='<%=path%>'</script>");

</body>
</html>