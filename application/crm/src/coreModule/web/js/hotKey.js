function quickKey(){}
$.extend(quickKey.prototype, {
    excute:function(rowClass) {
        var keys = { left: 37, up: 38, right: 39, down: 40, home: 36, end: 35 };
        rowClass = rowClass ? rowClass : '.rowClass';
        if (rowClass[0] != '.')
          rowClass = '.' + rowClass;
        $(rowClass).unbind('keyup',onkeyup).bind('keyup',onkeyup);

        function onkeyup(evt) {
           var ctrlOnly = evt.ctrlKey && !evt.altKey && !evt.shiftKey;
            switch (evt.keyCode) {
                case keys.down:
                 if (ctrlOnly)
                    go("down");
                    break;
                case keys.up:
                 if (ctrlOnly)
                    go("up");
                    break;
                case keys.left:
                    if (ctrlOnly)
                       go("left");
                    break;
                case keys.right:
                    if (ctrlOnly)
                       go("right");
                    break;
                case keys.home:
                   if (ctrlOnly)
                       go("home");
                    break;
                case keys.end:
                    if (ctrlOnly)
                        go("end");
                    break;
            }

            function go(to) {
                var td = $(evt.target).closest('td');
                var tr = $(evt.currentTarget);
                var toFocus = null;
                switch (to) {
                    case 'home':
                        toFocus = lastInput(td.prevAll('td'));
                        break;
                    case 'end':
                        toFocus = lastInput(td.nextAll('td'));
                        break;
                    case 'left':
                        toFocus = firstInput(td.prevAll('td'));
                        if (!toFocus)
                            toFocus = lastInput(tr.prev('tr' + rowClass).children('td'));
                        break;
                    case 'right':
                        toFocus = firstInput(td.nextAll('td'));
                        if (!toFocus)
                            toFocus = firstInput(tr.next('tr' + rowClass).children('td'));
                        break;
                    case 'up':
                        toFocus = firstInput(tr.prev('tr' + rowClass).children('td'), td.prevAll('td').size());
                        break;
                    case 'down':
                        toFocus = firstInput(tr.next('tr' + rowClass).children('td'), td.prevAll('td').size());
                        break;
                }
                if (toFocus) {
               	    $dp.hide();
                    toFocus.focus();
                    if($(toFocus).attr('type')=='text'){
                    	toFocus.select();
                    }	
                }
            }

            function firstInput(tds, start) {
                if (!start)
                    start = 0;
                for (var i = start; i < tds.size(); i++) {
                    var inputs = $(tds[i]).children('input:enabled:visible, select:enabled:visible, textarea:enabled:visible');
                    if (inputs.size())
                        return inputs[0];
                }
                return null;
            }

            function lastInput(tds){
                for (var i = tds.size() - 1; i >= 0; i--) {
                    var inputs = $(tds[i]).children('input:enabled, select:enabled, textarea:enabled');
                    if (inputs.size())
                        return inputs[0];
                }
                return null;
            }
        }
    }
});

$.fn.quickKey = function(options){
	var rs = new quickKey();
	rs.excute('.rowClass');
}

$(function(){
	document.onkeydown=function enterToTab(){ 
	if(event.srcElement.type != 'submit'&& event.srcElement.type != 'textarea' 
		&&event.srcElement.type != 'button'&& event.keyCode == 13) 
		event.keyCode = 9; 
		$dp.hide();
	} 
	$('tr').addClass("rowClass");
	$('man_zone').quickKey();
	$("input[type='submit'], input[type='button'], input[type='reset']").css('background-color','#ccc');
	$("input[type='submit'], input[type='button'], input[type='reset']").css('cursor','pointer');
})
