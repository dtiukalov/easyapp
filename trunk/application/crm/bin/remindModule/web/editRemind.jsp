<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改提醒</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
		$(function() { 
			$('#remd_remdname').selectDict({type:'crm_waiter',id:'remd_remdname',value:'${saturnData.remdname}'});
			$('#crmform').saturnValidate({
				rules:{
					remd_carvin:{
						required: true,
						maxlength: 17
					},
					remd_remdname:{
						required: true
					},
					remd_remdtime:{
						required: true
					},
					remd_remdstate:{
						required: true
					},
					remd_remdcontent:{
						required: true,
						maxlength: 100
					},
					remd_remdfeedback:{
						maxlength: 100
					},
					remd_remdfailreason:{
						maxlength: 50
					}
				},
				messages:{

				}
			})
		});
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/remindModule/action/UpdateRemind.action?startIndex=0&endIndex=9">
<fieldset>
<legend>修改提醒</legend>
<table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName" >车架号:</td>
      <td class="detailColVal">
          <input type="text" name="remd_carvin" id="remd_carvin"  value="${saturnData.carvin}"/>
          <input type="hidden" name="remd_remindid" id="remd_remindid"  value="${saturnData.remindid}"/>
	  </td>
      <td class="colName">提醒人:</td>
      <td class="detailColVal">
         <select id="remd_remdname" name="remd_remdname"></select>
	  </td>
      <td class="colName">提醒时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="remd_remdtime" id="remd_remdtime" value="${saturnData.remdtime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">提醒状态:</td>
      <td class="detailColVal">
      	 <select id="remd_remdstate" name="remd_remdstate">
            <option value=""></option>
           	<c:forEach items="${dict.crm_remdState}" var="var">				
           		<c:if test="${var.key==saturnData.remdstate}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.remdstate}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>				
           	</c:forEach>
         </select>
	  </td>
    </tr>
    <tr>
    	 <td class="colName">提醒内容:</td>
	      <td class="detailColVal" colspan="3">
	          <textarea name="remd_remdcontent" id="remd_remdcontent" style="height:50px;width:100%;">${saturnData.remdcontent}</textarea>
		  </td>
    </tr>
    <tr>
      <td class="colName">客户反馈:</td>
      <td class="detailColVal" colspan="3">
      	  <textarea name="remd_remdfeedback" id="remd_remdfeedback" style="height:50px;width:100%;">${saturnData.remdfeedback}</textarea>
      </td>
    </tr>
    <tr>
      <td class="colName">提醒失败原因:</td>
      <td class="detailColVal" colspan="3">
          <textarea name="remd_remdfailreason" id="remd_remdfailreason" style="height:50px;width:100%;">${saturnData.remdfailreason}</textarea>
	  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="window.location.href='${pageContext.request.contextPath}/crm::/remindModule/action/QueryRemindList.action?startIndex=0&endIndex=9'"value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
