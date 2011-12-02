<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改查询表属性</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String tableId = request.getParameter("tableId");
%>
<script type="text/javascript">
	function edit() {
		var type = $('#type').combogrid('getValue');
		
		if (type == "") {
			alert("列类型不能为空!");
			return;
		}
		
		$('#editForm').submit();
	}
	
	$(function() {
		$('#name').focus();
		
		$('#type').combobox({
			width : 256,
			value : "${query.type}",
			onSelect:function(record){
				$('#typeName').val(record.text);
		    }
		});
		
		$('#condition').combobox({
			width : 256,
			value : "${query.condition}",
			onSelect:function(record){
				$('#conditionName').val(record.text);
		    }
		});
		
		$('#hidden').combobox({
			width : 256,
			value : "${query.hidden}",
			onSelect:function(record){
				$('#hiddenName').val(record.text);
		    }
		});
		
		$('#sort').combobox({
			width : 256,
			value : "${query.sort}",
			onSelect:function(record){
				$('#sortName').val(record.text);
		    }
		});
		
		$('#dict').combobox({
			width : 256,
			value : "${query.dict}",
			onSelect:function(record){
				$('#dictName').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改查询表属性"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/system/easyform/query/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>属性名:</td>
					<td><input id="name" name="name" type="text" value="${query.name}" readonly="readonly"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>中文名:</td>
					<td><input id="showName" name="showName" type="text" value="${query.showName}"></input></td>
					<td><div id="showNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>条件:</td>
					<td><select id="condition" class="easyui-combobox"
								name="condition" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=boolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="conditionTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>隐藏:</td>
					<td><select id="hidden" class="easyui-combobox"
								name="hidden" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=visible" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="hiddenTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>排序:</td>
					<td><select id="sort" class="easyui-combobox"
								name="sort" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=boolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="sortTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>宽度</td>
					<td><input id="width" name="width" value="${query.width}"></input></td>
					<td><div id="widthTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">数据字典:</td>
					<td><select id="dict" class="easyui-combobox"
								name="dict" url="<%=request.getContextPath()%>/app/system/dict/queryDictType.action" valueField="id"
								textField="text" editable="true"></select></td>
					<td><div id="dictTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>显示类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=form.type" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">格式:</td>
					<td><textarea id="format" name="format" cols="70", rows="10">${query.format}</textarea></td>
					<td><div id="formatTip"></div></td>
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
			<input id="id" name="id" type="hidden" value="${query.id}"></input>
			<input id="conditionName" type="hidden" name="conditionName" type="text" value="${query.conditionName}"></input>
			<input id="hiddenName" type="hidden" name="hiddenName" type="text" value="${query.hiddenName}"></input>
			<input id="sortName" type="hidden" name="sortName" type="text" value="${query.sortName}"></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value="${query.typeName}"></input>
			<input id="tableId" type="hidden" name="tableId" type="text" value="<%=tableId%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		$("#showName").formValidator({
			onfocus : "中文名称不能为空,不超过20个字符！"
		}).inputValidator({
			min : 1,
			max : 20
		});
		
		$("#width").formValidator({
			onfocus : "请输出数字"
		}).regexValidator({
			regexp : "integer"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "宽度不超过50字符"
		});
		
		$("#format").formValidator({
			onfocus : "function(value, rec)的函数实现，返回有效格式化的字符串"
		}).inputValidator({
			empty : true,
			max : 1000
		});
	});
</script>
</html>