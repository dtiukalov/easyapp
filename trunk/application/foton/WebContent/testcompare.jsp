<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isErrorPage="true"%>
<%@ page import="java.util.List"%>
<%@ page import="foton.picture.vo.PictureVO"%>
<%@page import="java.util.Map"%>
<%	
if(request.getSession().getAttribute("USER") != null) {
	//String i = (String)(request.getParameter("i"));
  //	String j = (String)(request.getParameter("j"));
  	//Map<String, PictureVO> map = (Map<String, PictureVO>)request.getSession().getAttribute("map");
  //	PictureVO picture1 = map.get(i);
	//PictureVO picture2 = map.get(j);1260px
	String sessionTime = request.getParameter("sessionTime").toString();
	List<PictureVO> resultList = (List<PictureVO>)request.getSession().getAttribute("resultList" + sessionTime);	 
  	int i = Integer.parseInt(request.getParameter("i"));
  	int j = Integer.parseInt(request.getParameter("j"));
  	int size = resultList.size();
  	PictureVO picture1 = resultList.get(i);
	PictureVO picture2 = resultList.get(j);
	String img1Path = request.getContextPath() +"/downloadImgs/" + picture1.getJpgName();
	String img2Path = request.getContextPath() +"/downloadImgs/" + picture2.getJpgName();
	if (picture1.getJpg() == null) {
		img1Path= request.getContextPath() +"/images/" + picture1.getJpgName();

	}	
	
	if (picture2.getJpg() == null) {
		img2Path= request.getContextPath() +"/images/" + picture2.getJpgName();

	}	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>对比：<%=picture1.getCarType() %>&nbsp;<%=picture1.getBand() %>&nbsp;<%=picture1.getSubBand() %>&nbsp;<%=picture1.getYear()%> VS <%=picture2.getCarType() %>&nbsp;<%=picture2.getBand() %>&nbsp;<%=picture2.getSubBand() %>&nbsp;<%=picture2.getYear()%></title>
<script src="js/CJL.0.1.min.js"></script>
<script src="js/ImageTrans.js"></script>
<script src="js/function.js"></script>
<script src="js/ImageMove.js"></script>

<script type="text/JavaScript">

function pic1next(i,j,sessionTime) {
	var p = i + 1;
	var url = "testcompare.jsp?i="+p+"&j="+j+"&sessionTime="+sessionTime;
	window.location.href(url);
};

function pic1pre(i,j,sessionTime) {
	var p = i - 1;
	var url = "testcompare.jsp?i="+p+"&j="+j+"&sessionTime="+sessionTime;
	window.location.href(url);
}

function pic2next(i,j,sessionTime) {
	var p = j + 1;
	var url = "testcompare.jsp?i="+i+"&j="+p+"&sessionTime="+sessionTime;
	window.location.href(url);
};

function pic2pre(i,j,sessionTime) {
	var p = j - 1;
	var url = "testcompare.jsp?i="+i+"&j="+p+"&sessionTime="+sessionTime;
	window.location.href(url);
}

function resize(i,j,sessionTime) {
	var url = "testcompare.jsp?i="+i+"&j="+j+"&sessionTime="+sessionTime;
	window.location.href(url);
}
function search(){
	<%request.getSession().setAttribute("message","login");%>
	window.location.href("index.jsp");
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
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 4px;
	margin-left: auto;
	background-repeat: no-repeat;
	background-color: #233D62;
	text-align: right;
	padding-top: 10px;
	padding-right: 20px;
}
.content {
	height: auto;
	width: 1280px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 4px;
	margin-left: auto;
}
.column_left {
	float: left;
	height: auto;
	width: 636px;
	margin-right: 5px;
}
.content_right {
	height: auto;
	width: 636px;
	float: left;
}
.footer {
	background-color: #233D62;
	height: 22px;
	width: 1280px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	font-family: "新宋体";
	font-size: 12px;
	color: #FFFFFF;
	text-align: center;
	padding-top: 8px;
}
.shuxing {
	padding: 10px;
	height: 40px;
	width: 614px;
	border: 1px solid #233D62;
	margin-top: 4px;
	font-family: "新宋体";
	font-size: 12px;
	color: #000000;
}
.title {
	background-image: url(images/db_03.jpg);
	height: 20px;
	width: 600px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 4px;
	margin-left: 0px;
	padding-top: 10px;
	padding-left: 37px;
	font-family: "新宋体";
	font-size: 12px;
	color: #000000;
}
.dragAble {
	width: 615px;
	height: 480px;
	color: #000000;
	padding: 10px;
	margin-bottom: 5px;
	text-align: center;
}
.btn {
	background-color: #CCCCCC;
	height: 32px;
	width: 637px;
	padding-top: 4px;
	text-align: center;
}
-->
</style>
</head>

<body>
<div class="top">
 <input name="button" type="button" onclick="search()" value="搜  索" />
</div>
<div class="content">
  <div class="column_left">
    <div class="title">&gt;&gt;<b><%=picture1.getCarType() %>&nbsp;<%=picture1.getBand() %>&nbsp;<%=picture1.getSubBand() %>&nbsp;<%=picture1.getYear() %></b></div>

	
    <div style="overflow:hidden;height:485px;;position: relative;border: 1px solid #999999;width: 635px"> 
    	<div id="idContainer" onmouseout='drag=0' onmouseover='dragObj=idContainer; drag=1;' class="dragAble" ></div>
    	<img id="hidImg1" src="<%=img1Path%>" style="visibility: hidden; height:auto; width:auto;"/>
    </div>	
	<div class="btn"><span class="wrap">
 		<img src="<%=request.getContextPath()%>/images/big.gif" width="25" height="32" style="cursor: hand"
                   id="big"  title="放大" />
        &nbsp;&nbsp;&nbsp;           
		<img src="<%=request.getContextPath()%>/images/small.gif" width="25" height="32" style="cursor: hand"
                   id="small"  title="缩小" />     
                   &nbsp;&nbsp;&nbsp;         
		<img src="<%=request.getContextPath()%>/images/turnright.gif" width="25" height="32" style="cursor: hand"
                   id="idLeft"  title="逆时针旋转90度" />	
                   &nbsp;&nbsp;&nbsp;    		
		<img src="<%=request.getContextPath()%>/images/turnleft.gif" width="25" height="32" style="cursor: hand"
                   id="idRight"  title="顺时针旋转90度" />	    
                   &nbsp;&nbsp;&nbsp;
		<img src="<%=request.getContextPath()%>/images/Vertical.gif" width="25" height="32" style="cursor: hand"
                   id="idVertical"  title="垂直翻转" />
                   &nbsp;&nbsp;&nbsp;	  
		<img src="<%=request.getContextPath()%>/images/Horizontal.gif" width="25" height="32" style="cursor: hand"
                   id="idHorizontal"  title="水平翻转" />	
                   &nbsp;&nbsp;&nbsp;
 		<img src="<%=request.getContextPath()%>/images/resize.gif" width="25" height="32" style="cursor: hand"
                   id="Reset"  title="还原" onclick="resize(<%=i%>,<%=j%>,<%=sessionTime %>)" />	   
	 &nbsp;&nbsp;&nbsp;
      	<%if ( i > 0 && i < size-1 ) {%>
		   	<img src="<%=request.getContextPath()%>/images/pre.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="pic1pre(<%=i%>,<%=j%>,<%=sessionTime %>)" />
		   	&nbsp;&nbsp;&nbsp;
		   	<img src="<%=request.getContextPath()%>/images/next.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="pic1next(<%=i%>,<%=j%>,<%=sessionTime %>)" />

		  <%} else if(i == 0){%>	  
		   	<img src="<%=request.getContextPath()%>/images/preunable.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="" />
		   	&nbsp;&nbsp;&nbsp;
		   	<img src="<%=request.getContextPath()%>/images/next.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="pic1next(<%=i%>,<%=j%>,<%=sessionTime %>)" />

		  <%}else{%>
		   	<img src="<%=request.getContextPath()%>/images/pre.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="pic1pre(<%=i%>,<%=j%>,<%=sessionTime %>)" />
		   	&nbsp;&nbsp;&nbsp;
		   	<img src="<%=request.getContextPath()%>/images/nextunable.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="" />

		  <%} %>

	</span></div>
<script>
     (function(){
     var obj1= $$("hidImg1");
         var container = $$("idContainer"), src = "<%=img1Path%>",
             options = {
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
             },
             it = new ImageTrans(container, options , obj1.width, obj1.height);
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
          //   $$("idReset").onclick = function(){ it.reset(); }          
     })()
</script> 			
	<div class="shuxing">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" valign="bottom">车种</td>
          <td height="20" valign="bottom">国家</td>
          <td height="20" valign="bottom">品牌</td>
          <td height="20" valign="bottom">子品牌</td>
          <td height="20" valign="bottom">年代</td>
          <td height="20" valign="bottom">内外饰</td>
          <td height="20" valign="bottom">局部</td>
          <td height="20" valign="bottom">角度</td>          
        </tr>
        <tr>
          <td height="20" valign="bottom"><%=picture1.getCarType()%></td>
          <td height="20" valign="bottom"><%=picture1.getCountry()%></td>
          <td height="20" valign="bottom"><%=picture1.getBand()%></td>
          <td height="20" valign="bottom"><%=picture1.getSubBand()%></td>
          <td height="20" valign="bottom"><%=picture1.getYear()%></td>
          <td height="20" valign="bottom"><%=picture1.getInterOunter()%></td>
        <%if("外饰".equals(picture1.getInterOunter())) {%>
      	  <td height="20" valign="bottom"><%=picture1.getOuter()%></td>	            	   
    	<% }%>
    	<%if("内饰".equals(picture1.getInterOunter())) {%>
      	 <td height="20" valign="bottom"><%=picture1.getInter()%></td>	            	   
    	<% }%>
          <td height="20" valign="bottom"><%=picture1.getAngle()%></td>
          
        </tr>
      </table>
	</div>
  </div>
  <div class="content_right">
    <div class="title">&gt;&gt;<b><%=picture2.getCarType() %>&nbsp;<%=picture2.getBand() %>&nbsp;<%=picture2.getSubBand() %>&nbsp;<%=picture2.getYear() %></b></div>
	<div style="overflow:hidden;height:485px;;position: relative;border: 1px solid #999999;width: 635px"> 
    	<div id="idContainer2" onmouseout='drag=0' onmouseover='dragObj=idContainer; drag=1;' class="dragAble" ></div>
    	<img id="hidImg2" src="<%=img2Path%>" style="visibility: hidden; height:auto; width:auto;"/>
    </div>
	<div class="btn"><span class="wrap">
 		<img src="<%=request.getContextPath()%>/images/big.gif" width="25" height="32" style="cursor: hand" id="big2"  title="放大" />
 		&nbsp;&nbsp;&nbsp;
		<img src="<%=request.getContextPath()%>/images/small.gif" width="25" height="32" style="cursor: hand"
                   id="small2"  title="缩小" /> 
        &nbsp;&nbsp;&nbsp;           
		<img src="<%=request.getContextPath()%>/images/turnright.gif" width="25" height="32" style="cursor: hand"
                   id="idLeft2"  title="逆时针旋转90度" /> 
        &nbsp;&nbsp;&nbsp;             		
		<img src="<%=request.getContextPath()%>/images/turnleft.gif" width="25" height="32" style="cursor: hand"
                   id="idRight2"  title="顺时针旋转90度" />
        &nbsp;&nbsp;&nbsp;          	    
		<img src="<%=request.getContextPath()%>/images/Vertical.gif" width="25" height="32" style="cursor: hand"
                   id="idVertical2"  title="垂直翻转" />	
        &nbsp;&nbsp;&nbsp;          
		<img src="<%=request.getContextPath()%>/images/Horizontal.gif" width="25" height="32" style="cursor: hand"
                   id="idHorizontal2"  title="水平翻转" />
        &nbsp;&nbsp;&nbsp;        	
 		<img src="<%=request.getContextPath()%>/images/resize.gif" width="25" height="32" style="cursor: hand"
                   id="Reset2"  title="还原" onclick="resize(<%=i%>,<%=j%>,<%=sessionTime %>)" />	   
      &nbsp;&nbsp;&nbsp;
	  <%if ( j > 0 && j < size-1 ) {%>
		   	<img src="<%=request.getContextPath()%>/images/pre.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="pic2pre(<%=i%>,<%=j%>,<%=sessionTime %>)" />
		   &nbsp;&nbsp;&nbsp;
		   	<img src="<%=request.getContextPath()%>/images/next.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="pic2next(<%=i%>,<%=j%>,<%=sessionTime %>)" />
	  <%} else if(j == 0){%>	  
		   	<img src="<%=request.getContextPath()%>/images/preunable.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="" />
		   	&nbsp;&nbsp;&nbsp;
		   	<img src="<%=request.getContextPath()%>/images/next.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="pic2next(<%=i%>,<%=j%>,<%=sessionTime %>)" />

	  <%}else{%>
		   	<img src="<%=request.getContextPath()%>/images/pre.gif" width="25" height="32" style="cursor: hand" id="pre"  title="上一张" onclick="pic2pre(<%=i%>,<%=j%>,<%=sessionTime %>)" />
		   	&nbsp;&nbsp;&nbsp;
		   	<img src="<%=request.getContextPath()%>/images/nextunable.gif" width="25" height="32" style="cursor: hand" id="next"  title="下一张" onclick="" />

	  <%} %>

	</span></div>
<script>
        (function(){
         	var obj2= $$("hidImg2");
            var container = $$("idContainer2"), src = "<%=img2Path%>",
                options = {
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
                },
                it = new ImageTrans(container, options , obj2.width, obj2.height);
                it.load(src);
                //垂直翻转
                $$("idVertical2").onclick = function(){ it.vertical(); }
                //水平翻转
                $$("idHorizontal2").onclick = function(){ it.horizontal(); }
                //左旋转
                $$("idLeft2").onclick = function(){ it.left(); }
                //右旋转
                $$("idRight2").onclick = function(){ it.right(); }
	           //放大
	           $$("big2").onclick = function(){ it.zoomin(); }
	           //缩小
	           $$("small2").onclick = function(){ it.zoomout(); }
	           //重置
              // $$("idReset2").onclick = function(){ it.reset(); }	           
        })()
</script>       	
	
	<div class="shuxing">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" valign="bottom">车种</td>
          <td height="20" valign="bottom">国家</td>
          <td height="20" valign="bottom">品牌</td>
          <td height="20" valign="bottom">子品牌</td>
          <td height="20" valign="bottom">年代</td>
          <td height="20" valign="bottom">内外饰</td>
          <td height="20" valign="bottom">局部</td>
          <td height="20" valign="bottom">角度</td>
        </tr>
        <tr>
          <td height="20" valign="bottom"><%=picture2.getCarType()%></td>        
          <td height="20" valign="bottom"><%=picture2.getCountry()%></td>
          <td height="20" valign="bottom"><%=picture2.getBand()%></td>
          <td height="20" valign="bottom"><%=picture2.getSubBand()%></td>
          <td height="20" valign="bottom"><%=picture2.getYear()%></td>
          <td height="20" valign="bottom"><%=picture2.getInterOunter()%></td>
        <%if("外饰".equals(picture2.getInterOunter())) {%>
      	  <td height="20" valign="bottom"><%=picture2.getOuter()%></td>	            	   
    	<% }%>
    	<%if("内饰".equals(picture2.getInterOunter())) {%>
      	 <td height="20" valign="bottom"><%=picture2.getInter()%></td>	            	   
    	<% }%>
          <td height="20" valign="bottom"><%=picture2.getAngle()%></td>

        </tr>
      </table>
	</div>
  </div>
</div>
<div class="footer">版权所有：&copy;　福田汽车</div>
</body>
<%} else {
%>

<script>
	alert("超时，请重新登录");
  	window.close();
</script>

<%
}%>
</html>
