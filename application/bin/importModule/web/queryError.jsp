<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据导入信息查询</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:${count}, 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/importModule/action/QueryErrorResult.action',
				form:'crmform',
				percount:10
			});
			$('#importtarget').selectDict({type:'crm_importTarget',id:'importtarget',value:'${importtarget}'});
		});
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/importModule/action/QueryErrorResult.action?startIndex=0&endIndex=10">
			<fieldset>
			  <legend>数据导入信息查询</legend>
              <table cellspacing="20" cellpadding="0" style="padding:10px;">
                    <tr>
                      <td class="colName">导入类别:</td>
	                  <c:forEach items="${dict.crm_importTarget}" var="var">				
		             	<c:if test="${var.key==importtarget}">
		             		<td class="detailColVal" value="${var.key}" selected>${var.value}</td>
		             	</c:if>	
		              </c:forEach>
                      <td class="colName">导入日期:</td>
                      <td class="detailColVal">${importtime}</td>
                      <input type="hidden" value="${importtarget}" name="importtarget" id="importtarget"/>
                      <input type="hidden" value="${importtime}" name="importtime" id="importtime"/>
              </table>      
			</fieldset>           
		</form>
		<table class="optDiv">
			<tr>
				<td><div id="paginate"></div></td>
			</tr>
		</table>
		<div class="tbDiv">
			<div>
				<table cellspacing="0" cellpadding="0">
                    <tr>
                        <th>导入类别</th>
                        <th>错误信息</th>
                        <th>错误级别</th>
                        <th>导入日期</th>
                    </tr>
                </table>
			</div>
			<div id="dataDiv">
				<table id="dataTb" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.importtarget_dict}</td>
                        <td>${var.errormessage}</td>
                        <td>${var.errorlevel_dict}</td>
                        <td>${var.importtime}</td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
</div>
</body>
</html>