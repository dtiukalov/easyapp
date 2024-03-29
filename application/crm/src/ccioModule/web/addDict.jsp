<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增用户</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			//校验
			$('#crmform').saturnValidate({
				rules:{
					d_lable:{
						required: true
					},
					d_value:{
						required: true
					},
					d_type:{
						required: true
					},
					d_order:{
						required: true
					}
				},
				messages:{
					d_lable:{
						remote:"请填写标签"
					},
					d_value:{
						remote:"请填写值"
					},
					d_type:{
						remote:"请选择类型"
					},
					d_order:{
						remote:"请填写排序"
					}
				}
			})
		});
</script> 
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/ccioModule/action/SetDict.action">
<input type="hidden" name="startIndex" value="0"/>
<input type="hidden" name="endIndex" value="9"/>
<input type="hidden"  name="d_pid" id="d_pid" value="<%=request.getParameter("d_pid") %>" />
<input type="hidden"  name="d_state" id="d_state" value="1" />
<fieldset>
<legend>新增项目</legend>
<table cellspacing="10" cellpadding="0">
   <tr>
      <td class="colName">标签:</td>
      <td class="detailColVal">
          <input type="text" name="d_lable" id="d_lable"/>
	  </td>
  </tr>
  <tr>	  
      <td class="colName">值:</td>
      <td class="detailColVal">
         <input type="text" name="d_value" id="d_value" onkeyup="value=value.replace(/[^\d]/g,'');if(eval(this.value) > 56635){this.value = 56635}" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
	  </td>
   <tr>
   <tr>	  
      <td class="colName">类型:</td>
      <td class="detailColVal">
         <select name="d_type" id="d_type">
         <option value=""></option>
         <option value="1">国家</option>
         <option value="2">省份</option>
         <option value="3">城市</option>
         <option value="4">4S店</option>
         </select>
	  </td>
   <tr>		  
	  <td class="colName">排序:</td>
      <td class="detailColVal">
         <input type="text" name="d_order" id="d_order" value="0"/>
	  </td>
    </tr>
    <!--   
    <tr>	  
	  <td class="colName">状态:</td>
      <td class="detailColVal">
      	<input type="radio" name="d_state" id="d_state" value="0" />隐藏
        <input type="radio" name="d_state" id="d_state" value="1" />显示
        <input type="radio" name="d_state" id="d_state" value="2" />选定
	  </td>
    </tr> 
     --> 
  </table>
  <div style="text-align:center;margin-top:20px;">
       <input type="submit" value="确定"/>
       <input type="reset" value="重置"/>
       <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictList.action?startIndex=0&endIndex=9&d_pid=<%=request.getParameter("d_pid") %>'" value="返回"/>
   </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
