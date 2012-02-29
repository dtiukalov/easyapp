
	/**
	*	jquery plugin
	*	name:saturnTablePaginate
	*	author:zhangyu
	*/
	
	function SaturnTablePaginate() {
		this.count = 20;			//总条数
		this.percount = 10;			//每页显示条数
		this.action = '';			//链接地址
		this.current = 1;			//当前页
		this.pageId = 'pageNum';	//分页框的ID
		this.form = '';				//分页关联的表单
		this.type = '';				//分页的类型
		this.el = '';				//是写json分页数据的标签的id,如果写上它，就会在刷新的时候保留当前页
	}
	
	$.extend(SaturnTablePaginate.prototype, {
		printCode:function(j){
			 j.addClass("clb-table-paginate-div");
			 var pCode = '';
			 var p = this.current;
			 var percount = parseInt(this.percount);
			 var count = parseInt(this.count);
			 var max = Math.ceil(count/percount);
			 var num = this.pageId;
			 var action = this.action;
			 var type = this.type;
			 var form = this.form;
			 var el = this.el;
			 var name = window.name.split('-');
			 //if(type == 'action'){
				//if(parseInt(name[1]) && !p && (!Saturn.pageName || Saturn.pageName == name[0])){
					//if(el){
						//$('#' + el).html("");
						//go(Math.min(parseInt(name[1]), max), max, action, percount, form, type);
					//}
			 	//} else if(!p){
					//if(el && $('#' + el).html() == ""){
						//go(1, max, action, percount, form, type);
					//}
				//}
			 //}
			 
			 p = parseInt(p);
			 if(isNaN(p)){
			 	p = 1;
			 }
			 if(p > 1){
			 	pCode += '<button class="clb-table-paginate-button" onclick="go(1 ,' + max +',\'' + action + '\', '+percount+',\''+form+'\',\''+type+'\')">首页</button> ';
			 	pCode += '<button class="clb-table-paginate-button" onclick="go('+(p - 1)+' ,' + max +',\'' + action + '\', '+percount+',\''+form+'\',\''+type+'\')">上一页</button> ';
			 } else {
				pCode += '<button class="clb-table-paginate-button-disabled" disabled>首页</button> ';
			 	pCode += '<button class="clb-table-paginate-button-disabled" disabled>上一页</button> ';
			 }
			 var printPaging = function(p, start, end){
				for(var i = start; i <= end; i++){
				  	if(p != i){	
				  		pCode += '<button class="clb-table-paginate-page" onclick="go('+ i +' ,' + max +',\'' + action + '\', '+percount+',\''+form+'\',\''+type+'\')">' + i + '</button> ';
				  	} else {
				  		pCode += '<button class="clb-table-paginate-current">' + i + '</button> ';
				  	}
				}
			 }
			 if(p >= 1 && p <= 6){
			 		printPaging(p, 1, Math.min(10, max));
			 }else if(p >= 7 && p <= max-5){
			 		printPaging(p, Math.max(1, p - 5), p + 4);
			 }else if(p >= max - 4 && p <= max){
			 		printPaging(p, Math.max(1, max - 9), max);
			 }
			 if(p < max){
			 	
			 	pCode += '<button class="clb-table-paginate-button" onclick="go('+(p + 1)+' ,' + max +',\'' + action + '\', '+percount+',\''+form+'\',\''+type+'\')">下一页</button> ';
			 	pCode += '<button class="clb-table-paginate-button" onclick="go('+max+' ,' + max +',\'' + action + '\', '+percount+',\''+form+'\',\''+type+'\')">尾页</button> ';
			 } else {
			 	pCode += '<button class="clb-table-paginate-button-disabled" disabled>下一页</button> ';
			 	pCode += '<button class="clb-table-paginate-button-disabled" disabled>尾页</button> ';
			 }
			 if(max > 1){
				 pCode += '<input class="clb-table-paginate-input" type="text" id="' + num + '" style="width:40px;text-align:center;height:15px;"';
				 pCode += 'onKeyUp="this.value=this.value.replace(/[^\\d]/g,\'\')"';
				 pCode += 'onKeyDown="if(event.keyCode==13){document.getElementById(\'go\').click();return false;} ;"/>&nbsp;';
				 pCode += '<span class="clb-table-paginate-text">' + '/'+ max + '</span>';
				 pCode += '<input class="clb-table-paginate-go" type="button" id="go" value="转到" onclick="go($(\'#' + num +'\')[0].value ,' + max +',\'' + action + '\', '+percount+',\''+form+'\',\''+type+'\')"/>';
			 }
			 
			 pCode += '<span class="clb-table-paginate-count">每页' + percount + '条/共' + count + '条数据</span>'
			 
			 if(max > 0){
			 	j.html(pCode);
			 }
		}
	});

	$.fn.saturnTablePaginate = function(options){
		 var ttp = new SaturnTablePaginate();
		 for( e in options){
			ttp[e] = options[e];
		 }
		 ttp.printCode(this);
	}
	var go = function(pageValue, max, action, percount, form, type){
		//window.name = Saturn.pageName + '-' + pageValue;
		if(pageValue >= 1 && pageValue <= max ){
		  	startIndex = percount * (pageValue - 1)  + 1;
			endIndex = percount * pageValue;	
			paging(startIndex, endIndex, action, pageValue, form , type);
		}else {
			$().saturnAlert({
				txt:"请输入范围内的页数！"
			});
 		}
	}
	
	var paging = function(startIndex, endIndex, action, pageValue, form , type){
		if(action.indexOf('?')==-1){
			action += '?';
		}else{
			action += '&';
		}
		
		//为了应对MYSQL分页机制，如果是oracle的话要把-1去掉
		if(form){
			var f;
			if(type == 'action'){
				f = $('#'+form + ' *');
				f.each(function(){
					if( ($(this).attr('type') != 'radio' && $(this).attr('type') != 'checkbox') || $(this)[0].checked ){
						action += '&'+$(this).attr('name')+'='+$(this).val(); 	
					}
				});
				action += '&startIndex=' + (startIndex-1) + '&endIndex=' + (endIndex-1) + '&pageValue=' + pageValue;
				Saturn.executeAction(action)
			} else {
				f = $('#'+form);
				f[0].action = action;
				if($('#' + form + ' input[name="startIndex"]').size() == 0){
					var si = $('<input type="hidden" name="startIndex" value="'+(startIndex-1)+'">');
					f.append(si);
				} else {
					$('#' + form + ' input[name="startIndex"]').val(startIndex-1);
				}
				if($('#' + form + ' input[name="endIndex"]').size() == 0){
					var ei = $('<input type="hidden" name="endIndex" value="'+(endIndex-1)+'">');
					f.append(ei);
				} else {
					$('#' + form + ' input[name="endIndex"]').val(endIndex-1);
				}
				var pv = $('<input type="hidden" name="pageValue" value="'+pageValue+'">');
				f.append(pv);
				f.submit();
			}
		} else {
			action += '&startIndex=' + (startIndex-1) + '&endIndex=' + (endIndex-1) + '&pageValue=' + pageValue;
			if(type == 'action'){
				Saturn.executeAction(action)
			} else {
				window.location = action;
			}
		}
	}