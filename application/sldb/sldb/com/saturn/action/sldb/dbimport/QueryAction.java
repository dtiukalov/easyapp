package com.saturn.action.sldb.dbimport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Import;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		Import vo = Import.get(id);
		
		request.setAttribute("import", vo);
		return new JspView("/app/sldb/import/edit.jsp");
	}

	public String requestMapping() {
		return "/app/sldb/import/query.action";
	}

}
