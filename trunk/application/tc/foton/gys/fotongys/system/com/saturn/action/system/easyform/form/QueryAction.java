package com.saturn.action.system.easyform.form;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.FormItem;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		FormItem vo = FormItem.get(id);
		
		String tableId = request.getParameter("tableId");
		String formType = request.getParameter("formType");
		
		request.setAttribute("form", vo);
		return new JspView("/app/system/easyform/form/edit.jsp?tableId="+tableId + "&formType="+formType);
	}

	public String requestMapping() {
		return "/app/system/easyform/form/query.action";
	}

}
