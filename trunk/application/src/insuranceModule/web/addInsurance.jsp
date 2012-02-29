<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增保险</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#insur_insustaff').selectDict({type:'crm_waiter',id:'insur_insustaff'});
			$('#contentTb').quickKey();
			//校验
			$('#crmform').saturnValidate({
				rules:{
					insur_carvin:{
						required: true,
						maxlength: 17
					},
					insur_insuitems:{
						maxlength: 100
					},
					insur_insucompany:{
						required: true
					},
					insur_insuamount:{
						required: true
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
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/insuranceModule/action/AddInsurance.action">
  <fieldset>
    <legend>新增保险</legend>
    <table id="contentTb" cellspacing="10" cellpadding="0">
    <tr class="rowClass">
      <td class="colName">车架号:</td>
      <td class="detailColVal">
    	  <input type="text" name="insur_carvin" id="insur_carvin"/>
      </td>

      <td class="colName">保险金额:</td>
      <td class="detailColVal">
          <input type="text" name="insur_insuamount" id="insur_insuamount" class="auto"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">保险日期:</td>
      <td class="detailColVal">
          <input type="text" name="insur_insudate" id="insur_insudate" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
 
      <td class="colName">保险中止日期:</td>
      <td class="detailColVal">
          <input type="text" name="insur_insuendtime" id="insur_insuendtime" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
	<tr class="rowClass">
      <td class="colName">保险公司:</td>
      <td class="detailColVal">
         <select name="insur_insucompany" id="insur_insucompany">
		   <option value=""></option>
           <c:forEach items="${dict.crm_insuCompany}" var="var">				
           		<option value="${var.key}">${var.value}</option>		
           	</c:forEach>
         </select>
	  </td>
	  <td class="colName">服务顾问:</td>
      <td class="detailColVal">
         <select name="insur_insustaff" id="insur_insustaff"></select>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">保险业务:</td>
      <td class="detailColVal" colspan="3">
        <textarea name="insur_insuitems" id="insur_insuitems" style="width:100%;height:80px;"></textarea>
	  </td>
	</tr>
  </table>
   <div style="text-align:center;margin-top:15px;">
       <input type="submit" value="确定"/>
       <input type="reset" value="重置"/>
       <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/insuranceModule/action/QueryInsuranceList.action?startIndex=0&endIndex=9'" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
