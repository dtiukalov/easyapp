<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>导入数据信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	
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
					width : 40,
					sortable : true
				} ] ],
				columns : [ [ {
					field : 'typeName',
					title : '类型',
					width : 70,
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
					width : 150,
					sortable : true
				}, {
					field : 'filePath',
					title : '导入文件',
					width : 400,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a></span>';
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
			
			$('#type').combogrid({
				panelWidth : 600,
				idField : 'id',
				textField : 'name',
				pagination : true,
				rownumbers : true,
				sortName : 'id',
				sortOrder : 'asc',
				remoteSort : true,
				url : '<%=request.getContextPath()%>/app/sldb/info/list.action',
				columns : [[
					{field : 'id',title : '标识',width : 150, sortable : true},
					{field : 'name',title : '名称',width : 100, sortable : true},
					{field : 'tableName',title : '表名', width : 120, sortable : true}
				]],
				onSelect:function(record){
					queryVO();
			    }
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					type : $('#type').combogrid('getValue'),
					createTime : $('#createTime').datebox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/sldb/import/view.jsp?to=show&id='+ id;
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<tr align="right">
					<td>类型:</td>
					<td><select id="type" name="type" type="text"></select></td>
					<td>创建时间:</td>
					<td><input id="createTime" name="createTime" class="easyui-datebox" type="text"></input></td>
				</tr>
			</table>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="queryVO();" 
					iconCls="icon-search">确定</a>
				<a href="#" class="easyui-linkbutton" onclick="clearQueryForm();" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
	<table id="queryTable"></table>
</body>
</html>




