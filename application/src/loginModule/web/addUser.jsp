<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增用户</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			//校验
			$('#crmform').saturnValidate({
				rules:{
					user_username:{
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
						    type:'post',
						    data: {
						    	fullkey:'http://crm/coreModule/data::crm_user',
						        username: function () {
						            return $('#user_username').val();
						        }
						    }
							
						},
						required: true
					},
					user_userrealname:{
						required: true,
						maxlength: 20
					},
					user_password:{
						required: true,
						maxlength: 20
					}
				},
				messages:{
					user_username:{
						remote:"VIN已经存在"
					}
				}
			})
		});
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/loginModule/action/AddUser.action?startIndex=0&endIndex=9">
<fieldset>
<legend>新增用户</legend>
<table cellspacing="10" cellpadding="0">
   <tr>
      <td class="colName">用户名:</td>
      <td class="detailColVal">
          <input type="text" name="user_username" id="user_username"/>
	  </td>
  </tr>
  <tr>	  
      <td class="colName">密码:</td>
      <td class="detailColVal">
         <input type="text" name="user_userrealname" id="user_userrealname"/>
	  </td>
   <tr>	  
	  <td class="colName">真实姓名:</td>
      <td class="detailColVal">
         <input type="text" name="user_password" id="user_password"/>
	  </td>
    </tr>  
  </table>
  <div style="text-align:center;margin-top:20px;">
       <input type="submit" value="确定"/>
       <input type="reset" value="重置"/>
       <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/loginModule/action/QueryUserList.action?startIndex=0&endIndex=9'" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
