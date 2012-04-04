<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>药品查询</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
	function search() {
		$('#queryForm').submit();
	}
</script>
</head>
<body>
<center>
		<form id="queryForm" method="post" action="<%=request.getContextPath() %>/app/medication/search/queryMedication.action">
			<table>
				<tr align="right">
					<td style="font-size:25px;">编号:</td>
					<td align="left"><input id="number" name="number" type="text" style="width:180px;height:40px;font-size: 20px;line-height: 40px;"></input></td>
				</tr>
				<tr>
				<td colspan="2">
				<input type="button" value="返回" onclick="javascript:location.href='<%=request.getContextPath() %>/app/warning/farmer/main.jsp'" src="" alt="返回" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
				<input type="button" value="查询" onclick="search()" src="" alt="查询" style="font-size:20px;line-height: 50px;width:150px;height:50px;cursor: pointer;" />
				</td>
				</tr>
			</table>
		</form>
<table>
	<tr align="right">
		<td style="font-size:25px;" width="100px">编号:</td>
		<td style="font-size:25px;" width="250px" align="left">${search.number}</td>
	</tr>
	<tr align="right">
		<td style="font-size:25px;">标签:</td>
		<td style="font-size:25px;" align="left">${search.title}</td>
	</tr>
	<tr align="right">
		<td style="font-size:25px;">时间:</td>
		<td style="font-size:25px;" align="left">${search.createTime}</td>
	</tr>
</table>
</center>
</body>
</html>




