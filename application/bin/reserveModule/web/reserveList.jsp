<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>预约管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() {
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/reserveModule/action/QueryReserveList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(reserveid){
			if(window.confirm("确认删除此条记录？")){
				window.location = "<%=request.getContextPath()%>/crm::/reserveModule/action/DeleteReserve.action?reserveid="+reserveid+"&startIndex=0&endIndex=9"; 
			}
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/reserveModule/action/QueryReserveList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>预约管理</legend>
              <table cellspacing="5" cellpadding="0">
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenseno" id="carlicenseno" value="${carlicenseno}"/>
                      </td>
                      <td class="colName">接受预约日:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_resvaccessdate" id="min_resvaccessdate" value="${min_resvaccessdate}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_resvaccessdate" id="max_resvaccessdate" value="${max_resvaccessdate}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">预约单号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="resvorderid" id="resvorderid" value="${resvorderid}"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">预约类别:</td>
                      <td class="detailColVal">
                      	<select id="resvtype" name="resvtype">
                            <option value=""></option>
                            <c:forEach items="${dict.crm_resvType}" var="var">				
				           		<c:if test="${var.key==resvtype}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=resvtype}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>					
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">预约进厂时间:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_resvintime" id="min_resvintime" value="${min_resvintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_resvintime" id="max_resvintime" value="${max_resvintime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">服务专员:</td>
                      <td class="detailColVal">
                        <select id="servstaff" name="servstaff">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_waiter}" var="var">				
			             		<c:if test="${var.key==servstaff}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=servstaff}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
                      </td>
                    </tr>
                    <tr>
	                    <td class="colName">预约单状态:</td>
	                    <td class="detailColVal">
                      	<select id="resvstate" name="resvstate">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_resvState}" var="var">				
			             		<c:if test="${var.key==resvstate}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=resvstate}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>		
			             	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">资料来源:</td>
                      <td class="detailColVal">
                      	<select id="resvsource" name="resvsource">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_resvSource}" var="var">				
				           		<c:if test="${var.key==resvsource}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=resvsource}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>			
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">工单号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="servorderid" id="servorderid" value="${servorderid}"/>
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
				<td style="width:15%;"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/reserveModule/web/addReserve.jsp">新增</a></div></td>
			</tr>
		</table>
        <div class="tbDiv">
     		<div style="width:2220px;">
	      		<table style="width:2200px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>预约单号</th>
                        <th style="width:160px;">工单号</th>
                        <th>开单日期</th>
                        <th>服务专员</th>
                        <th>资料来源</th>
                        <th>预约类别</th>
                        <th>接受预约日</th>
                        <th>预约进厂时间</th>
                        <th>预约单状态</th> 
                        <th>指定技师</th>                          
                        <th>车牌号</th>
                        <th>车主</th>
                        <th>联系人</th>                                
                        <th>联系人电话</th>                                
                        <th>联系人手机</th>   		
                        <th>提醒人</th>                              
                        <th>提醒时间</th> 
                        <th>操作</th>                         
                    </tr>
                </table>
            </div>	
            <div id="dataDiv" style="width:2240px;">
			   <table id="dataTb" style="width:2200px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.resvorderid}</td>
                        <td style="width:160px;">${var.servorderid}</td>
                        <td>${var.servorderdate}</td>
                        <td>${var.servstaff_dict}</td>
                        <td>${var.resvsource_dict}</td>
                        <td>${var.resvtype_dict}</td>
                        <td>${var.resvaccessdate}</td>
                        <td>${var.resvintime}</td>
                        <td>${var.resvstate_dict}</td>
                        <td>${var.resvworker_dict}</td>                  
                        <td>${var.carlicenseno}</td>
                        <td>${var.carownername}</td>
                        <td>${var.contactname}</td>                               
                        <td>${var.contacttel}</td>                                                    
                        <td>${var.contactmobile}</td>                      		
                        <td>${var.remindname_dict}</td>                                               
                        <td>${var.remindtime}</td>                                                             
                        <td>
                        
                            <div class="edit"><a href="<%=request.getContextPath()%>/crm::/reserveModule/action/QueryReserve.action?reserveid=${var.reserveid}">修改</a></div>
                            <div class="detail"><a href="javascript:delConf('${var.reserveid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
</div>
</body>
</html>