<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改精品</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#parts_partsstaff').selectDict({type:'crm_waiter',id:'parts_partsstaff',value:'${saturnData.partsstaff}'});
			$('#parts_partsworker').selectDict({type:'crm_worker',id:'parts_partsworker',value:'${saturnData.partsworker}'});
			//校验
			$('#crmform').saturnValidate({
				rules:{
					parts_carvin:{
						required: true
					},
					parts_partsorderid:{
						maxlength: 12
					},
					parts_partsstaff:{
						required: true
					},
					parts_partsname:{
						maxlength: 200
					},
					parts_partsexpense:{
						required: true
					}
				},
				messages:{

				}
			})
		});
		
		function goBack(){
		 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/partsModule/action/QueryPartsList.action';
		    document.getElementById('hiddenForm').submit();
		}
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/partsModule/action/UpdateParts.action">
  <fieldset>
    <legend>修改精品</legend>
    <table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
    	  <input type="text" name="parts_carvin" id="parts_carvin" value="${saturnData.carvin}"/>
    	  <input type="hidden" name="parts_partsid" id="parts_partsid" value="${saturnData.partsid}"/>
      </td>
 
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
          <input type="text" name="parts_partsintime" id="parts_partsintime" onfocus="dayCalender(this)" value="${saturnData.partsintime}" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">出厂时间:</td>
      <td class="detailColVal">
          <input type="text" name="parts_partsouttime" id="parts_partsouttime" onfocus="dayCalender(this)" value="${saturnData.partsouttime}" class="Wdate"/>
	  </td>
 
      <td class="colName">精品工单号:</td>
      <td class="detailColVal">
        <input type="text" name="parts_partsorderid" id="parts_partsorderid" value="${saturnData.partsorderid}"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">精品接待:</td>
      <td class="detailColVal">
         <select name="parts_partsstaff" id="parts_partsstaff"></select>
	  </td>

      <td class="colName">作业人员:</td>
      <td class="detailColVal">
          <select name="parts_partsworker" id="parts_partsworker"></select>
	  </td>
    </tr>
    <tr>
      <td class="colName">精品名称:</td>
      <td class="detailColVal" colspan="3"> 
         <textarea name="parts_partsname" id="parts_partsname" style="width:100%;height:80px;">${saturnData.partsname}</textarea>
	  </td>
    </tr>
    <tr>
      <td class="colName">精品消费:</td>
      <td class="detailColVal" colspan="3"> 
           <input type="text" name="parts_partsexpense" id="parts_partsexpense" value="${saturnData.partsexpense}" class="auto"/>
	  </td>
	    <input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carbrand" value="${carbrand}">
		<input type="hidden" name="carmodel" value="${carseries}">
		<input type="hidden" name="cararea" value="${cararea}">
		<input type="hidden" name="partsstaff" value="${partsstaff}">
		<input type="hidden" name="min_partsouttime" value="${min_partsouttime}">
		<input type="hidden" name="max_partsouttime" value="${max_partsouttime}">
		<input type="hidden" name="min_partsintime" value="${min_partsintime}">
		<input type="hidden" name="max_partsintime" value="${max_partsintime}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
    </tr>
  </table>
    <div style="text-align:center;">
	  <table style="width:380px;margin:auto;">
	  	<tr class="rowClass">
		  	<td style="width:120px;"><input type="submit" value="确定"/></td>
		  	<td style="width:120px;"><input type="reset" value="重置"/></td>
		  	<td style="width:120px;"><input type="button" onclick="javascript:goBack();" value="返回"/></td>
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
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carbrand" value="${carbrand}">
		<input type="hidden" name="carmodel" value="${carseries}">
		<input type="hidden" name="cararea" value="${cararea}">
		<input type="hidden" name="partsstaff" value="${partsstaff}">
		<input type="hidden" name="min_partsouttime" value="${min_partsouttime}">
		<input type="hidden" name="max_partsouttime" value="${max_partsouttime}">
		<input type="hidden" name="min_partsintime" value="${min_partsintime}">
		<input type="hidden" name="max_partsintime" value="${max_partsintime}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
