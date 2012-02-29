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
				action:'${pageContext.request.contextPath}/crm::/importModule/action/QueryImportResult.action',
				form:'crmform',
				percount:10
			});
		});
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/importModule/action/QueryImportResult.action?startIndex=0&endIndex=10">
			<fieldset>
			  <legend>数据导入信息查询</legend>
              <table cellspacing="30" cellpadding="0" style="padding:20px;">
                    <tr>
                      <td class="colName" style="width:20%;">导入类别:</td>
                      <td class="detailColVal" style="width:20%;">
                      	<select id="importtype" name="importtype" style="width:200px;">
                        	<option value=""></option>
                            <c:forEach items="${dict.crm_importTarget}" var="var">				
			             		<c:if test="${var.key==importtype}">
			             			<option value="${var.key}" selected>${var.value}</option>
			             		</c:if>	
			             		<c:if test="${var.key!=importtype}">
			             			<option value="${var.key}">${var.value}</option>
			             		</c:if>		
			             	</c:forEach>
                        </select>
                      </td>
                      <td class="colName" style="width:20%;">导入日期:</td>
                      <td class="detailColVal" style="width:20%;">
                       	<input type="text" value="${importdate}" name="importdate" id="importdate" onfocus="dayCalender(this)" style="width:200px;"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="8" style="text-align:center;">
                          <input type="submit" value="查询" />
                          <input type="reset" value="重置" />
                      </td>
                    </tr>
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
				<table ellspacing="0" cellpadding="0">
                    <tr>
                        <th>导入类别</th>
                        <th>导入日期</th>
                        <th>成功条数</th>
                        <th>失败条数</th>
                        <th>操作员</th>
                        <th>操作</th>
                    </tr>
                  </table>
			</div>
			<div id="dataDiv">
				<table id="dataTb" cellspacing="0" cellpadding="0">
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.importtype_dict}</td>
                        <td>${var.importdate}</td>
                        <td>${var.importnum}</td>
                        <td>${var.importerrornum}</td>
                        <td>${var.importoper}</td>
                        <td>
	                         <div class="detail" style="width:50px;">
	                        	 <a href="<%=request.getContextPath()%>/crm::/importModule/action/QueryErrorResult.action?importtime=${var.importdate}&importtarget=${var.importtype}&importName=${var.importtype}&endIndex=9&startIndex=0">详细</a>
	                         </div>
                        </td>
                    </tr>
                </c:forEach>	
            </table>
    </div>
</div>
</body>
</html>