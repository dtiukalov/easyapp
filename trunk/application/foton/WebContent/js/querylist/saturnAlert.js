	function SaturnAlert(){
		this.type = "alert";
		this.txt = "";
		this.height = "45%";
		this.form = "";
		this.action = "";
		this.func = "";
	}
	$.extend(SaturnAlert.prototype, {
		execute:function() {
			$("select").hide();		
			var type = this.type;
			var txt = this.txt;
			var height = this.height;
			var form = this.form;
			var action = this.action;
			var func = this.func;
			var shield = document.createElement("DIV");
			shield.id = "shield";
			shield.style.position = "absolute";
			shield.style.left = "0px";
			shield.style.top = "0px";
			shield.style.width = ((document.documentElement.clientWidth>document.documentElement.scrollWidth)?document.documentElement.clientWidth:document.documentElement.scrollWidth) - 8 +"px";
			shield.style.height = ((document.documentElement.clientHeight>document.documentElement.scrollHeight)?document.documentElement.clientHeight:document.documentElement.scrollHeight)+"px";
			shield.style.background = "#000";
			shield.style.textAlign = "center";
			shield.style.zIndex = "10000";
			shield.style.filter = "alpha(opacity=0)";
			shield.style.opacity = 0;
			shield.style.padding = '4px';
			var alertFram = document.createElement("DIV");
			alertFram.id="alertFram";
			alertFram.style.position = "absolute";
			alertFram.style.left = "50%";
			alertFram.style.top = height;
			alertFram.style.marginLeft = "-200px" ;
			alertFram.style.marginTop = -75+document.documentElement.scrollTop+"px";
			alertFram.style.width = "400px";
			alertFram.style.height = "120px";
			alertFram.style.background = "#000";
			alertFram.style.textAlign = "center";
			alertFram.style.lineHeight = "150px";
			alertFram.style.zIndex = "20001";
			strHtml   = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
			strHtml += " <li style=\"background:#red;text-align:left;font-size:14px;font-weight:bold;line-height:23px;border:1px solid #999999;color:#fff;\"><div style='margin:0px;background:#0F669C;padding-left:20px;'>系统提示</div></li>\n";
			strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #999999;border-right:1px solid #999999;\">"+txt+"</li>\n";
			if(type == "alert"){
				strHtml += " <li style=\"background:#fff;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #999999;border-top:0px;padding-bottom:10px;\"><input type=\"button\" value=\"确 定\" id=\"do_OK\" class= \"alert-button\" onclick=\"doOk()\" /></li>\n";
			}else if(type == "confirm"){
				strHtml += " <li style=\"background:#fff;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #999999;border-top:0px;padding-bottom:10px;\"><input type=\"button\" value=\"确 定\" id=\"do_OK\" class= \"alert-button\" onclick=\"doOk()\" />"
				strHtml += "<input type=\"button\" value=\"取 消\" id=\"do_Close\" class= \"alert-button\" style=\"margin-left:60px\" onclick=\"doClose()\" /></li>\n";
			}	
			strHtml += "</ul>\n";
			alertFram.innerHTML = strHtml;
			document.body.appendChild(alertFram);
			document.body.appendChild(shield);
		
			setOpacity = function(obj,opacity){
				if(opacity>=1)opacity=opacity/100;
				try{ obj.style.opacity=opacity; }catch(e){}
				try{ 
				if(obj.filters.length>0&&obj.filters("alpha")){
				obj.filters("alpha").opacity=opacity*100;
				}else{
				obj.style.filter="alpha(opacity=\""+(opacity*100)+"\")";
				}
				}catch(e){}
			}
			var c = 0;
			doAlpha = function(){
				if (++c > 20){clearInterval(ad);return 0;}
				setOpacity(shield,c);
			}
			var ad = setInterval("doAlpha()",1);
			doOk = function(){
				$("select").show();	
				document.body.removeChild(alertFram);
				document.body.removeChild(shield);
				document.body.onselectstart = function(){return true;}
				document.body.oncontextmenu = function(){return true;}
				if(action == "" && func == ""){
				}else if (action == "" && func != "") {
					func.call(this);		
				}else if(action == "back"){
					window.history.back();
				}else{
					if(form == ""){
						window.location = action;
					}else{
						document.getElementById(form).action=action;
						document.getElementById(form).submit();
					}
				}
			}
			doClose = function(){
				$("select").show();	
				document.body.removeChild(alertFram);
				document.body.removeChild(shield);
				document.body.onselectstart = function(){return true;}
				document.body.oncontextmenu = function(){return true;}
			}
			document.getElementById("do_OK").focus();
		
			document.body.onselectstart = function(){return false;}
			document.body.oncontextmenu = function(){return false;}
		}
	});
	$.fn.saturnAlert = function(options){
		var ta = new SaturnAlert();
		for(e in options){
			ta[e] = options[e];	
		}
		ta.execute();
	}
	