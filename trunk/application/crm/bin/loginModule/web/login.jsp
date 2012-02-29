<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户关系管理--登录</title>
<script type="text/javascript">
	if (window.parent.frames["leftFrame"]) { 
		window.open("${pageContext.request.contextPath}/crm/loginModule/web/login.jsp",'_top'); 
	}
</script>
<style>
	*{margin:0px;padding:0px;}
	#content{height:88px; width:287px; background: url(${pageContext.request.contextPath}/crm/coreModule/web/images/04.png) repeat-x;width:801px;margin:0 auto; margin-top:80px;}
	#login{background:url(${pageContext.request.contextPath}/crm/coreModule/web/images/03.jpg) no-repeat;width:801px; height:242px;margin:0 auto;}
	.loginContent{margin-right:24px;width:300px;height:200px;float:right;margin-top:15px;}
	.loginTitle{margin-top:20px;height:17px;float:left;margin-left:15px;font-size:14px; font-weight:bolder; color:#fff; width:200px; padding-bottom:5px;border-bottom:#FFF solid 1px; letter-spacing:1px; background:url(${pageContext.request.contextPath}/crm/coreModule/web/images/05.png) no-repeat top left; padding-left:30px;}
	.loginDiv{float:right; margin:20px 30px;}
	.colname{color:#fff; font-size:12px; width:50px; text-align:left; float:left; letter-spacing:1px; line-height:20px;}
	.submitArea{height:30px;text-align:center;width:100%;}
	.bSub{background:url(${pageContext.request.contextPath}/crm/coreModule/web/images/02.jpg);width:67px; height:23px; border:none;}
	input.error,select.error {border: 1px solid red;}
	label.error{font-size:12px;background:url(${pageContext.request.contextPath}/crm/coreModule/web/images/024.png) left no-repeat;color:red;font-weight:500;padding-left:15px;cursor: pointer;}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/validate/jquery.validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/validate/additional-methods.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/validate/messages_cn.js"></script>
<script type="text/javascript">
	$(function() { 
			//校验
			$('#loginForm').saturnValidate({
				rules:{
					username:{
						required: true
					},
					userpasswd:{
						required: true
					}
				},
				messages:{
					username:{
						required: "用户名未填写"
					},
					userpasswd:{
						required: "密码未填写"
					}
				}
			})
		});
</script>
</head>
<body>
<div id="content">
<img src="${pageContext.request.contextPath}/crm/coreModule/web/images/01.jpg"/>
</div>
<div id="login">
    <div class="loginContent">
       <div class="loginTitle">用户登陆</div>
       <form id="loginForm" method="post" action="${pageContext.request.contextPath}/crm::/loginModule/action/Login.action">
       		<div style="float:right;margin-top:20px;width:300px;height:80px;margin-right:-25px;">
       		<table cellspacing="8" cellpadding="0">
       			<tr>
       				<td class="colname">用户名:</td>
       				<td><input type="text" id="username" name="username" style="width:120px;"/></td>
       			</tr>
       			<tr>
       				<td class="colname">密&nbsp;码:</td>
       				<td><input type="password" id="userpasswd" name="userpasswd" style="width:120px;"/></td>
       			</tr>
       		</table>
       		</div>
       		<div class="submitArea">
            	<input type="button" class="bSub" onclick="$('#loginForm').submit();"/>
            </div>
       </form>
    </div>
</div>
</body>
</html>
