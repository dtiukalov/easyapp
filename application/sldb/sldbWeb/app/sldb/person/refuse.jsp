<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>低保驳回</title>
	<%@ include file="/app/includes/header.jsp"%>
	<script type="text/javascript">
	function check() {
		$('#refuse').submit();
	}
	</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="驳回低保理由"
		icon="icon-query-form" collapsible="true" style="padding: 10px;">
		
		<form id="refuse" name="refuse" method="post" action="<%=request.getContextPath()%>/app/sldb/person/refuse.action">
		<input type="hidden" id="ids" name="ids" value="<%=request.getParameter("ids")%>">
			<table>
				<tr align="right">
					<td>乡镇街初审意见:</td>
					<td><textarea id="note" name="note" style="width:500px;height:100px;"></textarea></td>
				</tr>
			</table>
			<div style="padding: 40px;" >
				<a href="#" class="easyui-linkbutton" onclick="submit();" 
					iconCls="icon-back">驳回</a>
				<a href="javascript:history.back(-1)" class="easyui-linkbutton"" 
					iconCls="icon-cancel">取消</a>
			</div>
		</form>
	</div>
</body>
</html>




