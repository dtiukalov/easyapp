<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>车辆档案详细</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<script type="text/javascript">
	function goBack(){
	 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action';
	    document.getElementById('hiddenForm').submit();
	}
</script>
</head>
<body>
<div id="man_zone">
<form class="contentForm" id="crmform">
<fieldset>
<legend>车辆档案详细</legend>
<table cellspacing="3" cellpadding="0">
    <tr>
      <td class="colName">档案编号:</td>
      <td class="detailColVal">${carData.carcardid}</td>
      <td class="colName">建档时间:</td>
      <td class="detailColVal">${carData.carcreatetime}</td>
      <td class="colName">档案级别:</td>
      <td class="detailColVal">${carData.carcardlevel_dict}</td>
     <td class="colName">档案分类:</td>
      <td class="detailColVal">${carData.carcardtype_dict}</td>
    </tr>
      <tr>
      
      <td class="colName">车架号:</td>
      <td class="detailColVal">${carData.carvin}</td>
      <td class="colName">车牌号:</td>
      <td class="detailColVal">${carData.carlicenceno}</td>
       <td class="colName">曾用车牌:</td>
      <td class="detailColVal">${carData.caroldlicenceno}</td>
      <td class="colName">发动机号:</td>
      <td class="detailColVal">${carData.carengineno}</td>
    </tr>
    <tr>   
      <td class="colName">变速箱号:</td>
      <td class="detailColVal">${carData.cartransmno}</td>
      <td class="colName">钥匙号:</td>
      <td class="detailColVal">${carData.carkeyno}</td>
      <td class="colName">车色:</td>
      <td class="detailColVal">${carData.carcolor}</td>
      <td class="colName">车辆来源:</td>
      <td class="detailColVal">${carData.carsource_dict}</td>
    </tr>
    <tr>
      <td class="colName">它店信息:</td>
      <td class="detailColVal">${carData.carothershopinfo}</td>
      <td class="colName">销售日期:</td>
      <td class="detailColVal">${carData.carselldate}</td>
      <td class="colName">年款:</td>
      <td class="detailColVal">${carData.caryearstyle_dict}</td>
       <td class="colName">地区:</td>
      <td class="detailColVal">${carData.cararea_dict}</td>
    </tr>
    <tr>
      <td class="colName">首保时间:</td>
      <td class="detailColVal">${carData.carfmaintaintime}</td>
      <td class="colName">首保公里:</td>
      <td class="detailColVal">${carData.carfmaintainmile}</td>
      <td class="colName">车辆性质:</td>
      <td class="detailColVal">${carData.carownership_dict}</td>
      <td class="colName">车店距离:</td>
      <td class="detailColVal">${carData.carshoprange_dict}</td>
    </tr>
     <tr>
      <td class="colName">上牌日期:</td>
      <td class="detailColVal">${carData.carregistdate}</td>
      <td class="colName">用户类别:</td>
      <td class="detailColVal">${carData.carusertype_dict}</td>
      <td class="colName">下保日期:</td>
      <td class="detailColVal">${carData.carnmaintaintime}</td>
      <td class="colName">下保里程:</td>
      <td class="detailColVal">${carData.carnmaintainmile}</td>
    </tr>
    <tr>
      <td class="colName">销售顾问:</td>
      <td class="detailColVal">${carData.carseller_dict}</td>
    </tr>
    </table>
  </fieldset>
  <fieldset>
    <legend>客户详细</legend>
    <table cellspacing="3" cellpadding="0">
    <tr>
      <td class="colName">车主姓名:</td>
      <td class="detailColVal">${cstmData.cstmname_dict}</td>
      <td class="colName">车主性别:</td>
      <td class="detailColVal">${cstmData.cstmsex_dict}</td>
      <td class="colName">出生日期:</td>
      <td class="detailColVal">${cstmData.cstmbirthday}</td>
      <td class="colName">证件类别:</td>
      <td class="detailColVal">${cstmData.cstmdoctype_dict}</td>
    </tr>
    <tr>
      <td class="colName">证件号码:</td>
      <td class="detailColVal">${cstmData.cstmdocno}</td>
      <td class="colName">固定电话:</td>
      <td class="detailColVal">${cstmData.cstmtel}</td>
      <td class="colName">手机:</td>
      <td class="detailColVal">${cstmData.cstmmobile}</td>
      <td class="colName">邮编:</td>
      <td class="detailColVal">${cstmData.cstmzipcode}</td>
      
    </tr>
    <tr>
      <td class="colName">详细地址:</td>
      <td colspan="3" class="detailColVal">${cstmData.cstmaddress}</td>
      <td class="colName">工作单位:</td>
      <td colspan="3" class="detailColVal">${cstmData.cstmcompany}</td>
    </tr>
    <tr>
       <td class="colName">单位性质:</td>
       <td class="detailColVal">${cstmData.cstmcompnature_dict}</td>
       <td class="colName">所属行业:</td>
       <td class="detailColVal">${cstmData.cstmcompindustry_dict}</td>
       <td class="colName">职务:</td>
       <td class="detailColVal">${cstmData.cstmpost}</td>
	   <td class="colName">驾驶证下发日:</td>
       <td class="detailColVal">${cstmData.cstmcarlicensedate}</td>
    </tr>
    <tr>
      <td class="colName">婚姻状况:</td>
      <td class="detailColVal">${cstmData.cstmmarriage_dict}</td>
      <td class="colName">学历:</td>
      <td class="detailColVal">${cstmData.cstmeducation_dict}</td>  
      <td class="colName">QQ:</td>
      <td class="detailColVal">${cstmData.cstmqq}</td>
      <td class="colName">Email:</td>
      <td class="detailColVal">${cstmData.cstmemail}</td>    
    </tr>
     <tr>
      <td class="colName">家庭收入:</td>
      <td class="detailColVal">${cstmData.cstmincome}</td>
      <td class="colName">联系人:</td>
      <td class="detailColVal">${cstmData.cstmcontact}</td>
       <td class="colName">联系人性别:</td>
      <td class="detailColVal">${cstmData.cstmcontsex_dict}</td>
      <td class="colName">联系人电话:</td>
      <td class="detailColVal">${cstmData.cstmtel}</td>
    </tr>
    <tr>   
      <td class="colName">联系人手机:</td>
      <td class="detailColVal">${cstmData.cstmcontmobile}</td>
      <td class="colName">联系人地址:</td>
      <td colspan="3" class=" detailColVal">${cstmData.cstmcontaddr}</td>  
    </tr> 
    <tr>
      <td class="colName">车主爱好:</td>
      <td colspan="3" class="detailColVal">${cstmData.cstmfavorite}</td>
      <td class="colName">备注:</td>
      <td colspan="3" class="detailColVal">${cstmData.cstmnotes}</td>
    </tr>
    <tr>
      <td class="colName">其他联系方式:</td>
      <td colspan="4" class="detailColVal">${cstmData.cstmother}</td>
     </tr>
     <tr>
      	<td colspan="8" style="text-align:center;">
      		<input type="button" value="返回" onclick="javascript:goBack();"/>
      	</td>
      </tr>
    </table>
  </fieldset>
  </form>
  </div>
  <div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
  		<input type="hidden" name="carlicenceno" value="${carlicenceno}"/>
		<input type="hidden" name="carcardid" value="${carcardid}"/> 
		<input type="hidden" name="carcardtype" value="${carcardtype}"/>
		<input type="hidden" name="carcardlevel" value="${carcardlevel}"/> 
		<input type="hidden" name="carusertype" value="${carusertype}"/> 
		<input type="hidden" name="carvin" value="${carvin}"/>                      	
		<input type="hidden" name="carbrand" value="${carbrand}"/> 
		<input type="hidden" name="carseries" value="${carseries}"/>                    
		<input type="hidden" name="carmodel" value="${carmodel}"/>  
		<input type="hidden" name="cstmname" value="${cstmname}"/> 
		<input type="hidden" name="min_carselldate" value="${min_carselldate}"/>   
		<input type="hidden" name="max_carselldate" value="${max_carselldate}"/>  
		<input type="hidden" name="cstmcontact" value="${cstmcontact}" />    
		<input type="hidden" name="membtype" value="${membtype}"/>                     
		<input type="hidden" name="min_carcreatetime" value="${min_carcreatetime}" />    
		<input type="hidden" name="max_carcreatetime" value="${max_carcreatetime}" />              
		<input type="hidden" name="carsource" value="${carsource}"/>
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}"/>
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}"/>
		<input type="hidden" name="pageValue" value='${pageValue}'/>
  	</form>
  </div>
</body>
</html>
