package com.saturn.action.sldb.person.sub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.PersonSub;

public class QueryAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id =  request.getParameter("id");
		String pid = request.getParameter("pid");
		
		PersonSub vo = PersonSub.get(id);
		
		request.setAttribute("personSab", vo);
		return new JspView("/app/sldb/person/sub/edit.jsp?pid=" + pid);
	}

	public String requestMapping() {
		return "/app/sldb/person/sub/querySabPerson.action";
	}

}
