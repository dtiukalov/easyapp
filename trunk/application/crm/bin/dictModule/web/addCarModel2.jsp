<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增车辆车型</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() {
			//级联
			$('#crmform').saturnRelationSelect({
					levels:['car_carbrand', 'parent_code','car_carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}','${carmodel}']
			});
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
						        code: function () {
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
						maxlength: "编号的最大长度为20"
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
    <legend>新增车型</legend>
	     <table cellspacing="10" cellpadding="0">
	     <tr>
	     	  <td class="colName">品牌:</td>
		      <td class="detailColVal">
		        <select id="car_carbrand" name="car_carbrand">
		             <option value=""></option>
		           	<c:forEach items="${dict.crm_carModel$}" var="var">				
		           		<option value="${var.key}">${var.value}</option>			
		           	</c:forEach>
		         </select>
		      </td>
		      <td class="colName">车系:</td>
		      <td class="detailColVal">
		        <select id="parent_code" name="parent_code">
		        </select>
		      </td>
	     	<!-- 
		    <td class="colName">车型:</td>
            <td class="detailColVal">
             	<div id="tupian" class="detailColVal">
             	<script type="text/javascript">
			  	 	jQuery(function(){
						tupian("tupian",2);
					});
					  	function tupian(tupian,pinyin){
					  	 	jQuery.post("<%=request.getContextPath() %>/crm::/dictModule/action/QueryCarDate.action",{'pinyin':pinyin},
							function(json,textStatus){
								var num = json.result.length;
						       	var	codef ='<select name="parent_code" id="parent_code">';
						       		codef +='<option value=""></option>';
							       	for(i=0; i<num;i++){
								       	var rowi = json.result[i];
								       	codef +='<option value="'+rowi.code+'">'+rowi.value+'</option>';
							       	}
						       	codef +='</select>';
								jQuery("#"+tupian).html(codef);
							},"json");
						}
				  </script>	
				  </div>
	        </td>
	         -->
		    <td class="colName">车型编号:</td>
		    <td class="detailColVal">
				<input type="text" name="code" id="code"/>
			</td>
		    <td class="colName">车型名称:</td>
		    <td class="detailColVal">
		      	 <input type="text" name="value" id="value"/>
		      	 <input type="hidden" name="type" id="type" value="crm_carModel"/>
		      	 <input type="hidden" name="pinyin" id="pinyin" value="3"/>
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
