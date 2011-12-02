package com.saturn.action.auth.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;

public class AddUserAction implements IAction {

	public String requestMapping() {
		return "/app/auth/user/addUser.action";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		User user = BeanUtils.getBean(request, User.class);

		if (User.add(user) == 1) {
			return new JspView("/app/auth/user/showUsers.jsp");
		} else {
			return new JspErrorView("添加用户失败");
		}
	}
}
