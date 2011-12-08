package com.saturn.action.sldb.person.sub;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;
import com.saturn.sldb.PersonSub;

public class QueryPersonTabAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String pid = request.getParameter("id"); //获取页面户主ID
		
		String personId = request.getParameter("id");
		Person voP = Person.get(personId);
		
		List<PersonSub> voPerson = PersonSub.getByPid(pid);
		request.setAttribute("person", voP);
		request.setAttribute("personTab", voPerson);
		return new JspView("/app/sldb/person/sub/personTab.jsp");
	}

	public String requestMapping() {
		return "/app/sldb/person/sub/queryPersonTab.action";
	}

}
