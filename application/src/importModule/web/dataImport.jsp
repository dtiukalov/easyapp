<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据导入管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
 function disInput(){
   var url = '${pageContext.request.contextPath}/crm::/importModule/action/';
   var targetArr = ['150001','150002','150003','150004','150005','150006','150007','150008'];
   var actionArr = ['InsertCar','InsertReserve','InsertVisit','InsertRegulRemind','InsertService','InsertComplaintNew','InsertComplaintDeal','InsertComplaintClosed'];
   var target = $('#importtarget').val();
   for(var i=0;i<targetArr.length;i++){
	   	if(target==targetArr[i]){
	      	 var action = url + actionArr[i] + '.action?startIndex=0&endIndex=9';
	   		 $('#crmform').attr('action',action);
	   		 $('#crmform').submit();
   			 $(":input").attr("disabled",true);
   			 break;
	   	}
   } 
}

function doCancel(){
	$(":input").attr("disabled",true);
	var cancelType = $('#cancelType').val();
	$.post("${pageContext.request.contextPath}/crm::/importModule/action/CancelImport.action", {cancelType: cancelType},
        function (json, textStatus){
         $('#dataCount').html(json.result);
         $('#resultMes').show();
         $(":input").attr("disabled",false);
        }, "json");
}
</script>
</head>
<body>
<div id="man_zone">
		<form id="crmform" enctype="multipart/form-data" class="queryFrom" method="post" action="">
			<fieldset>
			  <legend>数据导入</legend>
				  <table cellspacing="20" cellpadding="0" style="padding-top:20px;">
	                   <tr>
	                    <td class="colName">导入类型:</td>
	                    <td class="detailColVal" style="width:130px;">
		                     <select id="importtarget" name="importtarget">
	                        	<option value=""></option>
	                            <c:forEach items="${dict.crm_importTarget}" var="var">				
				             		<option value="${var.key}">${var.value}</option>	
				             	</c:forEach>
	                        </select> 
	                     </td>   
	                     <td class="colName">上传文件:</td>
	                     <td class="detailColVal">
	                     	<input type="file" name="excelFile" style="width:300px;"/>
	                     </td>   
	                       <td style="text-align:right;">
	                         <input type="button" onclick="javascript:disInput();" value="确认导入" />
	                         <input type="reset" value="重置" />
	                     </td>      
	                   </tr>
	             </table>      
	        </fieldset>
	    </form>
	    <form id="cancelForm" class="queryFrom" method="post" action="">
			<fieldset>
			  <legend>撤消导入</legend>
				  <table cellspacing="20" cellpadding="0" style="padding-top:20px;">
	                   <tr>
	                    <td class="colName">撤消类型:</td>
	                    <td class="detailColVal" style="width:130px;">
		                     <select id="cancelType" name="cancelType">
	                        	<option value=""></option>
	                            <c:forEach items="${dict.crm_importTarget}" var="var">				
				             		<option value="${var.key}">${var.value}</option>	
				             	</c:forEach>
	                        </select> 
	                     </td>   
	                     <td style="text-align:right;" colspan="4">
	                         <input type="button" onclick="javascript:doCancel();" value="确认撤消" />
	                         <input type="reset" value="重置" />
	                     </td>
	                   </tr>
	             </table> 
	             <div id="resultMes" style="display:none;background-color:#DFC963;letter-spacing:2px;padding:2px;font-size:14px;text-align:center;">
	             		此次操作共撤销<span id="dataCount" style="color:#0948CB"></span>条数据。
	             </div>     
	        </fieldset>
	    </form>
</div>
</body>
</html>