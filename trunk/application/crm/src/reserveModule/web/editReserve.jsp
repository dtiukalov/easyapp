<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改预约</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
		$(function() { 
			$('#resv_remindname').selectDict({type:'crm_waiter',id:'resv_remindname',value:'${saturnData.remindname}'});
			$('#resv_resvworker').selectDict({type:'crm_worker',id:'resv_resvworker',value:'${saturnData.resvworker}'});
			$('#resv_servstaff').selectDict({type:'crm_waiter',id:'resv_servstaff',value:'${saturnData.servstaff}'});
			//校验
			$('#crmform').saturnValidate({
				rules:{
					resv_resvorderid:{
						required: true,
						maxlength: 12
					},
					resv_resvaccessdate:{
						required: true
					},
					resv_resvintime:{
						required: true
					},
					resv_carlicenseno:{
						required: true,
						maxlength: 20
					},
					resv_carownername:{
						required: true,
						maxlength: 12
					},
					resv_contacttel:{
						required: true,
						isPhone:true
					},
					resv_resvcancelreason:{
						maxlength: 200
					},
					resv_servorderid:{
						maxlength: 12
					},
					resv_contactmobile:{
						isMobile:true
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
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/reserveModule/action/UpdateReserve.action">
<fieldset>
<legend>修改预约</legend>
<table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">预约单号:</td>
      <td class="detailColVal">
          <input type="text" name="resv_resvorderid" id="resv_resvorderid" value="${saturnData.resvorderid}"/>
          <input type="hidden" name="resv_reserveid" id="resv_reserveid" value="${saturnData.reserveid}"/>
	  </td>
      <td class="colName">预约类别:</td>
      <td class="detailColVal">
         <select id="resv_resvtype" name="resv_resvtype">
            <option value=""></option>
           	<c:forEach items="${dict.crm_resvType}" var="var">				
           		<c:if test="${var.key==saturnData.resvtype}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.resvtype}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>					
           	</c:forEach>
         </select>
	  </td>
      <td class="colName">接受预约日:</td>
      <td class="detailColVal">
      	  <input type="text" name="resv_resvaccessdate" id="resv_resvaccessdate" value="${saturnData.resvaccessdate}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">预约进厂时间:</td>
      <td class="detailColVal">
      	 <input type="text" name="resv_resvintime" id="resv_resvintime" value="${saturnData.resvintime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
      <td class="colName">车牌号:</td>
      <td class="detailColVal">
          <input type="text" name="resv_carlicenseno" id="resv_carlicenseno" value="${saturnData.carlicenseno}"/>
	  </td>
      <td class="colName">车主:</td>
      <td class="detailColVal">
          <input type="text" name="resv_carownername" id="resv_carownername" value="${saturnData.carownername}"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">联系人:</td>
      <td class="detailColVal">
          <input type="text" name="resv_contactname" id="resv_contactname" value="${saturnData.contactname}"/>
	  </td>
	  <td class="colName">联系人电话:</td>
      <td class="detailColVal">
          <input type="text" name="resv_contacttel" id="resv_contacttel" value="${saturnData.contacttel}"/>
	  </td>
      <td class="colName">联系人手机:</td>
      <td class="detailColVal">
          <input type="text" name="resv_contactmobile" id="resv_contactmobile" value="${saturnData.contactmobile}"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">预约单状态:</td>
      <td class="detailColVal">
      	<select id="resv_resvstate" name="resv_resvstate">
            <option value=""></option>
           	<c:forEach items="${dict.crm_resvState}" var="var">				
           		<c:if test="${var.key==saturnData.resvstate}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.resvstate}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>				
           	</c:forEach>
         </select>
	  </td>
	   <td class="colName">提醒人:</td>
      <td class="detailColVal">
      	<select id="resv_remindname" name="resv_remindname"></select>
	  </td>
      <td class="colName">提醒时间:</td>
      <td class="detailColVal">
      	<input type="text" name="resv_remindtime" id="resv_remindtime" value="${saturnData.remindtime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
     <tr>
      <td class="colName">指定技师:</td>
      <td class="detailColVal">
         <select id="resv_resvworker" name="resv_resvworker"></select>
      </td>
      <td class="colName">工单号:</td>
      <td class="detailColVal">
    	  <input type="text" name="resv_servorderid" id="resv_servorderid" value="${saturnData.servorderid}"/>
      </td>
      <td class="colName">开单日期:</td>
      <td class="detailColVal">
      	  <input type="text" name="resv_servorderdate" id="resv_servorderdate" value="${saturnData.servorderdate}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">资料来源:</td>
      <td class="detailColVal">
      	 <select id="resv_resvsource" name="resv_resvsource">
            <option value=""></option>
           	<c:forEach items="${dict.crm_resvSource}" var="var">				
           		<c:if test="${var.key==saturnData.resvsource}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.resvsource}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>			
           	</c:forEach>
         </select>
	  </td>
      <td class="colName">服务专员:</td>
      <td class="detailColVal">
         <select id="resv_servstaff" name="resv_servstaff"></select>
	  </td>
    </tr>
    <tr>
	      <td class="colName">取消进厂原因:</td>
	      <td class="detailColVal" colspan="3">
	      	  <textarea name="resv_resvcancelreason" id="resv_resvcancelreason" style="height:50px;width:100%;">${saturnData.resvcancelreason}</textarea>
	      </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="window.location.href='${pageContext.request.contextPath}/crm::/reserveModule/action/QueryReserveList.action?startIndex=0&endIndex=9'"value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
