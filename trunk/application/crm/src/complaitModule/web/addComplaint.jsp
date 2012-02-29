<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增投诉</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
		$(function() { 
		    $('#new_comptstaff').selectDict({type:'crm_waiter',id:'new_comptstaff'});
		    $('#new_comptworker').selectDict({type:'crm_worker',id:'new_comptworker'});
		   	$('#new_compttarget').selectDict({type:'crm_worker',id:'new_compttarget'});
		    
			$('#crmform').saturnValidate({
				rules:{
					new_comptorderid:{
						remote:{
							    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
							    type:'post',
							    data: {
							    	fullkey:'http://crm/coreModule/data::crm_complaint_new',
							        comptorderid: function () {
							            return $('#new_comptorderid').val();
							        }
							    }
								
						},
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
					new_comptorderid:{
						remote:"该投诉编号已经存在"
					}
				}
			})
		});
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/complaitModule/action/AddComplaint.action?startIndex=0&endIndex=9">
<fieldset>
<legend>新增投诉</legend>
<table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">投诉编号:</td>
      <td class="detailColVal">
          <input type="text" name="new_comptorderid" id="new_comptorderid"/>
	  </td>
      <td class="colName">投诉类型:</td>
      <td class="detailColVal">
        <select id="new_compttype" name="new_compttype">
            <option value=""></option>
           	<c:forEach items="${dict.crm_comptType}" var="var">				
           		<option value="${var.key}">${var.value}</option>			
           	</c:forEach>
         </select>
	  </td>
      <td class="colName">投诉人姓名:</td>
      <td class="detailColVal">
      	  <input type="text" name="new_comptname" id="new_comptname"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">投诉人电话:</td>
      <td class="detailColVal">
      	 <input type="text" name="new_compttel" id="new_compttel"/>
	  </td>
      <td class="colName">接单时间:</td>
      <td class="detailColVal">
          <input type="text" name="new_compttime" id="new_compttime" onfocus="secondCalender(this)" class="Wdate"/>
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
	           		<option value="${var.key}">${var.value}</option>			
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
	           		<option value="${var.key}">${var.value}</option>			
	           	</c:forEach>
	         </select>
	      </td>
	      <td class="colName">车牌号:</td>
	      <td class="detailColVal">
	          <input type="text" name="new_carlicenseno" id="new_carlicenseno"/>
		  </td>
	      <td class="colName">车主姓名:</td>
	      <td class="detailColVal">
	          <input type="text" name="new_carownername" id="new_carownername"/>
		  </td>
    </tr>
    <tr>
	      <td class="colName">处理完成日期:</td>
	      <td class="detailColVal">
	          <input type="text" name="deal_comptdealtime" id="deal_comptdealtime"  onfocus="secondCalender(this)" class="Wdate"/>
		  </td>
    	  <td class="colName">及时处理:</td>
	      <td class="detailColVal">
	          <select id="deal_comptisdeal" name="deal_comptisdeal">
	            <option value=""></option>
	            <option value="1">是</option>
	            <option value="0">否</option>
	         </select>
	      </td>
		  <td class="colName">结案日期:</td>
	      <td class="detailColVal">
	          <input type="text" name="closed_comptendtime" id="closed_comptendtime" onfocus="secondCalender(this)" class="Wdate"/>
		  </td>
    </tr>
    <tr>
    	 <td class="colName">投诉内容:</td>
	     <td class="detailColVal" style="width:30%;">
	    	  <textarea name="new_comptcontent" id="new_comptcontent" style="height:80px;width:100%;"></textarea>
	     </td>
	      <td class="colName">投诉原因:</td>
	      <td class="detailColVal" style="width:30%;">
	      	  <textarea name="deal_comptreason" id="deal_comptreason" style="height:80px;width:100%;"></textarea>
		  </td>
    </tr>
    <tr>
    	  <td class="colName">对策方案:</td>
	      <td class="detailColVal" style="width:30%;">
	           <textarea name="deal_comptplan" id="deal_comptplan" style="height:80px;width:100%;"></textarea>
		  </td>
    	  <td class="colName">回访结果:</td>
	      <td class="detailColVal" style="width:30%;">
	      	  <textarea name="closed_comptvisitrslt" id="closed_comptvisitrslt" style="height:80px;width:100%;"></textarea>
		  </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="window.location.href='${pageContext.request.contextPath}/crm::/complaitModule/action/QueryComplaint.action?startIndex=0&endIndex=9'"value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
