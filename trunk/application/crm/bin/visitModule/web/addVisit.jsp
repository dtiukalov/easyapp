<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增回访</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#visit_visitstaff').selectDict({type:'crm_waiter',id:'visit_visitstaff'});
			//控制数字输入
			$('#visit_servicemark').autoNumeric({mDec:0});
			$('#visit_repairmark').autoNumeric({mDec:0});
			//校验
			$('#crmform').saturnValidate({
				rules:{
					visit_servorderid:{
						required: true,
						maxlength: 12
					},
					visit_visitstaff:{
						required: true
					},
					visit_visitdate:{
						required: true
					},
					visit_visitnotes:{
						maxlength: 300
					}
				},
				messages:{

				}
			})
			//级联
			$('#crmform').saturnRelationSelect({
					levels:['visit_carbrand', 'visit_carseries'],
					type:'crm_carModel',
					firstValue:[['','选择车型']],
					defaultValue:['${saturnData.carbrand}','${saturnData.carseries}']
			})
		});
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/visitModule/action/AddVisit.action?startIndex=0&endIndex=9">
<fieldset>
<legend>新增回访</legend>
<table cellspacing="15" cellpadding="0">
    <tr>
      <td class="colName">工单号:</td>
      <td class="detailColVal">
          <input type="text" name="visit_servorderid" id="visit_servorderid"/>
	  </td>
      <td class="colName">回访日期:</td>
      <td class="detailColVal">
          <input type="text" name="visit_visitdate" id="visit_visitdate" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
      <td class="colName">跟踪员:</td>
      <td class="detailColVal">
      	  <select id="visit_visitstaff" name="visit_visitstaff"></select>
	  </td>
    </tr>
     <tr>
      <td class="colName">联系人:</td>
      <td class="detailColVal">
          <input type="text" name="visit_linkman" id="visit_linkman"/>
	  </td>
      <td class="colName">联系人电话:</td>
      <td class="detailColVal">
          <input type="text" name="visit_linktel" id="visit_linktel"/>
	  </td>
      <td class="colName">维修类型:</td>
      <td class="detailColVal">
      	  <select id="visit_servtype" name="visit_servtype">
            <option value=""></option>
           	<c:forEach items="${dict.crm_serviceType}" var="var">				
           		<option value="${var.key}">${var.value}</option>				
           	</c:forEach>
         </select>
	  </td>
    </tr>
    
     <tr>
      <td class="colName">维修项目:</td>
      <td class="detailColVal">
          <input type="text" name="visit_servitem" id="visit_servitem"/>
	  </td>
      <td class="colName">维修技师:</td>
      <td class="detailColVal">
          <select id="visit_servworker" name="visit_servworker">
            <option value=""></option>
           	<c:forEach items="${dict.crm_worker}" var="var">				
           		<option value="${var.key}">${var.value}</option>					
           	</c:forEach>
         </select>
	  </td>
	  <td class="colName">车牌号:</td>
      <td class="detailColVal">
          <input type="text" name="visit_carlicenceno" id="visit_carlicenceno"/>
	  </td>
    </tr>
     
    <tr>
       <td class="colName">品牌:</td>
      <td class="detailColVal">
      	  <select id="visit_carbrand" name="visit_carbrand">
			<option value=""></option>
           	<c:forEach items="${dict.crm_carModel$}" var="var">				
           		<option value="${var.key}">${var.value}</option>			
           	</c:forEach>
         </select>
	  </td>
	   <td class="colName">车系:</td>
      <td class="detailColVal">
      	  <select id="visit_carseries" name="visit_carseries"></select>
	  </td>
    </tr>
     <tr>
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="visit_servintime" id="visit_servintime" onfocus="minCalender(this)" class="Wdate"/>
	  </td>
	   <td class="colName">出厂时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="visit_servouttime" id="visit_servouttime" onfocus="minCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">服务质量:</td>
      <td class="detailColVal">
      	  <select id="visit_serverpleased" name="visit_serverpleased">
            <option value=""></option>
           	<c:forEach items="${dict.crm_servPleased}" var="var">				
           		<option value="${var.key}">${var.value}</option>			
           	</c:forEach>
         </select>
	  </td>
      <td class="colName">维修质量:</td>
      <td class="detailColVal">
           <select id="visit_repairpleased" name="visit_repairpleased">
            <option value=""></option>
           	<c:forEach items="${dict.crm_repaPleased}" var="var">				
           		<option value="${var.key}">${var.value}</option>			
           	</c:forEach>
         </select>
	  </td>
      <td class="colName">是否有投诉:</td>
      <td class="detailColVal">
          <select id="visit_iscomplaint" name="visit_iscomplaint">
            <option value=""></option>
            <option value="1">有</option>
            <option value="0">无</option>
         </select>
	  </td>
    </tr>
    <tr>
      <td class="colName">意见/建议:</td>
      <td class="detailColVal">
         <select id="visit_hasproposal" name="visit_hasproposal">
            <option value=""></option>
            <option value="1">有</option>
            <option value="0">无</option>
         </select>
	  </td>
	  <td class="colName">服务评分:</td>
      <td class="detailColVal">
          <input type="text" name="visit_servmark" id="visit_servmark"/>
	  </td>
      <td class="colName">维修评分:</td>
      <td class="detailColVal">
          <input type="text" name="visit_repairmark" id="visit_repairmark"/>
	  </td>
    </tr>
    <tr>
	      <td class="colName">备注:</td>
	      <td class="detailColVal" colspan="3">
	      	  <textarea name="visit_visitnotes" id="visit_visitnotes" style="height:50px;width:100%;"></textarea>
	      </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="window.location.href='${pageContext.request.contextPath}/crm::/visitModule/action/QueryVisitList.action?startIndex=0&endIndex=9'"value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
