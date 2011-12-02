<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改节点属性</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String nodeId = request.getParameter("nodeId");
%>
<script type="text/javascript">
	function edit() {
		var model = $('#model').combobox('getValue');
		var type = $('#type').combobox('getValue');
		
		if (model == "" || type == "") {
			alert("模式、类型不能为空!");
			return;
		} 
		
		$('#valueName').val($('#value').combogrid("getText"));
		$('#editForm').submit();
	}
	
	function getUrlByType(id) {
		var url = '';
		if ("node.condition.auth.user" == id) {
			url = '<%=request.getContextPath()%>/app/auth/user/listUsers.action';
		} else if ("node.condition.auth.role" == id) {
			url = '<%=request.getContextPath()%>/app/auth/role/listRoles.action';
		}  else if ("node.condition.auth.department" == id) {
			url = '<%=request.getContextPath()%>/app/auth/organization/listOrganizations.action';
		} else {
			url = '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + id;
		}
		
		return url;
	}
	
	function getValueArr(values) {
		return values.split(",");

	}
	
	$(function() {
		$('#model').combobox({
			width : 256,
			value : "${condition.model}",
			onSelect:function(record){
				$('#type').combobox('enable');
				$('#type').combobox('clear');
				$('#type').combobox('reload', '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#model').combobox('getValue'));
				
				$('#modelName').val(record.text);
		    }
		});
		
		$('#type').combobox({
			width : 256,
			value : "${condition.type}",
			url : '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#model').combobox('getValue'),
			onSelect:function(record){
				$('#typeName').val(record.text);
				
				var id = record.id;
				
				$('#value').combogrid("clear");
				$('#value').combogrid({
					url : getUrlByType(id)
				});
		    }
		});
		
		$('#value').combogrid({
			width : 256,
			panelWidth : 600,
			idField : 'id',
			textField : 'name',
			pagination : true,
			rownumbers : true,
			singleSelect : false,//只能选一行
			sortName : 'id',
			sortOrder : 'asc',
			remoteSort : true,
			url : getUrlByType('${condition.type}'),
			multiple : true,
			value : '${condition.value}',
			columns : [[
				{field : 'id',title : '标识',width : 200, sortable : true},
				{field : 'name',title : '名称',width : 150, sortable : true}
			]],
			onSelect:function(record){
				var id = $('#value').combogrid("getValues");
				$('#values').val(id);
			}
		});
		$('#value').combogrid("setText", '${condition.valueName}');
		
		$('#signId').combobox({
			width : 256,
			value : "${condition.sign}" == "否" ? "boolean.false" : "boolean.true",
			onSelect:function(record){
				$('#sign').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改节点属性"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/workflow/condition/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>模式:</td>
					<td><select id="model" class="easyui-combobox" 
								name="model" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=node.condition.model" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="modelTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>条件:</td>
					<td><input id="value" name="value" type="text" value="${condition.value}"></input></td>
					<td><div id="valueTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>会签:</td>
					<td><select id="signId" class="easyui-combobox" 
								name="signId" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=boolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="valueTip"></div></td>
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
			<input id="id" name="id" type="hidden" value="${condition.id}"></input>
			<input id="modelName" type="hidden" name="modelName" type="text" value="${condition.modelName}"></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value="${condition.typeName}"></input>
			<input id="valueName" type="hidden" name="valueName" type="text" value="${condition.valueName}"></input>
			<input id="nodeId" type="hidden" name="nodeId" type="text" value="<%=nodeId%>"></input>
			<input id="sign" name="sign" type="hidden" value="${condition.sign}"></input>
			<input id="values" type="hidden" name="values" value="${condition.value}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});
	});
</script>
</html>