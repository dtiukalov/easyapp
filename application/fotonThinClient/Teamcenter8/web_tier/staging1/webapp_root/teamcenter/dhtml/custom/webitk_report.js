//////////////////////////一个报表一个函数/////////////////////
function F6_Product_REPORTDialog(context) {
	var browserName = getBrowserName();

	if (browserName == "IE") {
		form = F6_Product_REPORT.XMLDocument.documentElement;//TODO:和formemplates_custom.xml中的xml id一致
	} else if (browserName == "Netscape") {
		form = getFormByName(getString("web_foton_bom_title"));//TODO:和formemplates_custom.xml中的form name=一致
	}

	popupFotonReportDialog(context, "webclient?TC_file=common/actions/webitk_report.xml&_webitk_code=101", form);//TODO:修改_webitk_code对应值
}


function F6_Product_REPORTDialog22(context) {
	var browserName = getBrowserName();

	if (browserName == "IE") {
		form = F6_Product_REPORT22.XMLDocument.documentElement;//TODO:和formemplates_custom.xml中的xml id一致
	} else if (browserName == "Netscape") {
		form = getFormByName(getString("web_foton_bom_title"));//TODO:和formemplates_custom.xml中的form name=一致
	}
	
	popupFotonReportDialog(context, "webclient?TC_file=common/actions/webitk_report.xml&_webitk_code=102", form);//TODO:修改_webitk_code对应值
}


//////////////////////////////don't change///////////////////////////////

var globalReportDemoDialog = null;
function popupFotonReportDialog(context, request, form) {
	////////////如果不需要选中对象，注释以下代码//////////////////
 	/*var sel = selection();
    if( sel.length <=0 ) {        
	    alertString( 63093 );// Nothing Selected
	    return;
	}*/
    ////////////如果不需要选中对象，注释以上代码//////////////////
    
    
    globalReportDemoDialog = createActionDialog(form,
			request, true, 
			false, 3, reportDemoActionCall); // have apply button
	
	globalReportDemoDialog.popup();
}

function reportDemoActionCall(table, popDownOnSuccess) {
	//var request = "webclient?TC_file=common/actions/webitk_report.xml&_webitk_code=101";
	doRequest(new fotonReportAction(table, popDownOnSuccess, table.actionScript));
}

function fotonReportAction(table, popDownOnSuccess, request) {
	var dialog = getDialog(table);
	var runningFSC = getAssignedFSC();
	// Passing on right assignedFSC in URL.
	request += getFirstSelectionObject(); // from crfreport.js, populates
										// _contextObjects[0]

	var dialog = getDialog(table);
	var tbody = dialog.getTBodyFromTable(table);

	var row = tbody.firstChild;
    var arg = "&_args=";
	while (row) {
		var nameCell = row.firstChild; // 1st td
		if (nameCell) {
			var valueCell = nameCell.nextSibling; // 2nd td

			if (valueCell) {
				var value = queryInputValue(valueCell);

				if (value.length > 0) {
					arg += escape(value) + "::";
				}
			}
		}
		row = row.nextSibling;
	}
	request += arg;
	request += "&_assignedFSC=" + runningFSC;
	alert(request);
	this.url = request;
	this.callback = webitkReportCallback;

	this.dialog = dialog;
	this.popDownOnSuccess = popDownOnSuccess;
	if (this.popDownOnSuccess) {
		dialog.popdown();
	}
}

function webitkReportCallback(documentElement) {
	window.open(documentElement.firstChild.getAttribute("value"));
}

function getFirstSelectionObject() {
    var sel = selection();
    var selObjectsURL = "";
    if (sel.length>0) {
       selObjectsURL = "&_selection="+sel[0].iman_tag;
    }
    return selObjectsURL;

}