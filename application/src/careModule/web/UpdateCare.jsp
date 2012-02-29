<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改养护信息</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
$(function(){
	 $('#selcareitems').selectDict({type:'crm_careItemName',id:'selcareitems'});
	 $('#care_carestaff').selectDict({type:'crm_waiter',id:'care_carestaff',value:'${CareDate.carestaff}'});
	 
	 $('input[name=""bucketnum]').autoNumeric({mDec:0});
	 $('#care_carebucketnum').autoNumeric({mDec:0}); 
	  $('.auto').bind('blur',function(){
	  	 var num = 0;
   		 $("input[name='bucketnum']").each(function(){
   			num += parseNum($(this).val());
   			var p = $(this).parent().prev("td").prev("td").find("input[name=dj]").val();
   			var pc = $(this).parent().prev("td").prev("td").find("input[name=price]");
   			$(pc).val((parseNum($(this).val())*parseNum(p)).toFixed(2));
	     })
	     $('#care_carebucketnum').val(num);
	     
	     var expense=0;
    	 $("input[name='sjprice']").each(function() { 
   			expense += parseNum($(this).val());
	     })
	     $('#care_careexpense').val(expense);
	    
     });
	     
	$("#selcareitems").bind("change",function(){
		var value = $(this).val();
		var text = $(this).find("option:selected").text();
		var price = $(this).find("option:selected").attr('title');
		var careitems = "";
		$('input[name=care_careitems]').each(function(){
			careitems += $(this).val() + ",";
		});
	  	if(careitems.indexOf(value)<0){
	  		$('#tb').append('<tr class="rowClass" id="'+value+'"><td>养护品:<input type="text" name="careitemnames" value="'
			+text+'"/></td><td>价格:<input type="text" name="price" value="'+price+'" class="auto"/><input type="hidden" value="'+value+'" name="care_careitems"><input type="hidden" name="dj" value="'+price+'"></td>'
			//jyb start
			+'<td>实际价格:<input type="text" name="sjprice" value="'+price+'" class="auto"/></td>'
			//jyb end
			+'<td>桶数:<input type="text" name="bucketnum" value="1" class="auto"/></td>'+'<td><div class="delete"><a href="javascript:remove(\''+value+'\',\''+text+'\',\''+price+'\');">移除</a></div></td>'
			+'</tr>');
			//$(this).find("option:selected").remove();
		}
		 $('.auto').bind('blur',function(){
	     	 var num = 0;
	   		 $("input[name='bucketnum']").each(function(){
	   			num += parseNum($(this).val());
	   			var p = $(this).parent().prev("td").prev("td").find("input[name=dj]").val();
	   			var pc = $(this).parent().prev("td").prev("td").find("input[name=price]");
	   			$(pc).val((parseNum($(this).val())*parseNum(p)).toFixed(2));
		     })
		     $('#care_carebucketnum').val(num);
		     
		     var expense=0;
	    	 $("input[name='sjprice']").each(function() { 
	   			expense += parseNum($(this).val());
		     })
		     $('#care_careexpense').val(expense);
		});   
		 $('#care_carebucketnum').focus().blur();
		
	})
	
	function parseNum(value){
    	if(value!=""){
    	    return new Number(value);
    	}else{
    		return new Number(0);
    	}
    }
	
	//校验
	$('#crmform').saturnValidate({
		rules:{
			care_carvin:{
				required: true,
				maxlength: 17
			},
			care_careorderid:{
				required: true,
				maxlength: 20
			}
		},
		messages:{
		}
	})
});

function parseNum(value){
   	if(value!=""){
   	    return new Number(value);
   	}else{
   		return new Number(0);
   	}
}

function goBack(){
	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/careModule/action/QueryCareList.action';
    document.getElementById('hiddenForm').submit();
}

