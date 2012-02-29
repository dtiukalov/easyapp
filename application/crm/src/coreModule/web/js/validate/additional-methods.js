$.fn.saturnValidate = function(options){
	this.validate({
			errorElement: options.errorElement?options.errorElement:"label",
			//success: options.success?options.success:function(label) {
			//	label.text(" ").addClass("success");
			//},
			submitHandler: options.submitHandler?options.submitHandler:function(form){ 
		           form.submit();
		    },
			rules: options.rules,
			messages: options.messages
	})
};
		
		
jQuery.validator.addMethod("maxWords", function(value, element, params) { 
    return this.optional(element) || value.match(/\b\w+\b/g).length < params; 
}, $.format("Please enter {0} words or less.")); 
 
jQuery.validator.addMethod("minWords", function(value, element, params) { 
    return this.optional(element) || value.match(/\b\w+\b/g).length >= params; 
}, $.format("Please enter at least {0} words.")); 
 
jQuery.validator.addMethod("rangeWords", function(value, element, params) { 
    return this.optional(element) || value.match(/\b\w+\b/g).length >= params[0] && value.match(/bw+b/g).length < params[1]; 
}, $.format("Please enter between {0} and {1} words."));


jQuery.validator.addMethod("letterswithbasicpunc", function(value, element) {
	return this.optional(element) || /^[a-z-.,()'\"\s]+$/i.test(value);
}, "Letters or punctuation only please");  

jQuery.validator.addMethod("alphanumeric", function(value, element) {
	return this.optional(element) || /^\w+$/i.test(value);
}, "Letters, numbers, spaces or underscores only please");  

jQuery.validator.addMethod("lettersonly", function(value, element) {
	return this.optional(element) || /^[a-z]+$/i.test(value);
}, "Letters only please"); 

jQuery.validator.addMethod("nowhitespace", function(value, element) {
	return this.optional(element) || /^\S+$/i.test(value);
}, "No white space please"); 

jQuery.validator.addMethod("ziprange", function(value, element) {
	return this.optional(element) || /^90[2-5]\d\{2}-\d{4}$/.test(value);
}, "Your ZIP-code must be in the range 902xx-xxxx to 905-xx-xxxx");

/**
* Return true, if the value is a valid vehicle identification number (VIN).
*
* Works with all kind of text inputs.
*
* @example <input type="text" size="20" name="VehicleID" class="{required:true,vinUS:true}" />
* @desc Declares a required input element whose value must be a valid vehicle identification number.
*
* @name jQuery.validator.methods.vinUS
* @type Boolean
* @cat Plugins/Validate/Methods
*/ 
jQuery.validator.addMethod(
	"vinUS",
	function(v){
		if (v.length != 17){
			return false;
		}
		if(/^\d*$/.test(v)){
			return false;
		}
		
		if(/^\d*A*$/.test(v)){
			return false;
		}
		
		var i, n, d, f, cd, cdv;
		var LL    = ["A","B","C","D","E","F","G","H","J","K","L","M","N","P","R","S","T","U","V","W","X","Y","Z"];
		var VL    = [1,2,3,4,5,6,7,8,1,2,3,4,5,7,9,2,3,4,5,6,7,8,9];
		var FL    = [8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2];
		var rs    = 0;
		for(i = 0; i < 17; i++){
		    f = FL[i];
		    d = v.slice(i,i+1);
		    if(i == 8){
		        cdv = d;
		    }
		    if(!isNaN(d)){
		        d *= f;
		    }
		    else{
		        for(n = 0; n < LL.length; n++){
		            if(d.toUpperCase() === LL[n]){
		                d = VL[n];
		                d *= f;
		                if(isNaN(cdv) && n == 8){
		                    cdv = LL[n];
		                }
		                break;
		            }
		        }
		    }
		    rs += d;
		}
		cd = rs % 11;
		if(cd == 10){cd = "X";}
		if(cd == cdv){return true;}
		return false; 
	},
	"VIN码错误"
);

/**
  * Return true, if the value is a valid date, also making this formal check dd/mm/yyyy.
  *
  * @example jQuery.validator.methods.date("01/01/1900")
  * @result true
  *
  * @example jQuery.validator.methods.date("01/13/1990")
  * @result false
  *
  * @example jQuery.validator.methods.date("01.01.1900")
  * @result false
  *
  * @example <input name="pippo" class="{dateITA:true}" />
  * @desc Declares an optional input element whose value must be a valid date.
  *
  * @name jQuery.validator.methods.dateITA
  * @type Boolean
  * @cat Plugins/Validate/Methods
  */
jQuery.validator.addMethod(
	"dateITA",
	function(value, element) {
		var check = false;
		var re = /^\d{1,2}\/\d{1,2}\/\d{4}$/
		if( re.test(value)){
			var adata = value.split('/');
			var gg = parseInt(adata[0],10);
			var mm = parseInt(adata[1],10);
			var aaaa = parseInt(adata[2],10);
			var xdata = new Date(aaaa,mm-1,gg);
			if ( ( xdata.getFullYear() == aaaa ) && ( xdata.getMonth () == mm - 1 ) && ( xdata.getDate() == gg ) )
				check = true;
			else
				check = false;
		} else
			check = false;
		return this.optional(element) || check;
	}, 
	"Please enter a correct date"
);

/**
 * matches US phone number format 
 * 
 * where the area code may not start with 1 and the prefix may not start with 1 
 * allows '-' or ' ' as a separator and allows parens around area code 
 * some people may want to put a '1' in front of their number 
 * 
 * 1(212)-999-2345
 * or
 * 212 999 2344
 * or
 * 212-999-0983
 * 
 * but not
 * 111-123-5434
 * and not
 * 212 123 4567
 */
jQuery.validator.addMethod("phone", function(phone_number, element) {
    phone_number = phone_number.replace(/\s+/g, ""); 
	return this.optional(element) || phone_number.length > 9 &&
		phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
}, "Please specify a valid phone number");

// TODO check if value starts with <, otherwise don't try stripping anything
jQuery.validator.addMethod("strippedminlength", function(value, element, param) {
	return jQuery(value).text().length >= param;
}, jQuery.format("Please enter at least {0} characters"));

// same as email, but TLD is optional
jQuery.validator.addMethod("email", function(value, element, param) {
	return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)*(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(value); 
	//return this.optional(element) || /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/i.test(value);
}, jQuery.validator.messages.email);

// same as url, but TLD is optional
jQuery.validator.addMethod("url2", function(value, element, param) {
	return this.optional(element) || /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)*(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(value); 
}, jQuery.validator.messages.url);

// 中文字两个字节   
jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {   
  var length = value.length;   
  for(var i = 0; i < value.length; i++){   
   if(value.charCodeAt(i) > 127){   
    length++;   
   }   
  }   
  return this.optional(element) || ( length >= param[0] && length <= param[1] );   
}, jQuery.validator.messages.byteRangeLength);   
  
