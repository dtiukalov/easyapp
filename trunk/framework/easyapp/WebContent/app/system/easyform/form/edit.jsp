<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改表单属性</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String tableId = request.getParameter("tableId");
	String formType = request.getParameter("formType");
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
			value : "${form.type}",
			onSelect:function(record){
				$('#typeName').val(record.text);
		    }
		});
		
		$('#required').combobox({
			width : 256,
			value : "${form.required}",
			onSelect:function(record){
				$('#requiredName').val(record.text);
		    }
		});
		
		$('#readonly').combobox({
			width : 256,
			value : "${form.readonly}",
			onSelect:function(record){
				$('#readonlyName').val(record.text);
		    }
		});
		
		$('#hidden').combobox({
			width : 256,
			value : "${form.hidden}",
			onSelect:function(record){
				$('#hiddenName').val(record.text);
		    }
		});
		
		$('#regex').combobox({
			width : 256,
			value : "${form.regex}",
			onSelect:function(record){
				$('#regexName').val(record.text);
		    }
		});
		
		$('#dict').combobox({
			width : 256,
			value : "${form.dict}",
			onSelect:function(record){
				$('#dictName').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改表单属性"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/system/easyform/form/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>属性名:</td>
					<td><input id="name" name="name" type="text" value="${form.name}" readonly="readonly"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>中文名:</td>
					<td><input id="showName" name="showName" type="text" value="${form.showName}"></input></td>
					<td><div id="showNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">默认值:</td>
					<td><input id="defaultValue" name="defaultValue" type="text" value="${form.defaultValue}"></input></td>
					<td><div id="defaultValueTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>必填项:</td>
					<td><select id="required" class="easyui-combobox"
								name="required" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=boolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="requiredTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>只读项:</td>
					<td><select id="readonly" class="easyui-combobox"
								name="readonly" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=boolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="readonlyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>隐藏:</td>
					<td><select id="hidden" class="easyui-combobox"
								name="hidden" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=visible" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="hiddenTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">最小长度:</td>
					<td><input id="min" name="min" value="${form.min}"></input></td>
					<td><div id="minTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">最大长度:</td>
					<td><input id="max" name="max" value="${form.max}"></input></td>
					<td><div id="maxTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">验证规则:</td>
					<td><select id="regex" class="easyui-combobox"
								name="regex" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=regex" valueField="id"
								textField="text" editable="true"></select></td>
					<td><div id="regexTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">提示信息:</td>
					<td><input id="focusTip" name="focusTip" value="${form.focusTip}"></input></td>
					<td><div id="focusTipTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">验证函数:</td>
					<td><textarea id="func" name="func" cols="70", rows="10">${form.func}</textarea></td>
					<td><div id="funcTip"></div></td>
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
					<td style="text-align:right">装饰:</td>
					<td><textarea id="render" name="render" cols="70", rows="10">${form.render}</textarea></td>
					<td><div id="renderTip"></div></td>
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
			<input id="id" name="id" type="hidden" value="${form.id}"></input>
			<input id="requiredName" type="hidden" name="requiredName" type="text" value="${form.requiredName}"></input>
			<input id="readonlyName" type="hidden" name="readonlyName" type="text" value="${form.readonlyName}"></input>
			<input id="hiddenName" type="hidden" name="hiddenName" type="text" value="${form.hiddenName}"></input>
			<input id="regexName" type="hidden" name="regexName" type="text" value="${form.regexName}"></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value="${form.typeName}"></input>
			<input id="tableId" type="hidden" name="tableId" type="text" value="<%=tableId%>"></input>
			<input id="formType" type="hidden" name="formType" type="text" value="<%=formType%>"></input>
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
		
		$("#min").formValidator({
			onfocus : "请输出数字"
		}).regexValidator({
			regexp : "integer"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "宽度不超过50字符"
		});
		
		$("#max").formValidator({
			onfocus : "请输出数字"
		}).regexValidator({
			regexp : "integer"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "宽度不超过50字符"
		});
		
		$("#func").formValidator({
			empty : true,
			onfocus : "function()的函数实现，返回this.isvalid=true或false"
		}).inputValidator({
			max : 1000
		});
		
		$("#render").formValidator({
			empty : true,
			onfocus : "填写支持jquery语法的代码，来修改表单的属性、样式等"
		}).inputValidator({
			max : 1000
		});
	});
</script>
</html>