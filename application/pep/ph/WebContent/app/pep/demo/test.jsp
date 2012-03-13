<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>JS+CSSå¤é£æ ¼èªç±æå¨çå¾å±ä¸¨è¯æ´ç½é¡µç¹æä¸¨CsrCode.Cn</title>
<style>
body { 
 background: #667788;
 font-family: tahoma;
 font-size: 16px;
 padding: 0;
 margin: 0;
 overflow: hidden;
 background:#669900;
}

h1 {
 font-size: 140%;
}
#window1 { 
 top: 50px;
 left: 50px;
 width: 400px;
 height: 300px;
}
#window2 { 
 top: 270px;
 left: 250px;
 width: 400px;
 height: 300px;
}
#window3 { 
 top: 150px;
 left: 400px;
 width: 300px;
 height: 300px;
}
#window4 { 
 top: 200px;
 right: 100px;
 width: 400px;
 height: 350px;
}
/* www.codefans.net */
#window1 .border {
 border-color: #F8E0C0;
}
#window1 .glass {
 background: #F8E0C0; 
}

#window2 .border {
 border-color: #E0F8C0;
}
#window2 .glass {
 background: #E0F8C0; 
}

#window3 .border {
 border-color: #E0F0F8;
}
#window3 .glass {
 background: #E0F0F8; 
}

.window {
 position: absolute;
}
.shadow {
  position: absolute;
  top: -2px;
  left: -2px;
  width: 100%;
  height: 100%;
  background-color: #4F7500;
 }
.glass {
 position: absolute;
 top: 0px;
 left: 0px;
 width: 100%;
 height: 100%;
 background-color: #4F7500; 
 }
.border {
 position: absolute;
 top: 0px;
 left: 0px;
 width: 100%;
 height: 100%;
 border: 1px solid #F0F0F0;
 padding: 80px 10px 10p 10px;
}
.content {
 height: 100%;
 width: 100%;
 overflow: auto;
 background: white;
 padding: 0.5em;
 cursor: default;
 filter: alpha(opacity=60);
}
.title {
 color: white;
 font-weight: bold;
 font-size: 20px;
 position: absolute;
 top: 0px;
 left: 0px;
 width: 100%;
 height: 80px;
 padding: 25px 20px;
 cursor: move;
}
.current .shadow {
 top: 1px;
 left: 1px;
}
.current .content {
 filter: none;
}
.current .title {
 z-index: 1;
}

#menu { 
 position: absolute; 
 border: 1px solid rgb(182, 184, 196); 
 padding: 1px 2px; 
 background: #f4f4f5;
 font-family: trebuchet ms; 
 font-size: 9pt; 
}
#menu a { 
 display: block; 
 width: 200px; 
 color: black; 
 text-decoration: none; 
 height: 18px; 
 cursor: default;
}
#menu a i { 
 display: block; float: left;
 position:relative; 
 height: 14px; width: 26px;
 background: #ececed;
 border-left: 1px solid #ffffff; 
 border-right: 1px solid #e0e0e1;
 margin-left: -2px; 
 margin-right: -3px;
 padding: 2px 0px;
}
#menu a span { 
 display: block; 
 position:relative; 
 height: 14px; 
 background: #f4f4f5;
 border-left: 1px solid #ffffff;
 border-right: 1px solid #ffffff;
 padding: 2px 3px;
 margin-right: -2px;
}
.current #menu a:hover { 
 border: 1px solid; border-color: rgb(158, 215, 240) #ffffff; 
 padding: 0px;
}
.current #menu a:hover i { 
 border: 1px solid; 
 border-color: #ececed #e0e0e1 #d8e0f0 rgb(158, 215, 240); 
 filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#ffe2eaf2, endColorstr=#ffd8e0f0);
 padding: 0px;
 width: 25px;
}
.current #menu a:hover span { 
 border: 1px solid; 
 border-color: #f4f4f5 rgb(158, 215, 240) #e8f2f8 #e8f2f8; 
 filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#ffeef2f8, endColorstr=#ffddedf8);
 padding: 0px 3px;
}
</style>
<script>
var current = null;
var dragging = false;
var startedDragging = false;
function setCurrent(w){
 if (w != current)
 {
 
 if (current)
 current.className = 'window';
 // set current
 current = w;
 current.className = 'current window';
 document.getElementById("windows").appendChild(current);
 }

 // init drag
 var offsetX = event.x - parseInt(w.currentStyle.left);
 var offsetY = event.y - parseInt(w.currentStyle.top);
 if (offsetY < 80)
 {
 dragging = true;
 dragEffect = function()
 {
 w.style.pixelLeft = event.x - offsetX;
 w.style.pixelTop = event.y - offsetY;
 }
 } 
 else 
 {
 var width = parseInt(w.currentStyle.width);
 var resizeX = offsetX > width - 10;
 var height = parseInt(w.currentStyle.height);
 var resizeY = offsetY > height - 10;
 if (resizeX || resizeY)
 {
 dragging = true;
 var offsetX = event.x - width;
 var offsetY = event.y - height;

 dragEffect = function()
 {
 if (resizeX)
 w.style.pixelWidth = event.x - offsetX;
 if (resizeY)
 w.style.pixelHeight = event.y - offsetY;
 }
 }
 } 
}

