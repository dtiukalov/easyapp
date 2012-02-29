<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="css/common.css" type="text/css"/>

<title>客户关系管理系统</title>
<%	
	if(request.getAttribute("saturnData") != null){
		Map saturnData = (Map)request.getAttribute("saturnData");
		String username = (String)saturnData.get("username");
		String userid = String.valueOf(saturnData.get("userid"));
		String userrealname = (String)saturnData.get("userrealname");
		
		Map crm_user = new HashMap();
		crm_user.put("username", username);
		crm_user.put("userid", userid);
		crm_user.put("userrealname", userrealname);

		session.setAttribute("CRM_USER", crm_user);
	}
%>   
</head>
  <frameset name="myFrame" id="myFrame" rows="*" cols="199,7,*" frameborder="no" border="0" framespacing="0">
    <frame src="${pageContext.request.contextPath}/crm/coreModule/web/leftFrame.jsp" name="leftFrame" scrolling="no" frameborder="no" noresize="false" id="leftFrame" title="菜单栏" />
	<frame src="${pageContext.request.contextPath}/crm/coreModule/web/switchFrame.html" name="switchFrame" frameborder="no" scrolling="no" noresize="false" id="switchFrame" title="切换栏" />
    <frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0">
         <frame src="${pageContext.request.contextPath}/crm/coreModule/web/rightFrame.html" name="rightFrame" frameborder="no" scrolling="no"  noresize="false" id="rightFrame" title="导航栏" />
         <frame src="${pageContext.request.contextPath}/crm/coreModule/web/mainFrame.jsp" name="mainFrame" frameborder="no" noresize="false" id="mainFrame" title="内容栏" />
     </frameset>
</frameset>

<noframes>
</noframes>
</html>
