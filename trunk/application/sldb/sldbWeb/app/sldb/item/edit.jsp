<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改导入表格字段信息</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$('#editForm').submit();
	}
	
	$(function() {
		$('#name').focus();
		
		$('#type').combobox({
			value : '${item.type}',
			width : 256
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改导入表格字段信息"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/sldb/item/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>名称:</td>
					<td><input id="name" name="name" type="text" value="${item.name}" readonly="readonly"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>列名:</td>
					<td><input id="colume" name="colume" type="text" value="${item.colume}"></input></td>
					<td><div id="columeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>长度:</td>
					<td><input id="length" name="length" type="text" value="${item.length}"></input></td>
					<td><div id="lengthTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>显示长度:</td>
					<td><input id="showLength" name="showLength" type="text" value="${item.length}"></input></td>
					<td><div id="showLengthTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="type.jason" valueField="id"
								textField="text" editable="true"></select></td>
					<td><div id="typeTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
								onclick="edit()">确定</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div>
					</td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="${item.id}"></input>
			<input id="infoId" name="infoId" type="hidden" value="${item.infoId}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});
		
		$("#colume").formValidator({
			onfocus : "列名不能为空,不超过50个字符！"
		}).inputValidator({
			min : 1,
			max : 50
		});
		
		$("#length").formValidator({
			onfocus : "请输出数字"
		}).regexValidator({
			regexp : "integer"
		}).inputValidator({
			min : 1,
			max : 20,
			onerror : "长度不超过20字符"
		});
		
		$("#showLength").formValidator({
			onfocus : "请输出数字"
		}).regexValidator({
			regexp : "integer"
		}).inputValidator({
			min : 1,
			max : 20,
			onerror : "显示长度不超过20字符"
		});
	});
</script>
</html>