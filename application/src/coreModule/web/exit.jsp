<%
	session.invalidate();
%>
<script>
	window.location = "<%=request.getContextPath()%>/crm/loginModule/web/login.jsp";
</script>