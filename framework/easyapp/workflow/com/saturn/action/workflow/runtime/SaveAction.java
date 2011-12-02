package com.saturn.action.workflow.runtime;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.runtime.FlowFormDao;
import com.saturn.workflow.runtime.WorkFlowProcess;
import com.saturn.workflow.utils.FlowFormUtils;

public class SaveAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String instanceId = request.getParameter("instanceId");
		String remark = request.getParameter("__remark");
		String pid = request.getParameter("processId");
		
		Map formValue = FlowFormUtils.getBean(request, instanceId);
		
		WorkFlowProcess.remark(pid, remark);
		if (FlowFormDao.addOrEdit(formValue, instanceId) == 1) {
			return new JspView("/app/workflow/runtime/run.action?instanceId="+instanceId + "&result=true");
		}
		
		return new JspView("/app/workflow/runtime/run.action?instanceId="+instanceId + "&result=false");
	}

	public String requestMapping() {
		return "/app/workflow/runtime/save.action";
	}
	
}
