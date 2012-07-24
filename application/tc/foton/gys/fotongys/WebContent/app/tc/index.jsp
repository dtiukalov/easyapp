<%@page import="com.saturn.tc.utils.International"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/app/themes/saturn/saturn.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<style type="text/css">
body {
	width: 100%;
	height: 668px;
	overflow: hidden;
}

.login {
	background-image: url(<%=request.getContextPath()%>/app/themes/saturn/images/saturn/login.jpg
		);
	background-repeat: no-repeat;
	height: 595px;
	width: 997px;
	text-align: center;
	vertical-align: middle;
	/*margin-top: 86px;*/
	margin-left: auto;
	margin-right: auto;
	margin-top: 40px;
}

.login_form {
	width: 265px;
	float: right;
	margin-right: 56px;
	margin-top: 145px;
	vertical-align: bottom;
}

.login_title {
	width: 265px;
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

.input {
	width: 150px;
	height: 16px;
	border: 1px solid #999999;
}

.text {
	width: 100px;
	text-align: left;
	float: left;
}

.msg {
	width: 265px;
	height: 20px;
	text-align: center;
	color: red;
	float: left;
	font-size: 14px;
}
</style>
</head>

<%
	String msg = (String) request.getAttribute("msg");
	if (msg == null) {
		msg = "";
	}
%>
<body>

	<div class="login">
		<div class="login_form">

			<form id="loginForm" name="form1" method="post"
				action="<%=request.getContextPath()%>/app/tc/login.do">
					<div class="login_title"><%=International.get(request, "login_title")%></div>
					<br>
					<br>
						<div class="label">
							<%=International.get(request, "username")%>：
						</div>
						<div class="text">
							<input name="name" type="text" value="" class="input"/>
						</div>
						<br>
						<br>
						
						<div class="label">
							<%=International.get(request, "password")%>：
						</div>
						<div class="text">
							<input name="password" type="password" value="" class="input"/>
						</div>
						<br>
						<br>
					
						<div class="label">&nbsp;</div>
						<div class="text">
							<input name="Submit" type="submit" class="login_ok"
								value="<%=International.get(request, "login")%>" />
						</div>
						<br>
						<br>
						
					<div class="msg">
						<%=msg%>
					</div>
			</form>
			
		</div>
	</div>


</body>


</html>

