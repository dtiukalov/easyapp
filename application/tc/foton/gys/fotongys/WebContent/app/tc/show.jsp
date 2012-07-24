<%@page import="com.saturn.tc.foton.gys.Attachment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邮件详情</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#queryTable').treegrid({
			title : '<%=International.get(request, "attachment.list") %>',
			prerendered: false,
			iconCls : 'icon-datalist',
			nowrap : false,
			striped : true, //数据条纹显示
			collapsible : true,
			singleSelect : false,//只能选一行
			url : '<%=request.getContextPath()%>/app/tc/foton/gys/listAttachment.action?id=${mail.mailuid}',
			idField : 'uid',//唯一标识列
			treeField:'name',
			remoteSort : true,
//			frozenColumns : [ [ {//不可被删除的列
//				field : 'ck',
//				checkbox : true
//			}] ],
			columns : [ [ {
				field : 'name',
				title : '<%=International.get(request, "attachment.name") %>',
				width : 440,
				formatter : function(value, rec) {
					var type = rec.type;
					if ("Folder" != type  && rec.path != "") {
						return '<span><a <a href="javascript:downloadSingle(\'' + rec.uid + '\')">' + rec.name +'</a>';
					} else {
						return '<span>' + rec.name +'</span>';
					}
				}
			},{
				field : 'status',
				title : '<%=International.get(request, "attachment.status") %>',
				width : 150
			},{
				field : 'version',
				title : '<%=International.get(request, "attachment.version") %>',
				width : 150
			}, {
				field : 'type',
				title : '<%=International.get(request, "attachment.type") %>',
				width : 150
			}/*, {
				field : 'opt',
				title : '<%=International.get(request, "operation") %>',
				width : 100,
				align : 'center',
				rowspan : 2,	
				formatter : function(value, rec) {
					//没有被下载
					var type = rec.type;
					var uid = rec.uid;
					if ("Folder" != type  && rec.path != "") {     
						return '<span><a href="javascript:downloadSingle(\'' + uid + '\')"><%=International.get(request, "attachment.download") %></a></span>';
					} else {
						return '<span></span>';
					}
				}
			} */] ],
			animate:true,
			rownumbers : true,
			toolbar : [ {
				id : 'btndownload',
				text : '<%=International.get(request, "batch.download") %>',
				iconCls : 'icon-download',
				handler : function() {
					$.messager.confirm('<%=International.get(request, "download.info") %>', '<%=International.get(request, "download.info") %>', function(result){
						if (result){
							window.open('<%=request.getContextPath()%>/app/tc/foton/gys/batchdownload.action?uid=${mail.mailuid}');
						}
					});
					return false;
				}
			}]
		});
	});
	
	function downloadSingle(uid){
		if (uid != null && uid != ''){
			var ids = [];
			ids.push(uid);
			window.open('<%=request.getContextPath()%>/app/tc/foton/gys/download.action?uid=${mail.mailuid}&ids=' + ids);
		//	window.location.href='<%=request.getContextPath()%>/app/tc/foton/gys/download.action?uid=${mail.mailuid}&filename='+filename+'&ids=' + ids;
		} else {
			alert('<%=International.get(request, "download.noselect") %>');
		}
	} 
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="<%=International.get(request, "mail.detail") %>"
		icon="icon-edit-form" collapsible="true" style="padding: 10px;">

		<form id="editForm"
			action="<%=request.getContextPath()%>/app/system/easyform/table/update.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><%=International.get(request, "mail.title") %>:</td>
					<td><input id="title" name="title" type="text" value="${mail.title}" readonly="readonly"></input></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><%=International.get(request, "mail.from.user") %>:</td>
					<td><input id="fromUser" name="fromUser" type="text" value="${mail.fromUser}" readonly="readonly"></input></td>
					<td><div id="fromUserTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><%=International.get(request, "mail.from.userdept") %>:</td>
					<td><input id="userdept" name="userdept" type="text" value="${mail.fromUserDept}" readonly="readonly"></input></td>
					<td><div id="userdeptTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><%=International.get(request, "mail.send.time") %>:</td>
					<td><input id="datetime" name="datetime" type="text" value="${mail.datetime}" readonly="readonly"></input></td>
					<td><div id="datetimeTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><%=International.get(request, "mail.content") %>:</td>
					<td><textarea id="content" cols="50" rows="5">${mail.content}</textarea></td>
					<td><div id="contentTip"></div></td>
				</tr>
			</table>
		</form>
		<table id="queryTable"></table>
		<div style="padding: 10px;">
			 <a href="javascript:history.back(-1)"
				class="easyui-linkbutton" iconCls="icon-back"><%=International.get(request, "back") %></a>
		</div>
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