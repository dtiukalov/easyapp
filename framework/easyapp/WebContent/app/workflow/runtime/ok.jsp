<%@page import="com.saturn.workflow.FlowFormItem"%>
<%@page import="com.saturn.workflow.WorkFlow"%>
<%@page import="com.saturn.workflow.runtime.WorkFlowInstance"%>
<%@page import="java.util.Map"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.system.easyform.FormItem"%>
<%@page import="com.saturn.system.easyform.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/app/includes/header.jsp"%>
<%
	String instanceId = request.getParameter("instanceId");
	String nodeId = (String)request.getAttribute("nodeId");
	
	WorkFlowInstance instance = WorkFlowInstance.get(instanceId);
	
	String flowId = instance.getFlowId();
	WorkFlow workFlow = WorkFlow.get(flowId);
	
	String flowName = workFlow.getShowName();
	Map form = (Map)request.getAttribute("formValue");
%>
<title>确认</title>

</head>
<body>
	<a href="<%=request.getContextPath()%>/app/workflow/runtime/run.action?instanceId=<%=request.getParameter("instanceId")%>">下一步</a>		
</body>
</html>