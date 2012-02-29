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
			$('#partsstaff').selectDict({type:'crm_waiter',id:'partsstaff',value:'${partsstaff}'});
			$('#crmform').saturnRelationSelect({
					levels:['carbrand', 'carseries','carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}']
			});
			
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/partsModule/action/QueryPartsList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(partsid){
			if(window.confirm("确认删除此条记录？")){
				window.location = "${pageContext.request.contextPath}/crm::/partsModule/action/DeleteParts.action?partsid="+partsid+"&startIndex=0&endIndex=9"; 
			}
		}
		
		function modify(partsid){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/partsModule/action/QueryParts.action?partsid="+partsid;
			$('#hiddenForm')[0].submit();
		}
		
		function exportExcel(){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/partsModule/action/ExportPartsList.action";
			$('#hiddenForm')[0].submit();
		}
</script> 
<title>精品管理</title>
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/partsModule/action/QueryPartsList.action?startIndex=0&endIndex=9" method="post">
			<fieldset id="formFiled">
			  <legend>精品管理</legend>
               <table cellspacing="2" cellpadding="0">
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                      <td class="colName">档案编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                    </tr>        
                    <tr>
                      <td class="colName">进厂时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_partsintime}" name="min_partsintime" id="min_partsintime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_partsintime}" name="max_partsintime" id="max_partsintime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">精品接待:</td>
                      <td class="detailColVal">
                        <select id="partsstaff" name="partsstaff">
                        </select>
                      </td>                      
                      <td class="colName">地区:</td>
                      <td class="detailColVal">
                      	<select id="cararea" name="cararea">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carArea}" var="var">				
				           		<c:if test="${var.key==cararea}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=cararea}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>			
				           	</c:forEach>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">出厂时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" value="${min_partsouttime}" name="min_partsouttime" id="min_partsouttime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" value="${max_partsouttime}" name="max_partsouttime" id="max_partsouttime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">品牌:</td>
                      <td class="detailColVal">
                      	<select id="carbrand" name="carbrand">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carModel$}" var="var">				
				           		<option value="${var.key}">${var.value}</option>			
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">车系:</td>
                      <td class="detailColVal">
                      	<select id="carseries" name="carseries"></select>
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
				<td style="width:85%"><div id="paginate"></div></td>
				<td style="width:15%"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/partsModule/web/addParts.jsp">新增</a></div>
					<div class="optAdd"><a href="javascript:exportExcel();">导出</a></div>
				</td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:2220px;">
	      		<table style="width:2200px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>档案编号</th>
                        <th style="width:160px;">车架号</th>
                        <th>车牌号</th>
                        <th>品牌</th>
                        <th>车系</th>
                        <th>车型</th>                      
                        <th>地区</th>
                        <th>精品接待</th>
                        <th>精品名称</th>
                        <th>精品消费</th>
                        <th>工作人员</th>
                        <th>精品进厂时间</th>
                        <th>精品出厂时间</th>
                        <th>车主</th>
                        <th>性别</th>
                        <th>电话</th>
                        <th>手机</th>
                        <th>基本操作</th>                                   
                    </tr>
                </table>
            </div>	

            <div id="dataDiv" style="width:2240px;">
			   <table id="dataTb" style="width:2200px;" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                        <td>${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carlicenceno}</td>
                        <td>${var.carbrand_dict}</td>
                        <td>${var.carseries_dict}</td>
                        <td>${var.carmodel_dict}</td>
                        <td>${var.cararea_dict}</td>
                        <td>${var.partsstaff_dict}</td>
                        <td>${var.partsname}</td>
                        <td>${var.partsexpense}</td>
                        <td>${var.partsworker_dict}</td>
                        <td>${fn:substring(var.partsintime,0,10)}</td>
                        <td>${fn:substring(var.partsouttime,0,10)}</td>
                        <td>${var.cstmname}</td>
                        <td>${var.cstmsex_dict}</td>
                        <td>${var.cstmtel}</td>
                        <td>${var.cstmmobile}</td>
                        <td>
                            <div class="edit"><a href="javascript:modify('${var.partsid}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.partsid}');">删除</a></div>
                        </td>
                 </c:forEach>		
            </table>
    	 </div>
	</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="carbrand" value="${carbrand}">
		<input type="hidden" name="carmodel" value="${carseries}">
		<input type="hidden" name="pageValue" value='${carmodel}'>
		<input type="hidden" name="cararea" value="${cararea}">
		<input type="hidden" name="partsstaff" value="${partsstaff}">
		<input type="hidden" name="pageValue" value='${partsname}'>
		<input type="hidden" name="pageValue" value='${partsexpense}'>
		<input type="hidden" name="pageValue" value='${partsworker}'>
		<input type="hidden" name="min_partsouttime" value="${min_partsouttime}">
		<input type="hidden" name="max_partsouttime" value="${max_partsouttime}">
		<input type="hidden" name="min_partsintime" value="${min_partsintime}">
		<input type="hidden" name="max_partsintime" value="${max_partsintime}">
		<input type="hidden" name="pageValue" value='${cstmname}'>
		<input type="hidden" name="pageValue" value='${cstmsex}'>
		<input type="hidden" name="pageValue" value='${cstmtel}'>
		<input type="hidden" name="pageValue" value='${cstmmobile}'>
		
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
