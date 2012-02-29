<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增车辆档案</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() { 
			$('#car_carseller').selectDict({type:'crm_waiter',id:'car_carseller'});
			//级联
			$('#crmform').saturnRelationSelect({
					levels:['car_carbrand', 'car_carseries','car_carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}','${carmodel}']
			});
			
			//控制数字输入
			$('#car_carfmaintainmile').autoNumeric({mDec:0});
			$('#car_carsrepairmile').autoNumeric({mDec:0});
			$('#cstm_cstmincome').autoNumeric({mDec:0});
			
			$('#contentTb2').quickKey();
			$('#contentTb1').quickKey();
			
			$('#car_carvin').bind("blur",function(){
				var year = ['2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015'];
				var model = ['1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];
				var vin = $(this).val();
				var carYear = '';
				if(vin.length==17){
					var modelYear = vin.charAt(9).toUpperCase();;
					for(var i=0;i<model.length;i++){
						if(model[i]==modelYear){
							carYear = year[i];
							break;
						}
					}
				}
				$('#car_caryearstyle').val(carYear);
			});
			$('#crmform').saturnValidate({
				rules:{
					car_carcardid:{
						required: true,
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
						    type:'post',
						    data: {
						    	fullkey:'http://crm/coreModule/data::crm_car',
						        carcardid: function () {
						            return $('#car_carcardid').val();
						        }
						    }
							
						}
					//	,
					//	maxlength: 12
					},
					car_carcreatetime:{
						required: true 
					},
					car_carcardlevel:{
						required: true 
					},
					car_carvin:{
						//checkUnique:'http://crm/coreModule/data::crm_car',
						remote:{
						    url: '${pageContext.request.contextPath}/crm::/coreModule/action/CheckUnique.action',
						    type:'post',
						    data: {
						    	fullkey:'http://crm/coreModule/data::crm_car',
						        carvin: function () {
						            return $('#car_carvin').val();
						        }
						    }
							
						},
						required: true,
						maxlength: 17
					},
					car_carbrand:{
						required: true
					},
					car_carseries:{
						required: true
					},
					car_cararea:{
						required: true
					},    
					car_carusertype:{
						//required: true
					},
					car_carsource:{
						required: true
					},
					car_carengineno:{
						maxlength: 20
					},
					car_cartransmno:{
						maxlength: 20
					},
					car_carkeyno:{
						maxlength: 20
					},
					car_carothershopinfo:{
						maxlength: 30
					},
					car_carlicenceno:{
						maxlength: 20
					},
					car_caroldlicenceno:{
						maxlength: 100
					},
					cstm_cstmname:{
						required: true,
						maxlength: 45
					},
					cstm_cstmdoctype:{
						maxlength: 20
					},
					cstm_cstmdoctype:{
						maxlength: 20
					},
					cstm_cstmtel:{
						//isPhone:true
					},
					cstm_cstmmobile:{
						//isMobile:true
					},
					cstm_cstmzipcode:{
					    //isZipCode:true
					},
					cstm_cstmaddress:{
						maxlength: 150
					},
					cstm_cstmaddress:{
						maxlength: 150
					},
					cstm_cstmcompany:{
						maxlength: 150
					},
					cstm_cstmpost:{
						maxlength: 150
					},
					cstm_cstmemail:{
						//email: true
					},
					cstm_cstmqq:{
						maxlength: 20
					},
					cstm_cstmqq:{
						maxlength: 20
					},
					cstm_cstmcontact:{
						required: true,
						maxlength: 45
					},
					cstm_cstmcontmobile:{
						//isMobile:true
					},
					cstm_cstmconttel:{
						//isPhone:true
					},
					cstm_cstmfavorite:{
						maxlength: 300
					},
					cstm_cstmfavorite:{
						maxlength: 1000
					},
					cstm_cstmnotes:{
						maxlength: 1000
					},
					cstm_cstmother:{
						maxlength: 5000
					},
					car_carcolor:{
						maxlength: 20
					}
				},
				messages:{
					car_carvin:{
						remote:"VIN已经存在"
					},
					car_carcardid:{
						remote:"档案编号已经存在"
					}
				}
			});
			
		});
