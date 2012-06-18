<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/app/themes/saturn/saturn.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/testCode.js"></script>
<title>登录页面</title>
<script type="text/javascript">
	var code = __getTestCode();

	function press(e) {
		if(e.keyCode == 13)
			{login();}
	}
	function login() {
		var testCode = $('#testCode').val();
		
		/*  判断用户名和密码是否为空
		var userName = $('#name').val();
		var pwd = $('#pwd').val();
		
		if (userName == "") {
			alert('用户名不能为空');
			
			$('#name').focus();
			return;			
		}
		
		if (pwd == "") {
			alert('密码不能为空');
			
			$('#pwd').focus();
			return;			
		} */ 
		
		if (testCode.toLowerCase() != code.toLowerCase()) {
			alert('验证码不正确');
			
			$('#testCode').focus();
			return;
		}
		
		$('#loginForm').submit();
	}
	
	function reload() {
		code = __getTestCode();
		$('#testCodeImage').attr("src", "<%=request.getContextPath()%>/app/system/testcode/test.do?code=" + code);
		return false;
	}
	
	$(function() {
		code = __getTestCode();
		$('#testCodeImage').attr("src", "<%=request.getContextPath()%>/app/system/testcode/test.do?code=" + code);
		
		//$('#testCode').val(code);
	});
	
</script>
<style type="text/css">

img {
	border:0;
}
#glxt {
	background:url(themes/saturn/images/saturn/login.jpg) no-repeat 0 0;
}

</style>
</head>
<body >
	<div class="login_img" id="glxt">
		<div class="login_text">
			<form id="loginForm" name="form1" method="post"
				action="<%=request.getContextPath()%>/app/auth/user/login.do">
				用户名： <input name="id" id="name" type="text" class="login_input" value="" onkeydown="javascript:press(event);"/> <br />
				密&nbsp;&nbsp;码： <input name="password" id="pwd" type="password" class="login_input" value="" onkeydown="javascript:press(event);"/><br />
				验证码： <input id="testCode" name="testCode" type="text" class="login_input" value="" onkeydown="javascript:press(event);"onkeydown="javascript:press(event);"/><br /> <br /> 
				<input name="Submit" type="button" class="login_ok" onclick="login()"value="登录" /> <img id="testCodeImage" alt="验证码" onclick="reload()" style="cursor:hand">
					<div style="text-align:right;margin-right:30px;"><a href="<%=request.getContextPath()%>/app/login2.jsp" style="text-decoration: none;color: black;">指纹登录</a></div>
			</form>
		</div>
	</div>
</body>
</html>