/* 追加自定义验证方法 */   
// 身份证号码验证   
jQuery.validator.addMethod("isIdCardNo", function(value, element) {   
  return this.optional(element) || isIdCardNo(value);   
}, "请正确输入您的身份证号码");   
  
// 字符验证   
jQuery.validator.addMethod("userName", function(value, element) {  
  return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);   
}, "只能输入中文、英文字母、数字和下划线");   
  
// 手机号码验证   
jQuery.validator.addMethod("isMobile", function(value, element) {   
  var length = value.length;   
  return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));   
}, "请正确填写您的手机号码");   
  
// 电话号码验证   
jQuery.validator.addMethod("isPhone", function(value, element) {   
  var tel = /^((((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/;   
  var tel400 = /^400\d{7}$/;
  return this.optional(element) || (tel.test(value) || tel400.test(value));   
}, "支持手机号或(区号-)座机号!");   
  
// 邮政编码验证   
jQuery.validator.addMethod("isZipCode", function(value, element) {   
  var tel = /^[0-9]{6}$/;   
  return this.optional(element) || (tel.test(value));   
}, "请正确填写您的邮政编码");  

jQuery.validator.addMethod("ip", function(value, element) {   
  return this.optional(element) || (/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/.test(value) && (RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256));   
}, "请输入合法的IP信息");  

jQuery.validator.addMethod("startTime", function(value, element, param) {   
  return this.optional(element) ||  value >= $(param).val()   
}, "开始时间不能大于结束时间"); 

jQuery.validator.addMethod("endTime", function(value, element, param) {   
  return this.optional(element) ||  value <= $(param).val()   
}, "不能大于大于所比较时间"); 

jQuery.validator.addMethod("date", function(value, element, param) {   
  return this.optional(element) ||  /^(194[9]|19[5-9]{1}[0-9]{1}|20[0-4]{1}[0-9]{1})-(0[123456789]|1[012])$/.test(value); 
}, "日期格式不正确"); 

jQuery.validator.addMethod("gt", function(value, element, param) {  
 	if (value == null || value == ''){
		return this.optional(element) || true;
	} else if (!isNaN(param)){
		return this.optional(element) || Number(value) > Number(param)
	}else {
		return this.optional(element) || (!isNaN(value)&&!isNaN($(param).val())&&Number(value) > Number($(param).val()))
	}
}, "数字没有所比较的对象大"); 

jQuery.validator.addMethod("lt", function(value, element, param) {   
  	 	if (value == null || value == ''){
	 		return this.optional(element) || true;
	 	} else if (!isNaN(param)){
	 		return this.optional(element) || Number(value) < Number(param)
		} else {
		 	return this.optional(element) || (!isNaN(value)&&!isNaN($(param).val())&&Number(value) < Number($(param).val()))
		}
}, "数字没有所比较的对象小"); 

jQuery.validator.addMethod("equal", function(value, element, param) {   
	return this.optional(element) ||value == param;
}, "输入错误"); 

jQuery.validator.addMethod("notEqual", function(value, element, param) {   
	return this.optional(element) ||value != param;
}, "输入错误"); 

jQuery.validator.addMethod("notBothNull", function(value, element, param) { 
	return  $(param).val().length > 0 || value.length > 0;
}, "不可两项同时为空"); 

jQuery.validator.addMethod("alphaNumber", function(value, element, param) { 
	return  /^[a-zA-Z0-9]*$/.test(value);
}, "只能输入英文字母和数字"); 

jQuery.validator.addMethod("english", function(value, element, param) { 
	return  /^[a-zA-Z]*$/.test(value);
}, "只能输入英文字母"); 

jQuery.validator.addMethod("decNumber", function(value, element, param) { 
	return  /^-?\d+(\.\d{1,1})?$/.test(value);
}, "只能输一位小数");

jQuery.validator.addMethod("noSpace", function(value, element, param) { 
	return  !/\s/.test(value)
}, "不能含有空格");

jQuery.validator.addMethod("sureprice", function(value, element, param) { 
	return  this.optional(element) ||

/^-?\d+(\.\d{1,1})?$/.test(value);
}, "精确到小数点后一位");


jQuery.validator.addMethod("numberplates", function(value, element, param) { 
	return  this.optional(element) ||/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼台澳港]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂]{1}$/.test(value);
}, "请输入正确的车牌号");


jQuery.validator.addMethod("passwordRangelength", function(value, element, param) { 
	return  value.length >= param[0] && value.length <= param[1];
}, $.format("密码长度必须在{0}到{1}位"));

jQuery.validator.addMethod("chinese",function(value,element,param){
	return this.optional(element) || /^[\u4e00-\u9fa5]{1,15}$/.test(value);
	},"请输入汉字,最大长度为15");      
	
jQuery.validator.addMethod("email2",function(value,element,param){
	if (value != null && value != ""){
		if(value.substring(value.indexOf("@")-1,value.indexOf("@")) != "."){
			return /^(([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.(cn|com|net|org|com.cn|net.cn|org.cn|gov)){1}){0,1}$/.test(value);
		}
	} else {
		return false;
	}
},"请输入正确的email地址");

jQuery.validator.addMethod("isNumber",function(value,element,param){
	if(value!=""){
		if (value.substring(0,1) != '0' ) {
			return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
		} else if (value.substring(1,2) == '.') {
			return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
		} else if(value.substring(1,2) == ''){
			return true;
		} else {
			return false;
		}
	}else{
		return true;
	}
},"请输入正确的数字");

//传真号码校验
jQuery.validator.addMethod("isFax",function(value,element){
	var fax = /^((((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/;   
    return this.optional(element) || (fax.test(value));  
	//return /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/.test(value);
},"请输入正确的传真号码");

jQuery.validator.addMethod("cmsPath", function(value, element) {  
  return this.optional(element) || /^[\u0391-\uFFE5\w\/\.]+$/.test(value);   
}, "链接只能包括中文、英文字母、数字、下划线、\"/\"和\".\"");   

jQuery.validator.addMethod("lastNot", function(value, element, param) {  
	var result = true;
	for(var i = 0; i < param.length; i++){
		if(param[i] == value.charAt(value.length - 1)){
			result = false;
		}
	}
  return this.optional(element) ||  result;   
}, "最后一位字符不正确");  

jQuery.validator.addMethod("checkUnique",function(value,element,param){ 
	var result = false;
	$.post("/server/crm::/coreModule/action/CheckUnique.action", 
	       {fullkey:param,
	        carvin: value},
	       function(json, textStatus){
	         result = json.result;
	         alert(result);
	         return this.optional(element) ||  result; 
	       }, 
	       "json");
    //return this.optional(element) ||  result;   
},"已经存在此VIN码"); 