<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改作业项目</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
		$(function() { 
			$('#crmform').saturnValidate({
				rules:{
					ditem_ditemtype:{
						required: true
					},
					ditem_ditemstation:{
						maxlength: 30
					},
					ditem_ditemstarttime:{
						required: true
					}
				}
			});
			$('#ditem_ditemoperator').selectDict({type:'crm_worker',id:'ditem_ditemoperator',value:'${saturnData.ditemoperator}'});
		});
		
		function goback(){
			window.history.back();
		}
		
		function doSubmit(){
			$('#crmform').submit();
			if(opener){ 
				opener.location.reload();
				window.close();
			}
		}
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/dutyModule/action/UpdateDutyItem.action">
<input type="hidden" value="${saturnData.dutyitemid}" name="ditem_dutyitemid" id="ditem_dutyitemid">
<input type="hidden" value="${saturnData.ditemtype}" name="ditem_ditemtype" id="ditem_ditemtype">

<input type="hidden" name="startIndex" id="startIndex" value="${startIndex}"/>
<input type="hidden" name="endIndex" id="endIndex" value="${endIndex}"/>
<input type="hidden" name="carlicenseno" id="carlicenseno" value="${carlicenseno}"/>
<input type="hidden" name="carvin" id="carvin" value="${carvin}"/>
<input type="hidden" name="carcardid" id="carcardid" value="${carcardid}"/>
<input type="hidden" name="dutytype" id="dutytype" value="${dutytype}"/>
<input type="hidden" name="dutystaff" id="dutystaff" value="${dutystaff}"/>
<input type="hidden" name="dutydelivtime" id="dutydelivtime" value="${dutydelivtime}"/>
<input type="hidden" name="carbrand" id="carbrand" value="${carbrand}"/>
<input type="hidden" name="dutycarmodel" id="dutycarmodel" value="${dutycarmodel}"/>
<input type="hidden" name="min_dutyintime" id="min_dutyintime" value="${min_dutyintime}"/>
<input type="hidden" name="max_dutyintime" id="max_dutyintime" value="${max_dutyintime}"/>
<input type="hidden" name="dutycommu" id="dutycommu" value="${dutycommu}"/>

<fieldset>
<legend>修改作业项目</legend>
<table cellspacing="10" cellpadding="0">
<c:if test="${saturnData.ditemtype=='160003'}">
	<tr>
      <td class="colName">开始时间:</td>
      <td class="detailColVal">
      	 <input type="text" name="ditem_ditemstarttime" id="ditem_ditemstarttime" value="${saturnData.ditemstarttime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
	  <td class="colName">结束时间:</td>
      <td class="detailColVal">
      	 <input type="text" name="ditem_ditemendtime" id="ditem_ditemendtime" value="${saturnData.ditemendtime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
</c:if>	
<c:if test="${saturnData.ditemtype!='160003'}">
	<tr>
      <td class="colName">作业人:</td>
      <td class="detailColVal">
      	<select id="ditem_ditemoperator" name="ditem_ditemoperator"></select>
        <!-- <input type="text" name="ditem_ditemoperator" id="ditem_ditemoperator" value="${saturnData.ditemoperator}" maxlength=20/> -->
	  </td>
	  <td class="colName">工位:</td>
      <td class="detailColVal">
      	  <input type="text" name="ditem_ditemstation" id="ditem_ditemstation" value="${saturnData.ditemstation}"/>
	  </td>
      <td class="colName">开始时间:</td>
      <td class="detailColVal">
      	 <input type="text" name="ditem_ditemstarttime" id="ditem_ditemstarttime" value="${saturnData.ditemstarttime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
    <!-- 
    <td class="colName">作业项目:</td>
      <td class="detailColVal" colspan="3">
      	<textarea name="ditem_ditemcontent" id="ditem_ditemcontent" style="height:80px;width:90%;">${saturnData.ditemcontent}</textarea>
	  </td>
	   -->
	   <td class="colName">&nbsp;</td>
      <td class="detailColVal" colspan="3">
      	<input type="hidden" name="ditem_ditemcontent" id="ditem_ditemcontent" value="${saturnData.ditemcontent}"></input>
	  </td>
      <td class="colName">结束时间:</td>
      <td class="detailColVal">
      	 <input type="text" name="ditem_ditemendtime" id="ditem_ditemendtime" value="${saturnData.ditemendtime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
	  </tr>
</c:if>	
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="button" onclick="javascript:doSubmit();" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button" onclick="javascript:goback();" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
