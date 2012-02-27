drag = 0 
move = 0

// 拖拽对象 
// 参见：http://blog.sina.com.cn/u/4702ecbe010007pe 
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

