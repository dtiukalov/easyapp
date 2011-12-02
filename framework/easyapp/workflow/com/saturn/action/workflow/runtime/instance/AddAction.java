package com.saturn.action.workflow.runtime.instance;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.workflow.WorkFlow;
import com.saturn.workflow.runtime.WorkFlowInstance;

public class AddAction implements IAction {

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
		
		if (user == null) {
			return new JspErrorView("用户不存在, 请重新登录!");
		}
		
		String userId = user.getId();
		String userName = user.getName();
		
		WorkFlowInstance vo = new WorkFlowInstance(null, flowId, flowName, flowShowName, userId, userName, DateUtils.getSystemDate());
		
		if (WorkFlowInstance.add(vo) == 1) {
			return new JspView("/app/workflow/runtime/instance/show.jsp");
		} else {
			return new JspErrorView("添加工作流实例失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/runtime/instance/add.action";
	}
	
}
