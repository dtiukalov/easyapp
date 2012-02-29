<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增机油</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#jy_jystaff').selectDict({type:'crm_waiter',id:'jy_jystaff',value:'${param.jystaff}'});
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
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/jiyouModule/action/AddJY.action">
  <fieldset>
    <legend>新增机油</legend>
     <table cellspacing="10" cellpadding="0">  
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
		<input type="text" name="jy_carvin" id="jy_carvin" value="${param.carvin}"/>
	 </td>

      <td class="colName">工单号:</td>
      <td class="detailColVal">
      	 <input type="text" name="jy_servorderid" id="jy_servorderid"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">机油种类:</td>
      <td class="detailColVal">
          <select name="jy_jytype" id="jy_jytype">
			<option value=""></option>
			<c:forEach items="${dict.crm_jyType}" var="var">				
           		<option value="${var.key}">${var.value}</option>		
           	</c:forEach>        
         </select>
	  </td>
	  <td class="colName">服务顾问:</td>
      <td class="detailColVal">
          <select name="jy_jystaff" id="jy_jystaff"></select>
	  </td>
    </tr>
    <tr>
      <td class="colName">大桶数量:</td>
      <td class="detailColVal">
        <input type="text" name="jy_jybignum" id="jy_jybignum" class="auto"/>
	  </td>

      <td class="colName">小桶数量:</td>
      <td class="detailColVal">
        <input type="text" name="jy_jysmallnum" id="jy_jysmallnum" class="auto"/>
	  </td>
    </tr>
     <tr>
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
        <input type="text" name="jy_jyselltime" id="jy_jyselltime" onfocus="dayCalender(this)" value="${param.jyselltime}" class="Wdate"/>
	  </td>
	  <td class="colName">节余机油:</td>
      <td class="detailColVal">
      	<select name="jy_jystate" id="jy_jystate">
      		<option value=""></option>
      		<option value="0">带走</option>
      		<option value="1">外销</option>
      	</select>
      </td>
    </tr>
  </table>
   <div style="text-align:center;">
	  <table style="width:380px;margin:auto;">
	  	<tr class="rowClass">
		  	<td style="width:120px;"><input type="submit" value="确定"/></td>
		  	<td style="width:120px;"><input type="reset" value="重置"/></td>
		  	<td style="width:120px;"><input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/jiyouModule/action/QueryJYList.action?startIndex=0&endIndex=9'"value="返回"/></td>
	  	</tr>
	  </table>
  </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
