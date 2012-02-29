$(function(){
	if(parent.leftFrame!=null||parent.leftFrame!=undefined){
		var navHeight = parent.leftFrame.document.getElementById("main_nav").clientHeight - 10;
		$('#man_zone').css("height",navHeight);
		var fieldHeight = document.getElementById("formFiled").clientHeight;
		var dataHegiht = navHeight - fieldHeight - 29;;
		$('.tbDiv').css("height",dataHegiht);
		var dataDiv = dataHegiht - 50;
		$('#dataDiv').css("height",dataDiv);
	}else{
		var navHeight = 550;
		$('#man_zone').css("height",navHeight);
		var fieldHeight = document.getElementById("formFiled").clientHeight;
		var dataHegiht = navHeight - fieldHeight - 29;;
		$('.tbDiv').css("height",dataHegiht);
		var dataDiv = dataHegiht - 50;
		$('#dataDiv').css("height",dataDiv);
	}
	//data dblclick
	$("#dataTb tr").dblclick(function (){ 
		  window.location = $(this).find('.edit').find('a').attr("href");
	}); 
})