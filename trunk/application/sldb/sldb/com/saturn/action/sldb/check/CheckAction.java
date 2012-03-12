package com.saturn.action.sldb.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.IdCheck;
import com.saturn.sldb.Person;

public class CheckAction implements IAction {


	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String pid = request.getParameter("pid");
		String way = request.getParameter("id");
		
		try {
			if ("all".equals(way)) {
				return new JsonView(IdCheck.check(pid));
			} 
			if ("name".equals(way)) {
				return new JsonView(IdCheck.checkByName(pid));
			} 
			if ("identify".equals(way)) {
				return new JsonView(IdCheck.checkByIdentify(pid));
			}
			return new JsonView("false");
		} catch (Exception e) {
			return new JsonView("false");
		}
	}
	
	public String requestMapping() {
		return "/app/sldb/check/check.action";
	}
	
}





