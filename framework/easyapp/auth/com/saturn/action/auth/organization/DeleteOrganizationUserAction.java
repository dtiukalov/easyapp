package com.saturn.action.auth.organization;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.Organization;

public class DeleteOrganizationUserAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String organizationId = request.getParameter("id");
		String idStr = request.getParameter("ids");
		String[] userIds = idStr.split("__");
		
		Organization.removeUsers(organizationId, userIds);
		return new JspView("/app/auth/organization/showOrganizationUser.jsp?id="+organizationId);
	}

	public String requestMapping() {
		return "/app/auth/organization/deleteOrganizationUser.action";
	}

}
