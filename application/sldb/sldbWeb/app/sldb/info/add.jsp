<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加导入表格信息</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function add() {
		$('#addForm').submit();
	}
	
	$(function() {
		$('#name').focus();
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加导入表格信息" icon="icon-add-form"
		collapsible="true" style="padding: 10px;">
		<form id="addForm" name="addForm"
			action="<%=request.getContextPath()%>/app/sldb/info/add.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>名称:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>表名:</td>
					<td><input id="tableName" name="tableName" type="text"></input></td>
					<td><div id="tableNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>开始行号:</td>
					<td><input id="startLine" name="startLine" type="text"></input></td>
					<td><div id="startLineTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">描述:</td>
					<td><input id="desc" name="desc" type="text"></input></td>
					<td><div id="descTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});

		$("#name").formValidator({
			onfocus : "名称不能为空,不超过100个字符！"
		}).inputValidator({
			min : 1,
			max : 100
		});
		
		$("#tableName").formValidator({
			onfocus : "表名不能为空,不超过100个字符！"
		}).inputValidator({
			min : 1,
			max : 100
		});
		
		$("#startLine").formValidator({
			onfocus : "请输出数字"
		}).regexValidator({
			regexp : "integer"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "宽度不超过50字符"
		});
		
		$("#desc").formValidator({
			onfocus : "描述不超过500个字符！",
			empty : true
		}).inputValidator({
			min : 1,
			max : 500,
			onerror : "宽度不超过500字符"
		});
	});
</script>
</html>