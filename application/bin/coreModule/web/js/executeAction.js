	if(!Saturn){
		var Saturn = {};
	}
	Saturn.executeAction = function(path){
		var head = document.getElementsByTagName('head')[0];
		var script = document.createElement('script');
		head.appendChild(script);
		script.setAttribute('src', path);
	}