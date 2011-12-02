package com.saturn.action.system.easyform.query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.QueryFormItem;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		QueryFormItem vo = QueryFormItem.get(id);
		String tableId = request.getParameter("tableId");
		
		request.setAttribute("query", vo);
		return new JspView("/app/system/easyform/query/edit.jsp?tableId=" + tableId);
	}

	public String requestMapping() {
		return "/app/system/easyform/query/query.action";
	}

}
