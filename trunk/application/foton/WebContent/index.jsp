<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>造型图片管理</title>
</head>

<frameset rows="41,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" border="0"/>
  <frameset cols="220,8,*" id="content" frameborder="no" border="0" framespacing="0">
    <frame src="left.jsp" name="leftFrame"  id="leftFrame" title="leftFrame" scrolling="no" frameborder="no" noresize="false"/>
    <frame src="switchFrame.html" name="switch" scrolling="no" noresize="noresize" id="switch" title="switch" frameborder="no" border="0"/>
    <frame src="right.jsp" name="rightFrame" id="rightFrame" title="rightFrame" frameborder="no" border="0"/>
  </frameset> 
</frameset>

<noframes>
	<body></body>
</noframes>	

</html>