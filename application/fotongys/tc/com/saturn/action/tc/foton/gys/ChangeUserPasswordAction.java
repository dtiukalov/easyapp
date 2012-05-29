package com.saturn.action.tc.foton.gys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.CodeUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.foton.gys.UserInfo;

public class ChangeUserPasswordAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String userId = request.getParameter("id");
		String old = request.getParameter("old");
		String newP = request.getParameter("newP");
		request.setAttribute("userid", userId);
		old = CodeUtils.encode(old);
		UserInfo user = UserInfo.get(userId);
		
		if (user.getUserpass().equals(old)) {
			newP = CodeUtils.encode(newP);
			user.setUserpass(newP);
			if (UserInfo.edit(user) == 1) {
				return new JspView("/app/tc/chpass.jsp?result=1");
			} else {
				return new JspView("/app/tc/chpass.jsp?result=2");
			}
		} else {
			return new JspView("/app/tc/chpass.jsp?result=3");
		}
	}

	public String requestMapping() {
		return "/app/tc/changePassword.action";
	}

}
