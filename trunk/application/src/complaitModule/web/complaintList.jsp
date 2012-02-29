<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投诉管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/crm/coreModule/web/js/queryHight.js"></script>
<script type="text/javascript">
	$(function() {
		$("#paginate").saturnTablePaginate({
			count:'${count}', 
			current:'<%=request.getParameter("pageValue")%>',  
			action:'${pageContext.request.contextPath}/crm::/complaitModule/action/QueryComplaintList.action',
			form:'crmform',
			percount:10
		});
	});
	
	function delConf(complaintid){
		if(window.confirm("确认删除此条记录？")){
			window.location = "<%=request.getContextPath()%>/crm::/complaitModule/action/DeleteComplaint.action?complaintid="+complaintid+"&startIndex=0&endIndex=9"; 
		}
	}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/complaitModule/action/QueryComplaintList.action?startIndex=0&endIndex=9">
			<fieldset id="formFiled">
			  <legend>投诉管理</legend>
              <table cellspacing="5" cellpadding="0">
                   <tr>
                      <td class="colName">投诉编号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="comptorderid" id="comptorderid" value="${comptorderid}"/>
                      </td>
                      <td class="colName">投诉类型:</td>
                      <td class="detailColVal">
                      	<select id="compttype" name="compttype">
                            <option value=""></option>
                            <c:forEach items="${dict.crm_comptType}" var="var">				
				           		<c:if test="${var.key==compttype}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=compttype}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>					
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">接单时间:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_compttime" id="min_compttime" value="${min_compttime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_compttime" id="max_compttime" value="${max_compttime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                   </tr>
                   <tr>
                   	  
                      <td class="colName">发生部门:</td>
                      <td class="detailColVal">
                      	<select id="comptdept" name="comptdept">
                            <option value=""></option>
                            <c:forEach items="${dict.crm_department}" var="var">				
				           		<c:if test="${var.key==comptdept}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=comptdept}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>					
				           	</c:forEach>
                        </select>
                      </td>
                      <td class="colName">投诉来源:</td>
                      <td class="detailColVal">
                      	<select id="comptsource" name="comptsource">
                            <option value=""></option>
                            <c:forEach items="${dict.crm_comptSource}" var="var">				
				           		<c:if test="${var.key==comptsource}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=comptsource}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>					
				           	</c:forEach>
                        </select>
                      </td>
                        <td class="colName">处理完成日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_comptdealtime" id="min_comptdealtime" value="${min_comptdealtime}" onfocus="dayCalender(this)" class="Wdate"/>
                      		<span>至</span>
                      	<input type="text" name="max_comptdealtime" id="max_comptdealtime" value="${max_comptdealtime}" onfocus="dayCalender(this)" class="Wdate"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="colName">车牌号:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carlicenseno" id="carlicenseno" value="${carlicenseno}"/>
                      </td>
                      <td class="colName">车主姓名:</td>
                      <td class="detailColVal">
                      	<input type="text" name="carownername" id="carownername" value="${carownername}"/>
                      </td> 
                      <td class="colName">结案日期:</td>
                      <td class="detailColVal" style="width:35%;">
                      	<input type="text" name="min_comptendtime" id="min_comptendtime" value="${min_comptendtime}" onfocus="dayCalender(this)" class="Wdate"/>
                      	<span>至</span>
                      	<input type="text" name="max_comptendtime" id="max_comptendtime" value="${max_comptendtime}" onfocus="dayCalender(this)" class="Wdate"/>
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
				<td style="width:15%;"><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/complaitModule/web/addComplaint.jsp">新增</a></div></td>
			</tr>
		</table>
         <div class="tbDiv">
     		<div style="width:1940px;">
	      		<table style="width:1920px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>投诉编号</th>
                        <th>投诉类型</th>
                        <th>投诉来源</th> 
                        <th>投诉人姓名</th>
                        <th>投诉人电话</th>
                        <th>接单时间</th>
                        <th>服务顾问</th>
                        <th>责任技师</th>
                        <th>处理完成日期</th> 
                        <th>发生部门</th>                          
                        <th>被投诉员工</th>
                        <th>结案日期</th>                                                
                        <th>及时处理</th>   		
                        <th>车主姓名</th>     
                        <th>车牌号</th>  
                        <th>操作</th>                       
                    </tr>
                 </table>
            </div>	
            <div id="dataDiv" style="width:1960px;">
			   <table id="dataTb" style="width:1920px;" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.comptorderid}</td>
                        <td>${var.compttype_dict}</td>
                        <td>${var.comptsource_dict}</td>
                        <td>${var.comptname}</td>
                        <td>${var.compttel}</td>
                        <td>${var.compttime}</td>
                        <td>${var.comptstaff_dict}</td>
                        <td>${var.compttarget_dict}</td>
                        <td>${var.comptdealtime}</td>
                        <td>${var.comptdept_dict}</td>                  
                        <td>${var.comptworker_dict}</td>
                        <td>${var.comptendtime}</td>                            
                        <td>
	                        <c:if test="${var.comptisdeal=='1'}">是</c:if>
	                        <c:if test="${var.comptisdeal=='0'}">否</c:if>
                        </td>                                                                		
                        <td>${var.carownername}</td>  
                        <td>${var.carlicenseno}</td>                                     
                        <td>
                        
                            <div class="edit"><a href="<%=request.getContextPath()%>/crm::/complaitModule/action/QueryComplaint.action?complaintid=${var.complaintid}">修改</a></div>
                            <div class="delete"><a href="javascript:delConf('${var.complaintid}');">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
</div>
</body>
</html>