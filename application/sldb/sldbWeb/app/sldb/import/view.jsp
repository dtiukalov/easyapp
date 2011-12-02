<%@page import="com.saturn.sldb.ImportItem"%>
<%@page import="com.saturn.sldb.ImportInfo"%>
<%@page import="com.saturn.sldb.Import"%>
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
		String id = request.getParameter("id");
		String to = request.getParameter("to");
		Import imp = Import.get(id);
		
		String type = imp.getType();
		String importDate = imp.getImportDate();
		
		ImportInfo info = ImportInfo.get(type);
		String showname = info.getName() + importDate;
		
		String tableName = info.getTableName() + importDate;
	%>
	<title><%=showname%>信息</title>
	
	<script type="text/javascript">
		var lastIndex;
		
		$(function() {
			$('#queryTable').datagrid({
				title : '<%=showname%>信息',
				iconCls : 'icon-datalist',
				nowrap : false,
				striped : true, //数据条纹显示
				collapsible : true,
				singleSelect : false,//只能选一行
				url : '<%=request.getContextPath()%>/app/sldb/import/sub/list.action',
				queryParams : {
					iid : '<%=id%>'
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
					List items = ImportItem.getList(info.getId());
					int size = items.size();
					for (int i = 0; i < size; ++i) {
						ImportItem item = (ImportItem) items.get(i);
						
						String name = item.getColume();
						String title = item.getName();
						String width = item.getShowLength();
						String sort = "true";
				%>
				{
					field : '<%=name%>',
					title : '<%=title%>',
					width : <%=width%>,
					sortable : <%=sort%>
				},
				<%
					}
				%>
				{
					field : 'importDate',
					title : '导入月份',
					width : 70,
					sortable : true
				}, {
					field : 'importType',
					title : '数据类型',
					width : 70,
					sortable : true,	
					formatter : function(value, rec) {
						var result = (rec.importType == 1) ? '正确' : '错误';
						return '<span>' + result + '</span>';
					}
				}, {
					field : 'importError',
					title : '错误原因',
					width : 200,
					sortable : true
				}] ],
				pagination : true,
				rownumbers : true,
				toolbar : [{
					id : 'btnback',
					text : '返回',
					iconCls : 'icon-back',
					handler : function() {
						window.location.href='<%=request.getContextPath()%>/app/sldb/import/<%=to%>.jsp';
						return false;//解决IE6的不跳转的bug
					}
				}]
			});
		});
		
		function queryVO() {
			$('#queryTable').datagrid({
				queryParams : {
				<%
					items = ImportItem.getList(info.getId());
					size = items.size();
					for (int i = 0; i < size; ++i) {
						ImportItem item = (ImportItem) items.get(i);
						
						String name = item.getColume();
						String fun = "val()";
				%>	
					<%=name%> : $('#<%=name%>').<%=fun%>,
				<%
					}
				%>	
					iid : '<%=id%>'
			}});
			
			$('#queryTable').datagrid("load");
		}
		
		function clearQueryForm() {
			$('#queryForm').form('clear');
		}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="查询条件"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" method="post">
			<table>
				<%
					items = ImportItem.getList(info.getId());
					size = items.size();
					for (int i = 0; i < size; ++i) {
				%>
				<tr align="right">
					<%
						for (int j = i; j < i+4; ++j) {
							if (j >= size) {
								break;
							}
							
							ImportItem item = (ImportItem) items.get(j);
							String name = item.getColume();
							String title = item.getName();
						
					%>
					<td><%=title%>:</td>
					<td align="left">
					<input id="<%=name%>" name="<%=name%>" type="text"></input>
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
