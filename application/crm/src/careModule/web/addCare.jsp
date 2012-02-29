<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增养护</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/selectDict.js"></script> 
<script type="text/javascript">
$(function(){
	$('#careitems').selectDict({type:'crm_careItemName',id:'careitems'});
	$('#care_carestaff').selectDict({type:'crm_waiter',id:'care_carestaff',value:'${param.carestaff}'});
	$('#care_carvin').focus();
	$("#careitems").bind("change",function(){
		var value = $(this).val();
		var text = $(this).find("option:selected").text();
		var price = $(this).find("option:selected").attr('title');
		var careitems = "";
		$('input[name=care_careitems]').each(function(){
			careitems += $(this).val() + ",";
		});

		if(careitems.indexOf(value)<0){
			$('#tb').append('<tr class="rowClass" id="'+value+'"><td>养护品名称:<input type="text" name="careitemnames" value="'
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
	
	//控制数字输入
	$('#care_carebucketnum').autoNumeric({mDec:0});
	$('input[name=""bucketnum]').autoNumeric({mDec:0});
	
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

function remove(value,text,price){
    //$("#careitems").append('<option title="'+price+'" value="'+value+'">'+text+'</option>');
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

function parseNum(value){
   	if(value!=""){
   	    return new Number(value);
   	}else{
   		return new Number(0);
	}
}
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/careModule/action/AddCare.action?startIndex=0&endIndex=9">
<fieldset>
<legend>新增养护</legend>
<table cellspacing="10" cellpadding="0">
    <tr>
      <td class="colName">车架号:</td>
      <td class="detailColVal">
          <input type="text" name="care_carvin" id="care_carvin" value="${param.carvin}"/>
	  </td>
      <td class="colName">工单号:</td>
      <td class="detailColVal">
         <input type="text" name="care_careorderid" id="care_careorderid" value="${param.careorderid}"/>
	  </td>
      <td class="colName">养护进厂时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="care_careintime" id="care_careintime" value="${param.careintime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">养护接待:</td>
      <td class="detailColVal">
      	 <select id="care_carestaff" name="care_carestaff">
         </select>
	  </td>
     
      <td class="colName">养护桶数:</td>
      <td class="detailColVal">
          <input type="text" name="care_carebucketnum" id="care_carebucketnum" class="auto"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">养护消费:</td>
      <td class="detailColVal">
          <input type="text" name="care_careexpense" id="care_careexpense" class="auto"/>
	  </td>
	  <td class="colName">养护出厂时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="care_careouttime" id="care_careouttime" value="${param.careouttime}" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr>
      <td class="colName">养护项目:</td>
      <td class="detailColVal" colspan="5">
         <select name="careitems" id="careitems"></select>
	  </td>
    </tr>
  </table>
  <div style="border:1px solid #ccf;width:90%;margin-left:8%;margin-top:2px;">
  	<table id="tb" cellspacing="3" cellpadding="0">
  	</table>
  </div>
  <div style="text-align:center;">
	  <table style="width:380px;margin:auto;">
	  	<tr class="rowClass">
	  	<td style="width:120px;"><input type="submit" style="background-color:#ccc;width:120px;cursor:pointer;" value="确定"/></td>
	  	<td style="width:120px;"><input type="reset"  style="background-color:#ccc;width:120px;cursor:pointer;" value="重置"/></td>
	  	<td style="width:120px;"><input type="button" style="background-color:#ccc;width:120px;cursor:pointer;" onclick="window.location.href='${pageContext.request.contextPath}/crm::/careModule/action/QueryCareList.action?startIndex=0&endIndex=9'"value="返回"/></td>
	  	</tr>
	  </table>
  </div>
  </fieldset>
  </form>
  </div>
</body>
</html>
