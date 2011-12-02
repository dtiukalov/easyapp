package com.saturn.action.workflow.node;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowNode;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String flowId = request.getParameter("flowId");
		
		FlowNode vo = FlowNode.get(id);
		
		request.setAttribute("node", vo);
		return new JspView("/app/workflow/node/edit.jsp?flowId=" + flowId);
	}

	public String requestMapping() {
		return "/app/workflow/node/query.action";
	}

}
