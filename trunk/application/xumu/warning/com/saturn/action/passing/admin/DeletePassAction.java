package com.saturn.action.passing.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.passing.Passing;

public class DeletePassAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		Passing.removes(ids);
		return new JspView("/app/passing/admin/passShow.jsp");
	}

	public String requestMapping() {
		return "/app/passing/pass/deletePassing.action";
	}

}
