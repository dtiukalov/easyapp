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

<script type="text/javascript">
var saturnServerPath = '<%=request.getContextPath()%>';
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/selectDict.js"></script>
<title><%=WebUtils.getTitle(request) %></title>
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
		$('#model').selectDict({type:'car.buick',id:'model'});
	});
	
	function seriesDict(){
		var type = $('#model option:selected').val();
		if(''==type){
			type = 'nullz';
		}
		$('#series').selectDict({type:type,id:'series'});
	}
	
	function submitForm(form) {
		var testCode = $('#testCode').val();
		if (testCode.toLowerCase() != code.toLowerCase()) {
			alert('验证码不正确');
			
			$('#testCode').focus();
			return;
		}
		if ($('#userName').val() == '') {
			alert('请填写预约人姓名');
			$('#userName').focus();
			return;
		}
		if ($('#phone').val() == '') {
			alert('请填写电话');
			$('#phone').focus();
			return;
		}
		 var aid = '<%=request.getParameter("aid")%>';
		 var _type = '';
		 var _typeName = '';
		if('<%=WebUtils.getRootCid(request)%>.book.buy'==aid){
			//订车
			_type = 'bookcar.type.bookcar';
		 	_typeName = '订车';
		}else if('<%=WebUtils.getRootCid(request)%>.book.repair'==aid){
			//维修
			_type = 'bookcar.type.repair';
		 	_typeName = '维修';
		}else if('<%=WebUtils.getRootCid(request)%>.book.maintain'==aid){
			//保养
			_type = 'bookcar.type.maintain';
		 	_typeName = '保养';
		}else{
			//试驾
			_type = 'bookcar.type.drive';
		 	_typeName = '试驾';
		}
		
		$.ajax({
			url : '<%=request.getContextPath()%>/app/car/bookcar/addByClient.do', 
			type : 'post',         
			dataType : 'json',     
			data : {
				userName : $("#userName").val(),
				phone : $("#phone").val(),         
				text : $("#text").val(),         
				type : _type,  
				typeName : _typeName,     
				cid : '<%=WebUtils.getRootCid(request)%>',     
				brand : 'car.buick',  
				model : $('#model option:selected').val(),  
				series : $('#series option:selected').val(), 
				brandName : '通用别克',  
				modelName : $('#model option:selected').text(),  
				seriesName : $('#series option:selected').text(),
				state : 'bookcar.state.false',
				stateName : '未确认',
				createTime : '<%=DateUtils.getSystemTime()%>',
				license : '',
				bookTime : ''
			},
			success : function(data) {
				if (data) {
					$("#createTime").val('');
					$("#text").val('');
					$('#userName').val('');
					$('#phone').val('');
					
					$('#cid').val('');
					$('#type').val('');
					$('#typeName').val('');
					$('#brand').val('');
					$('#model').val('');
					$('#series').val('');
					$('#brandName').val('');
					$('#modelName').val('');
					$('#seriesName').val('');
					$('#testCode').val('');
					reload();
					alert('保存成功!');
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
        <div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;<%=__aname %></div>
        <div class="clear"></div>
        </div>
        <div class="ynr">
        	<div class="neirong">
        	<form id="addForm"
			action="<%=request.getContextPath()%>/app/car/bookcar/addByClient.do"
			method="post">
        	
        	<table border="0" cellpadding="0" cellspacing="0" style="width:90%; margin-left: 30px;">
            <tr>
              <td height="25px">您好，欢迎您使用预约服务。</td>
            </tr>
            <tr>
              <td height="25px">预约信息：</td>
            </tr>
            <tr>
              <td height="100px"><textarea name="text" id="text" style="width: 100%;height: 100px;"></textarea></td>
            </tr>
            <tr>
            	<td><div id="sendTextTip"></div></td>
            </tr>
            <tr>
              <td height="25px"><br/>
                <span style="color:#1377c5;">联系方式：</span></td>
            </tr>
            <tr>
              <td height="25px">为了能够及时为您服务，请留下您准确的联系方式，以便我们的客服人员能够快捷、准确的联系到您。</td>
            </tr>
            <tr>
              <td><table cellpadding="0" cellspacing="0">
              <tr align="left">
                  <td height="25px" align="right"><span style="color: red">*</span>预约人姓名：</td>
                  <td><input type="text" name="userName" id="userName" maxlength="30" />&nbsp;&nbsp;(先生/女士)</td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right"><span style="color: red">*</span>联系电话：</td>
                  <td><input type="text" name="phone" id="phone" maxlength="30" style="width:232px;" /></td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right">预约型号：</td>
                  <td>
                  <select id="model" name="model" onchange="seriesDict();" style="width:232px;">
                  <option value=""></option>
                  </select>
                  </td>
                </tr>
                <tr align="left">
                  <td height="25px" align="right">预约系列：</td>
                  <td>
                  <select id="series" name="series" style="width:232px;">
                  <option value=""></option>
                  </select>
                  </td>
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
                  <td><input type="button" value="提 交" name="button" onclick="javascript:return submitForm(this.form);"/></td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          </table>
          <input id="cid" type="hidden" name="cid" type="text" value=""></input>
			<input id="brand" type="hidden" name="brand" type="text" value=""></input>
			<input id="model" type="hidden" name="model" type="text" value=""></input>
			<input id="series" type="hidden" name="series" type="text" value=""></input>

			<input id="brandName" type="hidden" name="brandName" type="text" value=""></input>
			<input id="modelName" type="hidden" name="modelName" type="text" value=""></input>
			<input id="seriesName" type="hidden" name="seriesName" type="text" value=""></input>

			<input id="state" type="hidden" name="state" type="text" value="bookcar.state.false"></input>
			<input id="stateName" type="hidden" name="stateName" type="text" value="未确认"></input>
			<input id="type" type="hidden" name="type" type="text" value=""></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value=""></input>
			
			<input id="createTime" type="hidden" name="createTime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
        	</form>
        </div>
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