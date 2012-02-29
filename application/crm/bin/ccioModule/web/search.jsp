<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>兑换积分</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			getPRD('pr');
		});
		
</script> 
<script type="text/javascript">
			function getPRD(divid){
				jQuery.post("${pageContext.request.contextPath}/crm::/pointModule/action/GetPRListByDec.action",{},
					function(json,textStatus){
					        var num = json.prdec_result.length;
					        var i=0;
					        var code='<option value=""></option>';
							for(;i<num;i++){
					        	code+='<option value="'+json.prdec_result[i].pr_id+'">'+json.prdec_result[i].pr_lable+'</option>';
					        }
					        jQuery('#'+divid).html(code);
					},"json");
			}
	</script>
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
<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/GetIOTable.action" method="post">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>兑换积分</legend>
              <table cellspacing="2" cellpadding="0">
                      <tr>
                      <!-- 
                      <td class="colName">VIN:</td>
                      <td class="detailColVal">
                      	<input type="text" name="p_vin" id="p_vin" value="${p_vin}"/>
                      </td>
                       -->
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                      <td class="colName">发动机号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carengineno" id="carengineno" value="${carengineno}"/>
                      </td>
                    </tr>
              </table> 
              <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="生成"/>
              </div>        
			</fieldset>  
		</form>
  </div>
</body>
</html>
