package com.saturn.action.system.easyform.query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.QueryFormItem;

public class GenerateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String tableId = request.getParameter("tableId");
		
		QueryFormItem.createItemForTable(tableId);
		
		return new JspView("/app/system/easyform/query/show.jsp?tableId="+tableId);
	}

	public String requestMapping() {
		return "/app/system/easyform/query/generate.action";
	}
	
}
