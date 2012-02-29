<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>车辆导入结果信息</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
</head>
<body>
<div id="man_zone">
        <div class="dataDiv">
        <table>
                <thead>
                    <tr>
                        <th>导入目标</th>
                        <th>错误信息</th>
                        <th>错误级别</th>
                        <th>导入时间</th>                               
                    </tr>
                </thead>	
                <tbody>
                <c:forEach items="${result}" var="var">
                   <tr>
                        <td>${var.importtarget}</td>
                        <td>${var.errormessage}</td>
                        <td>${var.errorlevel}</td>
                        <td>${var.createtime}</td>
                    </tr>
                </c:forEach>
                </tbody>	
            </table>
    </div>
</div>
</body>
</html>