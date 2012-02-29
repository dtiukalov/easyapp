<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
<%@ include file="/crm/coreModule/web/floatFormat.jsp"%>
<script type="text/javascript">
		$(function() {
			$("#paginate").saturnTablePaginate({
				count:'${count}', 
				current:'<%=request.getParameter("pageValue")%>',  
				action:'${pageContext.request.contextPath}/crm::/loginModule/action/QueryUserList.action',
				form:'crmform',
				percount:10
			});
		});
        function delCheck(userid){
			if(window.confirm("确认删除此条记录？")){
				$('#hiddenForm')[0].action = "${pageContext.request.contextPath}/crm::/loginModule/action/DeleteUser.action?userid="+userid+"&startIndex=0&endIndex=9"; 
				$('#hiddenForm')[0].submit();
			}
		}
</script> 
</head>
<body>
<div id="man_zone">
		<form id="crmform" class="queryFrom" method="post" action="${pageContext.request.contextPath}/crm::/loginModule/action/QueryUserList.action?startIndex=0&endIndex=9">
			<fieldset id="field">
			  <legend>用户管理</legend>
              <table cellspacing="5" cellpadding="0">
                 <tr>
                      <td class="colName">用户名:</td>
                      <td class="detailColVal">
                      	<input type="text" name="username" id="username" value="${username}"/>
                      </td>
                      <td class="colName">真实姓名:</td>
                      <td class="detailColVal">
                      	<input type="text" name="userrealname" id="userrealname" value="${userrealname}"/>
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
				<td><label class="rsTitle">用户查询结果</label></td>
				<td><div id="paginate"></div></td>
				<td><div class="optAdd"><a href="<%=request.getContextPath()%>/crm/loginModule/web/addUser.jsp">新增</a></div></td>
			</tr>
		</table>
        <div class="dataDiv">
        <table id="dataTb">
                <thead>
                    <tr>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>密码</th>
                        <th>操作</th>                         
                    </tr>
                </thead>	
                <tbody>                                       
                      <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.username}</td>
                        <td>${var.userrealname}</td>
                        <td>${var.password}</td>                                                  
                        <td>
                            <div class="edit"><a href="<%=request.getContextPath()%>/crm::/loginModule/action/QueryUserDetail.action?userid=${var.userid}">修改</a></div>
                            <div class="delete"><a href="javascript:delCheck('${var.userid}')">删除</a></div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>		
            </table>
    </div>
</div>
<div style="display:none;">
	<form id="hiddenForm" name="hiddenForm" method="post">
	</form>
</div>
</body>
</html>