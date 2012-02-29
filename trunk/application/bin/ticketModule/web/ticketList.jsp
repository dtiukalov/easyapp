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
			$('#crmform').saturnRelationSelect({
					levels:['carbrand', 'carseries','carmodel'],
					type:'crm_carModel',
					firstValue:[['','选择车型'],['','选择型号']],
					defaultValue:['${carbrand}','${carseries}']
			});
			
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketList.action',
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
		
		function detail(carvin){
			window.open ("${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketDetailList.action?carvin="+carvin+"&startIndex=0&endIndex=9", "", "height=600, width=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no"); 
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ticketModule/action/QueryTicketList.action">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<fieldset id="formFiled">
			  <legend>代金管理</legend>
                <table cellspacing="2" cellpadding="0">
                    <tr>
                      <td class="colName">使用时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_tiktusetime" value="${min_tiktusetime}" id="min_tiktusetime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="max_tiktusetime" value="${max_tiktusetime}" id="max_tiktusetime" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">档案编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carcardid" id="carcardid" value="${carcardid}"/>
                      </td>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>    
                    </tr>
                    <tr>
                    <td class="colName">发放时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_tiktgranttime" value="${min_tiktgranttime}" id="min_tiktgranttime" onfocus="dayCalender(this)" class="Wdate"/>
                        <span>至</span>
                        <input type="text" name="max_tiktgranttime" value="${max_tiktgranttime}" id="max_tiktgranttime" onfocus="dayCalender(this)" class="Wdate"/>
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
                    <tr>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                      <td class="colName">地区:</td>
                      <td class="detailColVal">
                      	<select id="cararea" name="cararea">
                        	<option value=""></option>
                           	<c:forEach items="${dict.crm_carArea$}" var="var">	
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
				<td style="width:15%;"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/ticketModule/web/addticket.jsp">新增</a></div></td>
			</tr>
		</table>
        <div class="tbDiv">
     		<div style="width:1320px;">
	      		<table style="width:1300px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th style="width:100px;">档案编号</th>
                        <th style="width:160px;">车架号</th>
                        <th style="width:100px;">车牌号</th>
                        <th style="width:100px;">品牌</th>
                        <th style="width:100px;">车系</th>  
                        <th style="width:100px;">地区</th>                 
                      	<th style="width:100px;">车主</th>
                      	<th style="width:120px;">手机</th>
                      	<th style="width:100px;">发放金额</th>
                      	<th style="width:100px;">使用金额</th>
                      	<th style="width:100px;">剩余金额</th>
                        <th style="width:120px;">基本操作</th>                                   
                    </tr>
                </table>
            </div>	
            <div id="dataDiv" style="width:1320px;">
			   <table id="dataTb" style="width:1300px;" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                        <tr>
                        <td style="width:100px;">${var.carcardid}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td style="width:100px;">${var.carlicenceno}</td>
                        <td style="width:100px;">${var.carbrand_dict}</td>
                        <td style="width:100px;">${var.carseries_dict}</td>
                        <td style="width:100px;">${var.cararea_dict}</td>
                        <td style="width:100px;">${var.cstmname}</td>
                        <td style="width:120px;">${var.cstmmobile}</td>
                        <td style="width:100px;">${var.fafang}</td>
                        <td style="width:100px;">${var.shiyong}</td>
                        <td style="width:100px;">${var.shengyu}</td>
                        <td style="width:120px;">
                        	<div class="edit"><a href="javascript:detail('${var.carvin}');">详细</a></div>
                        </td>
                    </tr>
                   </c:forEach>	
            	</table>
    		</div>
</div>
</body>
</html>
