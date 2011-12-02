package com.saturn.action.workflow.node;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.workflow.FlowNode;

public class IsRepeatAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String name = request.getParameter("name");
		String flowId = request.getParameter("flowId");

		if (FlowNode.getByName(name, flowId) != null) {
			return new JsonView("true");
		}
		return new JsonView("false");
	}

	public String requestMapping() {
		return "/app/workflow/node/isRepeat.action";
	}

}
