// JavaScript Document
$(function(){	
	$("#dataTb tr:odd").addClass("odd"); 
	$('tbody tr').click(
	   function() {
		$(this).siblings().removeClass('selected');
		$(this).addClass('selected');
	   }
	);
})