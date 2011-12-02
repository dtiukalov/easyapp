<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加节点出口</title>
<%@ include file="/app/includes/header.jsp"%>
<%
	String flowId = request.getParameter("flowId");
%>
<script type="text/javascript">
	function edit() {
		var startId = $('#startId').combogrid('getValue');
		var endId = $('#endId').combogrid('getValue');
		
		if (startId == "" || endId == "") {
			alert("开始节点, 结束节点不能为空!");
			return;
		}
		
		$('#editForm').submit();
	}
	
	$(function() {
		$('#name').focus();
		
		$('#rejectId').combobox({
			width : 256,
			value : "boolean.false",
			onSelect:function(record){
				$('#reject').val(record.text);
		    }
		});
		
		$('#startId').combobox({
			width : 256,
			onSelect:function(record){
				$('#startName').val(record.text);
		    }
		});
		
		$('#endId').combobox({
			width : 256,
			onSelect:function(record){
				$('#endName').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加节点出口"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/workflow/line/add.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>名称:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">开始节点:</td>
					<td><select id="startId" class="easyui-combobox"
								name="startId" url="<%=request.getContextPath()%>/app/workflow/node/node.action?flowId=<%=flowId %>" valueField="id"
								textField="text" editable="true"></select></td>
					<td><div id="startIdTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">结束节点:</td>
					<td><select id="endId" class="easyui-combobox"
								name="endId" url="<%=request.getContextPath()%>/app/workflow/node/node.action?flowId=<%=flowId %>" valueField="id"
								textField="text" editable="true"></select></td>
					<td><div id="endIdTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">拒绝:</td>
					<td><select id="rejectId" class="easyui-combobox"
								name="rejectId" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=boolean" valueField="id"
								textField="text" editable="false"></select></input></td>
					<td><div id="rejectTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">表达式:</td>
					<td><textarea id="express" name="express" cols="70", rows="10"></textarea></td>
					<td><div id="expressTip"></div></td>
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
			<input id="endName" type="hidden" name="endName" type="text" value=""></input>
			<input id="startName" type="hidden" name="startName" type="text" value=""></input>
			<input id="reject" type="hidden" name="reject" type="text" value="否"></input>
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
			onfocus : "请正确填写节点出口名称"
		}).inputValidator({
			min : 1,
			max : 50,
			onerror : "节点出口不超过50字符"
		});
		
		$("#express").formValidator({
			empty : true,
			onfocus : "函数实现"
		}).inputValidator({
			max : 1000
		});
	});
</script>
</html>