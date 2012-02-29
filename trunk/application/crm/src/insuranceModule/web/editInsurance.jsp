<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改保险</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#insur_insustaff').selectDict({type:'crm_waiter',id:'insur_insustaff',value:'${saturnData.insustaff}'});
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
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/insuranceModule/action/UpdateInsurance.action">
  <fieldset>
    <legend>新增保险</legend>
    <table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
    	  <input type="text" name="insur_carvin" id="insur_carvin" value="${saturnData.carvin}"/>
    	  <input type="hidden" name="insur_insuranceid" id="insur_insuranceid" value="${saturnData.insuranceid}"/>
      </td>

      <td class="colName">保险金额:</td>
      <td class="detailColVal">
          <input type="text" name="insur_insuamount" id="insur_insuamount" value="${saturnData.insuamount}" class="auto"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">保险日期:</td>
      <td class="detailColVal">
          <input type="text" name="insur_insudate" id="insur_insudate" onfocus="dayCalender(this)" value="${saturnData.insudate}" class="Wdate"/>
	  </td>
 
      <td class="colName">保险中止日期:</td>
      <td class="detailColVal">
          <input type="text" name="insur_insuendtime" id="insur_insuendtime" onfocus="dayCalender(this)" value="${saturnData.insuendtime}" class="Wdate"/>
	  </td>
    </tr>
	<tr>
      <td class="colName">保险公司:</td>
      <td class="detailColVal">
         <select name="insur_insucompany" id="insur_insucompany">
		   <option value=""></option>
           <c:forEach items="${dict.crm_insuCompany}" var="var">				
           		<c:if test="${var.key==saturnData.insucompany}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.insucompany}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>			
           	</c:forEach>
         </select>
	  </td>
	  <td class="colName">服务顾问:</td>
      <td class="detailColVal">
         <select name="insur_insustaff" id="insur_insustaff"></select>
	  </td>
    </tr>
    <tr>
      <td class="colName">保险业务:</td>
      <td class="detailColVal" colspan="3">
        <textarea name="insur_insuitems" id="insur_insuitems" style="width:100%;height:80px;">${saturnData.insuitems}</textarea>
        <input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="min_insuendtime" value="${min_insuendtime}">
		<input type="hidden" name="max_insuendtime" value="${max_insuendtime}">
		<input type="hidden" name="insucompany" value="${insucompany}">
		<input type="hidden" name="cararea" value="${cararea}">
		<input type="hidden" name="carmodel" value="${carmodel}">
		<input type="hidden" name="carseries" value="${carseries}">
		<input type="hidden" name="carbrand" value="${carbrand}">
		<input type="hidden" name="cstmname" value="${cstmname}">
		<input type="hidden" name="min_insudate" value="${min_insudate}">
		<input type="hidden" name="max_insudate" value="${max_insudate}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
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
  <div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="min_insuendtime" value="${min_insuendtime}">
		<input type="hidden" name="max_insuendtime" value="${max_insuendtime}">
		<input type="hidden" name="insucompany" value="${insucompany}">
		<input type="hidden" name="cararea" value="${cararea}">
		<input type="hidden" name="carmodel" value="${carmodel}">
		<input type="hidden" name="carseries" value="${carseries}">
		<input type="hidden" name="carbrand" value="${carbrand}">
		<input type="hidden" name="cstmname" value="${cstmname}">
		<input type="hidden" name="min_insudate" value="${min_insudate}">
		<input type="hidden" name="max_insudate" value="${max_insudate}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
