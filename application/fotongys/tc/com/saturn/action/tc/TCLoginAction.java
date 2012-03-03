package com.saturn.action.tc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.action.tc.foton.gys.ListAction;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.soa.client.model.strong.User;

public class TCLoginAction implements IAction {

	public String requestMapping() {
		return "/app/tc/login.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		request.getSession().removeAttribute(ListAction.TC_MAIL_LIST);
		
		String name = (String) request.getParameter("name");
		String password = (String) request.getParameter("password");
		String host = WorkspaceUtils.HOST;
		TCSession tcsession = new TCSession(host);

		User user = null;

		try {
			user = tcsession.login(name, password);

			EasyDataManagementService service = new EasyDataManagementService(
					tcsession);

			service.getProperties(user, "userid", "user_name");

			request.getSession().setAttribute("TC_USER", user);
			request.getSession().setAttribute("authUser", user);
			request.getSession().setAttribute("TC_session", tcsession);
			
			Map arg = new HashMap();
			com.teamcenter.services.strong.core._2007_01.DataManagement.VecStruct s = new com.teamcenter.services.strong.core._2007_01.DataManagement.VecStruct();
			s.stringVec = new String[]{"111111"};
			arg.put("password", s);
			arg.put("user_password", s);
			service.editModelObject(user, arg);

			return new JspView("/app/tc/main.jsp");
		} catch (InvalidCredentialsException e) {
			request.setAttribute("msg", "用户名或密码错误，请重新登录!");
			return new JspView("/app/tc/index.jsp");
		}
	}
}
