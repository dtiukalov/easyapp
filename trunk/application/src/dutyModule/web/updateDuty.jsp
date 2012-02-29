<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改进厂车辆</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
		$(function() { 
		$('#duty_dutystaff').selectDict({type:'crm_waiter',id:'duty_dutystaff',value:'${saturnData.dutystaff}'});
		$('#duty_dutyprovide').selectDict({type:'crm_waiter',id:'duty_dutyprovide',value:'${saturnData.dutyprovide}'});
		$('#duty_dutydelivery').selectDict({type:'crm_waiter',id:'duty_dutydelivery',value:'${saturnData.dutydelivery}'});
		
			$('#crmform').saturnValidate({
				rules:{
					duty_carcardid:{
						//required: true
					},
					duty_carvin:{
						//required: true
					},
					duty_carlicenseno:{
						//required: true,
						//maxlength: 20
					},
					duty_dutycarmodel:{
						required: true
					},
					duty_dutyintime:{
						required: true
					},
					duty_dutypredelivtime:{
						//required: true
					},
					duty_dutywkcontent:{
						maxlength: 100
					},
					duty_dutystaff:{
						//required: true
					},
					duty_dutytype:{
						//required: true
					},
					duty_dutydelayreason:{
						maxlength: 100
					},
					duty_dutydelivery:{
						maxlength: 20
					}
					
				}
			});
			//级联
			$('#crmform').saturnRelationSelect({
					levels:['duty_carbrand', 'duty_dutycarmodel','carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车系'],['','选择型号']],
					defaultValue:['${duty_carbrand}','${duty_dutycarmodel}','${carmodel}']
			});
			
			$('#duty_dutycarmodel').html("<option value=''></option>").append("<option value='" + '${saturnData.dutycarmodel}' + "' selected>" + '${saturnData.dutycarmodel_dict}' + "</option>");
			$('#duty_dutycarmodel').removeAttr("disabled");
			//初始作业类别
			var dutycommu = '${saturnData.dutycommu}';
			var dutyArray = dutycommu.split('|');
			$('#jd').attr("checked", false); 
			$('#bj').attr("checked", false); 
			$('#pq').attr("checked", false); 
			$('#xc').attr("checked", false); 
			for(var i=0;i<dutyArray.length;i++){
				
				if('机电'==dutyArray[i])
					$('#jd').attr("checked", true); 
				if('钣金'==dutyArray[i])
					$('#bj').attr("checked", true); 
				if('喷漆'==dutyArray[i])
					$('#pq').attr("checked", true); 
				if('洗车'==dutyArray[i])
					$('#xc').attr("checked", true); 
			}
			
		});
		
function doSubmit(){
	var f_str = '';
$(":checkbox").each(function(){
   if($(this).attr("checked")==true){
    f_str += $(this).attr("value")+"|";
   }
});
$("#duty_dutycommu").val(f_str);
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
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/dutyModule/action/UpdateDuty.action">
<input type="hidden" name="duty_dutyid" id="duty_dutyid" value="${saturnData.dutyid}"/>

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
<legend>修改进厂车辆</legend>
<table cellspacing="10" cellpadding="0">
	<tr>
      <td class="colName">档案号:</td>
      <td class="detailColVal">
          <input type="text" name="duty_carcardid" id="duty_carcardid" value="${saturnData.carcardid }" style="background-color: #ccc;"/>
	  </td>
      <td class="colName">VIN:</td>
      <td class="detailColVal">
        <input type="text" name="duty_carvin" id="duty_carvin" value="${saturnData.carvin }" style="background-color: #ccc;"/>
	  </td>
      <td class="colName">车牌号:</td>
      <td class="detailColVal">
          <input type="text" name="duty_carlicenseno" id="duty_carlicenseno" value="${saturnData.carlicenseno}" style="background-color: #ccc;"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">车系:</td>
      <td class="detailColVal">
      <select id="duty_carbrand" name="duty_carbrand" style="background-color: #ccc;">
          	<option value=""></option>
             <c:forEach items="${dict.crm_carModel$}" var="var">				
		 		<option value="${var.key}">${var.value}</option>			
		 	</c:forEach>
          </select>
      	  	<select id="duty_dutycarmodel" name="duty_dutycarmodel" style="background-color: #ccc;">
               <option value=""></option>
               <c:forEach items="${dict.crm_carModel}" var="var">	
					<c:if test="${var.key==saturnData.dutycarmodel}">
						<option value="${var.key}" selected>${var.value}</option>
					</c:if>
			  	</c:forEach>
           </select>
	  </td>
	  <td class="colName">车辆分类:</td>
      <td class="detailColVal">
      	 <select id="duty_dutytype" name="duty_dutytype">
            <option value=""></option>
			<c:if test="${'售后'==saturnData.dutytype}">
				<option value="售后" selected>售后</option>
				<option value="市场">市场</option>
			</c:if>
			<c:if test="${'市场'==saturnData.dutytype}">
				<option value="售后">售后</option>
				<option value="市场" selected>市场</option>
			</c:if>
			<c:if test="${'市场'!=saturnData.dutytype and '售后'!=saturnData.dutytype}">
				<option value="售后">售后</option>
				<option value="市场">市场</option>
			</c:if>
         </select>
	  </td>
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
        <input type="text" name="duty_dutyintime" id="duty_dutyintime" value="${saturnData.dutyintime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">接待人员:</td>
      <td class="detailColVal">
      	 <select id="duty_dutystaff" name="duty_dutystaff">
         </select>
	  </td>
      <td class="colName">提车员:</td>
      <td class="detailColVal">
          <select id="duty_dutyprovide" name="duty_dutyprovide">
         </select>
	  </td>
      <td class="colName">预计交车时间:</td>
      <td class="detailColVal">
          <input type="text" name="duty_dutypredelivtime" id="duty_dutypredelivtime" value="${saturnData.dutypredelivtime}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
	      <td class="colName">作业项目:</td>
	       <td class="detailColVal" style="width:30%;">
	           <textarea name="duty_dutywkcontent" id="duty_dutywkcontent" style="height:80px;width:100%;">${saturnData.dutywkcontent}</textarea>
		  </td>
		  <td class="colName">延时原因:</td>
		  <td class="detailColVal" style="width:30%;">
	           <textarea name="duty_dutydelayreason" id="duty_dutydelayreason" style="height:80px;width:100%;">${saturnData.dutydelayreason}</textarea>
		  </td>
	      <td class="colName">实际交车时间:</td>
	      <td class="detailColVal">
	         <input type="text" name="duty_dutydelivtime" id="duty_dutydelivtime" value="${saturnData.dutydelivtime}" onfocus="secondCalender(this)" class="Wdate"/>
		  </td>
    </tr>
    <tr>
          <td class="colName">交车人:</td>
	      <td class="detailColVal">
	      <select id="duty_dutydelivery" name="duty_dutydelivery">
         </select>
	      </td> 
	      <td class="colName">作业类型:</td>
	      <td class="detailColVal">
		        <input type="checkbox" name="jd" id="jd" value="机电" style="width:20px;border: 0px;">机电
				<input type="checkbox" name="bj" id="bj" value="钣金" style="width:20px;border: 0px;">钣金
				<input type="checkbox" name="pq" id="pq" value="喷漆" style="width:20px;border: 0px;">喷漆
				<input type="checkbox" name="xc" id="xc" value="洗车" style="width:20px;border: 0px;">洗车
				<input type="hidden" name="duty_dutycommu" id="duty_dutycommu" value="${saturnData.dutycommu}"/>
	      </td> 
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="button" onclick="javascript:doSubmit();" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="javascript:history.back();" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
