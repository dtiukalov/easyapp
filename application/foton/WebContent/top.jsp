<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="foton.picture.vo.PictureVO"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>造型图片管理</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.top {
	background-image: url(images/logo1.jpg);
	height: 31px;
	width: auto;
	margin-right: auto;
	margin-left: auto;
	background-color: #233D62;
	background-repeat: no-repeat;
	margin-top: 0px;
	margin-bottom: 5px;
	text-align: right;
	padding-top: 10px;
	padding-right: 20px;
}
-->
</style>
<script src="js/jquery-1.4.2.min.js"></script> 
<script src="js/function.js"></script> 
<script type="text/javascript" src="js//jquery.pagination.js"></script>
<script type="text/javascript">
	function compare(){
		var s  = $(window.parent.rightFrame.document).find("input:checkbox:checked");
		if(s.length!=2){
			alert("选择两张图片");
		}else{
			var stri = $(s[0]).val();
			var strj = $(s[1]).val();
			var i = stri.split(",")[0];
			var j = strj.split(",")[0];
			var sessionTime = stri.split(",")[1]
			var url = "testcompare.jsp?i="+i+"&j="+j+"&sessionTime="+sessionTime;
			window.open(url);
		}
	};

	function getPictureList(){
		var s  = $(window.parent.rightFrame.document).find("input:checkbox:checked");
		var t;

		if(s.length > 0){
			var pics = "";
				for (t = 0; t < s.length; t++){
					var i = $(s[t]).val().split(",")[0];
					pics += i + "%";
				}
			var sessionTime = $(s[0]).val().split(",")[1];	
			$("#pics").val(pics);	
			$("#sessionTime").val(sessionTime);	
			$("#form1").submit();
		}else{
			alert("请选择要下载的图片");
		}
	}
	
	function addPictoList(){
		var s  = $(window.parent.rightFrame.document).find("input:checkbox:checked");
		var t;

		if(s.length > 0 ){
			var keys = "";
				for (t = 0; t < s.length; t++){
					var key = $(s[t]).val().split(",")[2];
					keys += key + "%";
				}
			var type = "add";	
			$("#keys").val(keys);	
			$("#type").val(type);	
			$("#form2").submit();
		}else{
			alert("请选择要加入列表的图片");
		}
	}
	
	function viewPicList(){
	<%	
	Map<String, PictureVO> picListmap = (Map<String, PictureVO>) request.getSession().getAttribute("picListmap");
		if(picListmap.size() > 0) {		
	%>
		window.open("piclist.jsp");
	<%} else {%>
		alert("列表中没有图片");
	<%}%>
	}	
</script>
</head>
<body >

<div class="top">
	<form id="form1" name="form1" method="post" action="load">
	    <input type="hidden" id="pics" name="pics"/>
	    <input type="hidden" id="sessionTime" name="sessionTime"/>
	    <%  String user = (String)request.getSession().getAttribute("loginUser");
	    if(user != null && "dba".equalsIgnoreCase(user)){ %>
	    <input class="t" type="button" value="管理数据字典" style="width:100px;" onclick="window.open('<%=request.getContextPath()%>/dict/dictIndex.jsp')"/>
	    <% }%>
	    <input name="button" type="button" class="t" onclick="addPictoList()" value="加入对比列表" title="将不同页的图片加入列表中，最多可加入十张"/>
	    <input name="button" type="button" class="t" onclick="viewPicList()" value="打开对比列表" title="打开列表，对比列表中的图片"/>	    
	    <input name="button" type="button" class="t" onclick="getPictureList()" value="下  载" />
	</form>
	<form id="form2" name="form2" method="post" action="PictureListServlet">
	    <input type="hidden" id="keys" name="keys"/>
	    <input type="hidden" id="type" name="type"/>
	</form>
</div>
</body>
<script type="text/javascript">
if('<%=request.getAttribute("PICINFO")%>'=='ok'){
	alert("已添加到列表");
}else if('<%=request.getAttribute("PICINFO")%>'=='fail'){
	alert("添加失败");
}else if('<%=request.getAttribute("PICINFO")%>'=='over'){
	alert("列表中图片不能超过10张");
}

</script>
</html>
