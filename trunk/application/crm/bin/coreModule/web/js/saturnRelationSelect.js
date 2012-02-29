	function SaturnRelationSelect() {
		this.urls = [saturnServerPath + '/crm::/coreModule/action/GetDict.action',saturnServerPath + '/crm::/coreModule/action/GetDict.action'];
		this.levels = ['level1','level2','level3'];
		this.json = {root:'list',key:'key',value:'value'};
		this.firstValue = [['','请选择'],['','请选择']];
		this.type = 'crm_carModel';
		this.defaultValue = ['','',''];
		this.onchange = [function(){}, function(){}, function(){}];
		this.type2 = '';
	}
	
	$.extend(SaturnRelationSelect.prototype, {	
		getUrl:function(url, type) {
			if(url.indexOf('?') <= 0) {
				url += '?'
			} else {
				url += '&'
			}
				
			return url + 'type=' + type + '&';
		},
		resetSelection:function(selection, value, text) {
			if (selection) {
				selection.attr("disabled", "disabled");  
				$("#" + selection.attr("id") + " option").remove(); 
				if(text != ''){
					selection.append("<option value='" + value + "'>" + text + "</option>");
				}
			}
		},
		execute:function() {			
			var addOption = function(selection, value, text) {
				selection.append("<option value='" + value + "'>" + text + "</option>");
			};
			
			var level3 = this.levels[2];
			
			var root = this.json.root;
			var key = this.json.key;
			var value = this.json.value;
			
			var level_1 = $("#" + this.levels[0]);  
			var level_2 = $("#"+ this.levels[1]);
			
			var type1 = this.type;
			var type2 = '';
			if(this.type2){
				type2 = this.type2;
			} else {
				type2 = this.type;
			}
			
			var onchange = this.onchange;
			
			var firstValue = this.firstValue;
			var defaultValue = this.defaultValue;	
			var resetSelection = this.resetSelection;
				
			var url1 = this.getUrl(this.urls[0], type1);
			if (this.urls[1]) {
				var url2 = this.getUrl(this.urls[1], type2);
			}
			
			this.resetSelection(level_2, firstValue[0][0], firstValue[0][1]);
			if (level3) {
				var level_3 = $("#"+ level3); 
				this.resetSelection(level_3, firstValue[1][0], firstValue[1][1]);
			}
				
			var level_1_change = function(change) { 
				resetSelection(level_2, firstValue[0][0], firstValue[0][1]);
				if (level3) {
					resetSelection(level_3, firstValue[1][0], firstValue[1][1]);
				}
				
				if (level_1.val() != ""){
					level_2.removeAttr("disabled"); 
				}
				Saturn.getLevel2 = function(msg) {
					var optionsStr = '';	
					$.each(msg[root], function(index, data) {
						if(msg.key == data[key]){
							optionsStr += "<option value='"+data[key]+"' selected>"+data[value]+"</option>";
						} else {
							optionsStr += "<option value='"+data[key]+"'>"+data[value]+"</option>";
						}
					});
					$('#' + msg.id).append(optionsStr);
					$('#' + msg.id).removeAttr("disabled");
					if(change && onchange[0]){
						onchange[0].call(this, level_1[0])
					}
					Saturn.getLevel3_2 = function(msg) {
						if(msg.id){
							var optionsStr = '';
							$.each(msg[root], function(index,data){	
								if(msg.key == data[key]){
									optionsStr += "<option value='"+data[key]+"' selected>"+data[value]+"</option>";
								} else {
									optionsStr += "<option value='"+data[key]+"'>"+data[value]+"</option>";
								}
							});	
							$('#' + msg.id).append(optionsStr);
							
							$('#' + msg.id).removeAttr("disabled"); 
						}
					}
					if ($('#' + msg.id).val() && msg.level_3_id){
						Saturn.executeAction(unescape(msg.level_3_url) + "execute=getLevel3_2&level=2&value=" + $('#' + msg.id).val() + "&id=" + msg.level_3_id + "&key=" + msg.level_3_key);
					}
				}
				if (level_1.val() != ""){
					if(level_3){
						Saturn.executeAction(url1 + "execute=getLevel2&level=1&value=" + level_1.val() + "&id=" + level_2.attr('id') + "&key=" + defaultValue[1] + '&level_3_id=' + level_3.attr('id') + '&level_3_url=' + escape(url2) + '&level_3_key=' + defaultValue[2]);	
					} else {
						Saturn.executeAction(url1 + "execute=getLevel2&level=1&value=" + level_1.val() + "&id=" + level_2.attr('id') + "&key=" + defaultValue[1]);
					}
				}
			};
				
			var level_2_change = function(change){
				if(level_3){
					resetSelection(level_3, firstValue[1][0], firstValue[1][1]);
					if (level_2.val() != ""){
						level_3.removeAttr("disabled"); 
					}
				} 
				Saturn.getLevel3 = function(msg) {
					if(level_3){
						var optionsStr = '';
						$.each(msg[root], function(index,data){	
							if(defaultValue[2] == data[key]){
								optionsStr += "<option value='"+data[key]+"' selected>"+data[value]+"</option>";
							} else {
								optionsStr += "<option value='"+data[key]+"'>"+data[value]+"</option>";
							}
						});	
						$('#' + msg.id).append(optionsStr);
					}
		
					if(change && onchange[1]){
						onchange[1].call(this, level_2[0])
					}
				
				}
				if (level_2.val()){
					if(level_3){
						Saturn.executeAction(url2 + "execute=getLevel3&level=2&value=" + level_2.val() + "&id=" + level_3.attr('id') + "&key=" + defaultValue[2]);
					} else {
						Saturn.executeAction(url2 + "execute=getLevel3");
					}
				}
			}
			level_1.change(function(){level_1_change.call(this, true)}); 
			if(level3){
				level_2.change(function(){level_2_change.call(this, true)});
				level_3.change(function(){onchange[2].call(this, level_3[0])});
			} else {
				level_2.change(function(){level_2_change.call(this, true)});
			}
			if (defaultValue[0]) {
				level_1.val(defaultValue[0]);
				level_1_change(false);
				
				if (defaultValue[1]) {
					level_2_change(false);
				}
			}
		}
	});

 	$.fn.saturnRelationSelect = function(options){
		var rs = new SaturnRelationSelect();
		for(e in options){
			rs[e] = options[e];	
		}
		rs.execute();
	}