<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改存油</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#jy_jystaff').selectDict({type:'crm_waiter',id:'jy_jystaff',value:'${saturnData.jystaff}'});
			$('#jy_jybignum').autoNumeric({mDec:0});
			$('#jy_jysmallnum').autoNumeric({mDec:0});
			//校验
			$('#crmform').saturnValidate({
				rules:{
					jy_carvin:{
						required: true,
						maxlength: 17
					},
					jy_jytype:{
						required: true
					}
				},
				messages:{

				}
			})
		});
		
		function goBack(){
		 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/jiyouModule/action/QueryJYList.action';
		    document.getElementById('hiddenForm').submit();
		}
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/jiyouModule/action/UpdateJY.action">
  <fieldset>
    <legend>修改机油</legend>
     <table cellspacing="10" cellpadding="0">  
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
		<input type="text" name="jy_carvin" id="jy_carvin" value="${saturnData.carvin}"/>
		<input type="hidden" name="jy_jyid" id="jy_jyid" value="${saturnData.jyid}"/>
	 </td>

      <td class="colName">工单号:</td>
      <td class="detailColVal">
      	 <input type="text" name="jy_servorderid" id="jy_servorderid" value="${saturnData.servorderid}"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">机油种类:</td>
      <td class="detailColVal">
          <select name="jy_jytype" id="jy_jytype">
			<option value=""></option>
           	<c:forEach items="${dict.crm_jyType}" var="var">				
           		<c:if test="${var.key==saturnData.jytype}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.jytype}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>				
           	</c:forEach>      
         </select>
	  </td>
	  <td class="colName">服务顾问:</td>
      <td class="detailColVal">
        <select name="jy_jystaff" id="jy_jystaff"></select>
        <input type="hidden" name="servorderid" value="${servorderid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="jystaff" value="${jystaff}">
		<input type="hidden" name="min_jyselltime" value="${min_jyselltime}">
		<input type="hidden" name="max_jyselltime" value="${max_jyselltime}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	  </td>
    </tr>
    <tr>
      <td class="colName">大桶数量:</td>
      <td class="detailColVal">
        <input type="text" name="jy_jybignum" id="jy_jybignum" value="${saturnData.jybignum}" class="auto"/>
	  </td>

      <td class="colName">小桶数量:</td>
      <td class="detailColVal">
        <input type="text" name="jy_jysmallnum" id="jy_jysmallnum" value="${saturnData.jysmallnum}" class="auto"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
        <input type="text" name="jy_jyselltime" id="jy_jyselltime" value="${saturnData.jyselltime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
	   <td class="colName">节余机油:</td>
       <td class="detailColVal">
       	<select name="jy_jystate" id="jy_jystate">
       		<option value=""></option>
       		<c:if test="${saturnData.jystate=='1'}">
       			<option value="1" selected>外销</option>
       			<option value="0">带走</option>
       		</c:if>
       		<c:if test="${saturnData.jystate=='0'}">
       			<option value="0" selected>带走</option>
       			<option value="1">外销</option>
       		</c:if>
       		<c:if test="${saturnData.jystate!='1'&&saturnData.jystate!='0'}">
       			<option value="0">带走</option>
       			<option value="1">外销</option>
       		</c:if>
       	</select>
       </td>
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
		<input type="hidden" name="servorderid" value="${servorderid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="jystaff" value="${jystaff}">
		<input type="hidden" name="min_jyselltime" value="${min_jyselltime}">
		<input type="hidden" name="max_jyselltime" value="${max_jyselltime}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
