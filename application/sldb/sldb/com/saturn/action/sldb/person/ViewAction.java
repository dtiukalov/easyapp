package com.saturn.action.sldb.person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;

public class ViewAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		Person vo = Person.get(id);
		
		request.setAttribute("person", vo);
		return new JspView("/app/sldb/person/view.jsp");
	}

	public String requestMapping() {
		return "/app/sldb/person/view.action";
	}

}
