$(function(){
	if(parent.leftFrame!=null||parent.leftFrame!=undefined){
		var navHeight = parent.leftFrame.document.getElementById("main_nav").clientHeight - 10;
		$('#man_zone').css("height",navHeight);
	}
})