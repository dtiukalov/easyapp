<%@page import="com.saturn.auth.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采集用户指纹</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String id = request.getParameter("id");
	User user = User.get(id);
	
	pageContext.setAttribute("user", user);
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
	<script for=zkonline event="OnFeatureInfo(quality)"> 
		
		if (zkonline.IsRegister) {
			var index = 4 - zkonline.EnrollIndex;
			if (quality != 0) {
				alert("指纹识别失败!" + "指纹质量：" + zkonline.LastQuality + ", 请继续输入（第" + index + "次，共3次)");
			} else {
				alert("指纹识别成功!" + "指纹质量：" + zkonline.LastQuality + ", 请继续输入（第" + index + "次，共3次)");
				if (zkonline.LastQuality > goodQuality) {
					goodQuality = zkonline.LastQuality;
				}
			}
		}
	 </script> 
	<script for=zkonline event="onEnroll(result, template)"> 
		var zw = zkonline.GetTemplateAsString();//采集指纹
		if(zw != ""){
			zkonline.CancelEnroll();
			
			document.editForm.template.value = zw;
			alert("指纹识别成功!" + "指纹质量：" + goodQuality);
			
			zkonline.EndEngine();
		} else {
			alert("指纹识别失败!" + "指纹质量：" + goodQuality);
		}
	 </script> 
	 <script type="text/javascript">
	 	var goodQuality = 1;
	 	
		function edit() {
			$('#editForm').submit();
		}
		
		$(function() {
			$('#name').focus();
		});
		
		function submitRegister() {
			if (navigator.appName == "Microsoft Internet Explorer" ||  window["zkonline"]) {
				if (zkonline.InitEngine() == 0) {//初始化指纹识别系统
					if(zkonline.IsRegister) {//是否正登记指纹
						zkonline.CancelEnroll();//取消当前的指纹登记状态
					}
					zkonline.EnrollCount=3;//登记指纹时取样的次数
					zkonline.LowestQuality=75;
					zkonline.BeginEnroll();//开始登记指纹
					
					alert("请输入指纹!");
				} else {
		    		alert("请检查确认已安装指纹驱动程序并指纹设备已连接.");
				}
			} 
		}
	</script>
	 
	<div id="panel" class="easyui-panel" title="采集用户指纹"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm" name="editForm"
			action="<%=request.getContextPath()%>/app/auth/user/updateUser.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right">登录ID:</td>
					<td><input id="id" name="id" type="text" value="${user.id}"
						readonly="readonly" ></input>
					</td>
					<td></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>姓名:</td>
					<td><input id="name" name="name" type="text"
						value="${user.name}" readonly="readonly" ></input>
					</td>
					<td>
						<div id="nameTip"></div>
					</td>
				</tr>
				<tr>
					<td style="text-align:right">邮箱:</td>
					<td><input id="email" name="email" type="text"
						value="${user.email}" readonly="readonly" ></input>
					</td>
					<td>
						<div id="emailTip"></div>
					</td>
				</tr>
				<tr>
					<td style="text-align:right">电话:</td>
					<td><input id="phone" name="phone" type="text"
						value="${user.phone}" readonly="readonly" ></input>
					</td>
					<td>
						<div id="phoneTip"></div>
					</td>
				</tr>
				<tr> 
                     <td style="text-align:right">采集指纹:</td>
                     <td>
                     	<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="submitRegister()">采集指纹</a>
					 </td>
                     <td> 
                     </td>
                   </tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
								onclick="edit()">确定</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div>
					</td>
				</tr>
			</table>
			<input id="password" name="password" type="hidden" value="${user.password}"></input>
			<input id="template" name="template" type="hidden" value="${user.template}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		$("#id").formValidator({
			onfocus : "标识由数字、字母或者下划线组成，例如：admin"
		}).regexValidator({
			regexp : "loginId"
		});

		$("#name").formValidator({
			onfocus : "用户姓名不能为空,不超过10个字符！"
		}).inputValidator({
			min : 1,
			max : 10
		});

		$("#email").formValidator({
			empty : true,
			onfocus : "请正确填写邮箱，例如：some@163.com"
		}).regexValidator({
			regexp : "email"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});

		$("#phone").formValidator({
			empty : true,
			onfocus : "请正确填写电话(11位)，例如：13566969636"
		}).regexValidator({
			regexp : "phone"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});
	});
</script>
</html>