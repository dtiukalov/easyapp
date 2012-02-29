<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改代金</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			//校验
			$('#crmform').saturnValidate({
				rules:{
					tikt_carvin:{
						required: true,
						maxlength: 17
					},
					tikt_tiktstate:{
						required: true
					},
					tikt_tiktamount:{
						required: true
					},
					tikt_tiktnumber:{
						maxlength: 12
					}
				}
			})
		});
		
		function goBack(){
		 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketDetailList.action';
		    document.getElementById('hiddenForm').submit();
		}
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/ticketModule/action/UpdateTicket.action">
  <fieldset>
    <legend>修改代金</legend>
    <table cellspacing="15" cellpadding="0">
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
			<input type="text" name="tikt_carvin" id="tikt_carvin" value="${saturnData.carvin}"/>
			<input type="hidden" name="tikt_ticketid" id="tikt_ticketid" value="${saturnData.ticketid}"/>
	  </td>

      <td class="colName"">代金编号:</td>
      <td class="detailColVal">
      	 <input type="text" name="tikt_tiktnumber" id="tikt_tiktnumber" value="${saturnData.tiktnumber}"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">代金金额:</td>
      <td class="detailColVal">
          <input type="text" name="tikt_tiktamount" id="tikt_tiktamount" value="${saturnData.tiktamount}" class="auto"/>
	  </td>

      <td class="colName">发放时间:</td>
      <td class="detailColVal">
          <input type="text" name="tikt_tiktgranttime" id="tikt_tiktgranttime" value="${saturnData.tiktgranttime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">代金状态:</td>
      <td class="detailColVal">
        <select name="tikt_tiktstate" id="tikt_tiktstate"">
			<option value=""></option>
            <c:forEach items="${dict.crm_ticketState}" var="var">				
            	<c:if test="${var.key==saturnData.tiktstate}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.tiktstate}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>	
           	</c:forEach>
         </select>
	  </td>
	  <td class="colName">使用时间:</td>
      <td class="detailColVal">
            <input type="text" name="tikt_tiktusetime" id="tikt_tiktusetime" value="${saturnData.tiktusetime}" onfocus="dayCalender(this)" class="Wdate"/>
          	<input type="hidden" name="carcardid" value="${carcardid}">
			<input type="hidden" name="carvin" value="${carvin}">
			<input type="hidden" name="carlicenceno" value="${carlicenceno}">
			<input type="hidden" name="servorderid" value="${servorderid}">
			<input type="hidden" name="min_tiktgranttime" value="${min_tiktgranttime}">
			<input type="hidden" name="max_tiktgranttime" value="${max_tiktgranttime}">
			<input type="hidden" name="min_tiktusetime" value="${min_tiktusetime}">
			<input type="hidden" name="max_tiktusetime" value='${max_tiktusetime}'>
			<input type="hidden" name="tiktstate" value='${tiktstate}'>
			<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
			<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
			<input type="hidden" name="pageValue" value='${pageValue}'>
	  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:15px;">
       <input type="submit" value="确定"/>
       <input type="reset" value="重置"/>
       <input type="button" onclick="javascript:goBack();" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
  <div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="min_tiktusetime" value="${min_tiktusetime}">
		<input type="hidden" name="max_tiktusetime" value="${max_tiktusetime}">
		<input type="hidden" name="cararea" value="${cararea}">
		<input type="hidden" name="tiktstate" value="${tiktstate}">
		<input type="hidden" name="min_tiktgranttime" value="${min_tiktgranttime}">
		<input type="hidden" name="max_tiktgranttime" value="${max_tiktgranttime}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