</script> 
<script type="text/javascript">
function changeVal(){
	if('104004'==$('#car_carbrand').val()){
		valu2();
	}else{
		valu1();
	}
}
function valu1(){
//校验
$('#car_carcreatetime').rules("add","required");
$('#car_carcardlevel').rules("add","required");
$('#car_carseries').rules("add","required");
$('#car_cararea').rules("add","required");
//$('#car_carusertype').rules("add","required");
$('#car_carsource').rules("add","required");
$('#cstm_cstmname').rules("add","required");
//$('#cstm_cstmtel').rules("add","required");
//$('#cstm_cstmmobile').rules("add","required");
//$('#cstm_cstmzipcode').rules("add","required");
//$('#cstm_cstmemail').rules("add","required");
$('#cstm_cstmcontact').rules("add","required");
//$('#cstm_cstmcontmobile').rules("add","required");
//$('#cstm_cstmconttel').rules("add","required");
}
function valu2(){
//校验
$('#car_carcreatetime').rules("remove","required");
$('#car_carcardlevel').rules("remove","required");
$('#car_carseries').rules("remove","required");
$('#car_cararea').rules("remove","required");
//$('#car_carusertype').rules("remove","required");
$('#car_carsource').rules("remove","required");
$('#cstm_cstmname').rules("remove","required");
//$('#cstm_cstmtel').rules("remove","required");
//$('#cstm_cstmmobile').rules("remove","required");
//$('#cstm_cstmzipcode').rules("remove","required");
//$('#cstm_cstmemail').rules("remove","required");
$('#cstm_cstmcontact').rules("remove","required");
//$('#cstm_cstmcontmobile').rules("remove","required");
//$('#cstm_cstmconttel').rules("remove","required");
}
</script>
<script type="text/javascript">
	function changeShop(ty){
		if(ty=='1'){
			$("#car_carformshop").val("长春正泰");
			$("#car_carformshop").attr("style","background-color: #ccc;");
			$("#car_carformshop").attr("readonly","readonly");
			$("#car_caristhis1").attr("checked","checked");
			$("#car_caristhis2").removeAttr("checked");
		}else{
			$("#car_carformshop").val("");
			$("#car_carformshop").attr("style","background-color: #fff;");
			$("#car_carformshop").removeAttr("readonly");
			$("#car_caristhis1").removeAttr("checked");
			$("#car_caristhis2").attr("checked","checked");
		}
	}
