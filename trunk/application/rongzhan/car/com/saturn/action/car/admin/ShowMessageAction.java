package com.saturn.action.car.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.Message;

public class ShowMessageAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String show = request.getParameter("show");
		String cid = request.getParameter("cid");
		Message.show(show);
		return new JspView("/app/car/admin/messageShow.jsp?cid="+cid);
	}

	public String requestMapping() {
		return "/app/website/admin/message/show.action";
	}

}
