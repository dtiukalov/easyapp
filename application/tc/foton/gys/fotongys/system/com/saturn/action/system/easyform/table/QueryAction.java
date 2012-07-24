package com.saturn.action.system.easyform.table;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.Table;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		Table vo = Table.get(id);
		
		request.setAttribute("table", vo);
		return new JspView("/app/system/easyform/table/edit.jsp");
	}

	public String requestMapping() {
		return "/app/system/easyform/table/query.action";
	}

}
