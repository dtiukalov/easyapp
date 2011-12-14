<%@page import="com.saturn.car.NewCar"%>
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
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
<link href="css/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidatorRegex.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/formValidator/validator.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/testCode.js"></script>
<title>新车列表</title>
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
				type : '留言',     
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
        	<div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;新车列表</div>
        	<div class="clear"></div>
        </div>
        <div class="nrzj">
        	<div class="neirong">
        	<%
        		List cars = NewCar.getListByCid(WebUtils.getRootCid(request));
        	%>
        	<table>
        		<%
        			for (int i = 0; i < cars.size(); ++i) {
        				NewCar car = (NewCar) cars.get(i);
        		%>
        			<tr><td><%=car.getBrandName() %>||<%=car.getSeriesName() %>||<%=car.getModelName() %>||<%=car.getPrice() %></td></tr>
        		<%
        			}
        		%>
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