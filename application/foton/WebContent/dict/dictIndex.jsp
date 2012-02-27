<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="foton.picture.xml.DictionaryLoader"%>
<%@ page import="foton.picture.xml.DictionaryManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理数据字典</title>
<script src="js/function.js"></script>

<link rel="stylesheet" type="text/css" href="css/photo.css"/>
<link rel="stylesheet" type="text/css" href="css/dictIndex.css"/>
</head>
<body>
<div class="wrap">
	<div class="ph_menu clearfix">
     	
    	<div style="float:right;margin-top:16px;margin-right:10px;"></div>
        
    </div>
 	
	<div class="bj"></div>
	
	<div class="main"> 

		<form id="hiddeForm" action="<%=request.getContextPath()%>/SearchDictServlet" method="post">
    		<input type="hidden" id="type" name="type" value="<%=DictionaryLoader.COUNTRY %>"/>
			<div><input class="img_bnt" type="submit" value="国 家"/></div>
		</form>
		
		<form id="hiddeForm" action="<%=request.getContextPath()%>/SearchDictServlet" method="post">
    		<input type="hidden" id="type" name="type" value="<%=DictionaryLoader.CARTYPE %>"/>
			<div><input  class="img_bnt" type="submit" value="车 种"/></div>
		</form>
		
		<form id="hiddeForm" action="<%=request.getContextPath()%>/SearchDictServlet" method="post">
			<input type="hidden" id="type" name="type" value="<%=DictionaryLoader.YEAR %>"/>
			<div ><input class="img_bnt" type="submit" value="年 代"/></div>
		</form>
		<form id="hiddeForm" action="<%=request.getContextPath()%>/SearchDictServlet" method="post">
			<input type="hidden" id="type" name="type" value="<%=DictionaryLoader.INTEROUTER %>"/>
			<div ><input class="img_bnt" type="submit" value="内外饰"/></div>
		</form>
		<form id="hiddeForm" action="<%=request.getContextPath()%>/SearchDictServlet" method="post">
			<input type="hidden" id="type" name="type" value="<%=DictionaryLoader.INTER %>"/>
			<div ><input class="img_bnt" type="submit" value="内饰局部"/></div>
		</form>	
		<form id="hiddeForm" action="<%=request.getContextPath()%>/SearchDictServlet" method="post">
			<input type="hidden" id="type" name="type" value="<%=DictionaryLoader.OUTER %>"/>
			<div ><input class="img_bnt" type="submit" value="外饰局部"/></div> 
		</form>
		<form id="hiddeForm" action="<%=request.getContextPath()%>/SearchDictServlet" method="post">
			<input type="hidden" id="type" name="type" value="<%=DictionaryLoader.ANGLE %>"/>
			<div ><input class="img_bnt" type="submit" value="整  体"/></div>
		</form>
	</div>
</div>
</body>
</html>
