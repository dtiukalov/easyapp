<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>养护管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() {
			$('#carestaff').selectDict({type:'crm_waiter',id:'carestaff',value:'${carestaff}'});
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/careModule/action/QueryCareList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function exportExcel(){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/careModule/action/ExportCareList.action";
			$('#hiddenForm')[0].submit();
		}
		
		function modify(careid){
			$('#hiddenForm')[0].action = "<%=request.getContextPath()%>/crm::/careModule/action/QueryCareDetail.action?careid="+careid;
			$('#hiddenForm')[0].submit();
		}
		
		function delConf(careid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/careModule/action/DeleteCare.action?careid="+careid;
				$('#hiddenForm')[0].submit();
			}
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/careModule/action/QueryCareList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>养护管理</legend>
              <table cellspacing="5" cellpadding="0">
                    <tr>
                      <td class="colName">档案号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">养护进厂时间:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_careintime" id="min_careintime" value="${min_careintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_careintime" id="max_careintime" value="${max_careintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      <td class="colName">养护出厂时间:</td>
                      <td class="detailColVal">
                      		<input type="text" name="min_careouttime" id="min_careouttime" value="${min_careouttime}" onfocus="dayCalender(this)" class="Wdate"/>
	                      	<span>至</span>
	                      	<input type="text" name="max_careouttime" id="max_careouttime" value="${max_careouttime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">养护接待:</td>
                      <td class="detailColVal">
                        <select id="carestaff" name="carestaff">              
                        </select>
                      </td>
                    </tr>
                    <tr>
                    	<td class="colName">工单号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="careorderid" id="careorderid" value="${careorderid}"/>
                      </td>       
                      <td class="colName">养护名称:</td>
                      <td class="detailColVal">
                        <select id="careitems" name="careitems">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_careItemName}" var="var">				
			             		<c:if test="${var.key==careitems}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=careitems}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
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
				<td style="width:15%;"><div class="optAdd">
				<a href="<%=request.getContextPath()%>/crm/careModule/web/addCare.jsp">新增</a></div>
				<div class="optAdd"><a href="javascript:exportExcel();">导出</a></div>
				</td>
			</tr>
		</table>
        <div class="tbDiv">
     		<div style="width:1540px;">
	      		<table style="width:1520px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>档案编号</th>
                        <th style="width:160px;">车架号</th>
                        <th>车牌号</th>
                        <th>品牌</th>
                        <th>车系</th>
                        <th>进厂时间</th>
                        <th style="width:160px;">工单号</th>
                        <th>养护接待</th>
                        <th>养护消费</th>
                        <th>养护桶数</th>
                        <th>出厂时间</th>
                        <th>操作</th>                         
                    </tr>
                  </table>
            </div>	
            <div id="dataDiv" style="width:1560px;">
			   <table id="dataTb" style="width:1520px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carlicenceno}</td>                     
                        <td>${var.carbrand_dict}</td>
         				<td>${var.carseries_dict}</td>
                        <td>${fn:substring(var.careintime,0,10)}</td>
 						<td style="width:160px;">${var.careorderid}</td>
 						<td>${var.carestaff_dict}</td> 
 						<td>${var.careexpense}</td>  
 						<td>${var.carebucketnum}</td> 
 						<td>${fn:substring(var.careouttime,0,10)}</td>                                         
                        <td>
                            <div class="edit"><a href="javascript:modify('${var.careid}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.careid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
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
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>