function remove(value,text,price,careitemid){
	if(careitemid!=undefined){
		$.post("<%=request.getContextPath()%>/crm::/careModule/action/DeleteCareItem.action", 
       {careitemid: careitemid},
       function(json, textStatus){}, 
       "json");
	}
     //$("#selcareitems").append('<option title="'+price+'" value="'+value+'">'+text+'</option>');
     $('#'+value).remove();
	 
	 var num=0;
 	 $("input[name='bucketnum']").each(function(){
		num += parseNum($(this).val());
		var p = $(this).parent().prev("td").prev("td").find("input[name=dj]").val();
		var pc = $(this).parent().prev("td").prev("td").find("input[name=price]");
		$(pc).val((parseNum($(this).val())*parseNum(p)).toFixed(2));
     })
     $('#care_carebucketnum').val(num);
     
     var expense=0;
   	 $("input[name='sjprice']").each(function() { 
  			expense += parseNum($(this).val());
     })
     $('#care_careexpense').val(expense);
}
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/careModule/action/UpdateCare.action">
<fieldset>
<legend>修改养护信息</legend>
<table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
      	  <input type="hidden" name="care_careid" id="care_carid" value="${CareDate.careid}"/>
          <input type="text" name="care_carvin" id="care_carvin" value="${CareDate.carvin}"/>
	  </td>
      <td class="colName">工单号:</td>
      <td class="detailColVal">
         <input type="text" name="care_careorderid" id="care_careorderid" value="${CareDate.careorderid}"/>
	  </td>
      <td class="colName">养护进厂时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="care_careintime" id="care_careintime"  onfocus="dayCalender(this)" class="Wdate" value="${CareDate.careintime}"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">养护接待:</td>
      <td class="detailColVal">
      <select name="care_carestaff" id="care_carestaff"></select>
	  </td>
      <td class="colName">养护消费:</td>
      <td class="detailColVal">
          <input type="text" name="care_careexpense" id="care_careexpense" class="auto" value="${CareDate.careexpense}" class="auto"/>
	  </td>
      <td class="colName">养护桶数:</td>
      <td class="detailColVal">
          <input type="text" name="care_carebucketnum" id="care_carebucketnum" value="${CareDate.carebucketnum}" class="auto"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">养护项目:</td>
      <td class="detailColVal">
         <select name="selcareitems" id="selcareitems"></select>
        <input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="min_careintime" value="${min_careintime}">
		<input type="hidden" name="max_careintime" value="${max_careintime}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="min_careouttime" value="${min_careouttime}">
		<input type="hidden" name="max_careouttime" value="${max_careouttime}">
		<input type="hidden" name="carestaff" value="${carestaff}">
		<input type="hidden" name="careitems" value="${careitems}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" name="pageValue" value='${pageValue}'>
	  </td>
	  <td class="colName">养护出厂时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="care_careouttime" id="care_careouttime"  onfocus="dayCalender(this)" class="Wdate" value="${CareDate.careouttime}"/>
	  </td>
    </tr>
  </table>
  <div style="border:1px solid #ccf;width:90%;margin-left:8%;margin-top:2px;">
  	<table id="tb" cellspacing="3" cellpadding="0">
  		 <c:forEach items="${careItems}" var="var" varStatus="state">
  		 	<tr class="rowClass" id="${var.careitemname}">
	  		 	<td>养护品:<input type="text" name="careitemnames" value="${var.careitemname_dict}"/><input type="hidden" name="care_careitems" value="${var.careitemname}"/></td>
	  		 	<td>价格:<input type="text" id="p_${state.index}" name="price" value="${var.price}" class="auto"/><input type="hidden" name="dj" value="${var.unitprice}"/></td>
	  		 	<td>实际价格:<input type="text" id="p_${state.index}" name="sjprice" value="${var.sjprice}" class="auto"/></td>
				<td>桶数:<input type="text" id="b_${state.index}" name="bucketnum" value="${var.bucketnum}" class="auto"/></td>
				<td>
					<div class="delete"><a href="javascript:remove('${var.careitemname}','${var.careitemname_dict}','${var.price}','${var.careitemid}');">移除</a></div>
				</td>
		    </tr>
  		 </c:forEach>
  	</table>
  </div>
   <div style="text-align:center;">
	  <table style="width:380px;margin:auto;">
	  	<tr class="rowClass">
	  	<td style="width:120px;"><input type="submit" style="background-color:#ccc;width:120px;cursor:pointer;" value="确定"/></td>
	  	<td style="width:120px;"><input type="reset"  style="background-color:#ccc;width:120px;cursor:pointer;" value="重置"/></td>
	  	<td style="width:120px;"><input type="button" style="background-color:#ccc;width:120px;cursor:pointer;" onclick="javascript:goBack();" value="返回"/></td>
	  	</tr>
	  </table>
  </div>
  </fieldset>
  </form>
  </div>
  <div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="min_careintime" value="${min_careintime}">
		<input type="hidden" name="max_careintime" value="${max_careintime}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="min_careouttime" value="${min_careouttime}">
		<input type="hidden" name="max_careouttime" value="${max_careouttime}">
		<input type="hidden" name="carestaff" value="${carestaff}">
		<input type="hidden" name="careitems" value="${careitems}">
		<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
		<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
		<input type="hidden" id="pageValue" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
