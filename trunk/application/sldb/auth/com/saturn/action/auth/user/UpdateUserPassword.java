package com.saturn.action.auth.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;

public class UpdateUserPassword implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String userId = request.getParameter("id");
		String passWord = request.getParameter("newP");
		User user = User.get(userId);
		user.setPassword(passWord);
		
		if (User.updateUserPassword(user) == 1) {
			return new JspView("/app/auth/user/showUsers.jsp");
		}
		return null;
	}

	public String requestMapping() {
		return "/app/auth/user/updateUserPassword.action";
	}

}
