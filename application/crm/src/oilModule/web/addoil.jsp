<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增存油</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() {
			$('#oil_oilstaff').selectDict({type:'crm_waiter',id:'oil_oilstaff',value:'${param.oilstaff}'});
		 	$('#oil_carvin').focus();
		 	$('#man_zone').quickKey();
		 	$('#oil_oilouttime').bind('blur',function(){
		 		if($(this).val()!=''){
		 			$('#oil_oilnumber').val('');
		 		}
		 	});
			//校验
			$('#crmform').saturnValidate({
				rules:{
					oil_carvin:{
						required: true
					},
					oil_oilnumber:{
						maxlength: 12
					},
					oil_oilstoretime:{
						required: true
					},
					oil_oiltype:{
						required: true
					},
					oil_oilamount:{
						required: true
					},
					oil_servorderid:{
						required: true,
						maxlength: 20
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
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/oilModule/action/AddOil.action?startIndex=0&endIndex=9">
  <fieldset>
    <legend>新增存油</legend>
     <table cellspacing="10" cellpadding="0">  
    <tr class="rowClass">
      <td class="colName">车架号:</td>
      <td class="detailColVal">
		<input type="text" name="oil_carvin" id="oil_carvin" value="${param.carvin}"/>
	 </td>
      <td class="colName">存油编号:</td>
      <td class="detailColVal">
      	 <input type="text" name="oil_oilnumber" id="oil_oilnumber"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">工单号:</td>
      <td class="detailColVal">
		<input type="text" name="oil_servorderid" id="oil_servorderid" value="${param.servorderid}"/>
	 </td>
	  <td class="colName">存油时间:</td>
      <td class="detailColVal">
          <input type="text" name="oil_oilstoretime" id="oil_oilstoretime" onfocus="dayCalender(this)" class="Wdate" value="${param.oilstoretime}"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">存油种类:</td>
      <td class="detailColVal">
          <select name="oil_oiltype" id="oil_oiltype">
			<option value=""></option>
			<c:forEach items="${dict.crm_oilType$}" var="var">				
           		<option value="${var.key}">${var.value}</option>		
           	</c:forEach>        
         </select>
	  </td>
	  <td class="colName">存油量:</td>
      <td class="detailColVal">
        <input type="text" name="oil_oilamount" id="oil_oilamount" class="auto"/>
	  </td>
    </tr>
    <tr class="rowClass">
      
	  <td class="colName">存油接待:</td>
      <td class="detailColVal">
         <select name="oil_oilstaff" id="oil_oilstaff"></select>
	  </td>
	  <td class="colName">出油时间:</td>
      <td class="detailColVal">
         <input type="text" name="oil_oilouttime" id="oil_oilouttime" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
  </table>
  <div style="text-align:center;">
  <table style="width:380px;margin:auto;">
  	<tr class="rowClass">
  	<td style="width:120px;"><input type="submit" style="background-color:#ccc;width:120px;cursor:pointer;" value="确定"/></td>
  	<td style="width:120px;"><input type="reset"  style="background-color:#ccc;width:120px;cursor:pointer;" value="重置"/></td>
  	<td style="width:120px;"><input type="button" style="background-color:#ccc;width:120px;cursor:pointer;" onclick="window.location.href='${pageContext.request.contextPath}/crm::/oilModule/action/QueryOilList.action?startIndex=0&endIndex=9'"value="返回"/></td>
  	</tr>
  </table>
  </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
