package com.saturn.action.tc.foton.gys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.utils.International;

public class LocalAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();
		String local = (String) session.getAttribute(
				International.LOCAL);

		String requestLocal = request.getParameter("local");
		if(local != null){
			if (!local.equals(requestLocal)) {
				session.setAttribute(International.LOCAL, requestLocal);
			} 
		} else {
			session.setAttribute(International.LOCAL, "cn");
		}
		
		return new JspView("/app/tc/main.jsp");
	}

	public String requestMapping() {
		return "/app/tc/foton/gys/local.do";
	}

}
