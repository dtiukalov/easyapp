<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ERROR</title>
<script>
	alert("超时，请重新登录");
	if (window != top) {
		top.location.href = "<%=request.getContextPath()%>/login.jsp"; 
		}else {
		window.location.href = "<%=request.getContextPath()%>/login.jsp"; 
		}
	
</script>
</head>

<body>

</body>
</html>

