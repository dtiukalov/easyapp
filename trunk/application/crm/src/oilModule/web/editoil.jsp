<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改存油</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#oil_oilstaff').selectDict({type:'crm_waiter',id:'oil_oilstaff',value:'${saturnData.oilstaff}'});
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
		
		function goBack(){
		 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/oilModule/action/QueryOilList.action';
		    document.getElementById('hiddenForm').submit();
		}
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/oilModule/action/UpdateOil.action">
  <fieldset>
    <legend>修改存油</legend>
     <table cellspacing="10" cellpadding="0">  
    <tr class="rowClass">
      <td class="colName">车架号:</td>
      <td class="detailColVal">
		<input type="text" name="oil_carvin" id="oil_carvin" value="${saturnData.carvin}"/>
		<input type="hidden" name="oil_oilid" id="oil_oilid" value="${saturnData.oilid}"/>
	 </td>

      <td class="colName">存油编号:</td>
      <td class="detailColVal">
      	 <input type="text" name="oil_oilnumber" id="oil_oilnumber" value="${saturnData.oilnumber}"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">工单号:</td>
      <td class="detailColVal">
		<input type="text" name="oil_servorderid" id="oil_servorderid" value="${saturnData.servorderid}"/>
	  </td>
	  <td class="colName">存油时间:</td>
      <td class="detailColVal">
          <input type="text" name="oil_oilstoretime" id="oil_oilstoretime" value="${saturnData.oilstoretime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr class="rowClass">
      

      <td class="colName">存油种类:</td>
      <td class="detailColVal">
          <select name="oil_oiltype" id="oil_oiltype">
			<option value=""></option>
			<c:forEach items="${dict.crm_oilType$}" var="var">				
           		<c:if test="${var.key==saturnData.oiltype}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.oiltype}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>	
           	</c:forEach>        
         </select>
	  </td>
	  <td class="colName">存油量:</td>
      <td class="detailColVal">
        <input type="text" name="oil_oilamount" id="oil_oilamount" value="${saturnData.oilamount}" class="auto"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">存油接待:</td>
      <td class="detailColVal">
        <select name="oil_oilstaff" id="oil_oilstaff"></select>
        <input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="min_oilstoretime" value="${min_oilstoretime}">
		<input type="hidden" name="max_oilstoretime" value="${max_oilstoretime}">
		<input type="hidden" name="oilstaff" value="${oilstaff}">
		<input type="hidden" name="oilstate" value="${oilstate}">
		<input type="hidden" name="min_oilouttime" value="${min_oilouttime}">
		<input type="hidden" name="max_oilouttime" value="${max_oilouttime}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	  </td>
	  <td class="colName">使用时间:</td>
      <td class="detailColVal">
         <input type="text" name="oil_oilouttime" id="oil_oilouttime" value="${saturnData.oilouttime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">状态:</td>
      <td class="detailColVal">
      	<select name="oil_flag" id="oil_flag">
      	<option value="1" ${saturnData.flag==1?'selected':''}>废弃</option>
      	<option value="0" ${empty saturnData.flag||saturnData.flag==0?'selected':''}>存油</option>
      	<option value="2" ${saturnData.flag==2?'selected':''}>出油</option>
      	<option value="3" ${saturnData.flag==3?'selected':''}>带走或外销</option>
      	</select>
	 </td>

      <td class="colName">&nbsp;</td>
      <td class="detailColVal">
      	 &nbsp;
	  </td>
    </tr>
  </table>
  <div style="text-align:center;">
	  <table style="width:380px;margin:auto;">
	  	<tr class="rowClass">
	  	<td style="width:120px;"><input type="submit" style="background-color:#ccc;width:120px;cursor:pointer;" value="确定"/></td>
	  	<td style="width:120px;"><input type="reset"  style="background-color:#ccc;width:120px;cursor:pointer;" value="重置"/></td>
	  	<td style="width:120px;"><input type="button" style="background-color:#ccc;width:120px;cursor:pointer;" onclick="javascript:goBack();" value="返回"/></td>
	  	</tr>
	  </table>
  </div>
  </fieldset>
  </form>
  </div>
  <div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="min_oilstoretime" value="${min_oilstoretime}">
		<input type="hidden" name="max_oilstoretime" value="${max_oilstoretime}">
		<input type="hidden" name="oilstaff" value="${oilstaff}">
		<input type="hidden" name="oilstate" value="${oilstate}">
		<input type="hidden" name="min_oilouttime" value="${min_oilouttime}">
		<input type="hidden" name="max_oilouttime" value="${max_oilouttime}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
