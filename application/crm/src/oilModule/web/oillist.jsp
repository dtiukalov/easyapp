<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() { 
			$('#oilstaff').selectDict({type:'crm_waiter',id:'oilstaff',value:'${oilstaff}'});
			$('#crmform').saturnRelationSelect({
					levels:['carbrand', 'carseries','carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}','${carmodel}']
			});
			
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/oilModule/action/QueryOilList.action',
				form:'crmform',
				percount:10
			});
			
			$("#checkedAll").click(function() { 
				if ($(this).attr("checked") == true) { // 全选 
				   $("input[name='oilidCk']").each(function() { 
					   $(this).attr("checked", true); 
				   }); 
				} else { // 取消全选 
				   $("input[name='oilidCk']").each(function() { 
				   $(this).attr("checked", false); 
				  }); 
				} 
			})
		}); 
		
		function delConf(oilid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/oilModule/action/DeleteOil.action?oilid="+oilid; 
				$('#hiddenForm')[0].submit();
			}
		}
		
		function modify(oilid){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/oilModule/action/QueryOil.action?oilid="+oilid;
			$('#hiddenForm')[0].submit();
		}
		
		function exportExcel(){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/oilModule/action/ExportOilList.action";
			$('#hiddenForm')[0].submit();
		}
		
		function feiqi(){
			var str="";
		    $(":checkbox[name='oilidCk'][checked]").each(function(){  
			 	str+=$(this).val()+",";
			});
			if(str==""){
				alert("没有选择要废弃的存油");
			}else{
				$.post("<%=request.getContextPath()%>/crm::/oilModule/action/DisuseOil.action", 
			       {oilidCk: str},
			       function(json, textStatus){
			         if(json==true){
			         	alert("已成功废弃");
			         	$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/oilModule/action/QueryOilList.action";
						$('#hiddenForm')[0].submit();
			         }
			       }, 
			       "json");
			}
		}
</script> 
<title>存油管理</title>
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/oilModule/action/QueryOilList.action?startIndex=0&endIndex=9">
			<input type="hidden" name="startIndex" value='0'>
		<input type="hidden" name="endIndex" value='9'>
			<fieldset id="formFiled">
			  <legend>存油管理</legend>
               <table cellspacing="2" cellpadding="0">
                    <tr>
                      <td class="colName">档案编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      <td class="colName">存油日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_oilstoretime}" name="min_oilstoretime" id="min_oilamount" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_oilstoretime}" name="max_oilstoretime" id="max_oilamount" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>                
                      <td class="colName">存油接待:</td>
                      <td class="detailColVal">
                      	<select id="oilstaff" name="oilstaff">                       	
                        </select>
                      </td>
                       <td class="colName">出油日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_oilouttime}" name="min_oilouttime" id="min_oilouttime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_oilouttime}" name="max_oilouttime" id="max_oilouttime" onfocus="dayCalender(this)" class="Wdate"/>
                       </td>
                     </tr> 
                      <tr>
                      <td class="colName">工单号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="servorderid" id="servorderid" value="${servorderid}"/>
                      </td>
                      <td class="colName">废弃或出油</td>
                      <td class="detailColVal">
                      <c:if test="${flag=='1'}">
                      <input id="flag" name="flag" type="checkbox" value="1" checked="checked"/>
                      </c:if>
                      	<c:if test="${flag!='1'}">
                      <input id="flag" name="flag" type="checkbox" value="1"/>
                      </c:if>
                      </td>
                      <td class="colName">&nbsp;</td>
                      <td class="detailColVal" style="width:35%;">
                      	&nbsp;
                      </td>
                    </tr>
              </table>   
              <div style="margin-buttom:10px;text-align:center;">
                    <input type="submit" value="查询" />
                    <input type="reset" value="重置" />
              </div>     
			</fieldset>           
		</form>
        <table class="optDiv">
			<tr>
				<td style="width:85%;"><div id="paginate"></div></td>
				<td style="width:15%;"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/oilModule/web/addoil.jsp">新增</a></div>
				<div class="optAdd"><a href="javascript:exportExcel();">导出</a></div>
				<div class="optAdd"><a href="javascript:feiqi();">废弃</a></div></td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:1260px;">
	      		<table style="width:1240px;" cellspacing="0" cellpadding="0">
	                    <tr>
	                        <th><input type="checkbox" name="checkedAll" id="checkedAll" style="width:15px;vertical-align:middle; margin-top:0;border:none;"/>档案编号</th>
	                        <th style="width:160px;">车架号</th>
	                        <th>车牌号</th>
	                        <th>存油时间</th>
	                        <th>存油编号</th>
	                        <th>工单号</th>
	                        <th>存油种类</th>
	                        <th>存油量</th>
	                        <th>出油时间</th>
	                        <th>存油接待</th>
	                        <th>基本操作</th>                                   
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:1260px;">
			   <table id="dataTb" style="width:1240px;" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                        <td><input type="checkbox" name="oilidCk" id="${var.oilid}" value="${var.oilid}" style="width:15px;vertical-align:middle; margin-top:0;border:none;"/>${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carlicenceno}</td>
                        <td>${fn:substring(var.oilstoretime,0,10)}</td>
                        <td>${var.oilnumber}</td>
                        <td>${var.servorderid}</td>
                        <td>${var.oiltype_dict}</td>
                        <td>${var.oilamount}</td>
                        <td>${fn:substring(var.oilouttime,0,10)}</td>
                        <td>${var.oilstaff_dict}</td>
                        <td>
                            <div class="edit"><a href="javascript:modify('${var.oilid}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.oilid}')">删除</a></div>
                        </td>
                 </c:forEach>
            </table>
    </div>
</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="min_oilstoretime" value="${min_oilstoretime}">
		<input type="hidden" name="max_oilstoretime" value="${max_oilstoretime}">
		<input type="hidden" name="oilstaff" value="${oilstaff}">
		<input type="hidden" name="oilstate" value="${oilstate}">
		<input type="hidden" name="min_oilouttime" value="${min_oilouttime}">
		<input type="hidden" name="max_oilouttime" value="${max_oilouttime}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
		<input type="hidden" name="servorderid" value='${servorderid}'>
		<input type="flag" name="flag" value='${flag}'>
	</form>
</div>
</body>
</html>
