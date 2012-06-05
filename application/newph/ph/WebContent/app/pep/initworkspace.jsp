<%@page import="java.util.ArrayList"%>
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
		<title>PH汇报</title>
		<%
			request.getSession().setAttribute("FV9_11ProjectTermin", null);
			request.getSession().setAttribute("FV9_11VorserienTer", null);
			List<Map<String,Item>> itemList = new ArrayList<Map<String,Item>>();
			if (session.getAttribute("CURR_USER_PHITEM_LIST") != null) {
				itemList = (List<Map<String,Item>>)session.getAttribute("CURR_USER_PHITEM_LIST");
			}
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
		    		<div style="width: 800px; height: 500px; margin-top: 40px; margin-left: 100px; text-align: center; overflow-y: auto;">
		    		<%
					if(itemList == null || itemList.size() <= 0){
					%>
						<h1>此用户没有PH汇报项</h1>
					<%
					} else {
					%>
						<table border="1" width="700" >
							
							<%
							for (Map<String,Item> map : itemList) {
								String key =  map.keySet().iterator().next().toString();
								Item item = map.get(key);
								PH.getDataService().getProperties(item, "object_name", "fv9PlatformType");
							%>	
							<form id="showPHForm" name="showPHForm" method="post" action="<%=request.getContextPath()%>/app/pep/view/load.do">
							<tr>
								<td style="width: 130px; height: 30px;">
									PH汇报项：
								</td>
								<td style="width: 470px; height: 30px; text-align: left;">
									&nbsp;&nbsp;<%=item.getPropertyDisplayableValue("object_name")%>
								</td>
								<td style="width: 150px; height: 30px;">
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
