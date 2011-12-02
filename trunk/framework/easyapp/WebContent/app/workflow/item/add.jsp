<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加表单属性</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String flowId = request.getParameter("flowId");
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
			value : "form.type.input",
			onSelect:function(record){
				$('#typeName').val(record.text);
		    }
		});
		
		$('#regex').combobox({
			width : 256,
			onSelect:function(record){
				$('#regexName').val(record.text);
		    }
		});
		
		$('#dict').combobox({
			width : 256,
			onSelect:function(record){
				$('#dictName').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加表单属性"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/workflow/item/add.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>属性名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>中文名:</td>
					<td><input id="showName" name="showName" type="text"></input></td>
					<td><div id="showNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">默认值:</td>
					<td><input id="defaultValue" name="defaultValue" type="text" "></input></td>
					<td><div id="defaultValueTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>最小长度:</td>
					<td><input id="min" name="min" value="1"></input></td>
					<td><div id="minTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>最大长度:</td>
					<td><input id="max" name="max" value="50"></input></td>
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
					<td><input id="focusTip" name="focusTip"></input></td>
					<td><div id="focusTipTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">验证函数:</td>
					<td><textarea id="func" name="func" cols="70", rows="10">function() {this.isvalid=true;}</textarea></td>
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
					<td><textarea id="render" name="render" cols="70", rows="10"></textarea></td>
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
			<input id="regexName" type="hidden" name="regexName" type="text" value=""></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value="输入框"></input>
			<input id="flowId" type="hidden" name="flowId" type="text" value="<%=flowId%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});
		
		$("#name").formValidator({
			onfocus : "请正确填写表单属性名称"
		}).regexValidator({
			regexp : "loginId"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "表单属性不超过50字符"
		}).ajaxValidator({
			url : "<%=request.getContextPath()%>/app/workflow/item/isRepeat.action?flowId=<%=flowId%>",
			data : $('#name').val(),
			success : function(data) {
				return data == "false";
			},
			onerror : "表单属性名已经存在"
		});
		
		$("#showName").formValidator({
			empty : true,
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