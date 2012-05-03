<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.auth.User"%>
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
<%
	String id = request.getParameter("id");
	List users = User.getUsers(new User(), null, null, null, null).getList();
	int size = users.size();
	
	String ids = "[";
	String tempalets = "[";
	for (int i = 0; i < size; ++i) {
		User user = (User)users.get(i);
		ids += "\"" + user.getId() + (i != size-1 ? "\", " : "\"]");
		tempalets += "\"" + user.getTemplate() + (i != size-1 ? "\", " : "\"]");
	}
	
%>

</head>
<body>
	<OBJECT classid="clsid:CA69969C-2F27-41D3-954D-A48B941C3BA7" width=2 height=2 id=zkonline >
	</OBJECT>
	<COMMENT>
	    <EMBED type="application/x-eskerplus"
	        classid="clsid:CA69969C-2F27-41D3-954D-A48B941C3BA7"
	        codebase="biokey.ocx"                
	        width=2 height=2>
	    </EMBED>
	</COMMENT>
	<script for=zkonline event="onEnroll(result, template)"> 
		var zw = zkonline.GetTemplateAsString();//采集指纹
		if(zw != ""){
			for (var i = 0; i < ids.length; ++i) {
				if(zkonline.VerFingerFromStr(tempalets[i],zw,true,false)){
				//if(zkonline.VerFingerFromStr("<%=((User)users.get(0)).getTemplate()%>",zw,true,false)){
					alert("指纹验证成功!" + ids[i]);
					zkonline.CancelEnroll();
					zkonline.EndEngine();
					
					document.loginForm.id.value=ids[i];
					document.loginForm.submit();
					return;
				}
			}
			alert("指纹质量：" + zkonline.LastQuality);
			alert("指纹匹配失败!");
			if (zkonline.InitEngine() == 0) {//初始化指纹识别系统
				if(zkonline.IsRegister) {//是否正登记指纹
					zkonline.CancelEnroll();//取消当前的指纹登记状态
				}
				zkonline.EnrollCount=1;//登记指纹时取样的次数
				zkonline.LowestQuality=75;
				zkonline.BeginEnroll();//开始登记指纹
			}
		}
	 </script> 
	 <script type="text/javascript">
	 	var ids = <%=ids%>;
	 	var tempalets = <%=tempalets%>;
	 	
		$(function() {
			if (navigator.appName == "Microsoft Internet Explorer" ||  window["zkonline"]) {
				if (zkonline.InitEngine() == 0) {//初始化指纹识别系统
					if(zkonline.IsRegister) {//是否正登记指纹
						zkonline.CancelEnroll();//取消当前的指纹登记状态
					}
					zkonline.EnrollCount=1;//登记指纹时取样的次数
					zkonline.LowestQuality=75;
					zkonline.BeginEnroll();//开始登记指纹
					
				//	alert("请输入指纹12233244!");
				} else {
		    		alert("请检查确认已安装指纹驱动程序并指纹设备已连接.");
				}
			} 
		});
	</script>
	<div class="login_img">
		<div class="login_text">
			<form id="loginForm" name="loginForm" method="post"
				action="<%=request.getContextPath()%>/app/auth/user/loginTemplate.do">
				<br /> <br />
				<h3>请输入指纹</h3><br /> <br /> 
				<br /> <br /> 
				<!--  <input name="Submit" type="button" class="login_ok" onclick="submitRegister()"
					value="验证指纹" />-->
				<div style="text-align:right;margin-right:30px;margin-top:-60px;"><a href="<%=request.getContextPath()%>/app/login.jsp" style="text-decoration: none;color: black;">管理员登录</a></div>
				<input id="id" name="id" type="hidden" value=""></input>
			</form>
		</div>
	</div>
</body>
</html>