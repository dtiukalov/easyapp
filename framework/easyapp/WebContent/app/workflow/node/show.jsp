<%@page import="com.saturn.workflow.WorkFlow"%>
<%@page import="com.saturn.system.Dict"%>
<%@page import="com.saturn.system.easyform.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/app/includes/header.jsp"%>
	
	<% 
		String flowId = request.getParameter("flowId");
		WorkFlow workFlow = WorkFlow.get(flowId);
		
		String flowName = workFlow.getName();
		String flowShowName = workFlow.getShowName();
		
		String name = flowShowName + "(" + flowName + ")";
	%>
	<title>节点信息</title>
	<script type="text/javascript">
		var lastIndex;
		
		var dictFlowType = <%=Dict.getDictJSONByType("flow.node")%>;
		
		function getDictValue(dict, value) {
			for (var i = 0; i < dict.length; i++) {
				if (dict[i].id == value) {
					return dict[i].text;
				}
			}
			
			return value;
		}
		
		$(function() {
			$('#type').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
			
			$('#queryTable').datagrid({
				title : '工作流: <%=name%>, 节点信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/workflow/node/list.action',
				queryParams : {
					flowId : '<%=flowId%>'
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
					title : '名称',
					width : 150,
					sortable : true,
					editor : {
						type:'text'
					}
				}, {
					field : 'type',
					title : '节点类型',
					width : 80,
					sortable : true,
					formatter : function(value, rec) {
						return '<span>' + getDictValue(dictFlowType, value) + '<span>';
					},
					editor : {
						type : 'combobox',
						options : {
							valueField :'id',
							textField : 'text',
							url : '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=flow.node',
							editable : true
						}
					}
				}, {
					field : 'conditonStr',
					title : '条件',
					width : 400,
					sortable : true
				}, {
					field : 'nextNodeStr',
					title : '下一节点',
					width : 200,
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
						rowData.typeName = getDictValue(dictFlowType, rowData.type);
						
						$('#queryTable').datagrid('acceptChanges');
						$.ajax({
							url : '<%=request.getContextPath()%>/app/workflow/node/ajaxupdate.action', 
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
				toolbar : [ {
					id : 'btnadd',
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/workflow/node/add.jsp?flowId=<%=flowId%>';
						return false;//解决IE6的不跳转的bug
					}
				}, {
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
				},{
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
								window.location.href='<%=request.getContextPath()%>/app/workflow/node/delete.action?flowId=<%=flowId%>&ids='+ids.join('__');
							}
						});
						return false;
					}
				}, '-', {
					text:'管理条件',
					iconCls:'icon-save',
					handler: function() {
						var rows = $('#queryTable').datagrid('getSelections');
						if (rows.length == 0) {
							$.messager.alert('提示','请选择操作项','info');
							return;
						} else if (rows.length > 1) {
							$.messager.alert('提示','只能选择一项','info');
							return;
						}
						
						window.location.href='<%=request.getContextPath()%>/app/workflow/condition/show.jsp?nodeId='+rows[0].id;
						return false;
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
						window.location.href='<%=request.getContextPath()%>/app/workflow/info/show.jsp';
						return false;
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					flowId : '<%=flowId%>',
					name : $('#name').val(),
					type : $('#type').combobox('getValue')
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/workflow/node/delete.action?flowId=<%=flowId%>&ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/workflow/node/query.action?flowId=<%=flowId%>&id='+ id;
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
					<td>节点名:</td>
					<td><input id="name" name="name" type="text"></input></td>
					<td>类型:</td>
					<td><td align="left"><select id="type" class="easyui-combobox"
						name="type" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=flow.node" valueField="id"
						textField="text" mode="remote"></select></td>
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




