<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改会员</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
	$(function() {
			subIframe();
			//校验
			$('#crmform').saturnValidate({
				rules:{
					memb_membcardid:{
						required: true,
						maxlength: 12
					},
					memb_carvin:{
						required: true,
						maxlength: 17 
					},
					car_carcardlevel:{
						required: true 
					},
					memb_membtype:{
						required: true 
					},
					memb_membenjoyed:{
						maxlength: 300
					},
					memb_membenjoying:{
						maxlength: 300
					}
				}
			})
		});
	
	function openwin() {
		var carvin = $('#memb_carvin').val();
		if(carvin!=''){ 
			window.open ("${pageContext.request.contextPath}/crm::/carModule/action/QueryCarByVin.action?carvin="+carvin, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}else{
			window.open ("${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action?startIndex=0&endIndex=9", "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}
	} 
	
	function goBack(){
	 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/memberModule/action/QueryMemberList.action';
	    document.getElementById('hiddenForm').submit();
	}
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/memberModule/action/UpdateMember.action">
  <fieldset>
    <legend>修改会员</legend>
    <table cellspacing="3" cellpadding="0">
    <tr>
      <td class="colName">会员卡号:</td>
      <td class="detailColVal">
      	  <input type="hidden" name="memb_memberid" id="memb_memberid" value="${saturnData.memberid}"/>
    	  <input type="text" name="memb_membcardid" id="memb_membcardid" value="${saturnData.membcardid}"/>	 
      </td>

      <td class="colName">车架号:</td>
      <td class="detailColVal">
    	  <input type="text" name="memb_carvin" id="memb_carvin" value="${saturnData.carvin}"/>
		  <a title="打开查询窗口" href="javascript:openwin();" style="color:#326EE9">查询</a>
      </td>
    </tr>
	<tr>
   	  <td class="colName">会员类别:</td>
      <td class="detailColVal">
         <select name="memb_membtype" id="memb_membtype">
		   <option value=""></option>
           <c:forEach items="${dict.crm_membType}" var="var">				
           		<c:if test="${var.key==saturnData.membtype}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=saturnData.membtype}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>				
           	</c:forEach>
         </select>
	  </td>

      <td class="colName">入会日期:</td>
      <td class="detailColVal">
          <input type="text" name="memb_membjoindate" value="${saturnData.membjoindate}" id="memb_membjoindate" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">已享优惠:</td>
      <td class="detailColVal" colspan="2">
        <textarea name="memb_membenjoyed" id="memb_membenjoyed" style="width:100%;height:50px;">${saturnData.membenjoyed}</textarea>
	  </td>
    </tr>
    <tr>
      <td class="colName">未享优惠:</td>
      <td class="detailColVal" colspan="2">
        <textarea name="memb_membenjoying" id="memb_membenjoying" style="width:100%;height:50px;">${saturnData.membenjoying}</textarea>
	  </td>
	  <input type="hidden" name="carcardid" value="${carcardid}">
	  <input type="hidden" name="carvin" value="${carvin}">
	  <input type="hidden" name="min_membjoindate" value="${min_membjoindate}">
	  <input type="hidden" name="max_membjoindate" value="${max_membjoindate}">
	  <input type="hidden" name="carbrand" value="${carbrand}">
	  <input type="hidden" name="carseries" value="${carseries}">
	  <input type="hidden" name="min_intgltime" value="${min_intgltime}">
	  <input type="hidden" name="max_intgltime" value="${max_intgltime}">
	  <input type="hidden" name="carlicenceno" value='${carlicenceno}'>
	  <input type="hidden" name="membcardid" value='${membcardid}'>
	  <input type="hidden" name="min_intglamount" value='${min_intglamount}'>
	  <input type="hidden" name="max_intglamount" value='${max_intglamount}'>
	  <input type="hidden" name="membtype" value='${membtype}'>
	  <input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
	  <input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
	  <input type="hidden" name="pageValue" value='${pageValue}'>
    </tr>
  </table>
   <div style="text-align:center;margin-top:5px;">
        <input type="submit" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="javascript:goBack();" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
  <div style="display:none;">
		<form id="hiddenForm" name="hiddenForm" method="post">
			<input type="hidden" name="carcardid" value="${carcardid}">
			<input type="hidden" name="carvin" value="${carvin}">
			<input type="hidden" name="min_membjoindate" value="${min_membjoindate}">
			<input type="hidden" name="max_membjoindate" value="${max_membjoindate}">
			<input type="hidden" name="carbrand" value="${carbrand}">
			<input type="hidden" name="carseries" value="${carseries}">
			<input type="hidden" name="min_intgltime" value="${min_intgltime}">
			<input type="hidden" name="max_intgltime" value="${max_intgltime}">
			<input type="hidden" name="carlicenceno" value='${carlicenceno}'>
			<input type="hidden" name="membcardid" value='${membcardid}'>
			<input type="hidden" name="min_intglamount" value='${min_intglamount}'>
			<input type="hidden" name="max_intglamount" value='${max_intglamount}'>
			<input type="hidden" name="membtype" value='${membtype}'>
			<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
			<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
			<input type="hidden" name="pageValue" value='${pageValue}'>
		</form>
	</div>
</body>
</html>
