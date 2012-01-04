<%@page import="java.util.List"%>
<%@page import="com.saturn.sldb.Import"%>
<%@page import="com.saturn.sldb.ImportInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>批量导入核对</title>
	<%@ include file="/app/includes/header.jsp"%>
	
</head>
<script type="text/javascript">

	function check() {
		$('#checkForm').submit();
	
	}
</script>
<body>
	<form id="checkForm" method="post" action="<%=request.getContextPath()%>/app/sldb/check/toExcel.jsp">
		<div id="panel" class="easyui-panel" title="批量核对"
			icon="icon-query-form" collapsible="true" style="padding: 10px;">
			<%
				String type = request.getParameter("type");
				ImportInfo info = ImportInfo.get(type);
				String name = info.getName();
				List list = Import.getAllDate(type);
				
				String date = "";
				if (list != null && !list.isEmpty()) {
					date = ((Import)list.get(0)).getImportDate();
				}
			%>
			<table>
				<tr align="left">
				<td>核对方式:</td>
					<td>
						<select id="way" name="way" class="easyui-combobox">
							<option value="identify">身份证号</option>
							<option value="name">姓名</option>
						</select></td>
						
				</tr>
				<tr align="right">
					<td><%=name %>:</td>
					<td><select id="<%=type+"_importDateSource"%>" class="easyui-combobox"
					name="<%=type+"_importDateSource"%>" url="<%=request.getContextPath()%>/app/sldb/import/listImportDate.action?type=<%=type%>" valueField="importDate"
					textField="importDate" editable="true"></select></td>
					<input type="hidden" id="idSource" name="idSource" value="<%=type%>"/>
				</tr>
			</table>
			<script type="text/javascript">
				$(function() {
					$('#<%=type+"_importDateSource"%>').combobox({
						width : 256,
						value : "<%=date%>"
					});
				});
				</script>
			<div style="padding: 10px;" >
				<a href="#" class="easyui-linkbutton" onclick="check();" 
					iconCls="icon-search">确定</a>
				<a href="javascript:history.back(-1)" class="easyui-linkbutton"
					iconCls="icon-back">返回</a>
			</div>
		</div>
		<div id="panel" class="easyui-panel" title="核对单位"
			icon="icon-query-form" collapsible="true" style="padding: 10px;">
			<%
				String idStr = request.getParameter("ids");
				String[] ids = null;
				String[] tableName = null;
				String[] importDate = null;
				String[] names = null;
				
				if (idStr != null) {
					String[] strs = idStr.split(",");
					ids = new String[strs.length];
					tableName = new String[strs.length];
					importDate = new String[strs.length];
					names = new String[strs.length];
					
					for (int i = 0; i < strs.length; ++i) {
						String[] args = strs[i].split(":");
						ids[i] = args[0];
						tableName[i] = args[1];
						importDate[i] = args[2];
						names[i] = args[3];
					}
				}
			%>
				<table>
				<%	
					for (int i = 0; i < ids.length; ++i) {
				%>
					<tr align="right">
						<td><%=names[i] %>:</td>
						<td><select id="<%=ids[i]+"_importDate"%>" class="easyui-combobox"
						name="<%=ids[i]+"_importDate"%>" url="<%=request.getContextPath()%>/app/sldb/import/listImportDate.action?type=<%=ids[i]%>" valueField="importDate"
						textField="importDate" editable="true" value="<%=importDate[i]%>"></select></td>
						<input type="hidden" name="idCheck" value="<%=ids[i] %>"/>
					</tr>
				<%  } %>
				</table>
				<script type="text/javascript">
				$(function() {
				<%	
					for (int i = 0; i < ids.length; ++i) {
					
				%>
					$('#<%=ids[i]+"_importDate"%>').combobox({
						width : 256,
						value : "<%=importDate[i] %>"
					});
					
				<%  } %>
				});
				</script>
		</div>
	</form>
</body>
</html>




