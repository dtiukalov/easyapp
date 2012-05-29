package com.saturn.action.tc.foton.gys.manage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.foton.gys.UserInfo;

public class EditUserAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		UserInfo.edits(ids);
		return new JspView("/app/tc/manage/showUsers.jsp");
	}

	public String requestMapping() {
		return "/app/tc/editUser.action";
	}

}
