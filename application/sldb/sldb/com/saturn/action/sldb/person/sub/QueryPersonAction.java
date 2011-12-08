package com.saturn.action.sldb.person.sub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;

public class QueryPersonAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String pid = request.getParameter("id");
		
		Person voPerson = Person.get(pid);
		request.setAttribute("person", voPerson);
		return new JspView("/app/sldb/person/sub/show.jsp?id=" + pid);
	}

	public String requestMapping() {
		return "/app/sldb/person/sub/queryPerson.action";
	}

}
