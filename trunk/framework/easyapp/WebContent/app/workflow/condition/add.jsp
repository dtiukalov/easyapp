<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加节点条件</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String nodeId = request.getParameter("nodeId");
%>
<script type="text/javascript">
	function add() {
		var model = $('#model').combobox('getValue');
		var type = $('#type').combobox('getValue');
		
		if (model == "" || type == "") {
			alert("模式、类型不能为空!");
			return;
		} 
		
		$('#valueName').val($('#value').combogrid("getText"));
		$('#addForm').submit();
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
	
	$(function() {
		$('#model').combobox({
			width : 250,
			value : 'node.condition.workflow',
			onSelect:function(record){
				$('#type').combobox('enable');
				$('#type').combobox('clear');
				$('#type').combobox('reload', '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#model').combobox('getValue'));
				
				$('#modelName').val(record.text);
		    }
		});
		
		$('#type').combobox({
			width : 250,
			value : 'node.condition.creater',
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
			panelWidth : 600,
			width : 250,
			idField : 'id',
			textField : 'name',
			pagination : true,
			rownumbers : true,
			singleSelect : false,//只能选一行
			sortName : 'id',
			sortOrder : 'asc',
			remoteSort : true,
			url : '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#type').combobox('getValue'),
			multiple : true,
			value : 'node.condition.creater.self',
			columns : [[
				{field : 'id',title : '标识',width : 200, sortable : true},
				{field : 'name',title : '名称',width : 150, sortable : true}
			]],
			onSelect:function(record){
				var id = $('#value').combogrid("getValues");
				$('#values').val(id);
			}
		});
		
		$('#signId').combobox({
			width : 250,
			value : 'boolean.false',
			onSelect:function(record){
				$('#sign').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加节点条件"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">

		<form id="addForm"
			action="<%=request.getContextPath()%>/app/workflow/condition/add.action"
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
					<td><input id="value" name="value"></input></td>
					<td><div id="valueTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>会签:</td>
					<td><select id="signId" class="easyui-combobox" 
								name="signId" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=boolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="signIdTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
								onclick="add()">确定</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div>
					</td>
				</tr>
			</table>
			<input id="modelName" type="hidden" name="modelName" value="工作流"></input>
			<input id="typeName" type="hidden" name="typeName"  value="创建者"></input>
			<input id="valueName" type="hidden" name="valueName"></input>
			<input id="values" type="hidden" name="values"></input>
			<input id="sign" type="hidden" name="sign" value="否"></input>
			<input id="nodeId" type="hidden" name="nodeId"value="<%=nodeId%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
	});
</script>
</html>