</script>
</head>
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/carModule/action/AddCar.action?startIndex=0&endIndex=9">
<fieldset>
<legend>新增车辆档案</legend>
<table id="contentTb1" cellspacing="3" cellpadding="0">
	<%
	        //currentTimeMillis返回以毫秒为单位的当前时间
	  Date myDate = new Date(System.currentTimeMillis());
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	  SimpleDateFormat sdfa = new SimpleDateFormat("yyyyMMdd HHmmss");
	  String time =sdf.format(myDate);
	  String num = sdfa.format(myDate);
	  	while(num.indexOf(" ")!=-1){
		  num=num.replace(" ","");
		}
	%>
	<tr class="rowClass">
      <td class="colName"><span>*</span>是否本店购车:</td>
      <td class="detailColVal">
          <input type="radio" name="car_caristhis" id="car_caristhis1" value="1" checked="checked" onclick="javascript:changeShop(1);"/><label for="car_caristhis1" onclick="javascript:changeShop(1);">是</label>
          <input type="radio" name="car_caristhis" id="car_caristhis2" value="2" onclick="javascript:changeShop(2);"/><label for="car_caristhis2" onclick="javascript:changeShop(2);">否</label>
	  </td>
      <td class="detailColVal" colspan="2">
          <input type="text" name="car_carformshop" id="car_carformshop" value="长春正泰" readonly="readonly" style="background-color: #ccc;"/>
	  </td>
      <td class="colName">&nbsp;</td>
      <td class="detailColVal">
      	&nbsp;
	  </td>
	  <td class="colName">&nbsp;</td>
      <td class="detailColVal">
      	&nbsp;
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName"><span>*</span>档案编号:</td>
      <td class="detailColVal">
          <input type="text" name="car_carcardid" id="car_carcardid" value="<%=num %>"/>
	  </td>
      <td class="colName"><span>*</span>建档时间:</td>
      <td class="detailColVal">
          <input type="text" name="car_carcreatetime" id="car_carcreatetime" onfocus="dayCalender(this)" class="Wdate" value="<%=time %>"/>
	  </td>
      <td class="colName"><span>*</span>档案级别:</td>
      <td class="detailColVal">
      	<select id="car_carcardlevel" name="car_carcardlevel">
            <option value=""></option>
           	<c:forEach items="${dict.crm_cardLevel$}" var="var">				
           		<option value="${var.key}">${var.value}</option>		
           	</c:forEach>
         </select>
	  </td>
	  <td class="colName">销售顾问:</td>
      <td class="detailColVal">
      	<select id="car_carseller" name="car_carseller"></select>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName"><span>*</span>车架号:</td>
      <td class="detailColVal">
          <input type="text" name="car_carvin" id="car_carvin" />
	  </td>
      <td class="colName">车牌号:</td>
      <td class="detailColVal">
          <input type="text" name="car_carlicenceno" id="car_carlicenceno"/>
	  </td>
	  <td class="colName">曾用车牌:</td>
      <td class="detailColVal">
          <input type="text" name="car_caroldlicenceno" id="car_caroldlicenceno" />
	  </td>
	  <td class="colName">上牌日期:</td>
      <td class="detailColVal">
          <input type="text" name="car_carregistdate" id="car_carregistdate" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">发动机号:</td>
      <td class="detailColVal">
          <input type="text" name="car_carengineno" id="car_carengineno"/>
	  </td>
      <td class="colName">变速箱号:</td>
      <td class="detailColVal">
          <input type="text" name="car_cartransmno" id="car_cartransmno"/>
	  </td>
	   <td class="colName">钥匙号:</td>
      <td class="detailColVal">
          <input type="text" name="car_carkeyno" id="car_carkeyno"/>
	  </td>
      <td class="colName">车色:</td>
      <td class="detailColVal">
          <input type="text" name="car_carcolor" id="car_carcolor"/>
	  </td>
    </tr>
    <tr class="rowClass">
	    <td class="colName"><span>*</span>车辆来源:</td>
      	<td class="detailColVal">
	      	<select id="car_carsource" name="car_carsource">
               	<option value=""></option>
            	<c:forEach items="${dict.crm_carSource$}" var="var">				
            		<option value="${var.key}">${var.value}</option>			
            	</c:forEach>
	        </select>
	  	</td>
	      <td class="colName">品牌:</td>
	      <td class="detailColVal">
	        <select id="car_carbrand" name="car_carbrand" onchange="changeVal();">
	             <option value=""></option>
	           	<c:forEach items="${dict.crm_carModel$}" var="var">				
	           		<option value="${var.key}">${var.value}</option>			
	           	</c:forEach>
	         </select>
	      </td>
	      <td class="colName">车系:</td>
	      <td class="detailColVal">
	        <select id="car_carseries" name="car_carseries">
	        </select>
	      </td>
	      <td class="colName">车型:</td>
	      <td class="detailColVal">
	        <select id="car_carmodel" name="car_carmodel">
	        </select>
	      </td>
	</tr>
    <tr class="rowClass">
      <td class="colName">它店信息:</td>
      <td class="detailColVal">
          <input type="text" name="car_carothershopinfo" id="car_carothershopinfo"/>
	  </td>
      <td class="colName">销售日期:</td>
      <td class="detailColVal">
          <input type="text" name="car_carselldate" id="car_carselldate" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
      <td class="colName">年款:</td>
      <td class="detailColVal">
      		<input type="text" name="car_caryearstyle" id="car_caryearstyle"/>
	  </td>
	  <td class="colName"><span>*</span>地区:</td>
      <td class="detailColVal">
      	<select id="car_cararea" name="car_cararea">
             <option value=""></option>
             	<c:forEach items="${dict.crm_carArea$}" var="var">				
             		<option value="${var.key}">${var.value}</option>			
             	</c:forEach>
         </select>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">车辆类别:</td>
      <td class="detailColVal">
      	<select id="car_carownership" name="car_carownership">
             <option value=""></option>
             	<c:forEach items="${dict.crm_carType$}" var="var">				
             		<option value="${var.key}">${var.value}			
             	</c:forEach>
         </select>
	  </td>
      <td class="colName">车店距离:</td>
      <td class="detailColVal">
      	<select id="car_carshoprange" name="car_carshoprange">
             <option value=""></option>
             	<c:forEach items="${dict.crm_shopRange$}" var="var">				
             		<option value="${var.key}">${var.value}</option>			
             	</c:forEach>
         </select>
	  </td>
	  <td class="colName">首保时间:</td>
      <td class="detailColVal">
          <input type="text" name="car_carfmaintaintime" id="car_carfmaintaintime" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
      <td class="colName">首保公里:</td>
      <td class="detailColVal">
          <input type="text" name="car_carfmaintainmile" id="car_carfmaintainmile"/>
	  </td>
    </tr>
      <tr class="rowClass">     
      <td class="colName">预计下保日期:</td>
      <td class="detailColVal">
          <input type="text" name="car_carnmaintaintime" id="car_carnmaintaintime" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
      <td class="colName">预计下保里程:</td>
      <td class="detailColVal">
          <input type="text" name="car_carnmaintainmile" id="car_carnmaintainmile"/>
	  </td>
    </tr>
  </table>
  </fieldset>
  <fieldset>
    <legend>新增客户</legend>
    <table id="contentTb2" cellspacing="3" cellpadding="0">
    <tr class="rowClass">
      <td class="colName"><span>*</span>车主姓名:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmname" id="cstm_cstmname" />
	  </td>
      <td class="colName">车主性别:</td>
      <td class="detailColVal">
          <select id="cstm_cstmsex" name="cstm_cstmsex" >
        	<option value=""></option>
            <c:forEach items="${dict.crm_sex}" var="var">				
           		<option value="${var.key}">${var.value}			
           	</c:forEach>
        </select>
	  </td>
     <td class="colName">出生日期:</td>
     <td class="detailColVal">
      	 <input type="text" name="cstm_cstmbirthday" id="cstm_cstmbirthday" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
	  <td class="colName">证件类别:</td>
      <td class="detailColVal">
      	<select id="cstm_cstmdoctype" name="cstm_cstmdoctype" >
        <option value=""></option>
           <c:forEach items="${dict.crm_docType$}" var="var">				
           		<option value="${var.key}">${var.value}</option>			
           	</c:forEach>
        </select>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">证件号码:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmdocno" id="cstm_cstmdocno"/>
	  </td>
      <td class="colName">固定电话:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmtel" id="cstm_cstmtel" />
	  </td>
      <td class="colName">手机:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmmobile" id="cstm_cstmmobile" />
	  </td>
      <td class="colName">邮编:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmzipcode" id="cstm_cstmzipcode"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">详细地址:</td>
      <td class="detailColVal" colspan="3">
          <input name="cstm_cstmaddress" id="cstm_cstmaddress" style="width:100%;"/>
	  </td>
       <td class="colName">单位性质:</td>
      <td class="detailColVal">
      	<select name="cstm_cstmcompnature" id="cstm_cstmcompnature" >
        	<option value=""></option>
            <c:forEach items="${dict.crm_compNature}" var="var">				
           		<option value="${var.key}">${var.value}			
           	</c:forEach>
        </select>
	  </td>
	  <td class="colName">所属行业:</td>
      <td class="detailColVal">
      	<select name="cstm_cstmcompindustry" id="cstm_cstmcompindustry" >
        	<option value=""></option>
            <c:forEach items="${dict.crm_compIndust}" var="var">				
           		<option value="${var.key}">${var.value}			
           	</c:forEach>
        </select>
	  </td>
    </tr>
    <tr class="rowClass">
     <td class="colName">工作单位:</td>
     <td class="detailColVal" colspan="3">
          <input type="text" name="cstm_cstmcompany" id="cstm_cstmcompany" style="width:100%;"/>
	  </td>  
	  <td class="colName">职务:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmpost" id="cstm_cstmpost"/>
	  </td>
      <td class="colName">婚姻状况:</td>
      <td class="detailColVal">
          <select name="cstm_cstmmarriage" id="cstm_cstmmarriage" >
        	<option value=""></option>
           <c:forEach items="${dict.crm_marriage}" var="var">				
           		<option value="${var.key}">${var.value}			
           	</c:forEach>
        </select>
	  </td> 
    </tr>
    <tr class="rowClass">  
     <td class="colName">学历:</td>
     <td class="detailColVal">
      	<select name="cstm_cstmeducation" id="cstm_cstmeducation" >
        	<option value=""></option>
            <c:forEach items="${dict.crm_education}" var="var">				
           		<option value="${var.key}">${var.value}			
           	</c:forEach>
        </select>
	  </td>
	  <td class="colName">家庭收入:</td>
      <td class="detailColVal">
      	<input type="text" name="cstm_cstmincome" id="cstm_cstmincome" />
	  </td>
	  <td class="colName">Email:</td>
      <td class="detailColVal">
      	<input type="text" name="cstm_cstmemail" id="cstm_cstmemail" />
	  </td>
	  <td class="colName">QQ:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmqq" id="cstm_cstmqq" />
	  </td>
    </tr>
    <tr class="rowClass">
	  <td class="colName">驾驶证下发日:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmcarlicensedate" id="cstm_cstmcarlicensedate" onfocus="dayCalender(this)" class="Wdate"/>
	  </td>
      <td class="colName"><span>*</span>联系人:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmcontact" id="cstm_cstmcontact"/>
	  </td>
	  <td class="colName">联系人性别:</td>
       <td class="detailColVal">
      	  <select id="cstm_cstmcontsex" name="cstm_cstmcontsex" >
        	<option value=""></option>
             <c:forEach items="${dict.crm_sex}" var="var">				
           		<option value="${var.key}">${var.value}			
           	</c:forEach>
          </select>
	   </td>
      <td class="colName">联系人电话:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmconttel" id="cstm_cstmconttel" />
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">联系人手机:</td>
      <td class="detailColVal">
          <input type="text" name="cstm_cstmcontmobile" id="cstm_cstmcontmobile" />
	  </td>
      <td class="colName">联系人地址:</td>
      <td class="detailColVal" colspan="2">
      	<input type="text" name="cstm_cstmcontaddr" id="cstm_cstmcontaddr" style="width:100%;"/>
	  </td>
	  <td class="colName">车主爱好:</td>
      <td class="detailColVal" colspan="2">
      	<input type="text" name="cstm_cstmfavorite" id="cstm_cstmfavorite" style="width:100%;"/>
	  </td>
     </tr>
     <tr>
      <td class="colName">备注:</td>
      <td class="detailColVal" colspan="3">
      	<textarea name="cstm_cstmnotes" id="cstm_cstmnotes" style="width:100%;height:80px;"></textarea>
	  </td>
      <td class="colName">其他联系方式:</td>
      <td class="detailColVal" colspan="3">
      	<textarea name="cstm_cstmother" id="cstm_cstmother" style="width:100%;height:80px;"></textarea>
	  </td>
      </tr>
    <tr class="rowClass">
    	<td class="buttonCol" colspan="8">
          <div>
              <input type="submit" value="确定"/>
              <input type="reset" value="重置"/>
              <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action?startIndex=0&endIndex=9'" value="返回"/>
          </div>
      </td>
    </tr>
  </table>
  </fieldset>
  </form>
  </div>
</body>
</html>
