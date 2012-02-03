<%@page import="com.saturn.website.Message"%>
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
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidatorRegex.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/formValidator/validator.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/testCode.js"></script>
<title>客户留言</title>
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
		$('#lyform').css("display","none");
	});
	
	function showLyForm(){
		if("block"==$('#lyform').css("display")){
			$('#lyform').css("display","none");
		}else{
			$('#lyform').css("display","block");
		}
	}
	
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
					$('#lyform').css("display","none");
					alert('保存成功!');
					window.location.reload();
				}
			} 
		});
	}
</script>
<body>
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">  
	<%@ include file="include/navigate.jsp" %>
    <div class="right">
    	<div class="nr">
        <div class="ybt">
        <div class="biaoti"><%=__aname %></div>
        <div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;客户留言</div>
        <div class="clear"></div>
        </div>
        <div class="ynr">
		<div id="lyform" class="neirong">
        	<form id="addForm"
				action="<%=request.getContextPath()%>/app/website/message/addByClient.do?to=<%=WebUtils.getRootCid(request)%>"
				method="post">
        	<table border="0" cellpadding="0" cellspacing="0" style="width:90%; margin-left: 30px;">
            <tr>
              <td height="25px">您好，欢迎您对我们的服务提出意见和建议。</td>
            </tr>
            <tr>
              <td height="25px">留言信息：</td>
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
                  <td><input type="text" name="sendPhone" id="sendPhone" maxlength="30"/></td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right">电子邮箱：</td>
                  <td><input type="text" name="sendEmail" id="sendEmail" maxlength="30"/></td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right">验证码：</td>
                  <td colspan="2"><table cellpadding="0" cellspacing="0">
                    <tr>
                      <td><input type="text" name="testCode" id="testCode"  maxlength="4" size="4" />
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
        </form>
        </div>
       			              
        <%
        List all = Message.getByCid(WebUtils.getRootCid(request),"留言");
        		String indexStr = request.getParameter("index");
        		List messages = PaginationUtils.getPaginationList(all, indexStr);
        		%>
        		 <div class="xwlb">
					   	    <div class="khly">
					            <h1>&nbsp;留言<span style="color:#F00;">共<%=all.size() %>条留言</span><span><a href="javascript:void(0);" onclick="return showLyForm();">我要留言</a></span></h1>
					  
        		<%
				if (messages != null && !messages.isEmpty()) {
					
					for (int i = 0; i < messages.size(); ++i) {
						Message mess = (Message)messages.get(i);
						%>
						<div class="xxhf">
					                <div class="xx">
					                <p>来自客户<%=mess.getSendName() %>的提问（<%=mess.getSendTime() %>）</p>
					                <p><%=mess.getSendText() %></p>
					                <div class="huifu" style="display:<%="message.state.true".equals(mess.getState())?"block":"none" %>"><table width="551" border="0" cellspacing="0" cellpadding="0" align="center">
					  <tr>
					    <td><img src="image/hf_s.gif" width="551" height="25" /></td>
					  </tr>
					  <tr>
					    <td style="background:url(image/hf_z.gif) repeat-y 0 0; text-indent:2em;"><%=mess.getReceiveOperaterName() %>回复：（<%=mess.getReceiveTime() %>）<%=mess.getReceiveText() %></td>
					  </tr>
					  <tr>
					    <td><img src="image/hf_x.gif" width="551" height="12" /></td>
					  </tr>
					</table>
					</div>
									</div>
					                </div><!--end_信息加回复-->
						<%
					}
				}
						%>
						
					
				                <table width="715" border="0" cellspacing="0" cellpadding="0">
				  <tr>
				    <td align="center"><%=PaginationUtils.getPagination("cus_message.jsp?cid=" + __cid, indexStr, all) %></td>
				  </tr>
				</table>
		          </div><!--end_客户留言-->
		         </div><!--end_新闻列表-->
        </div>
        <div class="ydi"><img src="images/nr_xia.gif" /></div>
        </div>
    </div><!--右侧-->
    <div class="clear"></div>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</div>
</body>
</html>