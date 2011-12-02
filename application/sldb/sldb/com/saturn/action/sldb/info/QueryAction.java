package com.saturn.action.sldb.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportInfo;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		ImportInfo vo = ImportInfo.get(id);
		
		request.setAttribute("info", vo);
		return new JspView("/app/sldb/info/edit.jsp");
	}

	public String requestMapping() {
		return "/app/sldb/info/query.action";
	}

}
