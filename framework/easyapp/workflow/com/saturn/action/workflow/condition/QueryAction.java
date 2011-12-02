package com.saturn.action.workflow.condition;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.NodeCondition;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String nodeId = request.getParameter("nodeId");
		
		NodeCondition vo = NodeCondition.get(id);
		
		request.setAttribute("condition", vo);
		return new JspView("/app/workflow/condition/edit.jsp?nodeId=" + nodeId);
	}

	public String requestMapping() {
		return "/app/workflow/condition/query.action";
	}

}
