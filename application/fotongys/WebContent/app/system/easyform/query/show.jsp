<%@page import="com.saturn.system.Dict"%>
<%@page import="com.saturn.system.easyform.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>查询表单项信息</title>
	<%@ include file="/app/includes/header.jsp"%>
	
	<% 
		String tableId = request.getParameter("tableId");
		String tableName = Table.get(tableId).getName();
	%>
	<script type="text/javascript">
		var lastIndex;
		
		var dictBoolean = <%=Dict.getDictJSONByType("boolean")%>;
		var dictVisible = <%=Dict.getDictJSONByType("visible")%>;
		var dictRegex = <%=Dict.getDictJSONByType("regex")%>;
		var dictFormType = <%=Dict.getDictJSONByType("form.type")%>;
		
		function getDictValue(dict, value) {
			for (var i = 0; i < dict.length; i++) {
				if (dict[i].id == value) {
					return dict[i].text;
				}
			}
			
			return value;
		}
		
		$(function() {
			$('#queryTable').datagrid({
				title : '<%=tableName%>表,查询表单项信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/system/easyform/query/list.action',
				queryParams : {
					tableId : '<%=tableId%>'
				},
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'asc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}] ],
				columns : [ [ {
					field : 'name',
					title : '属性名',
					width : 80,
					sortable : true
				}, {
					field : 'showName',
					title : '中文名称',
					width : 80,
					sortable : true,
					editor : {
						type:'text'
					}
				}, {
					field : 'conditionName',
					title : '条件',
					width : 50,
					sortable : true,
					editor : {
						type : 'checkbox',
						options: {
							on:'是',
							off:'否'
						}
					}
				}, {
					field : 'hiddenName',
					title : '隐藏',
					width : 50,
					sortable : true,
					editor : {
						type : 'checkbox',
						options: {
							on:'隐藏',
							off:'显示'
						}
					}
				}, {
					field : 'sortName',
					title : '排序',
					width : 50,
					sortable : true,
					editor : {
						type : 'checkbox',
						options: {
							on:'是',
							off:'否'
						}
					}
				}, {
					field : 'width',
					title : '宽度',
					width : 100,
					sortable : true,
					editor : {
						type:'numberbox'
					}
				}, {
					field : 'dict',
					title : '数据字典',
					width : 130,
					sortable : true,
					editor : {
						type : 'combobox',
						options : {
							valueField :'id',
							textField : 'text',
							url : '<%=request.getContextPath()%>/app/system/dict/queryDictType.action',
							editable : true
						}
					}
				}, {
					field : 'type',
					title : '类型',
					width : 100,
					sortable : true,
					formatter : function(value, rec) {
						return '<span>' + getDictValue(dictFormType, value) + '<span>';
					},
					editor : {
						type : 'combobox',
						options : {
							valueField :'id',
							textField : 'text',
							url : '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=form.type',
							editable : true
						}
					}
				}, {
					field : 'format',
					title : '格式',
					width : 150,
					sortable : true
				}, {
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a>'+
						'</span>';
					}
				} ] ],
				pagination : true,
				rownumbers : true,
				onClickRow: function(rowIndex){
					if (lastIndex != rowIndex){
						$('#queryTable').datagrid('endEdit', lastIndex);
						$('#queryTable').datagrid('beginEdit', rowIndex);
					}
					lastIndex = rowIndex;
				},
				onAfterEdit : function (rowIndex, rowData, changes) {
					var rows = $('#queryTable').datagrid('getChanges');
					if (rows.length > 0) {
						rowData.typeName = getDictValue(dictFormType, rowData.type);
						rowData.condition = rowData.conditionName == '是' ? 'boolean.true' : 'boolean.false';
						rowData.sort = rowData.sortName == '是' ? 'boolean.true' : 'boolean.false';
						rowData.hidden = rowData.hiddenName == '显示' ? 'visible.true' : 'visible.false';
						
						$('#queryTable').datagrid('acceptChanges');
						$.ajax({
							url : '<%=request.getContextPath()%>/app/system/easyform/query/ajaxupdate.action', 
							type : 'post',         
							dataType : 'json',     
							data : rowData,         
							success : function(data) {
								if (data) {
									$.messager.show({
										title:'信息',
										msg:'保存成功',
										showType:'show'
									});
								}
							} 
						});
					}
				},
				toolbar : [ 
				/*{
					id : 'btnadd',
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/system/easyform/query/add.jsp?tableId=<%=tableId%>';
						return false;//解决IE6的不跳转的bug
					}
				}, */
				{
					id : 'btnedit',
					text : '编辑',
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
				}, {
					id : 'btndelete',
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择删除项','info');
							return;
						} 
						
						var ids = [];
						for(var i=0;i<rows.length;i++){
							ids.push(rows[i].id);
						}

						$.messager.confirm('确认删除项', '确认删除该选项', function(result){
							if (result){
								window.location.href='<%=request.getContextPath()%>/app/system/easyform/query/delete.action?tableId=<%=tableId%>&ids='+ids.join('__');
							}
						});
						return false;
					}
				}, {
					id : 'btnedit',
					text : '位置互换',
					iconCls : 'icon-reload',
					handler : function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length != 2) {
							$.messager.alert('提示','请选择2个互换项','info');
							return;
						} 
						
						var first = rows[0];
						var second = rows[1];
						
						$.messager.confirm('确认互换项', '确认互换该选项', function(result){
							if (result){
							window.location.href='<%=request.getContextPath()%>/app/system/easyform/query/change.action?tableId=<%=tableId%>&first='+first.id+'&second='+second.id;
							}
						});
						return false;
					}
				}, '-', {
					id : 'btnGenerate',
					text : '生成表单属性',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/system/easyform/query/generate.action?tableId=<%=tableId%>';
						return false;//解决IE6的不跳转的bug
					}
				}, '-', {
					text:'保存',
					iconCls:'icon-save',
					handler: function() {
						$('#queryTable').datagrid('acceptChanges');
						lastIndex = -1;
					}
				}, {
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/system/easyform/table/show.jsp';
						return false;
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					tableId : '<%=tableId%>',
					name : $('#name').val(),
					showName : $('#showName').val()
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/system/easyform/query/delete.action?tableId=<%=tableId%>&ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/system/easyform/query/query.action?tableId=<%=tableId%>&id='+ id;
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
					<td>列名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>中文名:</td>
					<td><input id="showName" name="showName" type="text"></input></td>
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




