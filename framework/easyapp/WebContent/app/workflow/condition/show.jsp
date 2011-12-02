<%@page import="com.saturn.workflow.FlowNode"%>
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
		String nodeId = request.getParameter("nodeId");
		FlowNode node = FlowNode.get(nodeId);
		String nodeName = node.getName();
		String flowId = node.getFlowId();
	%>
	<title>节点信息</title>
	<script type="text/javascript">
		$(function() {
			$('#queryTable').datagrid({
				title : '<%=nodeName%>, 条件信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/workflow/condition/list.action',
				queryParams : {
					nodeId : '<%=nodeId%>'
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
					field : 'modelName',
					title : '模式',
					width : 80,
					sortable : true
				}, {
					field : 'typeName',
					title : '类型',
					width : 80,
					sortable : true
				}, {
					field : 'valueName',
					title : '条件',
					width : 300,
					sortable : true
				}, {
					field : 'sign',
					title : '会签',
					width : 80,
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
				toolbar : [ {
					id : 'btnadd',
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/workflow/condition/add.jsp?nodeId=<%=nodeId%>';
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
								window.location.href='<%=request.getContextPath()%>/app/workflow/condition/delete.action?nodeId=<%=nodeId%>&ids='+ids.join('__');
							}
						});
						return false;
					}
				}, {
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/workflow/node/show.jsp?flowId=<%=flowId%>';
						return false;
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
					nodeId : '<%=nodeId%>',
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
					window.location.href='<%=request.getContextPath()%>/app/workflow/condition/delete.action?nodeId=<%=nodeId%>&ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/workflow/condition/query.action?nodeId=<%=nodeId%>&id='+ id;
			return false;
		}
	</script>
</head>
<body>
	<table id="queryTable"></table>
</body>
</html>




