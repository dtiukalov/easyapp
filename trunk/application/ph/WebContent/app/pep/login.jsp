<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    
<html>
<head>
	<title>Teamcenter Login</title>
	<link REL='stylesheet' href='<%=request.getContextPath()%>/app/pep/include/TeamCenter.css'>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/app/pep/images/favicon.ico" type="image/x-icon"/>
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
		if (isFieldEmpty(loginFormObj.j_username) == false)
		{
		   loginFormObj.Submit.disabled=true;
		   return true;
		}
		else alert(userNameRequiredStr);		
	}
	
	/* 
	   Turn on the watch cursor when this page is busy.
	   There is no point to return cursor back, the 
	   browser considers the page new. 
	 */
	function doWatchCursor() {
	  document.body.style.cursor = 'wait';
	}
	
	</script>
</head>

<body onbeforeunload="doWatchCursor();" onunload="doWatchCursor();" onLoad="document.WebClientLoginForm.j_username.focus();">

<table cellspacing="0" cellpadding="0" align="left" id="Table1">
	<tr valign="top">
	    <td valign="top"><img src="<%=request.getContextPath()%>/app/pep/images/Teamcenter_Version8_Login.png"/></td>
	</tr>
</table>


<div id="loginSection" class="dialog-section-ie">

<table cellspacing="0" cellpadding="0" border="1" align="right" id="Table2">
<tr>
   <td>
      <table class="transparent-title" id="trans-title" style="background-color: #fff;">
      <tr>
         <td style="width:259px;" class="info-message">领导仪表板登录</td>
      </tr>
      </table>
    </td>
</tr>
<tr>
   <td>
      <form name="WebClientLoginForm" method="GET" action= "<%=request.getContextPath() %>/app/pep/login.do" onSubmit="return checkSubmitLoginForm(this)" ID="Form1">
      <table style="width: 252px" class="transparent-body" id="trans-body" bgColor="#fff">
      <tr>

          <td align="justify" colspan="3">&nbsp;</td>
										
      </tr>
      <tr>
          <td align="left" class="input-label">用户名：</td>
          <td width="1px"><font color="#b22222" size="1">*</font></td>
          <td align="left"><input class="input-body" type="text" name="ua" ID="Text1" size="15" value="infodba"></td>
      </tr>
      <tr>
          <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
          <td align="left" class="input-label">密码：</td>
          <td width="1px"><font color="#b22222" size="1">*</font></td>
          <td align="left"><input class="input-body" type="password" name="pd" ID="Password1" size="15" value="infodba"></td>    
      </tr>
      <tr>
          <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
          <td colspan="2">&nbsp;</td>
          <td align="left"><input type="submit" value="登录" ID="Submit1" NAME="Submit"></td>
      </tr>
      <tr>
          <td colspan="3">&nbsp;</td>
      </tr>
      </table>
          <INPUT TYPE="hidden" NAME="initialLoginPage" VALUE="myHomePage">
      </form>
   </td>
</tr>
</table>
</div>

</body>

</html>


