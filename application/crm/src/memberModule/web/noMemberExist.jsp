<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加积分</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/crm/coreModule/web/common.jsp"%>
<%@ include file="/crm/coreModule/web/saturnCalendar.jsp"%>
</head>
<body>
<div id="man_zone">
		<div style="margin-top:200px;text-align:center;">
			<div style="color:#2664EB; font-size:14px;font-weight:bolder;">
				不存在车架号为<label style="color:red;">${carvin}</label>的会员。
			</div>
			<div style="margin-top:10px;">
				<input type="button" value="返回"/>
			</div>
		</div>
		
</div>
</body>
</html>