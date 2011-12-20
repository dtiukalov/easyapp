<%@page import="org.json.JSONObject"%>
<%@page import="com.saturn.sldb.ImportInfo"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.auth.User"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.sldb.ImportItem"%>
<%@page import="com.saturn.sldb.IdCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=UTF-8">

	<title>核对结果信息</title>
	<%@ include file="/app/includes/header.jsp"%>

</head>
<body>
	<div id="panel" class="easyui-panel" title="核对结果"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">

		<form id="queryForm" name="queryForm" method="post" action="">
			<%
				ImportInfo info = (ImportInfo) request.getAttribute("info");
				List<ImportItem> items = ImportItem.getList(info.getId());
				String value = (String)request.getAttribute("values");
				JSONObject jsonObject = new JSONObject(value);
			%>
				<textarea rows="20" cols="70">
				<%
					for (int j=0; j<items.size(); j++) {
						ImportItem item = (ImportItem)items.get(j);
				%>
 <%=item.getName()%>:<%= jsonObject.get(item.getColume())%><%
				}
			%>
				</textarea>
				<div style="padding: 10px;" >
					<a href="javascript:history.back(-1)" class="easyui-linkbutton"
						iconCls="icon-back">返回</a>
				</div>
		</form>
	</div>
</body>
</html>




