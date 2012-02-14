package com.saturn.action.tc.foton.gys;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.Mail;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		TCSession session = (TCSession)request.getSession().getAttribute("TC_session");
		
		String idStr = request.getParameter("ids");
		
		String[] ids = idStr.split(",");
		
		Mail.removes(session, ids);
		
		return new JspView("/app/tc/main.jsp");
	}

	public String requestMapping() {
		return "/app/tc/foton/gys/delete.action";
	}

}
