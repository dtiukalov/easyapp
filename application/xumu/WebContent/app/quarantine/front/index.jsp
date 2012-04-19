<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<style type="text/css">
* {
	margin:0;
	padding:0;
	list-style:none;
	color:#999;
}
</style>
</head>
<body>
<center>
<form id="" name="" action="" method="post">
	<div style="font-size:50px;margin-top:150px;">
		流通检疫查询<br><br>
		<label style="margin-right:220px;">检疫证书：<select name="state" style="width:200px;height:40px;font-size:30px;" required="true">
					<option value="AL">动物A证</option>
					<option value="AK">动物B证</option>
					<option value="AZ">产品A证</option>
					<option value="AR">产品B证</option>
					</select>
		</label><br>
		动物检疫合格证编号：<input id="num" name="num" value="" type="text" style="font-size:30px;line-height: 50px;width:180px;height:35px;cursor: pointer;"/><br>
		
		&nbsp;&nbsp;&nbsp;<input type="button" onclick="javascript:location.href='<%=request.getContextPath() %>/app/quarantine/front/flow/list.jsp'" value="查询" style="margin-right:-520px;border-width:0px;font-size:20px;line-height: 30px;width:120px;height:45px;cursor: pointer;"/>
	</div>
</form>
</center>
</body>
</html>