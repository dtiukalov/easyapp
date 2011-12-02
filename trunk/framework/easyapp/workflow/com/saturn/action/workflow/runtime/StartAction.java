package com.saturn.action.workflow.runtime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.workflow.WorkFlow;
import com.saturn.workflow.runtime.WorkFlowManager;

public class StartAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String flowId = request.getParameter("flowId");
		
		WorkFlow workFlow = WorkFlow.get(flowId);
		if (workFlow == null) {
			return new JspErrorView("工作流id=" + flowId + "不存在!");
		}
		String flowName = workFlow.getName();
		String flowShowName = workFlow.getShowName();
		
		User user = (User)request.getSession().getAttribute("authUser");
		String userId = user.getId();
		String userNaem = user.getName();
		
		String instanceId = WorkFlowManager.start(flowId, flowName, flowShowName, userId, userNaem);
		
		return new JspView("/app/workflow/runtime/run.action?instanceId=" + instanceId);
	}

	public String requestMapping() {
		return "/app/workflow/runtime/start.action";
	}
	
}
