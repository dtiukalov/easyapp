<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.teamcenter.soa.client.model.strong.User"%>
<%@page import="com.teamcenter.soa.client.model.strong.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
	</head>
	
	<%
	Map<String,Item>  phItemMap = (Map<String,Item> )request.getSession().getAttribute("CURR_USER_PHITEM_LIST");
	
	if(phItemMap == null || phItemMap.size() <= 0){
		%>
		<body>
			<div id="container">
				没有PH会议数据
			</div>
		</body>
		<%
	} else {
		Iterator<String>  iterator = phItemMap.keySet().iterator();
		%>
		<body>
			<div id="container">
				<table>
					
					<%
					while(iterator.hasNext()){
						String key = iterator.next().toString();
						Item item = phItemMap.get(key);
					%>	
					<tr>
						<td>
						<form id="showPHForm" name="showPHForm" method="post" action="<%=request.getContextPath()%>/app/pep/view/load.do">
						文件夹名称： 	<input name="name" type="text" value="<%=item.getPropertyDisplayableValue("object_name")%>"/> 
									<input name="uid" type="hidden" value="<%=key%>"/> 
									<input type="Submit" value="  进入PH会议   " />
						</form>	
						</td>
					</tr>	
					
					<%	
					}
					%>
					
				</table>
			</div>
		</body>
	<%} %>
</html>
