<%@page import="com.saturn.tc.utils.International"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/app/themes/saturn/saturn.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function login() {
		$('#loginForm').submit();
	}
</script>
</head>
<!--<body>
	${msg}
	<form id="loginForm" name="form1" method="post"
		action="<%=request.getContextPath()%>/app/tc/login.do">
		用户名： <input name="name" type="text" value="lijialun"/> <br /> <br />
		密&nbsp;&nbsp;码： <input name="password" type="password" value="" /><br /> <br /> 
		<input name="Submit" type="button" class="login_ok" onclick="login()" value="登录" />
	</form>
</body>

-->
<%
	String msg = (String)request.getAttribute("msg");
	if (msg == null) {
		msg = "";
	}
%>
<body background="<%=request.getContextPath()%>/app/themes/saturn/images/saturn/background.png">
	<div class="login_img">
		<div class="login_text">
			<form id="loginForm" name="form1" method="post"
			action="<%=request.getContextPath()%>/app/tc/login.do">
			<%=International.get(request, "username") %>： <input name="name" type="text" value=""/> <br /> <br />
			<%=International.get(request, "password") %>&nbsp;&nbsp;： <input name="password" type="password" value="" /><br /> <br /> 
			<input name="Submit" type="button" class="login_ok" onclick="login()" value="<%=International.get(request, "login") %>" /><%=msg %>
			</form>	
		</div>
	</div>
</body>


</html>

