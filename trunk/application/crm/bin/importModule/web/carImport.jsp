<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>车辆档案管理</title>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
 function disInput(obj){
   var form = $(obj).attr("id") + "Form";
   $('#'+form).submit();
   $(":input").attr("disabled",true);
}
</script>
</head>
<body>
<div id="man_zone">
	<form id="carForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertCar.action">
		<fieldset style="height:65px;">
		  <legend style="letter-spacing:4px;">车辆导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="carExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="car">
                     	<input type="hidden" name="importTarget" value="150001"/>
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>         
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="car" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                   <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入当日新增车辆，上传EXCEL文件名称为"长春正泰_车主车辆资料查询.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
	<form method="post" id="reserveForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertReserve.action">
			<fieldset style="height:65px;">
		  <legend style="letter-spacing:4px;">预约导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="reserveExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="reserve"> 
                     	<input type="hidden" name="importTarget" value="150002"/> 
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>       
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="reserve" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                    <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入预约进厂时间为当日的数据，上传EXCEL文件名称为"长春正泰_预约状况查询.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
	<form method="post" id="visitForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertVisit.action">
			<fieldset style="height:65px;">
		  <legend style="letter-spacing:4px;">回访导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="visitExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="visit"> 
                     	<input type="hidden" name="importTarget" value="150003"/> 
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="visit" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                     <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入录入日期为当日的数据，上传EXCEL文件名称为"长春正泰_回访结果查询.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
	<form method="post" id="remindForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertRegulRemind.action">
			<fieldset style="height:65px;">
		  <legend style="letter-spacing:4px;">提醒导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="regulremindExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="regulremind"> 
                     	<input type="hidden" name="importTarget" value="150004"/> 
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="remind" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                    <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入提醒时间为当日的数据，上传EXCEL文件名称为"长春正泰_定期保养提醒.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
	<form method="post" id="serviceFrom" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertService.action">
			<fieldset style="height:65px;">
		  <legend style="letter-spacing:4px;">维修导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="serviceExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="service"/> 
                     	<input type="hidden" name="importTarget" value="150005"/> 
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="service" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                    <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入工单开单日期为当日的数据，上传EXCEL文件名称为"长春正泰_维修业务报表.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
	<form method="post" id="complaintForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertComplaintNew.action">
			<fieldset style="height:65px;">
		  <legend>新增投诉导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="compalintExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="complaint"/> 
                     	<input type="hidden" name="importTarget" value="150006"/> 
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="complaint" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                     <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入接单时间为当日的数据，上传EXCEL文件名称为"长春正泰_客户投诉查询.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
	<form method="post" id="complaintDealForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertService.action">
			<fieldset style="height:65px;">
		  <legend>已处理投诉导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="complaitDealExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="complait_deal"/> 
                     	<input type="hidden" name="importTarget" value="150007"/> 
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="complaintDeal" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                     <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入处理完成日期为当日的数据，上传EXCEL文件名称为"长春正泰_客户投诉查询.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
	<form method="post" id="complaintClosedForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/crm::/importModule/action/InsertService.action">
			<fieldset style="height:65px;">
		  <legend>结案投诉导入</legend>
             <table cellspacing="0" cellpadding="0">
                   <tr>
                     <td class="colName">上传文件:</td>
                     <td class="detailColVal" style="width:40%;">
                     	<input type="file" name="complaitClosedExcel" style="width:400px;"/>
                     	<input type="hidden" name="importType" value="complait_closed"/>
                     	<input type="hidden" name="importTarget" value="150008"/>  
                     	<input type="hidden" name="startIndex" value="0">
                     	<input type="hidden" name="endIndex" value="9"/>  
                     </td>
                     <td style="text-align:center;">
                         <input type="button" onclick="javascript:disInput(this);" id="complaintClosed" value="确认导入" />
                         <input type="reset" value="重置" />
                     </td>
                   </tr>
                    <tr>
                    <td class="detailColVal" colspan="3" style="text-align:center;">
                   	<div style="background-color:#DFCC66;color:#2A4695; padding:1px;">注：需导入结案日期为当日的数据，上传EXCEL文件名称为"长春正泰_车主车辆资料查询.xls"</div>
                   </td>
                   </tr>
             </table>      
		</fieldset>           
	</form>
</div>
</body>
</html>