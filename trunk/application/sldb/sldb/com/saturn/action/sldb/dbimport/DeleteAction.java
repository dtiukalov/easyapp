package com.saturn.action.sldb.dbimport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Import;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		Import.removes(ids);
		return new JspView("/app/sldb/import/show.jsp");
	}

	public String requestMapping() {
		return "/app/sldb/import/delete.action";
	}

}
