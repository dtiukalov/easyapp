<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增积分</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#integral_intglamount').autoNumeric({mDec:0});
			$('#crmform').saturnValidate({
				rules:{
					integral_intgltime:{
						required: true
					},
					integral_intglitem:{
						required: true,
						maxlength: 100
					},
					integral_intglamount:{
						required: true 
					},
					memb_membtype:{
						required: true 
					},
					integral_intgltype:{
						required: true 
					}
				}
			})
		});
</script> 
</head>
<body>
<div id="man_zone">
<form class="queryFrom">
	<fieldset>
	  <legend>积分管理</legend>
             <table cellspacing="2" cellpadding="0">
             	<tr>
             		<td class="colName">档案编号:</td>
                    <td class="detailColVal">${result.carcardid}</td>
                    <td class="colName">车牌号:</td>
                    <td class="detailColVal">${result.carlicenceno}</td>
                    <td class="colName">车架号:</td>
                    <td class="detailColVal">${result.carvin}</td>
                    <td class="colName">品牌:</td>
                    <td class="detailColVal">${result.carbrand_dict}</td>
                  </tr>
                  <tr>
                    <td class="colName">车系:</td>
                    <td class="detailColVal">${result.carseries_dict}</td>
                    <td class="colName">入会时间:</td>
                    <td class="detailColVal">${result.membjoindate}</td>
                    <td class="colName">会员卡号:</td>
                    <td class="detailColVal">${result.membcardid}</td>
                    <td class="colName">会员类别:</td>
                    <td class="detailColVal">${result.membtype_dict}</td>
                  </tr>
                  <tr>
                    <td class="colName">积分数量:</td>
                    <td class="detailColVal">${result.intglamount}</td>
                  </tr>
            </table> 
	</fieldset>           
</form>
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/memberModule/action/AddIntegral.action?startIndex=0&endIndex=9&memberid=${result.memberid}">
  <fieldset>
    <legend>新增积分</legend>
    <table cellspacing="3" cellpadding="0"> 
    <tr>
   	  <td class="colName">积分时间:</td>
      <td class="detailColVal">
          <input type="text" name="integral_intgltime" id="integral_intgltime" value="${integralData.intgltime}" onfocus="secondCalender(this)" class="Wdate"/>
          <input type="hidden" name="integral_carvin" id="integral_carvin" value="${result.carvin}"/>
	  </td>
	</tr>
	<tr>  
      <td class="colName">积分项目:</td>
      <td class="detailColVal">
    	  <textarea name="integral_intglitem" id="integral_intglitem" style="width:100%;height:50px;">${integralData.intglitem}</textarea>
      </td>
    </tr>
    <tr>
      <td class="colName">积分数量:</td>
      <td class="detailColVal">
    	  <input type="text" name="integral_intglamount" id="integral_intglamount" value="${integralData.intglamount}"/>
      </td>
      <td class="colName">积分类别:</td>
      <td class="detailColVal">
         <select name="integral_intgltype" id="integral_intgltype">
		   <option value=""></option>
           <c:forEach items="${dict.crm_intglType}" var="var">				
           		<c:if test="${var.key==integralData.intgltype}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=integralData.intgltype}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>		
           	</c:forEach>
         </select>
	  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:5px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/memberModule/action/QueryIntegralList.action?memberid=${result.memberid}&startIndex=0&endIndex=9'" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
