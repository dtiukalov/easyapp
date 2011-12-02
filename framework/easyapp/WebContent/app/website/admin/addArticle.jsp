<%@page import="com.saturn.website.Content"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加网站文章</title>
<!-- kindEditor和easyui样式冲突 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/panel.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/combo.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/combobox.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/linkbutton.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/saturn.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/formValidator/validator.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidatorRegex.js"></script>

<%@ include file="/app/includes/kindEditor.jsp" %>
<script type="text/javascript">
	<%
		String cid = request.getParameter("cid");
		Content content = Content.get(cid);
		String cname = content.getName();
	%>
	
	var editor = "";
	
	function add() {
		editor.sync();
		$('#addForm').submit();
	}
	
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="text"]', {
			cssPath : '<%=request.getContextPath()%>/app/js/kindEditor/plugins/code/prettify.css',
			fileManagerJson : '<%=request.getContextPath()%>/app/system/upload/fileManager.action',
			uploadJson : '<%=request.getContextPath()%>/app/system/upload/upload.action',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['addForm'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['addForm'].submit();
				});
			}
		});
	});
	
	$(function() {
		$('#title').focus();
		
		$('#type').combobox({
			width : 250,
			value : "article.state.normal",
			onSelect : function(record){
				$('#typeName').val(record.text);
		    }
		});
		
		$('#state').combobox({
			width : 250,
			value : "visible.true",
			onSelect : function(record){
				$('#stateName').val(record.text);
		    }
		});
	});
	
	<%
	Object __user = request.getSession().getAttribute("authUser");
	if (__user == null && request.getRequestURI().indexOf("/app/") >= 0) {
	%>
	
	$(function() {
		/*$.messager.show({
			title:'信息',
			msg:'用户会话过期，请重新登录',
			showType:'show'
		});*/
		$.messager.confirm('用户过期', '请重新登录', function(r){
			top.location.href = '<%=request.getContextPath()%>/app/login.jsp';
		});
	});
	<%
		}
	%>
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加<%=cname%>信息"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/website/admin/add.action?cid=<%=cid%>"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>题目:</td>
					<td><input id="title" name="title" type="text"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><select id="type" class="easyui-combobox"
						name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=article.state" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="typeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>显示:</td>
					<td><select id="state" class="easyui-combobox"
						name="state" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=visible" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="stateTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>(提交: Ctrl+Enter)
						</div></td>
				</tr>
			</table>
			<textarea name="text" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
			<input id="cid" type="hidden" name="cid" value="<%=cid%>"></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value="普通"></input>
			<input id="stateName" type="hidden" name="stateName" type="text" value="显示"></input>
			<input id="createTime" type="hidden" name="createTime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
			<input id="operater" type="hidden" name="operater" type="text" value="${authUser.id}"></input>
			<input id="operaterName" type="hidden" name="operaterName" type="text" value="${authUser.name}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		
		$("#title").formValidator({
			onfocus : "题目不能为空！并且不超过100字符"
		}).inputValidator({
			min : 1,
			max : 100
		});
		
		$("#text").formValidator({
			onfocus : "内容不能为空！并且不超过2000字符"
		}).inputValidator({
			min : 1,
			max : 2000
		});
	});
</script>
</html>






