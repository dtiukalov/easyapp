<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="foton.picture.vo.PictureVO"%>	
<%@ page import="java.util.List"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%	
if(request.getSession().getAttribute("USER") != null) {
	//String key = (String)request.getParameter("key");
	int key = Integer.parseInt(request.getParameter("key").toString());
	String sessionTime = request.getParameter("sessionTime").toString();
	//Map<String, PictureVO> map = (Map<String, PictureVO>)request.getSession().getAttribute("map");
	//PictureVO picture = map.get(key);
	List<PictureVO> resultList = (List<PictureVO>)request.getSession().getAttribute("resultList" + sessionTime);	 
	PictureVO picture = resultList.get(key);
	int size = resultList.size();
	String imgPath = "downloadImgs/" + picture.getJpgName();
	
	if (picture.getJpg() == null) {
		imgPath= "images/" + picture.getJpgName();
	}	
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>大图：<%=picture.getCarType() %>&nbsp;<%=picture.getBand() %>&nbsp;<%=picture.getSubBand() %>&nbsp;<%=picture.getYear()%></title>
<script src="js/CJL.0.1.min.js"></script>
<script src="js/ImageTrans.js"></script>
<script src="js/function.js"></script>
<script type="text/JavaScript">

function next(key, sessionTime) {
	var p = key + 1;
	var url = "odetail.jsp?key=" + p + "&sessionTime=" + sessionTime;
	window.location.href(url);
};

function pre(key, sessionTime) {
	var p = key - 1;
	var url = "odetail.jsp?key=" + p + "&sessionTime=" + sessionTime;
	window.location.href(url);
}

function resize(key, sessionTime) {
	var p = key;
	var url = "odetail.jsp?key=" + p + "&sessionTime=" + sessionTime;
	window.location.href(url);
}

function queryList(){
	$().saturnAlert({
		type:"confirm",
		txt:"确定要删除吗？",
	    action:"<%=request.getContextPath()%>/qamonthly::/monthlyModule/action/DeleteProjectInfo.action?del_id=" + del_id  + "&id= ${resultInfo.id}"
	});
}
</script>

<script type="text/JavaScript">

var pp = document.getElementById("viewArea");

drag = 0 
move = 0

// 拖拽对象 
var ie=document.all; 
var nn6=document.getElementById&&!document.all; 
var isdrag=false; 
var y,x; 
var oDragObj;

function moveMouse(e) { 
	if (isdrag) { 
	oDragObj.style.top = (nn6 ? nTY + e.clientY - y : nTY + event.clientY - y)+"px"; 
	oDragObj.style.left = (nn6 ? nTX + e.clientX - x : nTX + event.clientX - x)+"px"; 
	return false; 
	} 
}


function initDrag(e) { 
	var oDragHandle = nn6 ? e.target : event.srcElement; 
	var topElement = "HTML"; 
	while (oDragHandle.tagName != topElement && oDragHandle.className != "dragAble") { 
		oDragHandle = nn6 ? oDragHandle.parentNode : oDragHandle.parentElement; 
	} 
	if (oDragHandle.className=="dragAble") { 
		isdrag = true; 
		oDragObj = oDragHandle; 
		nTY = parseInt(oDragObj.style.top+0); 
		y = nn6 ? e.clientY : event.clientY; 
		nTX = parseInt(oDragObj.style.left+0); 
		x = nn6 ? e.clientX : event.clientX; 
		document.onmousemove=moveMouse; 
		return false; 
	} 
} 
document.onmousedown=initDrag; 
document.onmouseup=new Function("isdrag=false");


function clickMove(s){ 
	if(s=="up"){ 
	dragObj.style.top = parseInt(dragObj.style.top) + 100; 
	}else if(s=="down"){ 
	dragObj.style.top = parseInt(dragObj.style.top) - 100; 
	}else if(s=="left"){ 
	dragObj.style.left = parseInt(dragObj.style.left) + 100; 
	}else if(s=="right"){ 
	dragObj.style.left = parseInt(dragObj.style.left) - 100; 
	}
}

function search(){
	<%request.getSession().setAttribute("message","login");%>
	window.location.href("index.jsp");
	//window.location.reload("index.jsp");
}

</script>

<script language="JavaScript" type="text/JavaScript"> 
	function MM_reloadPage(init) { //reloads the window if Nav4 resized 
	if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) { 
	document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }} 
	else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload(); 
	} 
	MM_reloadPage(true); 

