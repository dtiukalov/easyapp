<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.teamcenter.soa.client.model.strong.User"%>
<%@page import="com.teamcenter.soa.client.model.strong.Item"%>
<%@page import="com.saturn.ph.PH" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<%
			Map<String,Item>  phItemMap = (Map<String,Item> )request.getSession().getAttribute("CURR_USER_PHITEM_LIST");
		%>
		<script type="text/javascript">
			function submitForm() {
				$('#showPHForm').submit();
			}
		</script>
	</head>
	<body>
		<div id="container">
			<div id="nr">
				<div id="top"><h1>PH汇报</h1></div>
		    	<div id="content">
		    		<div style="width: 800px; height: 500px; margin-top: 50px; text-align: center;">
		    		<%
					if(phItemMap == null && phItemMap.size() <= 0){
					%>
						<h1>此用户没有PH汇报项</h1>
					<%
					} else {
						Iterator<String>  iterator = phItemMap.keySet().iterator();
					%>
						<table border="1" style="width: 700xp; margin-left: 100px;">
							
							<%
							while(iterator.hasNext()){
								String key = iterator.next().toString();
								Item item = phItemMap.get(key);
								PH.getDataService().getProperties(item, "object_name",
										"fv9PlatformType");
							%>	
							<form id="showPHForm" name="showPHForm" method="post" action="<%=request.getContextPath()%>/app/pep/view/load.do">
							
							<tr>
								<td style="width: 130px; height: 30px;">
									PH汇报项：
								</td>
								<td style="width: 470px; text-align: left;">
									&nbsp;&nbsp;<%=item.getPropertyDisplayableValue("object_name")%>
								</td>
								<td style="width: 150px;">
									<input type="Submit" value="开始汇报" />
								</td>
								<input name="name" type="hidden" value="<%=item.getPropertyDisplayableValue("object_name")%>"/> 
								<input name="uid" type="hidden" value="<%=key%>"/> 
							</tr>	
							</form>	
							<%	
							}
							%>
							
						</table>
					<%} %>
					</div>
				</div>
		   	 	<div class="clear"></div>
		   	 	<%@ include file="/app/pep/include/foot.jsp"%>
		    </div>
		</div>
	</body>
</html>
