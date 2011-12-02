package com.saturn.action.workflow.runtime;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.runtime.WorkFlowManager;

public class ViewAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String instanceId = request.getParameter("instanceId");
		String processId = request.getParameter("id");
		
		if (processId == null) {
			
		}
		request.setAttribute("processId", processId);
		
		Map formValue = WorkFlowManager.getFormValue(instanceId);
		if (formValue == null) {
			formValue = new HashMap();
		}
		request.setAttribute("formValue", formValue);
		
		return new JspView("/app/workflow/runtime/show.jsp?instanceId=" + instanceId + "&__view=true");
	}

	public String requestMapping() {
		return "/app/workflow/runtime/view.action";
	}
	
}
