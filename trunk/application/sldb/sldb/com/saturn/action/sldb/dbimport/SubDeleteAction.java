package com.saturn.action.sldb.dbimport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Import;

public class SubDeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		String to = request.getParameter("to");
		Import.removes(ids);
		return new JspView("/app/sldb/import/sub/" + to + ".jsp");
	}

	public String requestMapping() {
		return "/app/sldb/import/sub/delete.action";
	}

}
