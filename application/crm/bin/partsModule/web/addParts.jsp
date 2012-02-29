<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增精品</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#parts_partsstaff').selectDict({type:'crm_waiter',id:'parts_partsstaff',value:'${param.partsstaff}'});
			$('#parts_partsworker').selectDict({type:'crm_worker',id:'parts_partsworker'});
				
			$('#parts_carvin').focus();
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
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/partsModule/action/AddParts.action?startIndex=0&endIndex=9">
  <fieldset>
    <legend>新增精品</legend>
    <table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
    	  <input type="text" name="parts_carvin" id="parts_carvin" value="${param.carvin}"/>
      </td>
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
          <input type="text" name="parts_partsintime" id="parts_partsintime"  value="${param.partsintime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">出厂时间:</td>
      <td class="detailColVal">
          <input type="text" name="parts_partsouttime" id="parts_partsouttime" value="${param.partsouttime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
 
      <td class="colName">精品工单号:</td>
      <td class="detailColVal">
       <input type="text" name="parts_partsorderid" id="parts_partsorderid"/>
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
         <textarea name="parts_partsname" id="parts_partsname" style="width:100%;height:80px;"></textarea>
	  </td>
    </tr>
    <tr>
      <td class="colName">精品消费:</td>
      <td class="detailColVal" colspan="3"> 
           <input type="text" name="parts_partsexpense" id="parts_partsexpense" class="auto"/>
	  </td>
    </tr>
  </table>
  <div style="text-align:center;">
	  <table style="width:380px;margin:auto;">
	  	<tr class="rowClass">
		  	<td style="width:120px;"><input type="submit" value="确定"/></td>
		  	<td style="width:120px;"><input type="reset" value="重置"/></td>
		  	<td style="width:120px;"><input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/partsModule/action/QueryPartsList.action?startIndex=0&endIndex=9'"value="返回"/></td>
	  	</tr>
	  </table>
  </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
