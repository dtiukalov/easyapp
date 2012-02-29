<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增车辆品牌</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() {
			$('#code').autoNumeric({mDec:0});
			//校验
			$('#crmform').saturnValidate({
				rules:{
					code:{
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/dictModule/action/CheckCode.action',
						    type:'post',
						    data: {
						    	type:'crm_carModel',
						        code: function() {
						            return $('#code').val();
						        }
						    }
						},
						required: true,
						maxlength: 12
					},
					value:{
						maxlength: 20
					}
				},
				messages:{
					code:{
						remote:"该编号已经被使用",
						maxlength:"编号的最大长度为12"
					},
					value:{
						maxlength: "最大长度为20"
					}
				}
			})
		});
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/dictModule/action/AddDict1.action">
<fieldset>
    <legend>新增车系</legend>
	     <table cellspacing="10" cellpadding="0">
	     <tr>
		    <td class="colName">品牌:</td>  
		    <td class="detailColVal">
		     	<select name="parent_code" id="parent_code">
		     		<option value=""></option>
		     		<option value="104001">东风HONDA</option>
		     		<option value="104002">广本</option>
		     		<option value="104003">进口本田</option>
		     		<option value="104004">其他</option>
		     	</select>
		    </td>
		    <td class="colName">车系编号:</td>
		    <td class="detailColVal">
				<input type="text" name="code" id="code"/>
			</td>
		    <td class="colName">车系名称:</td>
		    <td class="detailColVal">
		      	 <input type="text" name="value" id="value"/>
		      	 <input type="hidden" name="type" id="type" value="crm_carModel"/>
		      	 <input type="hidden" name="pinyin" id="pinyin" value="2"/>
		      	 <input type="hidden" name="hidden_flag" id="hidden_flag" value="0"/>
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
