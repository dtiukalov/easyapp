package com.saturn.action.workflow.runtime;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.workflow.runtime.WorkFlowInstance;
import com.saturn.workflow.runtime.WorkFlowManager;
import com.saturn.workflow.runtime.WorkFlowProcess;

public class RunAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String instanceId = request.getParameter("instanceId");
		
		User user = (User)request.getSession().getAttribute("authUser");
		String userId = user.getId();
		
		WorkFlowInstance instance = WorkFlowInstance.get(instanceId); 
		if (instance.getEndTime() != null) {
			return new JspErrorView("工作流实例id=" + instanceId + ", 已经结束!");
		}
		
		WorkFlowProcess process = WorkFlowManager.getProcess(instanceId, userId);
		if (process == null) {
			return new JspErrorView("用户:" + user.getName() + "：没有执行工作流实例id=" + instanceId + "的权限!");
		}
		request.setAttribute("processId", process.getId());
		
		Map formValue = WorkFlowManager.getFormValue(instanceId);
		if (formValue == null) {
			formValue = new HashMap();
		}
		request.setAttribute("formValue", formValue);
		
		return new JspView("/app/workflow/runtime/show.jsp?instanceId=" + instanceId);
	}

	public String requestMapping() {
		return "/app/workflow/runtime/run.action";
	}
	
}
