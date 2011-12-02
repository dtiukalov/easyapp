package com.saturn.action.workflow.runtime;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.workflow.runtime.FlowFormDao;
import com.saturn.workflow.runtime.WorkFlowManager;
import com.saturn.workflow.utils.FlowFormUtils;

public class ConfirmAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String instanceId = request.getParameter("instanceId");
		User user = (User)request.getSession().getAttribute("authUser");
		String remark = request.getParameter("__remark");
		String userId = user.getId();
		 
		Map formValue = FlowFormUtils.getBean(request, instanceId);
		
		if (FlowFormDao.addOrEdit(formValue, instanceId) == 1) {
			WorkFlowManager.confirm(instanceId, userId, remark);
			return new JspView("/app/workflow/runtime/user/tobe.jsp");
		}
		
		return new JspErrorView("保存信息失败");
	}

	public String requestMapping() {
		return "/app/workflow/runtime/confirm.action";
	}
	
}
