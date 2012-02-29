<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>错误信息</title>
<script>
</script>
</head>
<body>
		<%=request.getAttribute("__ERROR_MESSAGE__")%>
		<span>无售后分析类型</span>
</body>
</html>