</script>
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
	height: 41px;
	width: 1280px;
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
.sidebar_sidebar {
	font-family: "新宋体";
	font-size: 14px;
	color: #233D62;
	height: auto;
	width: auto;
	border: 1px solid #999999;
}
.column {
	height: auto;
	width: 1280px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 5px;
	margin-left: auto;
}
.sidebar {
	font-family: "新宋体";
	font-size: 14px;
	color: #233D62;
	background-color: #F0F0F0;
	float: left;
	height: 555px;
	width: 180px;
	border: 1px solid #999999;
	margin-right: 1px;
	padding: 10px;
}
.arrow {
	float: left;
	height: 31px;
	width: 6px;
	margin-top: 274px;
	margin-right: 1px;
	margin-bottom: 274px;
}
.column_column {
	font-family: "新宋体";
	font-size: 12px;
	color: #000000;
	float: left;
	height: auto;
	width: 1067px;
}
.title {
	font-family: "新宋体";
	font-size: 12px;
	color: #000000;
	background-image: url(images/db_03_03.jpg);
	height: 20px;
	width: 1067px;
	margin-bottom: 5px;
	padding-top: 10px;
}
.dragAble {
	color: #000000;
	padding: 10px;
	height: 485px;
	width: 1047px;
	margin-bottom: 5px;
	text-align: center;
}
.btn {
	font-family: "宋体";
	font-size: 12px;
	color: #000000;
	background-color: #CCCCCC;
	height: 32px;
	width: 1067px;
	margin-bottom: 5px;
	padding-top: 4px;
	text-align: center;
}
.footer {
	background-color: #233D62;
	height: 22px;
	width: 1280px;
	margin-right: auto;
	margin-left: auto;
	font-family: "新宋体";
	font-size: 12px;
	color: #FFFFFF;
	text-align: center;
	padding-top: 8px;
}
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>
</head>

<body>
<div class="top">
 <input name="button" type="button" onclick="search()" value="搜  索" />
