package com.saturn.action.sldb.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.IdCheck;

public class CheckAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String pid = request.getParameter("pid");

		try {
			return new JsonView(IdCheck.check(pid));
		} catch (Exception e) {
			return new JsonView("false");
		}
	}
	
	public String requestMapping() {
		return "/app/sldb/check/check.action";
	}
	
}





