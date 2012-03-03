<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="foton.picture.xml.DictionaryLoader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
    String type = (String)request.getSession().getAttribute("type");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ERROR</title>
<link rel="stylesheet" type=text/css href="/foton/dict/css/dictList.css" />
<link rel="stylesheet" type=text/css href="/foton/dict/css/photo.css" />
</head>

<body>

	<div class="wrap">
		<div class="ph_menu clearfix"></div>
		<div class="top">
		<div class="img_bnt_1"><a href="/foton/dict/dictIndex.jsp">数据字典管理</a></div>	
		<%
					if (DictionaryLoader.ANGLEINTER.equalsIgnoreCase(type)
							|| DictionaryLoader.ANGLEOUTER.equalsIgnoreCase(type)
					|| DictionaryLoader.YEAR.equalsIgnoreCase(type)
					|| DictionaryLoader.INTEROUTER.equalsIgnoreCase(type)
					|| DictionaryLoader.OUTER.equalsIgnoreCase(type)
					|| DictionaryLoader.INTER.equalsIgnoreCase(type)
					|| DictionaryLoader.CARTYPE.equalsIgnoreCase(type)) {
		%>
		<div class="img_bnt"><a href="/foton/dict/commonList.jsp">返 回</a></div>
		<%
		} else {
		%>
		<div class="img_bnt"><a href="/foton/dict/countryList.jsp">返 回</a></div>
		<%
		}
		%>
		</div>
		
		<div class="main">
		<div align="center">
			<div class="text"><%=request.getAttribute("error")%></div>
		</div>
		</div>
	</div>
</body>
</html>

