<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>到店离店时间列表</title>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<script type="text/javascript">
		$(function() { 
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>', 
				action:'${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictList.action',
				form:'crmform',
				percount:10
			});
		});
		function delDict(d_id){
			if(window.confirm("确认删除此条记录？")){
				$('#delform')[0].action = "${pageContext.request.contextPath}/crm::/ccioModule/action/UpdateDict.action?d_id="+d_id; 
				$('#delform')[0].submit();
			}
		}
</script> 
</head>
<body>
<div id="man_zone"> 
		<form id="crmform" class="queryFrom" action="${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictList.action">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<input type="hidden" name="d_pid" value="${d_pid }"/>
		</form>
		<form id="delform" class="contentForm" method="post" action="${pageContext.request.contextPath}/crm::/ccioModule/action/UpdateDict.action">
			<input type="hidden" name="startIndex" value="0"/>
			<input type="hidden" name="endIndex" value="9"/>
			<input type="hidden"  name="d_state" id="d_state" value="0" />
			<input type="hidden"  name="d_pid" id="d_pid" value="${d_pid }" />
		</form>
        <table class="optDiv">
			<tr>
				<td style="width:85%;"><div id="paginate"></div></td>
				<td style="width:15%;">&nbsp;
				<c:forEach items="${result}" var="var0">
				<c:if test="${var0.d_type!=5}">
				<div class="optAdd"><a href="${pageContext.request.contextPath}/crm/ccioModule/web/addDict.jsp?d_pid=${d_pid }">新增</a></div>
				</c:if>
                 </c:forEach>
				</td>
			</tr>
		</table>
    	<div class="tbDiv">
     		<div style="width:100%;">
	      		<table cellspacing="0" cellpadding="0">
	                    <tr>
	                        <!-- <th>编号</th> -->
	                        <th>标签</th>
	                        <th>数值</th>
	                        <th>状态</th>
	                        <th>创建时间</th>
	                        <th>操作</th>                                   
	                    </tr>
	             </table>
             </div>	
             <div id="dataDiv" style="width:100%;">
			   <table id="dataTb" cellspacing="0" cellpadding="0">
                 <c:forEach items="${result}" var="var">
                 	 <tr>
                        <!-- <td>${var.d_id}</td> -->
                        <td>${var.d_lable}</td>
                        <td>${var.d_value}</td>
                        <td>${var.d_state==1?"显示":var.d_state==2?"选定":"删除"}</td>
                        <td>${var.d_datetime}</td>
                        <td>
                        <c:if test="${var.d_type!=5}">
                        <div class="edit"><a href="${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictList.action?startIndex=0&endIndex=9&d_pid=${var.d_id }">子项</a></div>
                       <div class="edit"><a href="${pageContext.request.contextPath}/crm::/ccioModule/action/GetDictById.action?d_id=${var.d_id }">修改</a></div>
                            <div class="delete"><a href="javascript:delDict('${var.d_id}');">删除</a></div>
						</c:if>
                        </td>
                        </tr>
                 </c:forEach>
            </table>
    </div>
</div>

</body>
</html>
