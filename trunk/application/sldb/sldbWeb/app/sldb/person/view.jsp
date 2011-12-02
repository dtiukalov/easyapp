<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看申报低保信息</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		$('#editForm').submit();
	}
	
	function confirm() {
		$.messager.confirm('确认通过项', '确认通过该选项', function(result){
			if (result){
				$('#editForm').attr("action", '<%=request.getContextPath()%>/app/sldb/person/confirm.action?ids=${person.id}');
				$('#editForm').submit();
			}
		});
		return false;
	}
	
	function refuse() {
		$.messager.confirm('确认驳回项', '确认驳回该选项', function(result){
			if (result){
				$('#editForm').attr("action", '<%=request.getContextPath()%>/app/sldb/person/refuse.action?ids=${person.id}');
				$('#editForm').submit();
			}
		});
		return false;
	}
	
	$(function() {
		$('#name').focus();
		
		$('#type').combobox({
			value : '${person.type}',
			width : 256
		});
		
		$('#ill').combobox({
			value : '${person.ill}',
			width : 256
		});
		
		$('#deformity').combobox({
			value : '${person.deformity}',
			width : 256
		});
		
		$('#gender').combobox({
			value : '${person.gender}',
			width : 256
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查看申报低保信息"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/sldb/person/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
								name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=sldb.person.type" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>姓名:</td>
					<td><input id="name" name="name" type="text" value="${person.name}" readonly="readonly"></input></td>
					<td><div id="nameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>身份证:</td>
					<td><input id="identify" name="identify" type="text" value="${person.identify}" readonly="readonly"></input></td>
					<td><div id="identifyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>性别:</td>
					<td><select id="gender" class="easyui-combobox"
								name="gender" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=gender" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="identifyTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>年龄:</td>
					<td><input id="age" name="age" type="text" value="${person.age}" readonly="readonly"></input></td>
					<td><div id="ageTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>家庭人口:</td>
					<td><input id="homeSum" name="homeSum" type="text" value="${person.homeSum}" readonly="readonly"></input></td>
					<td><div id="homeSumTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>患病:</td>
					<td><select id="ill" class="easyui-combobox"
								name="ill" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=easyboolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="illTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">残疾:</td>
					<td><select id="deformity" class="easyui-combobox"
								name="deformity" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=easyboolean" valueField="id"
								textField="text" editable="false"></select></td>
					<td><div id="deformityTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">创建者:</td>
					<td><input id="createrName" name="createrName" type="text" value="${person.createrName}" readonly="readonly"></input></td>
					<td><div id="createrNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">所属部门:</td>
					<td><input id="createrDepartment" name="createrDepartment"  value="${person.createrDepartment}" type="text" readonly="readonly"></input></td>
					<td><div id="createrDepartmentTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">创建时间:</td>
					<td><input id="createTime" name="createTime"  value="${person.createTime}" type="text" readonly="readonly"></input></td>
					<td><div id="createTimeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">备注:</td>
					<td><textarea id="note" name="note" rows="5" cols="50"></textarea></td>
					<td><div id="noteTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
								onclick="confirm()">通过</a> <a href="#" class="easyui-linkbutton" iconCls="icon-back"
								onclick="refuse()">驳回</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div>
					</td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="${person.id}"></input>
			<input id="creater" name="creater" type="hidden" value="${person.creater}"></input>
			<input id="state" name="state" type="hidden" value="${person.state}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});

		$("#note").formValidator({
			onfocus : "备注不超过500字！"
		}).inputValidator({
			min : 1,
			max : 500
		});
		
		
	});
</script>
</html>