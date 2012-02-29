<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增维修人员</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() {
			$('#dict_code').autoNumeric({mDec:0});
			//校验
			$('#crmform').saturnValidate({
				rules:{
					dict_code:{
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/dictModule/action/CheckCode.action',
						    type:'post',
						    data: {
						    	type:'crm_worker',
						        code: function () {
						            return $('#dict_code').val();
						        }
						    }
							
						},
						required: true,
						maxlength: 12
					},
					dict_value:{
						maxlength: 20
					}
				},
				messages:{
					dict_code:{
						remote:"该编号已经被使用",
						maxlength:"编号的最大长度为12"
					},
					dict_value:{
						maxlength: "编号的最大长度为20"
					}
				}
			})
		});
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/dictModule/action/AddDict.action">
  <fieldset>
    <legend>新增维修人员</legend>
     <table cellspacing="10" cellpadding="0">  
    <tr class="rowClass">
      <td class="colName">维修人编号:</td>
      <td class="detailColVal">
		<input type="text" name="dict_code" id="dict_code"/>
	 </td>
      <td class="colName">维修人姓名:</td>
      <td class="detailColVal">
      	 <input type="text" name="dict_value" id="dict_value"/>
      	 <input type="hidden" name="dict_type" value="crm_worker"/>
      	 <input type="hidden" name="dict_hidden_flag" value="0"/>
	  </td>
    </tr>
  </table>
  <div style="text-align:center;">
  <table style="width:380px;margin:auto;">
  	<tr class="rowClass">
  	<td style="width:120px;"><input type="submit" style="background-color:#ccc;width:120px;cursor:pointer;" value="确定"/></td>
  	<td style="width:120px;"><input type="reset"  style="background-color:#ccc;width:120px;cursor:pointer;" value="重置"/></td>
  	</tr>
  </table>
  </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
