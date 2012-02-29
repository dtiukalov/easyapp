(function ($) {
	$.fn.selectDict = function(options) { 
		var opt = {
			action:'/crm::/coreModule/action/GetDictWithHiddenFlag.action',
			type:'',
			id:'',
			value:''
		};
		var ops = $.extend(opt,options);
		$.post(saturnServerPath + ops.action, 
	       {type: ops.type},
	       function(json, textStatus){
		        var code = '<option value=""></option>';
	            var num = json.list.length;
	            for(i=0; i<num; i++){
	           		if(ops.value==json.list[i].code){
		           		 if(json.list[i].other!=null){
		           		 	code += '<option title="' + json.list[i].other + '" value="' + json.list[i].code +'" selected>'+json.list[i].value +'</option>';
		           		 }else{
		           		 	code += '<option value="' + json.list[i].code +'" selected>'+json.list[i].value +'</option>';
		           		 }
	           		}else{
	           			if(json.list[i].other!=null){
		           		 	code += '<option title="' + json.list[i].other + '" value="' + json.list[i].code +'">'+json.list[i].value +'</option>';
		           		 }else{
		           		 	code += '<option value="' + json.list[i].code +'">'+json.list[i].value +'</option>';
		           		 }
	           		}							       
	            }
	            $('#'+ops.id).html(code);
	       }, 
	       "json");
	}
})(jQuery);
