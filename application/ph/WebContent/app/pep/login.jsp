<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    
<html>
<head>
	<title>Teamcenter Login</title>
	
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	
	<script language="JavaScript1.2">
	/*  Sivarama Chandra: The cookies stuff is added to address the PR5204641.
	    Similar verification and warning message is implmented in 
	    SSOLoginPage.jsp file also */
	var cookieEnabled = (navigator.cookieEnabled)? true : false
	if (cookieEnabled==false) {
	   alert("Cookies are disabled. Please enable cookies. Otherwise most of the functionalities will not work properly.");
	}
	
	function isFieldEmpty(textObj){
		for (var i = 0; i < textObj.value.length; i++){
			var ch = textObj.value.charAt(i);
			if (ch != ' ' && ch != '\t') return false;		
		}
		return true;
	}
	
	function checkSubmitLoginForm(loginFormObj) {
		var userNameRequiredStr = "用户名是必需的！您必须输入用户名！";
		if (isFieldEmpty(form1.ua) == false)
		{
			form1.Submit.disabled=true;
		   return true;
		}
		else alert(userNameRequiredStr);		
	}

	</script>
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 3px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	-->
	</style>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">
</head>

<body >
	
	<div class="bj">
		<form id="form1" name="WebClientLoginForm" method="post" action= "<%=request.getContextPath() %>/app/pep/login.do" onSubmit="return checkSubmitLoginForm(this)" ID="Form1">
		    <p>Pilothallengesprch  </p>
		    <p>用户名：
		      <label>
		      <input type="text" name="ua" ID="Text1" class="input" />
		      </label>
		    </p>
		    <p>密　码：
		      <label>
		      <input type="password" name="pd" ID="Password1" class="input" />
		      </label>
		    </p>
		    <p>
		      <label>
		       　　　　　　　 
		      <input type="submit" id="Submit1" name="Submit" value="登 录" />
		      </label>
		    </p>
		  </form>
		
	</div>

</body>

</html> 