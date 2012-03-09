<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改预约</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function edit() {
		var cid = $('#cid').combogrid('getValue');
		
		if (cid == "") {
			alert("目录标识不能为空!");
			return;
		} 

		var brand = $('#brand').combobox('getValue');
		var model = $('#model').combobox('getValue');
		var series = $('#series').combobox('getValue');
		
		if (brand == "" || model == "" || series == "") {
			alert("品牌型号系列不能为空!");
			return;
		} 
		
		var typeValue = $('#type').combogrid('getValue');
		if (typeValue == "") {
			alert("类型不能为空!");
			return;
		} 
		$('#editForm').submit();
	}
	
	$(function() {
		$('#license').focus();
		
		$('#brand').combobox({
			width : 256,
			value : "${bookcar.brand}",
			onSelect:function(record){
				$('#model').combobox('enable');
				$('#model').combobox('clear');
				$('#model').combobox('reload', '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#brand').combobox('getValue'));
				
				$('#series').combobox('clear');
				$('#series').combobox('disable');
				
				$('#brandName').val(record.text);
		    }
		});
		
		$('#model').combobox({
			width : 256,
			value : "${bookcar.model}",
			url : '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#brand').combobox('getValue'),
			onSelect:function(record){
				$('#series').combobox('enable');
				$('#series').combobox('clear');
				$('#series').combobox('reload', 
					'<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#model').combobox('getValue'));
				
				$('#modelName').val(record.text);
		    }
		});
		
		$('#series').combobox({
			width : 256,
			value : "${bookcar.series}",
			url : '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#model').combobox('getValue'),
			onSelect:function(record){
				$('#seriesName').val(record.text);
		    }
		});
		
		$('#model').combobox('disable');
		$('#series').combobox('disable');
		
		$('#type').combobox({
			width : 256,
			value : '${bookcar.type}',
			onSelect:function(record){
				$('#typeName').val(record.text);
		    }
		});
		
		$('#state').combobox({
			width : 256,
			value : '${bookcar.state}',
			onSelect:function(record){
				$('#stateName').val(record.text);
		    }
		});
		
		$('#bookTime').datetimebox({
			width : 256
		});
		
		$('#createTime').datetimebox({
			width : 256
		});
		
		$('#cid').combogrid({
			width : 256,
			panelWidth : 600,
			idField : 'id',
			textField : 'name',
			pagination : true,
			rownumbers : true,
			sortName : 'id',
			sortOrder : 'asc',
			remoteSort : true,
			url : '<%=request.getContextPath()%>/app/website/content/list.action',
			columns : [[
				{field : 'id',title : '标识',width : 150, sortable : true},
				{field : 'name',title : '名称',width : 100, sortable : true},
				{field : 'hasShowName',title : '显示', width : 120, sortable : true}
			]]
		});
		$('#cid').combogrid("setValue", '${bookcar.cid}');
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="修改预约"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">
		<form id="editForm"
			action="<%=request.getContextPath()%>/app/car/bookcar/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>目录标识:</td>
					<td><select id="cid" name="cid"></select></td>
					<td><div id="cidTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>品牌:</td>
					<td><select id="brand" class="easyui-combobox"
						name="brand" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=car" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="brandTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>型号:</td>
					<td><select id="model" class="easyui-combobox"
						name="model" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="modelTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>系列:</td>
					<td><select id="series" class="easyui-combobox"
						name="series" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="seriesTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
						name="type" valueField="id" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=bookcar.type" 
						textField="text" editable="false"></select></td>
					<td><div id="typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>状态:</td>
					<td><select id="state" class="easyui-combobox"
						name="state" valueField="id" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=bookcar.state" 
						textField="text" editable="false"></select></td>
					<td><div id="stateTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>车牌:</td>
					<td><input id="license" name="license" type="text" value="${bookcar.license}"></input></td>
					<td><div id="licenseTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>预约人:</td>
					<td><input id="userName" name="userName" type="text" value="${bookcar.userName}"></input></td>
					<td><div id="userNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>电话:</td>
					<td><input id="phone" name="phone" type="text" value="${bookcar.phone}"></input></td>
					<td><div id="phoneTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">内容:</td>
					<td><textarea id="text" name="text" type="text" cols="40" rows="5"></textarea></td>
					<td><div id="textTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>预约时间:</td>
					<td><input id="bookTime" name="bookTime" type="text" class="easyui-datetimebox" value="${bookcar.bookTime}"/></td>
					<td><div id="bookTimeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>创建时间:</td>
					<td><input id="createTime" name="createTime" type="text" value="${bookcar.createTime}" class="easyui-datetimebox" value="${bookcar.createTime}" readonly="readonly"/></td>
					<td><div id="bookTimeTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="edit()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
				</tr>
			</table>
			<input id="id" type="hidden" name="id" type="text" value="${bookcar.id}"></input>
			<input id="stateName" type="hidden" name="stateName" type="text" value="${bookcar.stateName}"></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value="${bookcar.typeName}"></input>
			<input id="brandName" type="hidden" name="brandName" type="text" value="${bookcar.brandName}"></input>
			<input id="modelName" type="hidden" name="modelName" type="text" value="${bookcar.modelName}"></input>
			<input id="seriesName" type="hidden" name="seriesName" type="text" value="${bookcar.seriesName}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "editForm"
		});
		
		$("#license").formValidator({
			onfocus : "请正确填写车牌"
		}).inputValidator({
			min : 1,
			max : 20,
			onerror : "不超过20个字符"
		});
		
		$("#phone").formValidator({
			onfocus : "请正确填写电话号码"
		}).regexValidator({
			regexp : "phone"
		}).inputValidator({
			min : 1,
			max : 20,
			onerror : "不超过20个字符"
		});
		
		$("#text").formValidator({
			onfocus : "内容不超过500字符"
		}).inputValidator({
			max : 500,
			onerror : "不超过500个字符"
		});
	});
</script>
</html>