<%@page import="com.saturn.system.Dict"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.system.easyform.QueryFormItem"%>
<%@page import="com.saturn.system.easyform.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/app/includes/header.jsp"%>
	
	<% 
		String tableId = request.getParameter("tableId");
		String tableName = Table.get(tableId).getShowName();
	%>
	<title><%=tableName%>信息</title>
	
	<script type="text/javascript">
		var lastIndex;
		
		$(function() {
			$('#queryTable').datagrid({
				title : '<%=tableName%>信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/system/easyform/list.action',
				queryParams : {
					tableId : '<%=tableId%>'
				},
				idField : 'id',//唯一标识列
				sortName : 'id',
				sortOrder : 'desc',
				remoteSort : true,
				frozenColumns : [ [ {//不可被删除的列
					field : 'ck',
					checkbox : true
				}] ],
				columns : [ [ 
				<%
					List items = QueryFormItem.getNotHiddenItem(tableId);
					int size = items.size();
					for (int i = 0; i < size; ++i) {
						QueryFormItem item = (QueryFormItem) items.get(i);
						
						String name = item.getName();
						String title = item.getShowName();
						String width = item.getWidth();
						String sort = "boolean.true".equals(item.getSort())?"true":"false";
						String format = item.getFormat();
				%>
				{
					field : '<%=name%>',
					title : '<%=title%>',
					width : <%=width%>,
					<%
						if (format!=null && !"".equals(format)) {
					%>
					formatter : function(value, rec) {
						<%=format%>
					},
					<%
						}
					%>
					sortable : <%=sort%>
					
				},
				<%
					}
				%>
				{
					field : 'opt',
					title : '操作',
					width : 100,
					align : 'center',
					rowspan : 2,	
					formatter : function(value, rec) {
						return '<span><a href="#" onclick="editVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/edit.png" width="16" height="16" border="0" /></a>'+
						'&nbsp&nbsp<a href="#" onclick="deleteVO(\'' + rec.id + '\');"><img src="<%=request.getContextPath()%>/app/themes/icons/cancel.png" width="14" height="14" border="0" /></a></span>';
					}
				}] ],
				pagination : true,
				rownumbers : true,
				toolbar : [ 
				{
					id : 'btnadd',
					text : '添加',
					iconCls : 'icon-add',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/system/easyform/add.jsp?formType=add&tableId=<%=tableId%>';
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
				}
				,{
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
								window.location.href='<%=request.getContextPath()%>/app/system/easyform/delete.action?tableId=<%=tableId%>&ids='+ids.join('__');
							}
						});
						return false;
					}
				}
				, '-']
			});
		
		<%
			items = QueryFormItem.getConditonItem(tableId);
			size = items.size();
			for (int i = 0; i < size; ++i) {
				QueryFormItem item = (QueryFormItem) items.get(i);
				
				if (!"form.type.combox".equals(item.getType())) {
					continue;
				}
				String name = item.getName();
		%>
			$('#<%=name%>').combobox({
				onSelect:function(record){
					queryVO();
			    }
			});
		<%
			}
		%>
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
				<%
					items = QueryFormItem.getConditonItem(tableId);
					size = items.size();
					for (int i = 0; i < size; ++i) {
						QueryFormItem item = (QueryFormItem) items.get(i);
						
						String name = item.getName();
						String type = item.getType();
						String fun = "val()";
						
						if ("form.type.combox".equals(type)) {
							fun = "combobox('getValue')";
						} else if ("form.type.datebox".equals(type)) {
							fun = "datebox('getValue')";
						} else if ("form.type.datetime".equals(type)) {
							fun = "datetimebox('getValue')";
						}
				%>	
					<%=name%> : $('#<%=name%>').<%=fun%>,
				<%
					}
				%>	
					tableId : '<%=tableId%>'
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
		
		function deleteVO(id){
			$.messager.confirm('确认删除项', '确认删除该选项', function(result){
				if (result){
					window.location.href='<%=request.getContextPath()%>/app/system/easyform/delete.action?tableId=<%=tableId%>&ids=' + id;
				}
			});
			return false;
		}
		
		function editVO(id){
			window.location.href='<%=request.getContextPath()%>/app/system/easyform/query.action?tableId=<%=tableId%>&id='+ id;
			return false;
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<%
					items = QueryFormItem.getConditonItem(tableId);
					size = items.size();
					for (int i = 0; i < size; ++i) {
				%>
				<tr align="right">
					<%
						for (int j = i; j < i+4; ++j) {
							if (j >= size) {
								break;
							}
							
							QueryFormItem item = (QueryFormItem) items.get(j);
							
							String name = item.getName();
							String title = item.getShowName();
							String type = item.getType();
							String dict = item.getDict();
						
					%>
					<td><%=title%>:</td>
					<td align="left">
					<%
							if ("form.type.combox".equals(type)) {
					%>
					<select id="<%=name%>" class="easyui-combobox"
						name="<%=name%>" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=<%=dict%>" valueField="id"
						textField="text" mode="remote"></select>
					<%
							} else if ("form.type.datebox".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" class="easyui-datebox" type="text"></input>
					<%
							} else if ("form.type.datetime".equals(type)) {
					%>
					<input id="<%=name %>" name="<%=name %>" class="easyui-datetime" type="text"></input>
					<%
							} else {
					%>
					<input id="<%=name%>" name="<%=name%>" type="text"></input>
					<%
							}
					%>
					</td>
					<%
						}
						i+=3;
					%>
				</tr>
					<%
					}
				%>	
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




