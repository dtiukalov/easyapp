package com.saturn.action.workflow.node;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.workflow.FlowNode;

public class GetNodeJSONAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String flowId = request.getParameter("flowId");
		
		return new JsonView(FlowNode.getJSONNodes(flowId));
	}

	public String requestMapping() {
		return "/app/workflow/node/node.action";
	}
}
