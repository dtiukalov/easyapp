<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增进厂车辆</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<jsp:useBean id="now" class="java.util.Date" />    
  
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" var="nowz"/> 

<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="nowzd"/> 
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<script type="text/javascript">
$(function() { 
	$('#duty_dutystaff').selectDict({type:'crm_waiter',id:'duty_dutystaff'});
	$('#duty_dutyprovide').selectDict({type:'crm_waiter',id:'duty_dutyprovide'});
	
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
			}
			
		}
	})
});
$(function() {
	$("#paginate").saturnTablePaginate({
		count:'${count}', 
		current:'<%=request.getParameter("pageValue")%>',  
		action:'${pageContext.request.contextPath}/crm::/dutyModule/action/ToAddPage.action',
		form:'pageform',
		percount:10
	});
	//级联
	$('#crmform').saturnRelationSelect({
			levels:['duty_carbrand', 'duty_dutycarmodel','carmodel'],
			type:'crm_carModel',
			firstValue:[['','选择车系'],['','选择型号']],
			defaultValue:['${carbrand}','${dutycarmodel}','${carmodel}']
	});
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
function editInput(carcardid,carvin,carlicenseno,carseries,carseries_dict){
	$('#duty_carcardid').val(carcardid);
	$('#duty_carvin').val(carvin);
	$('#duty_carlicenseno').val(carlicenseno);
	$('#duty_dutycarmodel').html("<option value=''></option>").append("<option value='" + carseries + "' selected>" + carseries_dict + "</option>");
	$('#duty_dutycarmodel').removeAttr("disabled");
}
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/dutyModule/action/AddDuty.action">

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
<legend>新增进厂车辆</legend>
<table cellspacing="10" cellpadding="0">
	<tr>
      <td class="colName">档案号:</td>
      <td class="detailColVal">
          <input type="text" name="duty_carcardid" id="duty_carcardid" value="${carcardid }" readonly="readonly" style="background-color: #ccc;"/>
	  </td>
      <td class="colName">VIN:</td>
      <td class="detailColVal">
        <input type="text" name="duty_carvin" id="duty_carvin" value="${carvin }" readonly="readonly" style="background-color: #ccc;"/>
	  </td>
      <td class="colName">车牌号:</td>
      <td class="detailColVal">
          <input type="text" name="duty_carlicenseno" id="duty_carlicenseno" value="${carlicenseno }" style="background-color: #ccc;"/>
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
           </select>
	  </td>
	  <td class="colName">车辆分类:</td>
      <td class="detailColVal">
      	 <select id="duty_dutytype" name="duty_dutytype">
            <option value=""></option>				
           	<option value="售后">售后</option>
			<option value="市场">市场</option>
         </select>
	  </td>
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
        <input type="text" name="duty_dutyintime" id="duty_dutyintime" value="${nowz}" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">接待人员:</td>
      <td class="detailColVal">
      	 <select id="duty_dutystaff" name="duty_dutystaff" value="${dutystaff}">
         </select>
	  </td>
      <td class="colName">提车员:</td>
      <td class="detailColVal">
          <select id="duty_dutyprovide" name="duty_dutyprovide">
         </select>
	  </td>
      <td class="colName">预计交车时间:</td>
      <td class="detailColVal">
          <input type="text" name="duty_dutypredelivtime" id="duty_dutypredelivtime" onfocus="secondCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
	      <td class="colName">作业项目:</td>
	       <td class="detailColVal" style="width:90%;" colspan="3">
	           <textarea name="duty_dutywkcontent" id="duty_dutywkcontent" style="height:50px;width:90%;"></textarea>
		  </td>
		  <td class="colName">作业类型:</td>
	      <td class="detailColVal">
	   	    		<input type="checkbox" name="jd" id="jd" value="机电" style="width:20px;border: 0px;">机电
	   	    		<input type="checkbox" name="bj" id="bj" value="钣金" style="width:20px;border: 0px;">钣金
	   	    		<input type="checkbox" name="pq" id="pq" value="喷漆" style="width:20px;border: 0px;">喷漆
	   	    		<input type="checkbox" name="xc" id="xc" value="洗车" style="width:20px;border: 0px;">洗车
					<input type="hidden" name="duty_dutycommu" id="duty_dutycommu" value=""/>
	      </td>
    </tr>
  </table>
   <div style="text-align:center;margin-top:20px;">
        <input type="button" onclick="javascript:doSubmit();" value="确定"/>
        <input type="reset" value="重置"/>
        <input type="button"  onclick="javascript:history.back();"value="返回"/>
   </div>
  </fieldset>
  </form>
  <table class="optDiv">
			<tr>
				<td><label class="rsTitle">总值管理</label></td>
				<td><div id="paginate"></div></td>
				<td>&nbsp;<!-- <div class="optAdd"><a href="javascript:addNewWin();">新增</a></div> --></td>
			</tr>
		</table>
        <div class="tbDiv">
			<div>
				<table cellspacing="0" cellpadding="0">
                    <tr>
                     	<th>操作</th>
                        <th>档案号</th>
                        <th>VIN</th>
                        <th>车牌号</th>
                        <th>车系</th>
                    </tr>
                </table>
			</div>
			<div id="dataDiv">
				<table id="dataTb" cellspacing="0" cellpadding="0">
                <c:forEach items="${car_result}" var="var" varStatus="status">
             		<tr style="line-height:10px;" ondblclick="editInput('${var.carcardid}','${var.carvin}','${var.carlicenceno}','${var.carseries}','${var.carseries_dict}');">
             			<td><a href="javascript:void(0);" onclick="editInput('${var.carcardid}','${var.carvin}','${var.carlicenceno}','${var.carseries}','${var.carseries_dict}');">选择</a></td>
                   	    <td>${var.carcardid}</td>  
                        <td>${var.carvin}</td>   
                        <td>${var.carlicenceno}</td> 
                        <td>${var.carseries_dict}</td>
                    </tr>  
                     </c:forEach>  
            </table>
            </div>
    </div>
  </div>
  <form id="pageform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/dutyModule/action/ToAddPage.action?startIndex=0&endIndex=9">
  <input type="hidden" name="carlicenseno" id="carlicenseno" value="${carlicenseno}"/>
  <input type="hidden" name="carvin" id="carvin" value="${carvin}"/>
  </form>
</body>
</html>
