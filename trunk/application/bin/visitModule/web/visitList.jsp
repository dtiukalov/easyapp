<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>回访管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
		$(function() {
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/visitModule/action/QueryVisitList.action',
				form:'crmform',
				percount:10
			});
		});
		
		function delConf(visitid){
			if(window.confirm("确认删除此条记录？")){
				window.location = "<%=request.getContextPath()%>/crm::/visitModule/action/DeleteVisit.action?visitid="+visitid+"&startIndex=0&endIndex=9"; 
			}
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/visitModule/action/QueryVisitList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>回访管理</legend>
              <table cellspacing="5" cellpadding="0">
                    <tr>
                      <td class="colName">工单号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="servorderid" id="servorderid" value="${servorderid}"/>
                      </td>
                      <td class="colName">回访日期:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_visitdate" id="min_visitdate" value="${min_visitdate}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_visitdate" id="max_visitdate" value="${max_visitdate}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenceno" id="carlicenceno" value="${carlicenceno}"/>
                      </td>
                     
                    </tr>
                    <tr>
                      <td class="colName">维修质量:</td>
                      <td class="detailColVal">
                      	 <select id="repairpleased" name="repairpleased">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_repaPleased}" var="var">				
			             		<c:if test="${var.key==repairpleased}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=repairpleased}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">服务质量:</td>
                      <td class="detailColVal">
                        <select id="servpleased" name="servpleased">
                           <option value=""></option>
			             	<c:forEach items="${dict.crm_servPleased}" var="var">				
			             		<c:if test="${var.key==servpleased}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=servpleased}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>				
			             	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">车架号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carvin" id="carvin" value="${carvin}"/>
                      </td>
                    </tr>
                    <tr>
	                    <td class="colName">维修类型:</td>
	                    <td class="detailColVal">
                      	<select id="servtype" name="servtype">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_serviceType}" var="var">				
			             		<c:if test="${var.key==servtype}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=servtype}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>		
			             	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">进厂日期:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_servintime" id="min_servintime" value="${min_servintime}" onfocus="minuteCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_servintime" id="max_servintime" value="${max_servintime}" onfocus="minuteCalender(this)" class="Wdate"/>
                      </td>
                      <td class="colName">联系人:</td>
                      <td class="detailColVal">
                      	<input type="text" name="linkman" id="linkman" value="${linkman}"/>
                      </td>	
                    </tr>
                    <tr>
	                  <td class="colName">回访人:</td>
                      <td class="detailColVal">
                      	<select id="visitstaff" name="visitstaff">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_waiter}" var="var">				
			             		<c:if test="${var.key==visitstaff}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=visitstaff}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>		
			             	</c:forEach>
                        </select>
                      </td>	
                      <td class="colName">出厂日期:</td>
                      <td class="detailColVal" style="width:35%">
                      	<input type="text" name="min_servouttime" id="min_servouttime" value="${min_servouttime}" onfocus="minuteCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_servouttime" id="max_servouttime" value="${max_servouttime}" onfocus="minuteCalender(this)" class="Wdate"/>
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
				<td style="width:15%;"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/visitModule/web/addVisit.jsp">新增</a></div></td>
			</tr>
		</table>
        <div class="tbDiv">
     		<div style="width:3300px;">
	      		<table style="width:3280px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>第一次跟踪日期</th>
                        <th>第二次跟踪日期</th>
                        <th>第三次跟踪日期</th>
                        <th style="width:160px;">工单号</th>
                        <th>车牌号</th>
                        <th style="width:160px;">车架号</th>
                        <th>品牌</th> 
                        <th>车系</th>                                                     
                        <th>维修类型</th> 
                        <th>进厂时间</th> 
                        <th>跟踪员</th>
                        <th>维修项目</th>  
                        <th>联系人</th> 
                        <th>维修评分</th>
                        <th>服务评分</th> 
                        <th>维修质量</th>  
                        <th>服务质量</th> 
                        <th>意见/建议</th>  
                        <th>有无投诉</th>   
                        <th>操作</th>                         
                    </tr>
                 </table>
            </div>	
            <div id="dataDiv" style="width:3320px;">
			   <table id="dataTb" style="width:3280px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                   <c:set var="array" value="${fn:split(var.visitdate, ',')}"/>
                        <td>
                        <c:if test="${fn:length(array)>=1}">${array[0]}</c:if>
                        </td> 
                         <td>
                        <c:if test="${fn:length(array)>=2}">${array[1]}</c:if>
                        </td> 
                        <td>
                        <c:if test="${fn:length(array)>=3}">${array[2]}</c:if>
                        </td> 
                        <td style="width:160px;">${var.servorderid}</td>
                        <td>${var.carlicenceno}</td>
                        <td style="width:160px;">${var.carvin}</td>
                        <td>${var.carbrand_dict}</td>
                        <td>${var.carseries_dict}</td>                                                                        
                        <td>${var.servtype_dict}</td>
                        <td>${var.servintime}</td>
                        <td>${var.visitstaff_dict}</td> 
                        <td>${var.servitem}</td> 
                        <td>${var.linkman}</td>  
						<td>${var.repairmark}</td> 
                        <td>${var.servmark}</td>
                        <td>${var.repairpleased_dict}</td>
						<td>${var.serverpleased_dict}</td>
                        <td>
                        	<c:if test="${var.hasproposal=='1'}">有</c:if>
                        	<c:if test="${var.hasproposal=='0'}">无</c:if>
                        </td> 
                         <td>
                        	<c:if test="${var.iscomplaint =='1'}">有</c:if>
                        	<c:if test="${var.iscomplaint=='0'}">无</c:if>
                        </td>                                  
                        <td>
                            <div class="edit"><a href="<%=request.getContextPath()%>/crm::/visitModule/action/QueryVisit.action?visitid=${var.visitid}">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.visitid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
</div>
</body>
</html>