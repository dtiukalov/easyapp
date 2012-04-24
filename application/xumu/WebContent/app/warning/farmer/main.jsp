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
	line-height: 100%;
	border-width:0px;
	cursor: pointer;
}
</style>
</head>
<body>
<center>
<table width="800px" height="600px;">
	<tr>
		<td align="left" width="25%">
		<input type="button" value="生猪新增" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/add.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="生猪卖出" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/sale.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="生猪死亡" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/dead.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="生猪淘汰" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/washout.jsp'" />
		</td>
	</tr>
	<tr>
		<td align="left" width="25%">
		<input type="button" value="饲料购进" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/forage.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="费用支出" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/spend.jsp'" />
		</td>
		 
		<%--<td align="left" width="25%">
		<input type="button" value="药品查询" onclick="javascript:location.href='<%=request.getContextPath()%>/app/medication/search/search.jsp'" />
		</td> 
		<td align="left" width="25%">
		<input type="button" value="生猪检疫" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/check.jsp'" />
		</td>--%>
		<td align="left" width="25%">
		<input type="button" value="市场价格" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/price.jsp'" />
		</td>
		<td align="left" width="25%">
		<input type="button" value="录入情况" onclick="javascript:location.href='<%=request.getContextPath()%>/app/warning/farmer/upload.jsp'" />
		</td>
	</tr>
</table>
</center>
<!-- 
<a href="<%=request.getContextPath()%>/app/warning/farmer/add.jsp">生猪新增</a>
<a href="<%=request.getContextPath()%>/app/warning/farmer/sale.jsp">生猪卖出</a>
<a href="<%=request.getContextPath()%>/app/warning/farmer/dead.jsp">生猪死亡</a>
<a href="<%=request.getContextPath()%>/app/warning/farmer/washout.jsp">生猪淘汰</a>
<a href="<%=request.getContextPath()%>/app/warning/farmer/forage.jsp">饲料购进</a>
<a href="<%=request.getContextPath()%>/app/warning/farmer/spend.jsp">费用支出</a>
<a href="<%=request.getContextPath()%>/app/warning/farmer/upload.jsp">录入情况</a>
<a href="<%=request.getContextPath()%>/app/medication/search/search.jsp">药品查询</a>
 -->
</body>
</html>