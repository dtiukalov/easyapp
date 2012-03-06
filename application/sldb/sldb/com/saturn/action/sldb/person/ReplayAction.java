package com.saturn.action.sldb.person;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;
import com.saturn.sldb.PersonState;
import com.saturn.sldb.PersonSub;

public class ReplayAction implements IAction {

	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("id");
		PersonState.update(id);
		Person pson = Person.get(id);

		pson.setState("创建");
		Person.add(pson);
		
		List<PersonSub> subs = PersonSub.getByPid(id);
		
		if (subs != null) {
			for (PersonSub sub : subs) {
				PersonSub.add(sub);
			}
		}

		return new JspView("/app/sldb/person/state.jsp");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/person/replay.action";
	}

}
