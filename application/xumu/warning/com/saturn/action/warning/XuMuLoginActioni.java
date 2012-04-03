package com.saturn.action.warning;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.CodeUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.Organization;
import com.saturn.auth.User;

public class XuMuLoginActioni implements IAction {
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		password = CodeUtils.encode(password);
		User user = User.get(id);
		if (user != null) {
			if (user.getPassword().equals(password)) {
				request.getSession().setAttribute("authUser", user);
				
				List<Organization> types = Organization.getOrganizationByUser(id);
				
				if (isFarmer(types)) {
					return new JspView("/app/warning/farmer/main.jsp");
				} else {
					return new JspView("/app/main.jsp");
				}
			} else {
				return new JspErrorView("密码不正确");
			}
		} else {
			return new JspErrorView("用户不存在");
		}
		
	}
	
	public boolean isFarmer(List<Organization> types) {
		if (types == null || types.isEmpty()) {
			return false;
		}
		
		for (Organization type : types) {
			if ("养殖户".equals(type.getName())) {
				return true;
			}
		}
		
		return false;
	}

	public String requestMapping() {
		return "/app/warning/login.do";
	}

}