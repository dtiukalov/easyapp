<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据导入管理</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
</head>
<body>
<div id="man_zone">
		<div style="margin-top:200px;text-align:center;">
			<div style="color:#2664EB; font-size:14px;font-weight:bolder;">
				导入文件类型错误，请撤销此次操作。
			</div>
			<div style="margin-top:10px;">
				<input type="button" onClick="javascript:history.back();return false;" value="返回"/>
			</div>
		</div>
		
</div>
</body>
</html>