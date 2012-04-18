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
	<div style="font-size:50px;margin-top:200px;">
		兽药真假查询<br><br>
		批准文号：<input id="num" name="num" value="" type="text" style="font-size:20px;line-height: 50px;width:180px;height:35px;cursor: pointer;"/>
		&nbsp;&nbsp;&nbsp;<input type="button" onclick="javascript:location.href='<%=request.getContextPath() %>/app/animal/drug/show.jsp'" value="查询" style="border-width:0px;font-size:20px;line-height: 30px;width:120px;height:45px;cursor: pointer;"/>
	</div>
</form>
</center>
</body>
</html>