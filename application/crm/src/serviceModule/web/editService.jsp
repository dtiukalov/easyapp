<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改维修</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%> 
<style>
.disable{background-color:#ccc;}
</style>
<script type="text/javascript">
	$(function() { 
		$('#serv_servstaff').selectDict({type:'crm_waiter',id:'serv_servstaff',value:'${result.servstaff}'});
		$('#serv_servmetalworker').selectDict({type:'crm_worker',id:'serv_servmetalworker',value:'${result.servmetalworker}'});
		$('#serv_servpaintworker').selectDict({type:'crm_worker',id:'serv_servpaintworker',value:'${result.servpaintworker}'});
		$('#serv_servelecworker').selectDict({type:'crm_worker',id:'serv_servelecworker',value:'${result.servelecworker}'});
		
		$('#tab-title div').click(function(){
			$(this).addClass("selected").siblings().removeClass();
			$("#tab-content > ul").eq($('#tab-title div').index(this)).show().siblings().hide();
		});
		//控制数字输入
		$('#serv_servkilometer').autoNumeric({mDec:0});
		$('#mile_carfmaintainmile').autoNumeric({mDec:0});
		$('#mile_carlmaintainmile').autoNumeric({mDec:0});
		$('#mile_carnmaintainmile').autoNumeric({mDec:0});
		$('#mile_servmaintainmile').autoNumeric({mDec:0});
		$('#jybignum').autoNumeric({mDec:0});
		$('#jysmallnum').autoNumeric({mDec:0});
		$('#man_zone').quickKey();
		$('#updateMileBtn').css('background-color','red');
		$('#addjyBtn').css('background-color','red');
		servChange();
		getMaintainInfo();
		$('#serv_servpartsexp').focus().blur();
		$('#serv_servkilometer').focus().blur();
	});
	
	$(function(){    
		function getExp(exp,reb,membreb){
			var tolExp = $('#'+exp).val();
			var RebExp = $('#'+reb).val();
			var MembrebExp = $('#'+membreb).val();
			return parseNum(tolExp) - parseNum(RebExp) - parseNum(MembrebExp);
		}
		
		$('input[type=radio]').bind('click',function(){
			$(this).parent().parent().find('input[type=text]').attr('disabled',true).css('background-color','#ccc');
			$(this).parent().next('td').find('input').attr('disabled',false).css('background-color','#fff');
			var jy = $("input[name='jytype']:checked").val();
			if(jy!=''){
				var nextMile = new Number($('#serv_servkilometer').val()||0);
				if(jy=='180001'){
					$('#mile_carnmaintainmile').val(nextMile + 8000);
				}else{
					$('#mile_carnmaintainmile').val(nextMile + 5000);
				}
			}
		});
	    
	    $('.auto').bind('blur',function(){
			var db_gh = getExp('db_servhoursexp','db_servhoursreb','db_servhoursmembreb');
			var db_lj =  getExp('db_servpartsexp','db_servpartsreb','db_servpartsmembreb');
			$('#db_servrepairexp').val((db_gh + db_lj).toFixed(2));
			$('#db_repairexp').val(db_gh.toFixed(2));
			$('#db_partsexp').val(db_lj.toFixed(2));
			
			var bp_gh = getExp('bp_servhoursexp','bp_servhoursreb','bp_servhoursmembreb');
			var bp_lj =  getExp('bp_servpartsexp','bp_servpartsreb','bp_servpartsmembreb');
			$('#bp_servrepairexp').val((bp_gh + bp_lj).toFixed(2));
			$('#bp_repairexp').val(bp_gh.toFixed(2));
			$('#bp_partsexp').val(bp_lj.toFixed(2));
			
			var yb_gh = getExp('yb_servhoursexp','yb_servhoursreb','yb_servhoursmembreb');
			var yb_lj =  getExp('yb_servpartsexp','yb_servpartsreb','yb_servpartsmembreb');
			$('#yb_servrepairexp').val((yb_gh + yb_lj).toFixed(2));
			$('#yb_repairexp').val(yb_gh.toFixed(2));
			$('#yb_partsexp').val(yb_lj.toFixed(2));
			
			var sb_gh = getExp('sb_servhoursexp','sb_servhoursreb','sb_servhoursmembreb');
			var sb_lj =  getExp('sb_servpartsexp','sb_servpartsreb','sb_servpartsmembreb');
			$('#sb_servrepairexp').val((sb_gh + sb_lj).toFixed(2));
			$('#sb_repairexp').val(sb_gh.toFixed(2));
			$('#sb_partsexp').val(sb_lj.toFixed(2));
			
			var bx_gh = getExp('bx_servhoursexp','bx_servhoursreb','bx_servhoursmembreb');
			var bx_lj = getExp('bx_servpartsexp','bx_servpartsreb','bx_servpartsmembreb');
			$('#bx_servrepairexp').val((bx_gh + bx_lj).toFixed(2));
			$('#bx_repairexp').val(bx_gh.toFixed(2));
			$('#bx_partsexp').val(bx_lj.toFixed(2));
			
			var sg_gh = getExp('sg_servhoursexp','sg_servhoursreb','sg_servhoursmembreb');
			var sg_lj = getExp('sg_servpartsexp','sg_servpartsreb','sg_servpartsmembreb');
			$('#sg_servinsureexp').val((sg_gh + sg_lj).toFixed(2));
			$('#sg_repairexp').val(sg_gh.toFixed(2));
			$('#sg_partsexp').val(sg_lj.toFixed(2));
			
			//总工时费用
			var serv_servhoursexp = db_gh + bp_gh + yb_gh + sb_gh + bx_gh + sg_gh;
			$('#serv_servhoursexp').val(serv_servhoursexp.toFixed(2));
			//总零件
			var serv_servpartsexp = db_lj + bp_lj + yb_lj + sb_lj + bx_lj + sg_lj;
			$('#serv_servpartsexp').val(serv_servpartsexp.toFixed(2));
			//总优惠券
			var db_servticketexp = parseNum($('#db_servticketexp').val());
			var yb_servticketexp = parseNum($('#yb_servticketexp').val());
			var sb_servticketexp = parseNum($('#sb_servticketexp').val());
			var bx_servticketexp = parseNum($('#bx_servticketexp').val());
			var bp_servticketexp = parseNum($('#bp_servticketexp').val());
			var sg_servticketexp = parseNum($('#sg_servticketexp').val());	
			var serv_servticketexp = db_servticketexp + yb_servticketexp + sb_servticketexp + bx_servticketexp + sg_servticketexp + bp_servticketexp;
			$('#serv_servticketexp').val(serv_servticketexp.toFixed(2));
			//总消费
			var serv_servamountexp = serv_servhoursexp + serv_servpartsexp - serv_servticketexp;
			$('#serv_servamountexp').val(serv_servamountexp.toFixed(2));
			//现金消费
			var serv_servtransfer = parseNum($('#serv_servtransfer').val());
			$('#serv_servcashexp').val((serv_servamountexp-serv_servtransfer).toFixed(2));
	    });
	    
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
					serv_servorderdate:{
						required: true
					},
					serv_servtype:{
						required: true 
					},
					serv_servstaff:{
						required: true 
					},
					serv_carvin:{
						required: true,
						maxlength: 17
					},
					serv_servdelivtel:{
						isPhone:true
					},
					serv_servdelivmobile:{
						isMobile:true
					},
					serv_resveorederid:{
						maxlength: 12
					}
				}
			})
	})
	
	function openwin() {
		var carvin = $('#serv_carvin').val();
		if(carvin!=''){ 
			window.open ("${pageContext.request.contextPath}/crm::/carModule/action/QueryCarByVin.action?carvin="+carvin, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}else{
			window.open ("${pageContext.request.contextPath}/crm::/carModule/action/QueryCarInfo.action?startIndex=0&endIndex=9", "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}
	} 
	
	function getMaintainInfo(){
		var carvin = $('#serv_carvin').val();
		if(carvin!=null&&carvin!=''){
		$.post("${pageContext.request.contextPath}/crm::/carModule/action/QueryCarByVinJson.action", 
	       {carvin: carvin},
	       function(json, textStatus){
	         var data = json.carData;
	         if(data.carfmaintaintime!=null){
	         	 $('#mile_carfmaintaintime').val(data.carfmaintaintime);
	         }
	         if(data.carfmaintainmile!=null&&data.carfmaintainmile!=''){
	         	 $('#mile_carfmaintainmile').val(data.carfmaintainmile);
	         }
	         if(data.carlmaintaintime!=null){
	         	 $('#mile_carlmaintaintime').val(data.carlmaintaintime);
	         }
	         if(data.carlmaintainmile!=null&&data.carlmaintainmile!=''){
	         	 $('#mile_carlmaintainmile').val(data.carlmaintainmile);
	         }
	        
	         var cstmnData = json.cstmnData;
	         if(cstmnData.cstmcontmobile!=null&&cstmnData.cstmcontmobile!=''){
	         	 $('#cstmcontmobile').val(cstmnData.cstmcontmobile);
	         }
	         if(cstmnData.cstmcontact!=null&&cstmnData.cstmcontact!=''){
	         	 $('#cstmcontact').val(cstmnData.cstmcontact);
	         }
	         if(cstmnData.cstmconttel!=null&&cstmnData.cstmconttel!=''){
	         	 $('#cstmconttel').val(cstmnData.cstmconttel);
	         }
	         if(data.carcardid!=undefined&&data.carcardid!=''){
	         	$('#view_carcardid').val(data.carcardid);
	         	$('#view_carcardid').css('background-color','yellow');
	         }else{
	         	$('#view_carcardid').css('background-color','red');
	         }
	         if(data.carlicenceno!=undefined&&data.carlicenceno!=''){
	         	$('#view_carlicenceno').val(data.carlicenceno);
	         }
	       }, 
	       "json");
	    }
	}
	
	function calculate(){
		var flag = true;
		var date = $('#mile_servmaintaindate').val();
		var mile = $('#mile_servmaintainmile').val();
		if((date==null||date=='')||(mile==null||mile=='')){
			flag = false;
			alert("此保时间和公里数必须填写");
		}else{
			var fmaintaintime = $('#mile_carfmaintaintime').val();
			var fmaintainmile = $('#mile_carfmaintainmile').val();
			var lmaintaintime = $('#mile_carlmaintaintime').val();
			var lmaintainmile = $('#mile_carlmaintainmile').val();
			if((fmaintaintime==''||fmaintainmile=='')&&(lmaintaintime==''||lmaintainmile=='')){
				flag = false;
				alert("首保时间和公里或上保时间和公里数须填写一项");
			}else{
				var time_arr = date.split("-"); 
				var time = new Date(time_arr[0],time_arr[1]-1,time_arr[2]);
				if(lmaintaintime!=''&lmaintainmile!=''){
						var ltime_arr = lmaintaintime.split("-"); 
						var ltime = new Date(ltime_arr[0],ltime_arr[1]-1,ltime_arr[2]);
						var days = (time - ltime)/1000/60/60/24;
						var mileInday = (mile - lmaintainmile)/days;
						if(mileInday==NaN||days<=0){
							flag = false;
							alert("上保和此保的保养时间、公里数填写不正确");
						}else{
							var nmaintainmile = $('#mile_carnmaintainmile').val();
							var needDays = (nmaintainmile - mile)/mileInday;			
							var newtimems=time.getTime()+(needDays*24*60*60*1000);
							var nextTime = new Date(newtimems);
							var next = nextTime.format('yyyy-MM-dd');
							$('#mile_carnmaintaintime').val(next);
						}
				}else{
					if((fmaintaintime!=null&&fmaintaintime!='')
						&&(fmaintainmile!=null&&fmaintainmile!='')){
						var ftime_arr = fmaintaintime.split("-"); 
						var ftime = new Date(ftime_arr[0],ftime_arr[1]-1,ftime_arr[2]);
						var days = (time - ftime)/1000/60/60/24;
						var mileInday = (mile - fmaintainmile)/days;
						if(mileInday==NaN||days<=0){
							flag = false;
							alert("上保和此保的保养时间、公里数填写不正确");
						}else{
							var nmaintainmile = $('#mile_carnmaintainmile').val();
							var needDays = (nmaintainmile - mile)/mileInday;			
							var newtimems=time.getTime()+(needDays*24*60*60*1000);
							var nextTime = new Date(newtimems);
							var next = nextTime.format('yyyy-MM-dd');
							$('#mile_carnmaintaintime').val(next);
						}
					}
				}
			}
		}
		return flag;
	}

Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //月
        "d+" : this.getDate(),//日
        "h+" : this.getHours(), //小时
        "m+" : this.getMinutes(), //分
        "s+" : this.getSeconds(), //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S" : this.getMilliseconds() //毫秒
    };

    if(/(y+)/.test(format)) 
        format = format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] :("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}

function addCareWin(){
	var careorderid = $('#serv_servorderid').val();
	var carvin =  $('#serv_carvin').val();
	var careintime = $('#serv_servintime').val();
	var careouttime = $('#serv_servouttime').val();
	var carestaff = $('#serv_servstaff').val();
	window.open ("${pageContext.request.contextPath}/crm::/serviceModule/action/QueryCareByOrderId.action?carvin="+carvin+"&careintime="+careintime+"&careouttime="+careouttime+"&carestaff="+carestaff+"&careorderid="+careorderid, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
}
function addOilWin(){
	var carvin =  $('#serv_carvin').val();
	var servorderid = $('#serv_servorderid').val();
	var oilstoretime = $('#serv_servintime').val();
	var oilstaff = $('#serv_servstaff').val();
	window.open ("${pageContext.request.contextPath}/crm::/serviceModule/action/QueryOilByOrderId.action?carvin="+carvin+"&oilstoretime="+oilstoretime+"&oilstaff="+oilstaff+"&servorderid="+servorderid, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
}

function servChange(){	
	var servtype=$('#serv_servtype').val();
	switch(servtype){
		case '112001':
			$('#dingbao').click();
			break;
		case '112002':
			$('#banpen').click();
			break;
		case '112003':
			$('#shigu').click();
			break;
		case '112004':
			$('#shoubao').click();
			break;
		case '112005':
			$('#yiban').click();
			break;
		case '112009':
			$('#baoxiu').click();
			break;
	}
}

function doSubmit(){
 	if($('#crmform').valid()){
	  	 $('#crmform').submit();
	  	 $('#subBtn').attr("disabled",true);
	  	 $('#returnBtn').attr("disabled",true);
 	}
}

function fillMileAndTime(){
	var mile = new Number($('#serv_servkilometer').val()||0);
	var servtype=$('#serv_servtype').val();
	if(mile!=0){
		if(servtype=='112001'){
			$('#mile_servmaintainmile').val(mile);
		}
		if(servtype=='112004'){
			$('#mile_carfmaintainmile').val(mile);
		}
		$('#mile_carnmaintainmile').val(mile + 5000);
	}
	var time = $('#serv_servintime').val();
	if(time!=''){
		time = time.substring(0,10);
		if(servtype=='112001'){
			$('#mile_servmaintaindate').val(time);
		}
		if(servtype=='112004'){
			$('#mile_carfmaintaintime').val(time);
		}
	}
}

function addJY(){
	var jytype = $("input[name='jytype']:checked").val();
	var jystaff = $('#serv_servstaff').val();
	var carvin = $('#serv_carvin').val();
	var servorderid = $('#serv_servorderid').val();
	var servouttime = $('#serv_servouttime').val();
	var jybignum = $("input[name='jybignum']:enabled").val()==''?'0':$("input[name='jybignum']:enabled").val();
	var jysmallnum = $("input[name='jysmallnum']:enabled").val()==''?'0':$("input[name='jysmallnum']:enabled").val();
	var jystate=$('#jystate').val();
	if(carvin==''){
		alert("须填写车架号");
	}else if(servorderid==''){
		alert("须填写工单号");
	}else if(jystaff==''){
		alert("须填写服务顾问");
	}else if(jybignum=='0'&&jysmallnum=='0'){
		alert("须填写机油桶数");
	}else if(jytype!=''){
		$.post("${pageContext.request.contextPath}/crm::/jiyouModule/action/AddJYJson.action", 
	       {carvin:carvin,jystaff:jystaff,jybignum:jybignum,jysmallnum:jysmallnum,jytype:jytype,servorderid:servorderid,jyselltime:servouttime,jystate:jystate},
	       function(json, textStatus){
	         if(json==true){
				$('#addjyBtn').css('background-color','#ccc');
	         	$('#addjyBtn').attr('disabled',true);
	         	alert("已成功添加机油销售记录");
	         }
	       }, 
	       "json");
	 }else{
	 	alert("未选择机油");
	 }
}

function updateMile(){
	var servtype=$('#serv_servtype').val();
	if(servtype=='112004'){
		var carnmaintaintime = $('#mile_carnmaintaintime').val();
		var carnmaintainmile = $('#mile_carnmaintainmile').val();
		var carlmaintaintime = $('#mile_servmaintaindate').val();
		var carlmaintainmile = $('#mile_servmaintainmile').val();
		var carvin = $('#serv_carvin').val();
		if(carvin==''){
			alert("须填写车架号");
		}else{
			$.post("${pageContext.request.contextPath}/crm::/serviceModule/action/UpdateMile.action", 
		       {carvin: carvin,mile_carnmaintaintime:carnmaintaintime,mile_carnmaintainmile:carnmaintainmile,
		       mile_carlmaintaintime:carlmaintaintime,mile_carlmaintainmile:carlmaintainmile},
		       function(json, textStatus){
		         if(json==true){
		         	$('#updateMileBtn').css('background-color','#ccc');
		         	$('#updateMileBtn').attr('disabled',true);
		         	alert("已成更新该车辆保养记录");
		         }
		       }, 
		       "json");
	    }
	}else{
		var flag = calculate();
		if(flag){
			var carnmaintaintime = $('#mile_carnmaintaintime').val();
			var carnmaintainmile = $('#mile_carnmaintainmile').val();
			var carlmaintaintime = $('#mile_servmaintaindate').val();
			var carlmaintainmile = $('#mile_servmaintainmile').val();
			var carvin = $('#serv_carvin').val();
			if(carvin==''){
				alert("须填写车架号");
			}else{
				$.post("${pageContext.request.contextPath}/crm::/serviceModule/action/UpdateMile.action", 
			       {carvin: carvin,mile_carnmaintaintime:carnmaintaintime,mile_carnmaintainmile:carnmaintainmile,
			       mile_carlmaintaintime:carlmaintaintime,mile_carlmaintainmile:carlmaintainmile},
			       function(json, textStatus){
			         if(json==true){
			         	$('#updateMileBtn').css('background-color','#ccc');
			         	$('#updateMileBtn').attr('disabled',true);
			         	alert("已成更新该车辆保养记录");
			         }
			       }, 
			       "json");
		    }
	    }
    }
}

	function goBack(){
	 	$('#hiddenForm')[0].action = '${pageContext.request.contextPath}/crm::/serviceModule/action/QueryServiceList.action';
	    document.getElementById('hiddenForm').submit();
	}
	
	function delConf1(servexpid,serviceid){
		if(window.confirm("确认删除此条记录？")){
			window.location = "${pageContext.request.contextPath}/crm::/serviceModule/action/DeleteServXP.action?servexpid="+servexpid+"&serviceid="+serviceid; 
		}
	}
</script>
<style>
#sidebar-tab{margin-top:5px;margin-bottom:5px;margin-left:8%;width:90%;}
#tab-title {color:#000;font-size:13px;font-weight:400;float:left;background-color:#ccc;}
#tab-title .selected{color:#356aa0;background-color:#fff;}
#tab-title div{border:1px solid #000;cursor:pointer;color:#000;width:80px;float:left;text-align:center;}
#tab-content{border:1px solid #ccf;float:left;width:100%;}
#tab-content .hide{display:none;}
</style>
</head> 
<body>
<div id="man_zone">
<form id="crmform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/serviceModule/action/UpdateService.action">
<fieldset>
<legend>修改维修</legend>
<table id="contentTb1" cellspacing="3" cellpadding="0">
	<tr class="rowClass">
      <td class="colName">车牌号:</td>
      <td class="detailColVal">
      		<input type="text" name="view_carlicenceno" id="view_carlicenceno" readonly style="background-color:#ccc;"/>
	  </td>
	  <td class="colName">备注</td>
      <td class="detailColVal" colspan="3">
      <input type="text" name="serv_servnotes" id="serv_servnotes" value="${result.servnotes}" style="width:400px;"/>
      </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">工单号:</td>
      <td class="detailColVal">
          <input type="text" name="serv_servorderid" id="serv_servorderid" value="${result.servorderid}"/>
          <input type="hidden" name="serv_serviceid" id="serv_serviceid" value="${result.serviceid}"/>
	  </td>
	  <td class="colName">维修类型:</td>
      <td class="detailColVal">
         <select id="serv_servtype" name="serv_servtype" onchange="servChange(this);">
            <option value=""></option>
           	<c:forEach items="${dict.crm_serviceType}" var="var">				
           		<c:if test="${var.key==result.servtype}">
           			<option value="${var.key}" selected>${var.value}</option>
           		</c:if>	
           		<c:if test="${var.key!=result.servtype}">
           			<option value="${var.key}">${var.value}</option>
           		</c:if>						
           	</c:forEach>
         </select>
	  </td>
      <td class="colName">车架号</a>:</td>
      <td class="detailColVal">
      	 <input type="text" name="serv_carvin" id="serv_carvin" onblur="javascript:getMaintainInfo();" value="${result.carvin}"/>
      	 <div style="width:30px;float:right;"><a title="打开查询窗口" href="javascript:openwin();" style="color:#326EE9">查询</a></div>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">进厂时间:</td>
      <td class="detailColVal">
      	  <input type="text" name="serv_servintime" id="serv_servintime" value="${result.servintime}" onfocus="minuteCalender(this)" onblur="fillMileAndTime();" class="Wdate"/>
	  </td>
      <td class="colName">进厂行驶里程:</td>
      <td class="detailColVal">
      	 <input type="text" name="serv_servkilometer" id="serv_servkilometer" value="${result.servkilometer}" onblur="fillMileAndTime();"/>
	  </td>
	  <td class="colName">档案编号:</td>
      <td class="detailColVal">
      	 <input type="text" name="view_carcardid" id="view_carcardid" style="background-color:yellow;" readOnly/>
	  </td>
    </tr>
 </table>
<div id="sidebar-tab">
		<div id="tab-title">
			<c:if test="${dingBao.servtype==null}">
				<div id="dingbao">定保</div>
			</c:if>
			<c:if test="${dingBao.servtype!=null}">
				<div id="dingbao" style="background-color:red;">定保<a href="javascript:delConf1('${dingBao.servexpid}','${result.serviceid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></div>
			</c:if>
			<c:if test="${banPen.servtype==null}">
				<div id="banpen">钣喷</div>
			</c:if>
			<c:if test="${banPen.servtype!=null}">
				<div id="banpen" style="background-color:red;">钣喷<a href="javascript:delConf1('${banPen.servexpid}','${result.serviceid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></div>
			</c:if>
			<c:if test="${shiGu.servtype==null}">
				<div id="shigu">保险事故</div>
			</c:if>
			<c:if test="${shiGu.servtype!=null}">
				<div id="shigu" style="background-color:red;">保险事故<a href="javascript:delConf1('${shiGu.servexpid}','${result.serviceid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></div>
			</c:if>
			<c:if test="${shouBao.servtype==null}">
				<div id="shoubao">首保</div>
			</c:if>
			<c:if test="${shouBao.servtype!=null}">
				<div id="shoubao" style="background-color:red;">首保<a href="javascript:delConf1('${shouBao.servexpid}','${result.serviceid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></div>
			</c:if>
			<c:if test="${yiBan.servtype==null}">
				<div id="yiban">一般维修</div>
			</c:if>
			<c:if test="${yiBan.servtype!=null}">
				<div id="yiban" style="background-color:red;">一般维修<a href="javascript:delConf1('${yiBan.servexpid}','${result.serviceid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></div>
			</c:if>
			<c:if test="${baoXiu.servtype==null}">
				<div id="baoxiu">保修</div>
			</c:if>
			<c:if test="${baoXiu.servtype!=null}">
				<div id="baoxiu" style="background-color:red;">保修<a href="javascript:delConf1('${baoXiu.servexpid}','${result.serviceid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></div>
			</c:if>
		</div>
		<div id="tab-content">
			<ul>
				<table cellspacing="3" cellpadding="0">
				 <tr class="rowClass">
					 <td colspan=6 style="color:#356aa0">定保费用</td>
				 </tr>
	   			 <tr class="rowClass">
				      <td class="colName">工时费:</td>
				      <td class="detailColVal">
				          <input type="text" name="db_servhoursexp" id="db_servhoursexp" value="${dingBao.servhoursexp}" class="auto"/>
				          <input type="hidden" value="112001" name="db_servtype" id="db_servtype"/>
					  </td>
					  <td class="colName">工时折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="db_servhoursreb" id="db_servhoursreb" value="${dingBao.servhoursreb}" class="auto"/>
				          
					  </td>
				      <td class="colName">工时会员折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="db_servhoursmembreb" id="db_servhoursmembreb" value="${dingBao.servhoursmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr class="rowClass">
				      <td class="colName">零件费:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="db_servpartsexp" id="db_servpartsexp" value="${dingBao.servpartsexp}" class="auto"/>
					  </td>
					   <td class="colName">零件折扣:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="db_servpartsreb" id="db_servpartsreb" value="${dingBao.servpartsreb}" class="auto"/>
					  </td>
				      <td class="colName">零件会员折扣:</td>
				      <td class="detailColVal">
				      	<input type="text" name="db_servpartsmembreb" id="db_servpartsmembreb" value="${dingBao.servpartsmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">工时费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="db_repairexp" id="db_repairexp" class="auto"/>
					  </td>
					  <td class="colName">零件费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="db_partsexp" id="db_partsexp" class="auto"/>
					  </td>
					  <td class="colName">优惠券:</td>
				      <td class="detailColVal">
					     <input type="text" name="db_servticketexp" id="db_servticketexp" value="${dingBao.servticketexp}" class="auto"/>
					  </td>
				    </tr>
				    <tr class="rowClass">
				      <td class="colName">维修消费:</td>
				      <td class="detailColVal">
					     <input type="text" name="db_servrepairexp" id="db_servrepairexp" value="${dingBao.servrepairexp}" class="auto"/>
					  </td>
				    </tr>
			 </table>  
			</ul>
			<ul class="hide">
				<table cellspacing="3" cellpadding="0">
				<tr><td colspan=6 style="color:#356aa0">钣喷费用</td></tr>
	   			 <tr class="rowClass">
				      <td class="colName">工时费:</td>
				      <td class="detailColVal">
				          <input type="text" name="bp_servhoursexp" id="bp_servhoursexp" value="${banPen.servhoursexp}" class="auto"/>
				          <input type="hidden" value="112002" name="bp_servtype" id="bp_servtype"/>
					  </td>
					  <td class="colName">工时折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="bp_servhoursreb" id="bp_servhoursreb" value="${banPen.servhoursreb}" class="auto"/>
					  </td>
				      <td class="colName">工时会员折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="bp_servhoursmembreb" id="bp_servhoursmembreb" value="${banPen.servhoursmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr class="rowClass">
				      <td class="colName">零件费:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="bp_servpartsexp" id="bp_servpartsexp" value="${banPen.servpartsexp}" class="auto"/>
					  </td>
					   <td class="colName">零件折扣:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="bp_servpartsreb" id="bp_servpartsreb" value="${banPen.servpartsreb}" class="auto"/>
					  </td>
				      <td class="colName">零件会员折扣:</td>
				      <td class="detailColVal">
				      	<input type="text" name="bp_servpartsmembreb" id="bp_servpartsmembreb" value="${banPen.servpartsmembreb}" class="auto"/>
					  </td>
				    </tr>
				     <tr>
				      <td class="colName">工时费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="bp_repairexp" id="bp_repairexp" class="auto"/>
					  </td>
					  <td class="colName">零件费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="bp_partsexp" id="bp_partsexp" class="auto"/>
					  </td>
					  <td class="colName">优惠券:</td>
				      <td class="detailColVal">
					     <input type="text" name="bp_servticketexp" id="bp_servticketexp" value="${banPen.servticketexp}" class="auto"/>
					  </td>
				    </tr>
				     <tr class="rowClass">
				      <td class="colName">维修消费:</td>
				      <td class="detailColVal">
					      <input type="text" name="bp_servrepairexp" id="bp_servrepairexp" value="${banPen.servrepairexp}" class="auto"/>
					  </td>
				    </tr>
			 </table>  
			</ul>
			<ul class="hide">
				<table cellspacing="3" cellpadding="0">
				 <tr><td colspan=6 style="color:#356aa0">保险事故费用</td></tr>
	   			 <tr class="rowClass">
				      <td class="colName">工时费:</td>
				      <td class="detailColVal">
				          <input type="text" name="sg_servhoursexp" id="sg_servhoursexp" value="${shiGu.servhoursexp}" class="auto"/>
				          <input type="hidden" name="sg_servtype" id="sg_servtype" value="112003"/>
					  </td>
					  <td class="colName">工时折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="sg_servhoursreb" id="sg_servhoursreb" value="${shiGu.servhoursreb}" class="auto"/>
					  </td>
				      <td class="colName">工时会员折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="sg_servhoursmembreb" id="sg_servhoursmembreb" value="${shiGu.servhoursmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr class="rowClass">
				      <td class="colName">零件费:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="sg_servpartsexp" id="sg_servpartsexp" value="${shiGu.servpartsexp}" class="auto"/>
					  </td>
					   <td class="colName">零件折扣:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="sg_servpartsreb" id="sg_servpartsreb" value="${shiGu.servpartsreb}" class="auto"/>
					  </td>
				      <td class="colName">零件会员折扣:</td>
				      <td class="detailColVal">
				      	<input type="text" name="sg_servpartsmembreb" id="sg_servpartsmembreb" value="${shiGu.servpartsmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">工时费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="sg_repairexp" id="sg_repairexp" class="auto"/>
					  </td>
					  <td class="colName">零件费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="sg_partsexp" id="sg_partsexp" class="auto"/>
					  </td>
					  <td class="colName">优惠券:</td>
				      <td class="detailColVal">
					     <input type="text" name="sg_servticketexp" id="sg_servticketexp" value="${shiGu.servticketexp}" class="auto"/>
					  </td>
				    </tr>
				     <tr class="rowClass">
					  <td class="colName">保险消费:</td>
				      <td class="detailColVal">
				          <input type="text" name="sg_servinsureexp" id="sg_servinsureexp" value="${shiGu.servinsureexp}" class="auto"/>
					  </td>
				    </tr>
			   </table>  
			</ul>
			<ul class="hide">
				<table cellspacing="3" cellpadding="0">
				 <tr><td colspan=6 style="color:#356aa0">首保费用</td></tr>
	   			 <tr class="rowClass">
				      <td class="colName">工时费:</td>
				      <td class="detailColVal">
				          <input type="text" name="sb_servhoursexp" id="sb_servhoursexp" value="${shouBao.servhoursexp}" class="auto"/>
				          <input type="hidden" name="sb_servtype" id="sb_servtype" value="112004"/>
					  </td>
					  <td class="colName">工时折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="sb_servhoursreb" id="sb_servhoursreb" value="${shouBao.servhoursreb}" class="auto"/>
					  </td>
				      <td class="colName">工时会员折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="sb_servhoursmembreb" id="sb_servhoursmembreb" value="${shouBao.servhoursmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr class="rowClass">
				      <td class="colName">零件费:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="sb_servpartsexp" id="sb_servpartsexp" value="${shouBao.servpartsexp}" class="auto"/>
					  </td>
					   <td class="colName">零件折扣:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="sb_servpartsreb" id="sb_servpartsreb" value="${shouBao.servpartsreb}" class="auto"/>
					  </td>
				      <td class="colName">零件会员折扣:</td>
				      <td class="detailColVal">
				      	<input type="text" name="sb_servpartsmembreb" id="sb_servpartsmembreb" value="${shouBao.servpartsmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">工时费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="sb_repairexp" id="sb_repairexp" class="auto"/>
					  </td>
					  <td class="colName">零件费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="sb_partsexp" id="sb_partsexp" class="auto"/>
					  </td>
					  <td class="colName">优惠券:</td>
				      <td class="detailColVal">
					     <input type="text" name="sb_servticketexp" id="sb_servticketexp" value="${shouBao.servticketexp}" class="auto"/>
					  </td>
				    </tr>
				    <tr class="rowClass">
				      <td class="colName">维修消费:</td>
				      <td class="detailColVal">
					       <input type="text" name="sb_servrepairexp" id="sb_servrepairexp" value="${shouBao.servrepairexp}" class="auto"/>
					  </td>
				    </tr>
			   </table>  
			</ul>
			<ul class="hide">
				<table cellspacing="3" cellpadding="0">
				 <tr><td colspan=6 style="color:#356aa0">一般维修费用</td></tr>
	   			 <tr>
				      <td class="colName">工时费:</td>
				      <td class="detailColVal">
				          <input type="text" name="yb_servhoursexp" id="yb_servhoursexp" value="${yiBan.servhoursexp}" class="auto"/>
				          <input type="hidden" name="yb_servtype" id="yb_servtype" value="112005"/>
					  </td>
					  <td class="colName">工时折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="yb_servhoursreb" id="yb_servhoursreb" value="${yiBan.servhoursreb}" class="auto"/>
					  </td>
				      <td class="colName">工时会员折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="yb_servhoursmembreb" id="yb_servhoursmembreb" value="${yiBan.servhoursmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">零件费:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="yb_servpartsexp" id="yb_servpartsexp" value="${yiBan.servpartsexp}" class="auto"/>
					  </td>
					   <td class="colName">零件折扣:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="yb_servpartsreb" id="yb_servpartsreb" value="${yiBan.servpartsreb}" class="auto"/>
					  </td>
				      <td class="colName">零件会员折扣:</td>
				      <td class="detailColVal">
				      	<input type="text" name="yb_servpartsmembreb" id="yb_servpartsmembreb" value="${yiBan.servpartsmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">工时费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="yb_repairexp" id="yb_repairexp" class="auto"/>
					  </td>
					  <td class="colName">零件费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="yb_partsexp" id="yb_partsexp" class="auto"/>
					  </td>
					  <td class="colName">优惠券:</td>
				      <td class="detailColVal">
					     <input type="text" name="yb_servticketexp" id="yb_servticketexp" value="${yiBan.servticketexp}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				    <td class="colName">维修消费:</td>
				      <td class="detailColVal">
					       <input type="text" name="yb_servrepairexp" id="yb_servrepairexp" value="${yiBan.servrepairexp}" class="auto"/>
					  </td>
				    </tr>
			   </table>  
			</ul>
			<ul class="hide">
				<table cellspacing="3" cellpadding="0">
				 <tr><td colspan=6 style="color:#356aa0">保修费用</td></tr>
	   			 <tr>
				      <td class="colName">工时费:</td>
				      <td class="detailColVal">
				          <input type="text" name="bx_servhoursexp" id="bx_servhoursexp" value="${baoXiu.servhoursexp}" class="auto"/>
				          <input type="hidden" name="bx_servtype" id="bx_servtype" value="112009"/>
					  </td>
					  <td class="colName">工时折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="bx_servhoursreb" id="bx_servhoursreb" value="${baoXiu.servhoursreb}" class="auto"/>
					  </td>
				      <td class="colName">工时会员折扣:</td>
				      <td class="detailColVal">
				          <input type="text" name="bx_servhoursmembreb" id="bx_servhoursmembreb" value="${baoXiu.servhoursmembreb}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">零件费:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="bx_servpartsexp" id="bx_servpartsexp" value="${baoXiu.servpartsexp}" class="auto"/>
					  </td>
					   <td class="colName">零件折扣:</td>
				      <td class="detailColVal">
				      	 <input type="text" name="bx_servpartsreb" id="bx_servpartsreb" value="${baoXiu.servpartsreb}" class="auto"/>
					  </td>
				      <td class="colName">零件会员折扣:</td>
				      <td class="detailColVal">
				      	<input type="text" name="bx_servpartsmembreb" id="bx_servpartsmembreb" value="${baoXiu.servpartsmembreb}" class="auto"/>
					  </td>
				    </tr>
				     <tr>
				      <td class="colName">工时费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="bx_repairexp" id="bx_repairexp" class="auto"/>
					  </td>
					  <td class="colName">零件费合计:</td>
				      <td class="detailColVal">
					     <input type="text" name="bx_partsexp" id="bx_partsexp" class="auto"/>
					  </td>
					  <td class="colName">优惠券:</td>
				      <td class="detailColVal">
					     <input type="text" name="bx_servticketexp" id="bx_servticketexp" value="${baoXiu.servticketexp}" class="auto"/>
					  </td>
				    </tr>
				    <tr>
				      <td class="colName">维修消费:</td>
				      <td class="detailColVal">
					     <input type="text" name="bx_servrepairexp" id="bx_servrepairexp" value="${baoXiu.servrepairexp}" class="auto"/>
					  </td>
				    </tr>
			   </table>  
			</ul>
		</div>
   </div>
<table cellspacing="3" cellpadding="0">
	 <tr class="rowClass">
	     <td class="colName">工时总额:</td>
	      <td class="detailColVal">
	        <input type="text" name="serv_servhoursexp" id="serv_servhoursexp" value="${result.servhoursexp}" class="auto gs"/>
	      </td>
	      <td class="colName">零件总额:</td>
	      <td class="detailColVal">
	         <input type="text" name="serv_servpartsexp" id="serv_servpartsexp" value="${result.servpartsexp}" class="auto"/>
		  </td>
		  <td class="colName">优惠劵总额:</td>
	      <td class="detailColVal">
	        <input type="text" name="serv_servticketexp" id="serv_servticketexp" value="${result.servticketexp}" class="auto"/>
	      </td>
	  </tr>
	  <tr class="rowClass">
	      <td class="colName">现金消费:</td>
	      <td class="detailColVal">
	         <input type="text" name="serv_servcashexp" id="serv_servcashexp" value="${result.servcashexp}" class="auto"/>
		  </td>
		  <td class="colName">转账:</td>
	      <td class="detailColVal">
	      	 <input type="text" name="serv_servtransfer" id="serv_servtransfer" value="${result.servtransfer}" class="auto"/>
		  </td>
		  <td class="colName">服务顾问:</td>
	      <td class="detailColVal">
	         <select id="serv_servstaff" name="serv_servstaff"></select>
		  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">消费总额:</td>
      <td class="detailColVal">
      	 <input type="text" name="serv_servamountexp" id="serv_servamountexp" value="${result.servamountexp}" class="auto"/>
	  </td>
      <td class="colName">维修项目:</td>
      <td class="detailColVal" colspan=3>
      	<input style="width:80%;" type="text" name="serv_servitems" id="serv_servitems" value="${result.servitems}"/>
	  </td>
    </tr>
     <tr class="rowClass">
      <td class="colName">钣金主修:</td>
      <td class="detailColVal">
         <select id="serv_servmetalworker" name="serv_servmetalworker"></select>
	  </td>
      <td class="colName">喷漆主修:</td>
      <td class="detailColVal">
       <select id="serv_servpaintworker" name="serv_servpaintworker"></select>
	  </td>
	  <td class="colName">机电主修:</td>
      <td class="detailColVal">
         <select id="serv_servelecworker" name="serv_servelecworker"></select>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">交车日期:</td>
      <td class="detailColVal">
      	 <input type="text" name="serv_servouttime" id="serv_servouttime" value="${result.servouttime}" onfocus="dayCalender(this)" class="Wdate" style="background-color: yellow;"/>
	  </td>
      <td class="colName">是否返修:</td>
      <td class="detailColVal">
         <select id="serv_isrework" name="serv_isrework">
           <option value=""></option>
          <c:if test="${result.isrework=='1'}">
           		<option value="1" selected>是</option>
           		<option value="0">否</option>
           </c:if>
           <c:if test="${result.isrework=='0'}">
           		<option value="1">是</option>
           		<option value="0" selected>否</option>
           </c:if>
           <c:if test="${result.isrework!='1'&&result.isrework!='0'}">
           		<option value="1">是</option>
           		<option value="0">否</option>
           </c:if>
         </select>
	  </td>
	  <td class="colName">预约单号:</td>
      <td class="detailColVal">
        <input type="text" name="serv_resveorederid" id="serv_resveorederid" value="${result.resveorederid}"/>
	  </td>
    </tr>
    <tr class="rowClass">
      <td class="colName">联系人:</td>
      <td class="detailColVal">
          <input type="text" name="cstmcontact" id="cstmcontact" readonly style="background-color:#ccc;"/>
	  </td>
      <td class="colName">联系人电话:</td>
      <td class="detailColVal">
     	  <input type="text" name="cstmconttel" id="cstmconttel" readonly style="background-color:#ccc;"/>
	  </td>
	  <td class="colName">联系人手机:</td>
      <td class="detailColVal">
          <input type="text" name="cstmcontmobile" id="cstmcontmobile" readonly style="background-color:#ccc;"/>
	  </td>
    </tr>
  </table>
  <div id="jiyouDiv" style="border:1px solid #ccf;width:90%;margin-left:8%;">
  	<table>
  		<tr class="rowClass">
  			<c:forEach items="${dict.crm_jyType}" var="var">				
	  			<td class="colName">
	  				<c:if test="${var.key==jyData.jytype}">
		  				<input type="radio" name="jytype" value="${var.key}" checked style="vertical-align:middle;width:20px;border:none;"/>${var.value}:
		  			</c:if>
		  			<c:if test="${var.key!=jyData.jytype}">
		  				<input type="radio" name="jytype" value="${var.key}" style="vertical-align:middle;width:20px;border:none;"/>${var.value}:
		  			</c:if>
	  			</td>
	  			<td class="detailColVal">
	  				<c:if test="${var.key==jyData.jytype}">
	  					大<input type="text" value="${jyData.jybignum}" name="jybignum" style="width:25px;text-align:center;background-color:#fff;"/>桶
	  					&nbsp;小<input type="text" value="${jyData.jysmallnum}" name="jysmallnum" style="width:25px;text-align:center;background-color:#fff;"/>桶
	  				</c:if>
	  				<c:if test="${var.key!=jyData.jytype}">
	  					大<input type="text" value="1" disabled name="jybignum" style="width:25px;text-align:center;background-color:#ccc;"/>桶
	  					&nbsp;小<input type="text" value="1" disabled name="jysmallnum" style="width:25px;text-align:center;background-color:#ccc;"/>桶
	  				</c:if>
	  			</td>
  			</c:forEach>
  		</tr>
   		<tr class="rowClass">
	   		<td colspan=8>
	   			<div style="margin-top:3px;text-align:right;margin-right:20px;">节约机油：
					<select id="jystate" name="jystate">
						<option value=""></option>
						<c:if test="${jyData.jystate=='1'}">
							<option value="0">带走</option>
							<option value="1" selected>外销</option>
						</c:if>
						<c:if test="${jyData.jystate=='0'}">
							<option value="0" selected>带走</option>
							<option value="1">外销</option>
						</c:if>
						<c:if test="${jyData.jystate!='1'&&jyData.jystate!='0'}">
							<option value="0">带走</option>
							<option value="1">外销</option>
						</c:if>
					</select>
					<input type="button" id="addjyBtn" value="更新机油信息" onclick="javascript:addJY();" style="background-color:#ccc;cursor:pointer;"/>
				</div>
			</td>
   		</tr>
  	</table>
  </div>
  <div id="maintainDiv" style="border:1px solid #ccf;width:90%;margin-left:8%;margin-top:2px;">
  	<table id="maintainTb">
  		<tr class="rowClass">
  			<td class="colName">首保时间:</td>
  			<td class="detailColVal"><input type="text" name="mile_carfmaintaintime" id="mile_carfmaintaintime" class="Wdate" onfocus="dayCalender(this)" ></td>
  			<td class="colName">首保公里:</td>
  			<td class="detailColVal"><input type="text" name="mile_carfmaintainmile" id="mile_carfmaintainmile"></td>
  			<td class="colName">上保时间:</td>
  			<td class="detailColVal"><input type="text" name="mile_carlmaintaintime" id="mile_carlmaintaintime" class="Wdate" onclick="dayCalender(this)" ></td>
  		</tr>
  		<tr class="rowClass">
			<td class="colName">上保公里:</td>
  			<td class="detailColVal"><input type="text" name="mile_carlmaintainmile" id="mile_carlmaintainmile"></td>
  			<td class="colName">此保时间:</td>
  			<td class="detailColVal"><input type="text" name="mile_servmaintaindate" id="mile_servmaintaindate" class="Wdate" onclick="dayCalender(this)" ></td>
  			<td class="colName">此保公里:</td>
  			<td class="detailColVal"><input type="text" name="mile_servmaintainmile" id="mile_servmaintainmile"></td>
   		</tr>
   		<tr class="rowClass">
			<td class="colName"></td>
  			<td class="detailColVal">
				<input type="button" value="计算生成" onclick="javascript:calculate();" style="background-color:#ccc;width:150px;cursor:pointer;">
			</td>
			<td class="colName"><label style="color:red">预计下保公里:</label></td>
  			<td class="detailColVal"><input type="text" name="mile_carnmaintainmile" id="mile_carnmaintainmile"></td>
  			<td class="colName"><label style="color:red">预计下保时间:</label></td>
  			<td class="detailColVal"><input type="text" name="mile_carnmaintaintime" id="mile_carnmaintaintime" onclick="dayCalender(this)"></td>
   		</tr>
   		<tr class="rowClass">
	   		<td colspan=6>
				<div style="margin-top:3px;text-align:right;margin-right:20px;">
					<input type="button" value="更新下次保养时间" id="updateMileBtn" onclick="javascript:updateMile();" style="background-color:#ccc;cursor:pointer;"/>
				</div>
			</td>
   		</tr>
  	</table>
  </div>
  <div style="text-align:center">
    <table style="width:750px;margin:auto;">
	  <tr class="rowClass">
	 	<td style="text-align:center;width:150px;">
	 		<input type="hidden" name="carcardid" value="${carcardid}">
			<input type="hidden" name="min_servintime" value="${min_servintime}">
			<input type="hidden" name="max_servintime" value="${max_servintime}">
			<input type="hidden" name="servtype" value="${servtype}">
			<input type="hidden" name="carlicenceno" value="${carlicenceno}">
			<input type="hidden" name="servorderid" value="${servorderid}">
			<input type="hidden" name="max_servouttime" value="${max_servouttime}">
			<input type="hidden" name="min_servouttime" value="${min_servouttime}">
			<input type="hidden" name="carvin" value="${carvin}">
			<input type="hidden" name="isFinished" value="${isFinished}">
			<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
			<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
			<input type="hidden" name="pageValue" value='${pageValue}'>
  			<input type="button" id="subBtn" style="background-color:#ccc;width:120px;cursor:pointer;" onclick="javascript:doSubmit();" value="确定"/>
	  	</td>
	  	<td style="text-align:center;width:150px;">
	  		<input type="reset"  style="background-color:#ccc;width:140px;cursor:pointer;" value="重置"/>
	  	</td>
	  	<td style="text-align:center;width:150px;">
	  		 <input type="button" id="returnBtn" style="background-color:#ccc;width:140px;cursor:pointer;" onclick="javascript:goBack();" value="返回"/>
	  	</td>
	  	<td style="text-align:center;width:150px;">
	  		<input type="button" style="background-color:#ccc;width:140px;cursor:pointer;" onclick="javascript:addCareWin();" value="养护"/>
	  	</td>
	  	<td style="text-align:center;width:150px;">
	    	<input type="button" style="background-color:#ccc;width:140px;cursor:pointer;" onclick="javascript:addOilWin();" value="小桶油出库"/>
	  	</td>
	  </tr>
  </table>
  </div>
  </fieldset>
  </form>
  </div>
  <div style="display:none;">
	  <form id="hiddenForm" method="post">
			<input type="hidden" name="carcardid" value="${carcardid}">
			<input type="hidden" name="min_servintime" value="${min_servintime}">
			<input type="hidden" name="max_servintime" value="${max_servintime}">
			<input type="hidden" name="servtype" value="${servtype}">
			<input type="hidden" name="carlicenceno" value="${carlicenceno}">
			<input type="hidden" name="servorderid" value="${servorderid}">
			<input type="hidden" name="max_servouttime" value="${max_servouttime}">
			<input type="hidden" name="min_servouttime" value="${min_servouttime}">
			<input type="hidden" name="carvin" value="${carvin}">
			<input type="hidden" name="isFinished" value="${isFinished}">
			<input type="hidden" name="startIndex" value="${empty startIndex?'0':startIndex}">
			<input type="hidden" name="endIndex" value="${empty endIndex?'9':endIndex}">
			<input type="hidden" name="pageValue" value='${pageValue}'>
		</form>
	</div>
</body>
</html>
