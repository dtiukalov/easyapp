<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.saturn.ph.PH"%>
<%@page import="com.teamcenter.soa.client.model.ModelObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>目录</title>
<script type="text/javascript">

</script>
</head>
<body class="easyui-layout">
	<div id="container">
		<div id="nr">
			<div id="top"><h1>目录</h1></div>
			<div id="content">
				<% 
				List<String> indexes = (List<String>)request.getSession().getAttribute("indexes");
				List<String> cataloguelist = (List<String>)request.getSession().getAttribute("catalogue");
				
				
				if(cataloguelist == null){
					cataloguelist = new ArrayList<String>();
					out.println("总条数：" + indexes.size());
					String url = "";
					for(int i=0; i < indexes.size(); i++){
						String name1 = "";
						if(indexes.get(i).contains("uid=")){
							String uid1 = indexes.get(i).substring(indexes.get(i).indexOf("=") + 1);
							ModelObject object1 = PH.getDataService().loadModelObject(uid1);
							name1 = object1.getProperty("object_name").getDisplayableValue();
							url = name1 + "<a href=\"" + (request.getContextPath().concat(indexes.get(i))).concat("&current=").concat(String.valueOf(i+1))
							+ "\" target=\"_self\">打开</a><br \\>";
						}
						%>	
						<%= url%>
				<% }
					cataloguelist.add(url);
				} else {
					for(int j=0; j < cataloguelist.size(); j++){
						%>	<%= cataloguelist.get(j)%> <% 
					}
				}%>
			</div>
		</div>
	</div>	
</body>
</html>