<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改投诉</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
		$(function() { 
			$('#new_comptstaff').selectDict({type:'crm_waiter',id:'new_comptstaff',value:'${saturnData.comptstaff}'});
			$('#new_comptworker').selectDict({type:'crm_worker',id:'new_comptworker',value:'${saturnData.comptworker}'});
			$('#new_compttarget').selectDict({type:'crm_worker',id:'new_compttarget',value:'${saturnData.compttarget}'});
					
			$('#crmform').saturnValidate({
				rules:{
					new_comptorderid:{
						required: true
					},
					new_comptname:{
						required: true,
						maxlength: 12
					},
					new_compttime:{
						required: true
					},
					new_carlicenseno:{
						maxlength: 20
					},
					new_carownername:{
						maxlength: 12
					},
					new_comptcontent:{
						maxlength: 300
					},
					deal_comptreason:{
						maxlength: 300
					},
					deal_comptplan:{
						maxlength: 300
					},
					closed_comptvisitrslt:{
						maxlength: 100
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
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/complaitModule/action/UpdateComplaint.action?startIndex=0&endIndex=9">
<fieldset>
<legend>修改投诉</legend>
<table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">投诉编号:</td>
      <td class="detailColVal">
          <input type="text" name="new_comptorderid" id="new_comptorderid" value="${saturnData.comptorderid}"/>
          <input type="hidden" name="new_complaintid" id="new_complaintid" value="${saturnData.complaintid}"/>
	  </td>
      <td class="colName">投诉类型:</td>
      <td class="detailColVal">
        <select id="new_compttype" name="new_compttype">
            <option value=""></option>
           	<c:forEach items="${dict.crm_comptType}" var="var">				
           		<c:if test="${var.key==saturnData.compttype}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.compttype}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>					
           	</c:forEach>
         </select>
	  </td>
      <td class="colName">投诉人姓名:</td>
      <td class="detailColVal">
      	  <input type="text" name="new_comptname" id="new_comptname" value="${saturnData.comptname}"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">投诉人电话:</td>
      <td class="detailColVal">
      	 <input type="text" name="new_compttel" id="new_compttel" value="${saturnData.compttel}"/>
	  </td>
      <td class="colName">接单时间:</td>
      <td class="detailColVal">
          <input type="text" name="new_compttime" id="new_compttime" value="${saturnData.compttime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
      <td class="colName">服务顾问:</td>
      <td class="detailColVal">
          <select id="new_comptstaff" name="new_comptstaff"></select>
	  </td>
    </tr>
    <tr>
	     <td class="colName">责任技师:</td>
	      <td class="detailColVal">
	          <select id="new_compttarget" name="new_compttarget"></select>
		  </td>
		  <td class="colName">发生部门:</td>
	      <td class="detailColVal">
	          <select id="new_comptdept" name="new_comptdept">
	            <option value=""></option>
	           	<c:forEach items="${dict.crm_department}" var="var">				
	           		<c:if test="${var.key==saturnData.comptdept}">
             			<option value="${var.key}" selected>${var.value}</option>
             		</c:if>	
             		<c:if test="${var.key!=saturnData.comptdept}">
             			<option value="${var.key}">${var.value}</option>
             		</c:if>			
	           	</c:forEach>
	          </select>
		  </td>
	      <td class="colName">被投诉员工:</td>
	      <td class="detailColVal">
	          <select id="new_comptworker" name="new_comptworker"></select>
		  </td>
    </tr>
    <tr>
          <td class="colName">投诉来源:</td>
	      <td class="detailColVal">
	        <select id="new_comptsource" name="new_comptsource">
	            <option value=""></option>
	           	<c:forEach items="${dict.crm_comptSource}" var="var">				
	           		<c:if test="${var.key==saturnData.comptsource}">
           				<option value="${var.key}" selected>${var.value}</option>
	           		</c:if>	
	           		<c:if test="${var.key!=saturnData.comptsource}">
	           			<option value="${var.key}">${var.value}</option>
	           		</c:if>				
	           	</c:forEach>
	         </select>
	      </td>
	      <td class="colName">车牌号:</td>
	      <td class="detailColVal">
	          <input type="text" name="new_carlicenseno" id="new_carlicenseno" value="${saturnData.carlicenseno}"/>
		  </td>
	      <td class="colName">车主姓名:</td>
	      <td class="detailColVal">
	          <input type="text" name="new_carownername" id="new_carownername" value="${saturnData.carownername}"/>
		  </td>
    </tr>
    <tr>
	      <td class="colName">处理完成日期:</td>
	      <td class="detailColVal">
	          <input type="text" name="deal_comptdealtime" id="deal_comptdealtime" value="${saturnData.comptdealtime}" onfocus="secondCalender(this)" class="Wdate"/>
	          <input type="hidden" name="deal_comptdealid" id="deal_comptdealid" value="${saturnData.comptdealid}"/>
		  </td>
    	  <td class="colName">及时处理:</td>
	      <td class="detailColVal">
	          <select id="deal_comptisdeal" name="deal_comptisdeal">
	            <option value=""></option>
	            <c:if test="${'1'==saturnData.comptisdeal}">
	           		<option value="1" selected>是</option>
	           		<option value="0">否</option>
		   		</c:if>	
		   		<c:if test="${'0'==saturnData.comptisdeal}">
		   			<option value="1">是</option>
	           		<option value="0" selected>否</option>
		   		</c:if>	
		   		<c:if test="${'0'!=saturnData.comptisdeal&&'1'!=saturnData.comptisdeal}">
		   			<option value="1">是</option>
	           		<option value="0">否</option>
		   		</c:if>	
	         </select>
	      </td>
		  <td class="colName">结案日期:</td>
	      <td class="detailColVal">
	          <input type="text" name="closed_comptendtime" value="${saturnData.comptendtime}" id="closed_comptendtime" onfocus="secondCalender(this)" class="Wdate"/>
	          <input type="hidden" name="closed_comptcloseid" id="closed_comptcloseid" value="${saturnData.comptcloseid}"/>
		  </td>
    </tr>
    <tr>
    	 <td class="colName">投诉内容:</td>
	     <td class="detailColVal" style="width:30%;">
	    	  <textarea name="new_comptcontent" id="new_comptcontent" style="height:80px;width:100%;">${saturnData.comptcontent}</textarea>
	     </td>
	      <td class="colName">投诉原因:</td>
	      <td class="detailColVal" style="width:30%;">
	      	  <textarea name="deal_comptreason" id="deal_comptreason" style="height:80px;width:100%;">${saturnData.comptreason}</textarea>
		  </td>
    </tr>
    <tr>
    	  <td class="colName">对策方案:</td>
	      <td class="detailColVal" style="width:30%;">
	           <textarea name="deal_comptplan" id="deal_comptplan" style="height:80px;width:100%;">${saturnData.comptplan}</textarea>
		  </td>
    	  <td class="colName">回访结果:</td>
	      <td class="detailColVal" style="width:30%;">
	      	  <textarea name="closed_comptvisitrslt" id="closed_comptvisitrslt" style="height:80px;width:100%;">${saturnData.comptvisitrslt}</textarea>
		  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="window.location.href='${pageContext.request.contextPath}/crm::/complaitModule/action/QueryComplaintList.action?startIndex=0&endIndex=9'"value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
