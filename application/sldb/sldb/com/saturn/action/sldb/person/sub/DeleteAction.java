package com.saturn.action.sldb.person.sub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;
import com.saturn.sldb.PersonSub;

public class DeleteAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String pid = request.getParameter("pid");
		
		Person voPerson = Person.get(pid);
		request.setAttribute("person", voPerson);
		
		String id = request.getParameter("id");
		String[] ids = id.split("__");
		
		PersonSub.removes(ids);
		return new JspView("/app/sldb/person/sub/show.jsp?id=" + pid);
	}

	public String requestMapping() {
		return "/app/sldb/person/sub/delete.action";
	}

}
