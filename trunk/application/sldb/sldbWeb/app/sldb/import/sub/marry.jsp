<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=UTF-8">

	<title>导入数据信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/app/js/kindEditor/css/default.css" />
	<script src="<%=request.getContextPath()%>/app/js/kindEditor/kindeditor.js"></script>
	<script src="<%=request.getContextPath()%>/app/js/kindEditor/lang/zh_CN.js"></script>
	<script src="<%=request.getContextPath()%>/app/js/kindEditor/plugins/filemanager/filemanager.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '导入数据列表',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/import/list.action',
				queryParams : {
					type : $('#type').val()
				},
				idField : 'id',//唯一标识列
				sortName : 'createTime',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					title : '标识',
					width : 140,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'name',
					title : '导入文件名',
					width : 150,
					sortable : true
				}, {
					field : 'typeName',
					title : '类型',
					width : 100,
					sortable : true
				}, {
					field : 'createrName',
					title : '导入单位',
					width : 70,
					sortable : true
				}, {
					field : 'sum',
					title : '导入总数',
					width : 70,
					sortable : true
				}, {
					field : 'importDate',
					title : '导入月份',
					width : 70,
					sortable : true
				}, {
					field : 'createTime',
					title : '导入时间',
					width : 130,
					sortable : true
				}, /*{
					field : 'filePath',
					title : '导入文件',
					width : 400,
					sortable : true
				},*/ {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						var urlStr = '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>';
						
						if (rec.importDate == '<%=DateUtils.getSystemDate().substring(0, 7)%>') {
							urlStr += '&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a>';
						}
						urlStr += '</span>';
						
						return urlStr;
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ {
					id : 'btnedit',
					text : '查看',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择修改项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						editVO(rows[0].id);
						return false;
					}
				}]
			});
		});
		
		KindEditor.ready(function(K) {
			var uploadbutton = K.uploadbutton({
				button : K('#uploadButton')[0],
				fieldName : 'imgFile',
				url : '<%=request.getContextPath()%>/app/sldb/import/add.action?type='+$('#type').val(),
				afterUpload : function(data) {
					if (data.error === 0) {
						$.messager.show({
							title:'信息',
							msg:'上传数据成功',
							showType:'show'
						});
						queryVO();
					} else {
						alert(data.message);
					}
					
					return false;
				}
			});
			
			uploadbutton.fileBox.change(function(e) {
				$.messager.confirm('确认上传项', '确认上传该文件', function(result){
					if (result){
						uploadbutton.submit();
					}
				});
			});
		});
		
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					type : $('#type').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/sldb/import/sub/delete.action?to=marry&ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/import/view.jsp?to=sub/marry&id='+ id;
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="导入数据"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" name="queryForm" method="post" action="<%=request.getContextPath()%>/app/sldb/import/add.action">
			<table>
				<tr align="right">
					<td><input type="button" id="uploadButton" value="上传文件" style="width:100"/> </td>
				</tr>
			</table>
			<input id="type" name="type" type="hidden" value="7"></input>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>