function calcResize(w)
{
 var offsetX = event.x - parseInt(w.currentStyle.left);
 var offsetY = event.y - parseInt(w.currentStyle.top);
 var width = parseInt(w.currentStyle.width);
 var resizeX = offsetX > width - 10;
 var height = parseInt(w.currentStyle.height);
 var resizeY = offsetY > height - 10;
 w.style.cursor = (resizeX||resizeY)?(resizeY?"S":"")+(resizeX?"E":"")+"-resize":"default";
}

var dragEffect;
function moveCurrent()
{
 if (!dragging || !current)
 return;
 
 if (event.button == 0)
 {
 releaseCurrent();
 return;
 }
 
 if (!startedDragging)
 {
 current.className = 'dragging current window';
 startedDragging = true;
 }
 
 dragEffect();
}

function releaseCurrent()
{
 if (!current)
 return;
 
 current.className = 'current window';
 dragging = false;
 startedDragging = false;
}

function makeUnselectable(e)
{
 e.unselectable=true;
 if (e.className == 'content')
 return;
 
 for (var c=e.firstChild;c;c=c.nextSibling)
 if (c.nodeType == 1)
 makeUnselectable(c);
}
</script>
</head>
<body onload="makeUnselectable(document.body);setCurrent(window1)" onmouseup="releaseCurrent()" onmousemove="moveCurrent()">
<div id="windows">
<div class="window" id="window1" onmousedown="setCurrent(this)" onmousemove="calcResize(this)">
	<div class="shadow"></div>
	<div class="title">CsrCode.Cn</div>
	<div class="glass"></div>
	<div class="border">
		<div class="content">
		<h1>Windows Longhorn Glass Look</h1>
		<p>pppppp</p>
		<p>Looks horrible in any browser but Internet Explorer.</p>
		</div>
	</div>
</div>
<div class="window" id="window3" onmousedown="setCurrent(this)" onmousemove="calcResize(this)">
 <div class="shadow"></div>
 <div class="title">èè²ççªå£</div>
 <div class="glass"></div>
 <div class="border">
 <div class="content"><p align="center">æ¬ç¹æç± <a href="http://www.CsrCode.cn">è¯æ´ç½é¡µç¹æ</a>ä¸¨CsrCode.Cn æ¶éäºäºèç½ï¼åªä¸ºå´è¶£ä¸å­¦ä¹ äº¤æµï¼ä¸ä½åä¸ç¨éã</p>
 </div>
 </div>
</div>
<div class="window" id="window4" onmousedown="setCurrent(this)" onmousemove="calcResize(this)">
 <div class="shadow"></div>
 <div class="title">Longhorn èå</div>
 <div class="glass"></div>
 <div class="border">
 <div class="content">
 <div id="menu">
 <a href="http://www.CsrCode.cn/"><i></i><span>ç½é¡µç¹æ</span></a>
 <a href="http://www.33567.cn/"><i></i><span>ççå½±è§</span></a>
 <a href="http://Links.CsrCode.Cn/"><i></i><span>é¾æ¥å¹³å°</span></a>
 <a href="http://www.7caidy.com/"><i></i><span>ä¸å½©å½±è§</span></a>
 </div>
 </div>
 </div>
</div>
<div class="window" id="window2" onmousedown="setCurrent(this)" onmousemove="calcResize(this)">
 <div class="shadow"></div>
 <div class="title">ç»¿è²çªå£</div>
 <div class="glass"></div>
 <div class="border">
 <div class="content">
 </div>
 </div>
</div>
</div>
</body>
</html>