<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加节点属性</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String flowId = request.getParameter("flowId");
%>
<script type="text/javascript">
	function add() {
		$('#addForm').submit();
	}
	
	$(function() {
		$('#name').focus();
		
		$('#type').combobox({
			width : 256,
			value : "flow.node.process",
			onSelect:function(record){
				$('#typeName').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加节点属性"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">

		<form id="addForm"
			action="<%=request.getContextPath()%>/app/workflow/node/add.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>节点名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=flow.node" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="typeTip"></div></td>
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
			<input id="typeName" type="hidden" name="typeName" type="text" value="过程节点"></input>
			<input id="flowId" type="hidden" name="flowId" type="text" value="<%=flowId%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		
		$("#name").formValidator({
			onfocus : "请正确填写节点属性名称"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "节点属性不超过50字符"
		}).ajaxValidator({
			url : "<%=request.getContextPath()%>/app/workflow/node/isRepeat.action?flowId=<%=flowId%>",
			data : $('#name').val(),
			success : function(data) {
				return data == "false";
			},
			onerror : "节点属性名已经存在"
		});
	});
</script>
</html>