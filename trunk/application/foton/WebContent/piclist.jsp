<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.List"%>
<%@ page import="foton.picture.vo.PictureVO"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图片对比列表</title>
<script src="js/jquery-1.4.2.min.js"></script> 
<script src="js/function.js"></script> 
<link rel="stylesheet" type=text/css href="css/photo.css">
<link rel="stylesheet" href="js/pagination.css" />
<script type="text/javascript" src="js//jquery.pagination.js"></script>

<script type="text/javascript">
	function compare(){
	var s= $(document.all).find("input:checkbox:checked");
		if(s.length!=2){
			alert("选择两张图片");
		}else{
			var i = $(s[0]).val();
			var j = $(s[1]).val();
			var url = "piccompare.jsp?i="+i+"&j="+j;
			window.open(url);
		}
	}
	
	function remove(){
		var s= $(document.all).find("input:checkbox:checked");
		var t;

		if(s.length > 0){
			var keys = "";
				for (t = 0; t < s.length; t++){
					var key = $(s[t]).val();
					keys += key + "%";
				}
			var type = "remove";	
			$("#keys").val(keys);	
			$("#type").val(type);	
			$("#picform").submit();
		}else{
			alert("请选择要移除的图片");
		}
	}
</script>
<style type="text/css">
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
.right {
	font-family: "宋体";
	font-size: 30px;
	color: #213a62;
	text-align: center;
	padding: 100px;
}
.bottom {
	WIDTH: 930px;
	OVERFLOW: hidden;
	margin-top: 5px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	text-align: right;
}
</style>
<script src="js/function.js"></script>

</head>
<%	
	Map<String, PictureVO> picListmap = (Map<String, PictureVO>) request.getSession().getAttribute("picListmap");
	if(picListmap.size() > 0) {	
	%>
<body>
	<form id="picform" name="picform" method="post" action=" PictureListServlet">
	
<div class="top">

</div>
	   <div class="wrap" style="margin-top:10px;" style="border-top: solid 2px #233D62;border-bottom: solid 2px #233D62;border-left: solid 2px #233D62;border-right: solid 2px #233D62;">
	    	<div style="margin-top:5px;">
		    <%	
		    Iterator<String> iter = picListmap.keySet().iterator();
		    
			while (iter.hasNext()) {
				String key = iter.next();
				PictureVO value = picListmap.get(key);
				
	    		String imgPath = "downloadImgs/sp/" + value.getSp_jpgName();
				if (value.getJpg() == null) {
					imgPath= "images/" + value.getSp_jpgName();
				}
			%>
				 <div style="margin: 0px 10px 10px 0px; padding-top: 20px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px; " class="set set_m twoline">
		           	<img width=140 height=93 onload="DrawImage(this,140,130);" src="<%=imgPath%>"/>		            
		            <p><%=value.getBand()%>&nbsp;<%=value.getSubBand()%>&nbsp; <%=value.getCarType()%></p>
		           	<p>	<input name="selectpic" type="checkbox" id="<%=key%>" value="<%=key%>"/>选中</p>
		         </div>
	         <% 
				}
	         %>        
	    	</div>
	    </div>
	    <div class="bottom">
	    		<input type="button" name="" value="对   比" onclick="compare()"/>  
				<input type="button" name="" value="移   除" onclick="remove()"/>  
	    </div>	
	    <input type="hidden" id="keys" name="keys"/>
		<input type="hidden" id="type" name="type"/>    
    </form>

</body>
	<%	
	}else{
%>
<script type="text/javascript">
	alert("列表中没有图片");
	window.close();
</script>		
		
<%
	}
%>
<script type="text/javascript">
if('<%=request.getAttribute("PICINFO")%>'=='fail'){
	alert("移除失败");
}
if(request.getSession().getAttribute("USER") == null) {
	alert("超时，请重新登录");
  	window.location.href = "<%=request.getContextPath()%>/login.jsp"; 
}
</script>
</html>
