package com.saturn.action.tc.foton.gys;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.Mail;
import com.teamcenter.soa.client.model.strong.User;

public class ListAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		TCSession session = (TCSession) request.getSession().getAttribute(
				"TC_session");

		String fromUser = request.getParameter("fromUser");
		String title = request.getParameter("title");
		String hasDownload = request.getParameter("hasDownload");
		String datetime = request.getParameter("datetime");

		String userId = (String) request.getSession().getAttribute("TC_uid");
		User user = (User) request.getSession().getAttribute("TC_USER");
		List<Mail> mails = Mail.getAll(user, session, userId, fromUser, title,
				hasDownload, datetime);

		return new JsonView(JSONUtils.getDataGridJSON(mails.size(), mails));
	}

	public String requestMapping() {
		return "/app/tc/foton/gys/list.action";
	}

}
