<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>废弃进厂车辆</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<jsp:useBean id="now" class="java.util.Date" />    
  
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" var="nowz"/> 
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
		$(function() { 
			$('#crmform').saturnValidate({
				rules:{
					duty_delcontent:{
						required: true
					}
				}
			})
		});
		
function doSubmit(){
	$('#crmform').submit();
	if(opener){ 
		opener.location.reload();
		window.close();
	}
}
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/dutyModule/action/UpdateDuty.action">
<input type="hidden" name="duty_dutyid" id="duty_dutyid" value="${saturnData.dutyid}"/>
<input type="hidden" name="duty_delpersion" id="duty_delpersion" value="${CRM_USER.username}"/>
<input type="hidden" name="duty_deltime" id="duty_deltime" value="${nowz}"/>

<input type="hidden" name="startIndex" id="startIndex" value="${startIndex}"/>
<input type="hidden" name="endIndex" id="endIndex" value="${endIndex}"/>
<input type="hidden" name="carlicenseno" id="carlicenseno" value="${carlicenseno}"/>
<input type="hidden" name="carvin" id="carvin" value="${carvin}"/>
<input type="hidden" name="carcardid" id="carcardid" value="${carcardid}"/>
<input type="hidden" name="dutytype" id="dutytype" value="${dutytype}"/>
<input type="hidden" name="dutystaff" id="dutystaff" value="${dutystaff}"/>
<input type="hidden" name="dutydelivtime" id="dutydelivtime" value="${dutydelivtime}"/>
<input type="hidden" name="carbrand" id="carbrand" value="${carbrand}"/>
<input type="hidden" name="dutycarmodel" id="dutycarmodel" value="${dutycarmodel}"/>
<input type="hidden" name="min_dutyintime" id="min_dutyintime" value="${min_dutyintime}"/>
<input type="hidden" name="max_dutyintime" id="max_dutyintime" value="${max_dutyintime}"/>
<input type="hidden" name="dutycommu" id="dutycommu" value="${dutycommu}"/>

<fieldset>
<legend>废弃进厂车辆</legend>
<table cellspacing="10" cellpadding="0">
    <tr>
		  <td class="colName">废弃原因:</td>
		  <td class="detailColVal" style="width:70%;">
	           <textarea name="duty_delcontent" id="duty_delcontent" style="height:80px;width:90%;">${saturnData.delcontent}</textarea>
		  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="button" onclick="javascript:doSubmit();" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="javascript:history.back();" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
