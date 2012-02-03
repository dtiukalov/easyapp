<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
<link href="css/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidatorRegex.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/formValidator/validator.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/testCode.js"></script>
<title>投诉意见</title>
</head>
<script type="text/javascript">
	var code = '';

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
	
	function submitForm(form) {
		var testCode = $('#testCode').val();
		if (testCode.toLowerCase() != code.toLowerCase()) {
			alert('验证码不正确');
			
			$('#testCode').focus();
			return;
		}
		
		if ($('#sendText').val() == '') {
			alert('请填写留言信息');
			$('#sendText').focus();
			return;
		}
		
		$.ajax({
			url : '<%=request.getContextPath()%>/app/website/message/addByClient.do', 
			type : 'post',         
			dataType : 'json',     
			data : {
				sendText : $("#sendText").val(),         
				sendName : $("#sendName").val(),         
				sendEmail : $("#sendEmail").val(),     
				sendPhone : $("#sendPhone").val(),     
				cid : '<%=WebUtils.getRootCid(request)%>',     
				type : '投诉',     
				receiveText : '',     
				stateName : '未回复',     
				state : 'message.state.false',     
				hasShow : 'visible.true',     
				hasShowName : '显示',     
				sendTime : '<%=DateUtils.getSystemTime()%>',     
				receiveTime : '',     
				receiveOperater : '',     
				receiveOperaterName : ''
			},
			success : function(data) {
				if (data) {
					$("#sendText").val('');       
					$("#sendName").val('');
					$("#sendEmail").val('');
					$("#sendPhone").val('');
					$('#testCode').val('');
					reload();
					alert('保存成功!');
				}
			} 
		});
	}
</script>
<body style="margin:0px; padding:0px;">
	<%@ include file="include/top.jsp" %>
 <div id="content">
    <%@ include file="include/navigate.jsp" %>
      <div class="right">
      	<div class="nrbt">
        	<div class="biaoti"><%=__aname %></div>
        	<div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;投诉建议</div>
        	<div class="clear"></div>
        </div>
        <div class="nrzj">
        	<div class="neirong">
        	<table border="0" cellpadding="0" cellspacing="0" style="width:90%; margin-left: 30px;">
            <tr>
              <td height="25px">您好，欢迎您对我们的服务提出意见和建议。</td>
            </tr>
            <tr>
              <td height="25px">投诉建议信息：</td>
            </tr>
            <tr>
              <td height="100px"><textarea name="sendText" id="sendText" style="width: 100%;height: 100px;"></textarea></td>
            </tr>
            <tr>
            	<td><div id="sendTextTip"></div></td>
            </tr>
            <tr>
              <td height="25px"><br/>
                <span style="color:#1377c5;">联系方式：</span></td>
            </tr>
            <tr>
              <td height="25px">为了能够及时解决您的疑问或问题，请留下您准确的联系方式，以便我们的客服人员能够快捷、准确的联系到您。</td>
            </tr>
            <tr>
              <td><table cellpadding="0" cellspacing="0">
                <tr align="left">
                  <td height="25px" width="80px" align="right">姓名：</td>
                  <td width="180px"><input type="text" name="sendName" id="sendName" maxlength="20"/></td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right">联系电话：</td>
                  <td><input type="text" name="sendPhone" id="sendPhone" maxlength="30" /></td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right">电子邮箱：</td>
                  <td><input type="text" name="sendEmail" id="sendEmail" maxlength="30" /></td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right">验证码：</td>
                  <td colspan="2"><table cellpadding="0" cellspacing="0">
                    <tr>
                      <td><input type="text" name="testCode" id="testCode" maxlength="4" size="4"/>
                        &nbsp; </td>
                      <td><img id="testCodeImage" alt="点击更换图片" onclick="reload()" style="cursor:pointer;"/></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><input type="button" value="提 交" name="submit" onclick="javascript:return submitForm(this.form);"/></td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          </table>
        </div>
        </div>
        <div class="nrdi"><img src="image/nr_xia.gif" /></div>
      </div><!--右铡-->
      <div class="clear"></div>
</div>
<%@ include file="include/foot.jsp" %>
</body>
<script type="text/javascript">
	/*$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		
		$("#sendText").formValidator({
			empty : true,
			onfocus : "留言内容不超过500字符"
		}).inputValidator({
			min : 1,
			max : 500
		});
		
		$("#sendName").formValidator({
			empty : true,
			onfocus : "用户姓名不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50
		});
		
		$("#sendEmail").formValidator({
			empty : true,
			onfocus : "请正确填写邮箱，例如：some@163.com"
		}).regexValidator({
			regexp : "email"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});

		$("#sendPhone").formValidator({
			empty : true,
			onfocus : "请正确填写电话(11位)，例如：13566969636"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});
	});*/
</script>
</html>