</div>
<div class="column">
  <div class="sidebar">
    <p>图片属性<br />
    </p>
    <div class="sidebar_sidebar">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      
        <tr>
          <td width="80" height="30" align="right">车种：</td>
          <td height="30">&nbsp;<%=picture.getCarType() %></td>
        </tr>
        
        <tr>
          <td width="80" height="30" align="right">国家：</td>
          <td height="30">&nbsp;<%=picture.getCountry() %></td>
        </tr>
        <tr>
          <td width="80" height="30" align="right">品牌：</td>
          <td height="30">&nbsp;<%=picture.getBand() %></td>
        </tr>
        <tr>
          <td width="80" height="30" align="right">子品牌：</td>
          <td height="30">&nbsp;<%=picture.getSubBand() %></td>
        </tr>
        <tr>
          <td width="80" height="30" align="right">年代：</td>
          <td height="30">&nbsp;<%=picture.getYear() %></td>
        </tr>
               
        <tr>
          <td width="80" height="30" align="right">内外饰：</td>
          <td height="30">&nbsp;<%=picture.getInterOunter() %></td>
        </tr>       
                
        <tr>
          	<td width="80" height="30" align="right">局部：</td>
         <%if("外饰".equals(picture.getInterOunter())) {%>
	 		<td height="30">&nbsp;<%=picture.getOuter()%></td>            	   
		<% }%>
		<%if("内饰".equals(picture.getInterOunter())) {%> 
			<td height="30">&nbsp;<%=picture.getInter()%></td>               	   
		<% }%>
        </tr>
        
        <tr>
          <td width="80" height="30" align="right">角度：</td>
          <td height="30">&nbsp;<%=picture.getAngle() %></td>
        </tr>    
       

      </table>
    </div>
    <p><br />
    </p>
  </div>
   
  <div class="column_column">
   		<div class="title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;&gt;<b><%=picture.getCarType() %>&nbsp;<%=picture.getBand() %>&nbsp;<%=picture.getSubBand() %>&nbsp;<%=picture.getYear() %></b></div>
	
    <div style="overflow:hidden;height:485px;;position: relative;border: 1px solid #999999;width: 1067px;border-top: solid 2px #233D62;border-bottom: solid 2px #233D62;border-left: solid 2px #233D62;border-right: solid 2px #233D62;"> 
    	<div id="idContainer" onmouseout='drag=0' onmouseover='dragObj=idContainer; drag=1;' class="dragAble"></div>   
    	<img id="hidImg" src="<%=imgPath%>" style="visibility: hidden; height:auto; width:auto;"/> 	
    </div>

	    <div class="btn" >
	    	<span class="wrap">
	    		<img src="<%=request.getContextPath()%>/images/big.gif" width="25" height="32" style="cursor: hand" id="big"  title="放大" />&nbsp;&nbsp;&nbsp;
	    		<img src="<%=request.getContextPath()%>/images/small.gif" width="25" height="32" style="cursor: hand" id="small"  title="缩小" />  &nbsp;&nbsp;&nbsp;             
	    		<img src="<%=request.getContextPath()%>/images/turnright.gif" width="25" height="32" style="cursor: hand" id="idLeft"  title="逆时针旋转90度" />  &nbsp;&nbsp;&nbsp;  		
	    		<img src="<%=request.getContextPath()%>/images/turnleft.gif" width="25" height="32" style="cursor: hand" id="idRight"  title="顺时针旋转90度" />	&nbsp;&nbsp;&nbsp;    
	    		<img src="<%=request.getContextPath()%>/images/Vertical.gif" width="25" height="32" style="cursor: hand" id="idVertical"  title="垂直翻转" />	 &nbsp;&nbsp;&nbsp; 
	    		<img src="<%=request.getContextPath()%>/images/Horizontal.gif" width="25" height="32" style="cursor: hand" id="idHorizontal"  title="水平翻转" />&nbsp;&nbsp;&nbsp;
 	    		<img src="<%=request.getContextPath()%>/images/resize.gif" width="25" height="32" style="cursor: hand" id="Reset"  title="还原" onclick="resize(<%=key %>,<%=sessionTime %>)"/>	                                                 	
				&nbsp;&nbsp;&nbsp;
			   <%if ( key > 0 && key < size-1 ) {%>
			   	<img src="<%=request.getContextPath()%>/images/pre.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="pre(<%=key %>,<%=sessionTime %>)" />
			   &nbsp;&nbsp;&nbsp;
			   	<img src="<%=request.getContextPath()%>/images/next.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="next(<%=key %>,<%=sessionTime %>)" />

			  <%} else if(key == 0 && size > 1){%>	  
			   	<img src="<%=request.getContextPath()%>/images/preunable.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="" />
			   &nbsp;&nbsp;&nbsp;
			   	<img src="<%=request.getContextPath()%>/images/next.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="next(<%=key %>,<%=sessionTime %>)" />
			  
			  <%}else if(key == 0 && size == 1){%>
			   	<img src="<%=request.getContextPath()%>/images/preunable.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick=""  />
			   &nbsp;&nbsp;&nbsp;
			   	<img src="<%=request.getContextPath()%>/images/nextunable.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick=""  />

			  <%}else { %>	
			   	<img src="<%=request.getContextPath()%>/images/pre.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="pre(<%=key %>,<%=sessionTime %>)" />
			   &nbsp;&nbsp;&nbsp;
			   	<img src="<%=request.getContextPath()%>/images/nextunable.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="" />

			  <%} %> 
	    	</span>
	    </div>
	    
  </div>
  <div class="footer">版权所有：&copy;　福田汽车</div>
</div>
<script>
var obj= $$("hidImg");
	       (function(){

	           var container = $$("idContainer");
		       var src = "<%=imgPath%>";
		       //var image = new image();
		      // image.src = src;
		       
		       var options = {
	               onPreLoad: function(){
	                   container.style.backgroundImage ="url('js/o_loading.gif')";       
	               },
	               onLoad: function(){ 
	                   container.style.backgroundImage = "";
	               },
	               onError: function(err){ 
	                   container.style.backgroundImage = ""; 
	                   alert(err); 
	               }
	           };
//alert(obj.width);alert(obj.height);
	           var it = new ImageTrans(container, options, obj.width, obj.height); 
	           
	           it.load(src);


	           //垂直翻转
	           $$("idVertical").onclick = function(){ it.vertical(); }
	           //水平翻转
	           $$("idHorizontal").onclick = function(){ it.horizontal(); }
	           //左旋转
	           $$("idLeft").onclick = function(){ it.left(); }
	           //右旋转
	           $$("idRight").onclick = function(){ it.right(); }	          
	           //放大
	           $$("big").onclick = function(){ it.zoomin(); }
	           //缩小
	           $$("small").onclick = function(){ it.zoomout(); }
	 		   //重置
	          // $$("idReset").onclick = function(){ it.reset(); }
	         // alert(333)}, 1000);//alert(this._img.src.width);},200);
	       })()       
		</script>
</body>
<%} else {
%>

<script>
	alert("超时，请重新登录");
  	window.close();
</script>

<%
}
%>

</html>
