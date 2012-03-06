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
	<style type="text/css">
		.login {
			background-image: url(../themes/saturn/images/saturn/login.jpg);
			background-repeat: no-repeat;
			height: 595px;
			width: 997px;
			margin: 0px;
			text-align: center;
			vertical-align: middle;
			margin-top: 86px;

		}
		.login_form {
			width: 265px; 
			float: right;
			margin-right: 56px;
			margin-top: 145px;
			vertical-align: bottom;

		}
		.login_title {
			width:  265px;
			height: 40px;
			text-align: left;
			color: white;
			font-weight: bolder;
			float: left;
			padding-left: 20px;
			font-size: 22px;
		}
		.label {
			width: 78px;
			color: white;
			text-align: left;
			padding-left: 23px;
			font-weight: bolder;
			float: left;
		}
		.text {
			width: 100px;
			text-align: left;
			float: left;
		}
		.msg {
			width:  265px;
			height: 20px;
			text-align: center;
			color: red;
			float: left;
			font-size: 14px;
		}
	</style>
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
<body>
 

	<!-- 
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
	 -->
		
	<div class="login">
		<div class="login_form">
			
			<form id="loginForm" name="form1" method="post" action="<%=request.getContextPath()%>/app/tc/login.do">
				<div class="login_title"><%=International.get(request, "login_title") %></div>
				<br><br>
				<div class="label"><%=International.get(request, "username") %>：</div>
				<div class="text"><input name="name" type="text" value=""/></div>
				<br><br>
				<div class="label"><%=International.get(request, "password") %>：</div>
				<div class="text"><input name="password" type="password" value="" /></div>
				<br><br>
				<div class="label">&nbsp;</div>
				<div class="text">
					<input name="Submit" type="button" class="login_ok" onclick="login()" value="<%=International.get(request, "login") %>" />
				</div>
				<br><br>
				<div class="msg">
					<%=msg %>
				</div>
			</form>
		</div>
	</div>

	
</body>


</html>

