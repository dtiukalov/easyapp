$(function(){
	// select helper
	SelectHelper = new function() {
		// 初始化
		this.init = function() {
			document.attachEvent("onkeypress", function() {
				var elm = event.srcElement;
				if(elm.tagName == "SELECT"
				&& elm.className.indexOf("SelectHelper") == -1) {
					elm.className += "SelectHelper";
					elm.attachEvent("onkeypress", SelectHelper.getNextKeyItem);
					elm.fireEvent("onkeypress", event);
				}
			});
		}
	// 获取选项文本的首字符
	function getItemKeyChar(option) {
		return $(option).attr("title").toUpperCase();
	}
	// 查找并选中匹配的选项
	this.getNextKeyItem = function() {
		var elm = event.srcElement;
		var index = elm.selectedIndex + 1;
		do {
			if (index == elm.length) index = 0;
			if (index == elm.selectedIndex) return false; // 未找到匹配的选项，则退出
		} while (key2Char(event.keyCode) != getItemKeyChar(elm.options[index++]));
			elm.selectedIndex = index - 1; // 选中匹配的选项
			return false; // 取消原有的选择功能
		}
	};
	
	/**
	* 返回键盘事件对应的字母或数字
	* a-z: 97 -> 122
	* A-Z: 65 -> 90
	* 0-9: 48 -> 57
	*/
	function key2Char(key) {
		var s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		if (key >= 97 && key <= 122) return s.charAt(key - 97);
		if (key >= 65 && key <= 90) return s.charAt(key - 65);
		if (key >= 48 && key <= 57) return "" + (key - 48);
		return null;
	}
	
	SelectHelper.init();
})