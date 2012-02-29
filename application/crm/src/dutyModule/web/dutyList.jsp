<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>总值管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<jsp:useBean id="now" class="java.util.Date" />    
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH" var="nowz"/> 
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<style>
.dutyItem{background-color:#EBE08A}
.hide{display:none;}
</style>
<script type="text/javascript">
$(function() {
$('#dutystaff').selectDict({type:'crm_waiter',id:'dutystaff',value:'${dutystaff}'});
	$("#paginate").saturnTablePaginate({
		count:'${count}', 
		current:'<%=request.getParameter("pageValue")%>',  
		action:'${pageContext.request.contextPath}/crm::/dutyModule/action/QueryDutyList.action',
		form:'crmform',
		percount:30
	});
	
	$(".dutyItem").click(function (){ 
		  var strHref = $(this).parent().find('.detail').find('a').attr("href");
		  window.open(strHref, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
	}); 
	
	//$("#dataTb tr").dblclick(function (){ 
	//	var strHref =  $(this).find('.edit').find('a').attr("href");
	//	document.location.href=strHref;
		//window.open(strHref, "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
	//}); 
	
	//级联
	$('#crmform').saturnRelationSelect({
			levels:['carbrand', 'dutycarmodel','carmodel'],
			type:'crm_carModel',
			firstValue:[['','选择车系'],['','选择型号']],
			defaultValue:['${carbrand}','${dutycarmodel}','${carmodel}']
	});
	//初始作业类别
	var dutycommu = '${dutycommu}';
	var dutyArray = dutycommu.replace(new RegExp('%','gm'),'').split('|');
	$('#jd').attr("checked", false); 
	$('#bj').attr("checked", false); 
	$('#pq').attr("checked", false); 
	$('#xc').attr("checked", false); 
	for(var i=0;i<dutyArray.length;i++){
		if('机电'==dutyArray[i])
			$('#jd').attr("checked", true); 
		if('钣金'==dutyArray[i])
			$('#bj').attr("checked", true); 
		if('喷漆'==dutyArray[i])
			$('#pq').attr("checked", true); 
		if('洗车'==dutyArray[i])
			$('#xc').attr("checked", true); 
	}
});

function delConf(dutyid){
	if(window.confirm("确认删除此条记录？")){
		$('#hiddenform').attr('action','<%=request.getContextPath()%>/crm::/dutyModule/action/QueryDutyData.action?dutyid='+dutyid+'&del=ok');
		$('#hiddenform').submit();
	}
	
}

function delConf1(dutyitemid){
			if(window.confirm("确认删除此条记录？")){
				//window.location = "<%=request.getContextPath()%>/crm::/dutyModule/action/DeleteDutyItem.action?dutyitemid="+dutyitemid+"&startIndex=0&endIndex=29&min_dutyintime=${min_dutyintime }&max_dutyintime=${max_dutyintime }"; 
				$('#hiddenform').attr('action','<%=request.getContextPath()%>/crm::/dutyModule/action/DeleteDutyItem.action?dutyitemid='+dutyitemid);
				$('#hiddenform').submit();
			}
		}

function updateDuty(dutyid){
	$('#hiddenform').attr('action','<%=request.getContextPath()%>/crm::/dutyModule/action/QueryDutyData.action?dutyid='+dutyid);
	$('#hiddenform').submit();
}

function updateDuty1(dutyitemid){
	$('#hiddenform').attr('action','<%=request.getContextPath()%>/crm::/dutyModule/action/QueryDutyItemData.action?dutyitemid='+dutyitemid);
	$('#hiddenform').submit();
}

function addNewWin(){
	$('#crmform').attr("action","${pageContext.request.contextPath}/crm::/dutyModule/action/ToAddPage.action?startIndex=0&endIndex=29");
	$('#crmform').submit();
}

function addNewWin1(dutyid,ditemtype){
	$('#hiddenform').attr('action','<%=request.getContextPath()%>/crm::/dutyModule/action/ToAddPage1.action?dutyid='+dutyid+'&ditemtype='+ditemtype);
	$('#hiddenform').submit();
}

function doSubmit(){
	var f_str = '';
	$(":checkbox").each(function(){
	   if($(this).attr("checked")==true){
		f_str += $(this).attr("value")+"|%";
	   }
	});
	$("#dutycommu").val(f_str);
	$('#crmform').submit();
	if(opener){ 
		opener.location.reload();
		window.close();
	}
}
</script> 
<style>
.autocomplete-w1 { background:url(img/shadow.png) no-repeat bottom right; position:absolute; top:0px; left:0px; margin:6px 0 0 6px; /* IE6 fix: */ _background:none; _margin:1px 0 0 0; }
.autocomplete { border:1px solid #999; background:#FFF; cursor:default; text-align:left; max-height:350px; overflow:auto; margin:-6px 6px 6px -6px; /* IE6 specific: */ _height:350px; _margin:0; _overflow-x:hidden; }
.autocomplete .selected { background:#F0F0F0; }
.autocomplete div { padding:2px 5px; white-space:nowrap; overflow:hidden; }
.autocomplete strong { font-weight:normal; color:#3399FF; } 
</style>
</head>
<body>
<div id="man_zone" style="overflow: hidden;overflow-y: auto;">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/dutyModule/action/QueryDutyList.action?startIndex=0&endIndex=29">
			<fieldset id="formFiled">
			  <legend>总值管理</legend>
              <table cellspacing="5" cellpadding="0">
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenseno" id="carlicenseno" value="${carlicenseno}"/>
                      </td>
                      <td class="colName">VIN:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}" autocomplete="off" style="width:200px;"/>
                      </td>
                   </tr>
                   <tr>
                      <td class="colName">档案号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">车辆分类:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<select id="dutytype" name="dutytype">
				            <option value=""></option>
							<option value="售后" ${'售后'==dutytype?'selected':''}>售后</option>
							<option value="市场" ${'市场'==dutytype?'selected':''}>市场</option>
				         </select>
                      </td>
                   </tr>
                   <tr>
                      <td class="colName">接待人员:</td>
                      <td class="detailColVal">
                      	<select id="dutystaff" name="dutystaff">
			         </select>
                      </td>
                      <td class="colName">车辆状态:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<select id="dutydelivtime" name="dutydelivtime">
				            <option value=""></option>
							<option value="0" ${'0'==dutydelivtime?'selected':''}>未交车</option>
							<option value="1" ${'1'==dutydelivtime?'selected':''}>已交车</option>
							<option value="2" ${'2'==dutydelivtime?'selected':''}>已废弃</option>
				         </select>
                      </td>
                   </tr>
                   <tr>
                      <td class="colName">品牌:</td>
                      <td class="detailColVal">
                      	<select id="carbrand" name="carbrand">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carModel$}" var="var">				
				           		<option value="${var.key}">${var.value}</option>			
				           	</c:forEach>
                        </select>
                        <select id="dutycarmodel" name="dutycarmodel"></select>
                        <!-- 
                      	<select id="dutycarmodel" name="dutycarmodel">
                            <option value=""></option>
                            <c:forEach items="${dict.crm_carModel}" var="var">				
				           		<c:if test="${var.key==dutycarmodel}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=dutycarmodel}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>					
				           	</c:forEach>
                        </select>
                         -->
                      </td>
                      <td class="colName">进厂时间:</td>
                      <td class="detailColVal">
                   		<input type="text" name="min_dutyintime" id="min_dutyintime" value="${min_dutyintime}" onfocus="dayCalender(this)" class="Wdate"/>
                   		<span>至</span>
                      	<input type="text" name="max_dutyintime" id="max_dutyintime" value="${max_dutyintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <!-- 
                      <td class="colName">实际交车时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_dutydelivtime" id="min_dutydelivtime" value="${min_dutydelivtime}" onfocus="secondCalender(this)" class="Wdate"/>
                      		<span>至</span>
                      	<input type="text" name="max_dutydelivtime" id="max_dutydelivtime" value="${max_dutydelivtime}" onfocus="secondCalender(this)" class="Wdate"/>
                      </td>
                       -->
                    </tr>
					<tr>
                      <td class="colName">作业类型:</td>
                      <td class="detailColVal">
                      	<input type="checkbox" name="jd" id="jd" value="机电" style="width:20px;border: 0px;">机电
						<input type="checkbox" name="bj" id="bj" value="钣金" style="width:20px;border: 0px;">钣金
						<input type="checkbox" name="pq" id="pq" value="喷漆" style="width:20px;border: 0px;">喷漆
						<input type="checkbox" name="xc" id="xc" value="洗车" style="width:20px;border: 0px;">洗车
						<input type="hidden" name="dutycommu" id="dutycommu" value="${dutycommu}"/>
                      </td>
                      <td class="colName">&nbsp;</td>
                      <td class="detailColVal">
                      	&nbsp;
                      </td>
                   </tr>
              </table>   
               <div style="margin-buttom:10px;text-align:center;">
                      <input type="button" onclick="javascript:doSubmit();" value="查询" />
                      <input type="button" onclick="javascript:addNewWin();" value="新增" />
              </div>   
			</fieldset>           
		</form>
		<table class="optDiv">
			<tr>
				<td><label class="rsTitle">总值管理</label></td>
				<td><div id="paginate"></div></td>
				<td>&nbsp;<!-- <div class="optAdd"><a href="javascript:addNewWin();">新增</a></div> --></td>
			</tr>
		</table>
        <div class="tbDiv" style="overflow: hidden;overflow-x: auto;">
			<div style="width:1265px">
				<table cellspacing="0" cellpadding="0">
                    <tr>
                     	<th style="width:50px;">操作</th>
                     	<th style="width:290px;padding:0px;">
                     	<table cellspacing="0" cellpadding="0" style="border-width: 0;width:290px;table-layout: auto;">
                        <tr>
                        <th style="border-left-style: none; border-left-width: medium;border-top-style: none; border-top-width: medium;width:40px;">进厂</th>
						<th style="border-top-style: none; border-top-width: medium;width:50px;">车型</th>
                        <th style="border-top-style: none; border-top-width: medium;width:70px;">车牌号</th>
                        <th style="border-top-style: none; border-top-width: medium;width:50px;">接待员</th>
                        <th style="border-top-style: none; border-top-width: medium;border-right-style: none; border-right-width: medium;width:80px;">预交车</th>
                        </tr>
                        <tr>
                        <th colspan="5" style="border-bottom-style: none; border-bottom-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">作业项目</th>
                        </tr>
                        </table>
                     	</th>
                        <th style="width:270px;padding:0px;">
                        <table cellspacing="0" cellpadding="0" style="border-width: 0;width:270px;table-layout: auto;">
                        <tr>
                        <th colspan="5" style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">机电</th>
                        </tr>
                        <tr>
                        <th style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:60px;">操作</th>
						<th style="border-bottom-style: none; border-bottom-width: medium;width:50px;">作业人</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;width:40px;">开始</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;width:40px;">结束</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:60px;">工位</th>
                        </tr>
                        </table>
                        </th>
						<th style="width:210px;padding:0px;">
                        <table cellspacing="0" cellpadding="0" style="border-width: 0;width:210px;table-layout: auto;">
                        <tr>
                        <th colspan="4" style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">钣金</th>
                        </tr>
                        <tr>
                        <th style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:60px;">操作</th>
						<th style="border-bottom-style: none; border-bottom-width: medium;width:50px;">作业人</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;width:40px;">开始</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:40px;">结束</th>
                        </tr>
                        </table>
                        </th>
						<th style="width:210px;padding:0px;">
                        <table cellspacing="0" cellpadding="0" style="border-width: 0;width:210px;table-layout: auto;">
                        <tr>
                        <th colspan="4" style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">喷漆</th>
                        </tr>
                        <tr>
                        <th style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:60px;">操作</th>
						<th style="border-bottom-style: none; border-bottom-width: medium;width:50px;">作业人</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;width:40px;">开始</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:40px;">结束</th>
                        </tr>
                        </table>
                        </th>
						<th style="width:140px;padding:0px;">
                        <table cellspacing="0" cellpadding="0" style="border-width: 0;width:140px;table-layout: auto;">
                        <tr>
                        <th colspan="3" style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">洗车</th>
                        </tr>
                        <tr>
						<th style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:60px;">操作</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;width:40px;">开始</th>
                        <th style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:40px;">结束</th>
						</tr>
                        </table>
                        </th>
                        <th style="width:100px;padding:0px;">
                     	<table cellspacing="0" cellpadding="0" style="border-width: 0;width:100px;table-layout: auto;">
                        <tr>
                        <th style="border-left-style: none; border-left-width: medium;border-top-style: none; border-top-width: medium;width:50px;">交车</th>
                        <th style="border-top-style: none; border-top-width: medium;border-right-style: none; border-right-width: medium;width:50px;">交车人</th>
                        </tr>
                        <tr>
                        <th colspan="2" style="border-bottom-style: none; border-bottom-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;">延时原因</th>
                        </tr>
                        </table>
                     	</th>
						<th style="border:0px;background-color:#fff;"></th>
                    </tr>
                </table>
			</div>
			<div id="dataDiv" style="width:1295px;min-height:250px;overflow-x: hidden;overflow-y: auto;">
			<script type="text/javascript">
								function getPL(divid,dutyid,ditemtype){
									jQuery.post("${pageContext.request.contextPath}/crm::/dutyModule/action/QueryDutyItemList.action",{'dutyid':dutyid,'ditemtype':ditemtype},
										function(json,textStatus){
										        var num = json.duty_item_result.length;
										        var i=0;
										        var code='';
												for(;i<num;i++){
													if(ditemtype=='160001'||ditemtype=='160003'){
													code+='<tr style="background-color: #A0C7FA;">';
													}else{
													code+='<tr style="background-color: #EBE08A;">';
													}
													var dutyitemid=json.duty_item_result[i].dutyitemid==null?"&nbsp;":json.duty_item_result[i].dutyitemid;
													var dutyid=json.duty_item_result[i].dutyid==null?"&nbsp;":json.duty_item_result[i].dutyid;
													var ditemoperator=json.duty_item_result[i].ditemoperator_dict==null?"&nbsp;":json.duty_item_result[i].ditemoperator_dict;
													var ditemstarttime=json.duty_item_result[i].ditemstarttime==null?"&nbsp;":json.duty_item_result[i].ditemstarttime;
													var ditemendtime=json.duty_item_result[i].ditemendtime==null?"&nbsp;":json.duty_item_result[i].ditemendtime;
													var ditemstation=json.duty_item_result[i].ditemstation==null?"&nbsp;":json.duty_item_result[i].ditemstation;
													var ditemcontent=json.duty_item_result[i].ditemcontent==null?"&nbsp;":json.duty_item_result[i].ditemcontent;
													if(ditemtype=='160003'){
														if(i==0){
															code+='<td style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:41px;"><a href="javascript:updateDuty1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/edt.gif" title="修改" /></a><a href="javascript:delConf1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></td>';
															
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;width:40px;" title="'+ditemstarttime+'">'+(ditemstarttime.length<16?ditemstarttime:ditemstarttime.substring(11,16))+'</td>';
															
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:40px;" title="'+ditemendtime+'">'+(ditemendtime.length<16?ditemendtime:ditemendtime.substring(11,16))+'</td>';
															
														}else{
															code+='<td style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;"><a href="javascript:updateDuty1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/edt.gif" title="修改" /></a><a href="javascript:delConf1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></td>';
															
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;" title="'+ditemstarttime+'">'+(ditemstarttime.length<16?ditemstarttime:ditemstarttime.substring(11,16))+'</td>';
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;" title="'+ditemendtime+'">'+(ditemendtime.length<16?ditemendtime:ditemendtime.substring(11,16))+'</td>';
															
														}
														
													}else if(ditemtype=='160001'||ditemtype=='160002'){
														if(i==0){
															code+='<td style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:41px;"><a href="javascript:updateDuty1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/edt.gif" title="修改" /></a><a href="javascript:delConf1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></td>';
															
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;width:50px;">'+ditemoperator+'</td>';
															
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;width:40px;" title="'+ditemstarttime+'">'+(ditemstarttime.length<16?ditemstarttime:ditemstarttime.substring(11,16))+'</td>';
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:40px;" title="'+ditemendtime+'">'+(ditemendtime.length<16?ditemendtime:ditemendtime.substring(11,16))+'</td>';
															
														}else{
															code+='<td style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;"><a href="javascript:updateDuty1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/edt.gif"  title="修改"/></a><a href="javascript:delConf1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></td>';
															
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;">'+ditemoperator+'</td>';
															
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;" title="'+ditemstarttime+'">'+(ditemstarttime.length<16?ditemstarttime:ditemstarttime.substring(11,16))+'</td>';
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;" title="'+ditemendtime+'">'+(ditemendtime.length<16?ditemendtime:ditemendtime.substring(11,16))+'</td>';
															
														}
													}else{
														if(i==0){
															code+='<td style="border-top-style: none; border-top-width: medium;border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;width:41px;"><a href="javascript:updateDuty1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/edt.gif" title="修改" /></a><a href="javascript:delConf1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></td>';
															
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;width:50px;">'+ditemoperator+'</td>';
															
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;width:40px;" title="'+ditemstarttime+'">'+(ditemstarttime.length<16?ditemstarttime:ditemstarttime.substring(11,16))+'</td>';
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;width:40px;" title="'+ditemendtime+'">'+(ditemendtime.length<16?ditemendtime:ditemendtime.substring(11,16))+'</td>';
															
															code+='<td style="border-top-style: none; border-top-width: medium;border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;width:60px;">'+ditemstation+'</td>';
															
														}else{
															code+='<td style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;"><a href="javascript:updateDuty1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/edt.gif"  title="修改"/></a><a href="javascript:delConf1('+dutyitemid+');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="删除" /></a></td>';
															
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;">'+ditemoperator+'</td>';
															
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;" title="'+ditemstarttime+'">'+(ditemstarttime.length<16?ditemstarttime:ditemstarttime.substring(11,16))+'</td>';
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;" title="'+ditemendtime+'">'+(ditemendtime.length<16?ditemendtime:ditemendtime.substring(11,16))+'</td>';
															
															code+='<td style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;">'+ditemstation+'</td>';
															
														}
													}
										        	code+='</tr>';
										        }
												if(num==1){
														if(ditemtype=='160001'||ditemtype=='160003'){
															code+='<tr style="background-color: #A0C7FA;">';
														}else{
															code+='<tr style="background-color: #EBE08A;">';
														}
														if(ditemtype=='160003'){
															
																code+='<td style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;">&nbsp;</td>';
																
															
														}else if(ditemtype=='160001'||ditemtype=='160002'){
															
																code+='<td style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;">&nbsp;</td>';
																
														}else{
															
																code+='<td style="border-left-style: none; border-left-width: medium;border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;">&nbsp;</td>';
																
																code+='<td style="border-bottom-style: none; border-bottom-width: medium;border-right-style: none; border-right-width: medium;">&nbsp;</td>';
															
														}
														code+='</tr>';
													}
										        jQuery('#'+divid).html(code);
										},"json");
								}
						</script>
				<table id="dataTb" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var" varStatus="status">
                   <c:if test="${empty var.dutydelivtime}">
                   		<c:if test="${!empty var.deltime}">
	             			<tr style="line-height:10px;background-color: #CCC;">
	             		</c:if>
	             		<c:if test="${empty var.deltime}">
	             			<c:if test="${nowz>fn:substring(var.dutypredelivtime,0,13) or nowz==fn:substring(var.dutypredelivtime,0,13)  }">
		             			<tr style="line-height:10px;background-color: #FFC125;">
		             		</c:if>
		             		<c:if test="${nowz<fn:substring(var.dutypredelivtime,0,13)}">
		             			<tr style="line-height:10px;background-color: #c5ffd1;">
		             		</c:if>
	             		</c:if>
             		</c:if>	
             		<c:if test="${!empty var.dutydelivtime}">
             			<c:if test="${!empty var.deltime}">
	             			<tr style="line-height:10px;background-color: #CCC;">
	             		</c:if>
	             		<c:if test="${empty var.deltime}">
	             			<tr style="line-height:10px;background-color: #ffb2b2;">
	             		</c:if>
             		</c:if>
             			<td style="width:50px;">
                            <a href="javascript:updateDuty('${var.dutyid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/edt.gif" title="修改" /></a>
                            <a href="javascript:delConf('${var.dutyid}');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/del.gif" title="废弃" /></a>
                        </td>
	             		<td style="width:290px;padding:0px;background-color: #A0C7FA;vertical-align: top;">
	                     	<table cellspacing="0" cellpadding="0" style="border-width: 0;width:290px;table-layout: fixed;">
	                        <tr style="background-color: #A0C7FA;">
	                        <td style="border-left-style: none; border-left-width: medium;border-top-style: none; border-top-width: medium;width:40px;" title="${var.dutyintime }">${var.dutyintime!=null?fn:substring(var.dutyintime,11,16):""}</td>
							<td style="border-top-style: none; border-top-width: medium;width:50px;" title="${var.dutycarmodel_dict }">${var.dutycarmodel_dict}</td>
	                        <td style="border-top-style: none; border-top-width: medium;width:70px;" title="${var.carlicenseno }">${var.carlicenseno}</td>
	                        <td style="border-top-style: none; border-top-width: medium;width:50px;" title="${var.dutycarmodel_dict }">${var.dutystaff_dict}</td>
	                        <td style="border-top-style: none; border-top-width: medium;border-right-style: none; border-right-width: medium;width:80px;" title="${var.dutypredelivtime }">${var.dutypredelivtime!=null?fn:substring(var.dutypredelivtime,8,16):""}</td>
	                        </tr>
	                        <tr style="background-color: #A0C7FA;">
	                        <td colspan="5" style="border-bottom-style: none; border-bottom-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;" title="${var.dutywkcontent }">${var.dutywkcontent}</td>
	                        </tr>
	                        </table>
                     	</td>
						<td style="width:19px;background-color: #EBE08A;vertical-align: top;">
						<a href="javascript:addNewWin1('${var.dutyid}','160004');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/add.gif" title="新增" /></a>
						</td>
                        <td style="width:250px;padding:0px;background-color: #EBE08A;vertical-align: top;">
                        <table id="jd_${status.index}" cellspacing="0" cellpadding="0" style="border-width: 0;width:250px;table-layout: fixed;">
                        </table>
                        <script type="text/javascript">getPL("jd_"+${status.index},'${var.dutyid}','160004');</script>
						</td>
						<td style="width:19px;background-color: #A0C7FA;vertical-align: top;">
						<a href="javascript:addNewWin1('${var.dutyid}','160001');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/add.gif" title="新增" /></a>
						</td>
						<td style="width:190px;padding:0px;background-color: #A0C7FA;vertical-align: top;">
						<table id="bj_${status.index}" cellspacing="0" cellpadding="0" style="border-width: 0;width:190px;table-layout: fixed;">
                        </table>
                        <script type="text/javascript">getPL("bj_"+${status.index},'${var.dutyid}','160001');</script>
						</td>
						<td style="width:19px;background-color: #EBE08A;vertical-align: top;">
						<a href="javascript:addNewWin1('${var.dutyid}','160002');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/add.gif" title="新增" /></a>
						</td>
						<td style="width:190px;padding:0px;background-color: #EBE08A;vertical-align: top;">
						<table id="pq_${status.index}" cellspacing="0" cellpadding="0" style="border-width: 0;width:190px;table-layout: fixed;">
                        </table>
                        <script type="text/javascript">getPL("pq_"+${status.index},'${var.dutyid}','160002');</script>
						</td>
						<td style="width:19px;background-color: #A0C7FA;vertical-align: top;">
						<a href="javascript:addNewWin1('${var.dutyid}','160003');"><img src="<%=request.getContextPath()%>/crm/coreModule/web/images/add.gif" title="新增" /></a>
						</td>
						<td style="width:120px;padding:0px;background-color: #A0C7FA;vertical-align: top;">
						<table id="xc_${status.index}" cellspacing="0" cellpadding="0" style="border-width: 0;width:120px;table-layout: fixed;">
                        </table>
                        <script type="text/javascript">getPL("xc_"+${status.index},'${var.dutyid}','160003');</script>
						</td>
						<td style="width:100px;padding:0px;background-color: #EBE08A;vertical-align: top;">
	                     	<table cellspacing="0" cellpadding="0" style="border-width: 0;width:100px;table-layout: fixed;">
	                        <tr style="background-color: #EBE08A;">
	                        <td style="border-left-style: none; border-left-width: medium;border-top-style: none; border-top-width: medium;width:50px;" title="${var.dutydelivtime }">${var.dutydelivtime!=null?fn:substring(var.dutydelivtime,11,16):""}</td>
	                        <td style="border-top-style: none; border-top-width: medium;border-right-style: none; border-right-width: medium;width:50px;" title="${var.dutydelivery_dict }">${var.dutydelivery_dict}</td>
	                        </tr>
	                        <tr style="background-color: #EBE08A;">
	                        <td colspan="2" style="border-bottom-style: none; border-bottom-width: medium;border-left-style: none; border-left-width: medium;border-right-style: none; border-right-width: medium;" title="${var.dutydelayreason }">${var.dutydelayreason}</td>
	                        </tr>
	                        </table>
                     	</td>
						<td style="border:0px;background-color:#fff;"></td>
                    </tr>  
                     </c:forEach>  
            </table>
            </div>
    </div>
</div>
<form id="hiddenform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/dutyModule/action/QueryDutyList.action">
<input type="hidden" name="startIndex" id="startIndex" value="${startIndex}"/>
<input type="hidden" name="endIndex" id="endIndex" value="${endIndex}"/>
<input type="hidden" name="carlicenseno" id="carlicenseno" value="${carlicenseno}"/>
<input type="hidden" name="carvin" id="carvin" value="${carvin}"/>
<input type="hidden" name="carcardid" id="carcardid" value="${carcardid}"/>
<input type="hidden" name="dutytype" id="dutytype" value="${dutytype}"/>
<input type="hidden" name="dutystaff" id="dutystaff" value="${dutystaff}"/>
<input type="hidden" name="dutydelivtime" id="dutydelivtime" value="${dutydelivtime}"/>
<input type="hidden" name="carbrand" id="carbrand" value="${carbrand}"/>
<input type="hidden" name="dutycarmodel" id="dutycarmodel" value="${dutycarmodel}"/>
<input type="hidden" name="min_dutyintime" id="min_dutyintime" value="${min_dutyintime}"/>
<input type="hidden" name="max_dutyintime" id="max_dutyintime" value="${max_dutyintime}"/>
<input type="hidden" name="dutycommu" id="dutycommu" value="${dutycommu}"/>
</form>
</body>
</html>
<script type="text/javascript">
$('#carvin').autocomplete({
        serviceUrl: '', // Page for processing autocomplete requests
        minChars: 2, // Minimum request length for triggering autocomplete
        delimiter: /(,|;)\s*/, // Delimiter for separating requests (a character or regex)
        maxHeight: 400, // Maximum height of the suggestion list, in pixels
        width: 200, // List width
        zIndex: 9999, // List's z-index
        deferRequestBy: 0, // Request delay (milliseconds), if you prefer not to send lots of requests while the user is typing. I usually set the delay at 300 ms.
        params: { country: 'Yes'}, // Additional parameters
        onSelect: function(data, value){ }, // Callback function, triggered if one of the suggested options is selected,
        lookup: ['January', 'February', 'March'] // List of suggestions for local autocomplete
    });
	
</script>
<script>
var onAutocompleteSelect = function(value, data) {
      //$('#selection').html('<img src="\/global\/flags\/small\/' + data + '.png" alt="" \/> ' + value);
      //alert(data);
    }

var options = {
      //serviceUrl: '<%=request.getContextPath() %>/crm/ccioModule/web/vinsdata.jsp',
      serviceUrl: '<%=request.getContextPath() %>/crm::/ccioModule/action/GetVinByLike.action',
      width: 200,
      delimiter: /(,|;)\s*/,
      //onSelect: onAutocompleteSelect,
      deferRequestBy: 0, //miliseconds
      params: { country: 'Yes' },
      noCache: false //set to true, to disable caching
    };

	var ac = $('#carvin').autocomplete(options);
    ac.disable();
    ac.enable();
    ac.setOptons({ zIndex: 1001 });

//屏蔽鼠标右键
function document.oncontextmenu(){event.returnValue=false;}
</script>