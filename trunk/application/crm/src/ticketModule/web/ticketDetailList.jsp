<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代金管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketDetailList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(ticketid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/ticketModule/action/DeleteTicket.action?ticketid="+ticketid; 
				$('#hiddenForm')[0].submit();
			}
		}
		function modify(ticketid){
			$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicket.action?ticketid="+ticketid;
			$('#hiddenForm')[0].submit();
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketDetailList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>代金管理</legend>
                <table cellspacing="2" cellpadding="0">
                    <tr>
                      <td class="colName">档案编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">发放时间:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_tiktgranttime" id="min_tiktgranttime" value="${min_tiktgranttime}" onfocus="dayCalender(this)" class="Wdate"/>
                     	<span>至</span>
                     	<input type="text" name="max_tiktgranttime" id="max_tiktgranttime" value="${max_tiktgranttime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      
                    </tr>
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                      <td class="colName">使用时间:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_tiktusetime" id="min_tiktusetime" value="${min_tiktusetime}" onfocus="dayCalender(this)" class="Wdate"/>
                     	<span>至</span>
                     	<input type="text" name="max_tiktusetime" id="max_tiktusetime" value="${max_tiktusetime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">工单号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="servorderid" id="servorderid" value="${servorderid}"/>
                      </td>
                    </tr> 
                    <tr>
                      <td class="colName">代金状态:</td>
                      <td class="detailColVal">
                      	 <select name="tiktstate" id="tiktstate"">
							<option value=""></option>
				            <c:forEach items="${dict.crm_ticketState}" var="var">				
				            	<c:if test="${var.key==tiktstate}">
				           			<option value="${var.key}" selected>${var.value}</option>
				           		</c:if>	
				           		<c:if test="${var.key!=tiktstate}">
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
			</tr>
		</table>
        <div class="tbDiv">
     		<div style="width:1380px;">
	      		<table style="width:1360px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th style="width:100px;">档案编号</th>
                        <th style="width:160px;">车架号</th>
                        <th style="width:100px;">车牌号</th>
                        <th style="width:130px;">发放时间</th>        
                        <th style="width:100px;">代金状态</th>
                        <th style="width:100px;">代金金额</th>  
                      	<th style="width:130px;">使用时间</th>
                      	<th style="width:120px;">工单号</th>
                        <th style="width:120px;">基本操作</th>                                   
                    </tr>
                </table>
            </div>	
            <div id="dataDiv" style="width:1380px;">
			   <table id="dataTb" style="width:1360px;" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                        <tr>
                        <td style="width:100px;">${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td style="width:100px;">${var.carlicenceno}</td>
                        <td style="width:130px;">${var.tiktgranttime}</td>
                        <td style="width:100px;">${var.tiktstate_dict}</td>
                        <td style="width:100px;">${var.tiktamount}</td>
                        <td style="width:130px;">${var.tiktusetime}</td>
                        <td style="width:120px;">${var.servorderid}</td>
                        <td style="width:120px;">
                        	<div class="edit"><a href="javascript:modify('${var.ticketid}');">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.ticketid}');">删除</a></div>
                        </td>
                    </tr>
                   </c:forEach>	
            	</table>
    		</div>
</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
		<input type="hidden" name="carcardid" value="${carcardid}">
		<input type="hidden" name="carvin" value="${carvin}">
		<input type="hidden" name="carlicenceno" value="${carlicenceno}">
		<input type="hidden" name="servorderid" value="${servorderid}">
		<input type="hidden" name="min_tiktgranttime" value="${min_tiktgranttime}">
		<input type="hidden" name="max_tiktgranttime" value="${max_tiktgranttime}">
		<input type="hidden" name="min_tiktusetime" value="${min_tiktusetime}">
		<input type="hidden" name="max_tiktusetime" value='${max_tiktusetime}'>
		<input type="hidden" name="tiktstate" value='${tiktstate}'>
		<input type="hidden" name="startIndex" value='${startIndex}'>
		<input type="hidden" name="endIndex" value='${endIndex}'>
		<input type="hidden" name="pageValue" value='${pageValue}'>
	</form>
</div>
</body>
</html>
