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
input {
	width:200px;
	height:100px;
	font-size: 30px;
	border-width:0px;
	cursor: pointer;
}
</style>
</head>
<body>
<center>
<form id="" name="" action="" method="post">
	<%-- <div style="font-size:30px;">
		查询提示:请输入产品追随标签上全部21位产品追溯码，<br>点击"查询"获取详细的产销履历信息<br><br>
		产品追溯码：<input id="num" name="num" value="" type="text" style="border-width:1px;font-size:20px;line-height: 50px;height:35px;"/>
		&nbsp;&nbsp;<input type="button" onclick="javascript:location.href='<%=request.getContextPath() %>/app/recall/back/index.jsp'" value="查询" style="border-width:0px;font-size:20px;line-height: 30px;width:120px;height:45px;cursor: pointer;"/>
	</div> --%>
</form>
<div style="font-size:30px;width: 800px;float:left;margin-left:140px;">
		产品追溯码：<input name="textfield" type="text" value="103711000114120796298" style="height:30px;font-size:25px;width:300px;"/>
	</div>
<table width="800px" height="400px;"style="margin-top:10px;">
	<tr>
		<td align="left" width="25%">
		<input type="button" value="养殖信息" onclick="javascript:location.href='<%=request.getContextPath()%>/app/recall/back/message/feed.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="生猪物流信息" onclick="javascript:location.href='<%=request.getContextPath()%>/app/recall/back/message/pig.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="屠宰信息" onclick="javascript:location.href='<%=request.getContextPath()%>/app/recall/back/message/kill.jsp'" />
		</td>
	</tr>
	<tr>
		<td align="left" width="25%">
		<input type="button" value="仓储信息" onclick="javascript:location.href='<%=request.getContextPath()%>/app/recall/back/message/save.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="物流信息" onclick="javascript:location.href='<%=request.getContextPath()%>/app/recall/back/message/logistic.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="销售信息" onclick="javascript:location.href='<%=request.getContextPath()%>/app/recall/back/message/sale.jsp'" />
		</td>
		 
</table>
<table width="700px">
<tr>
<td align="right" width="50%">
<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/recall/back/index.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
</td>
</tr>
</table>
</center>
</body>
</html>