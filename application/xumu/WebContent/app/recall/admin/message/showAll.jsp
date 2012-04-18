<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>信息列表</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table style="margin-left:200px;">
				<tr align="right">
					<td>产品追溯码:</td>
					<td align="left"><input id="number" name="number" type="text"></input></td>
					<td>&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">查询</a></td>
				<!-- <a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a> -->
				</tr>
			</table>
			
		</form>
	</div>
	<table id="queryTable">
		
	</table>
	<div id="panel" class="easyui-panel" title="产品追溯信息"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">
			<div class="easyui-tabs" fit="true" plain="true" style="height:300px;width:300px;">
				<div title="养殖信息" style="padding:10px;">Content 1</div>
				<div title="生物猪流信息" style="padding:10px;">Content 2</div>
				<div title="屠宰信息" style="padding:10px;">Content 3</div>
				<div title="仓储信息" style="padding:10px;">Content 3</div>
				<div title="产品物流信息" style="padding:10px;">Content 3</div>
				<div title="产品销售信息" style="padding:10px;">Content 3</div>
			</div>
		</div>
</body>
</html>