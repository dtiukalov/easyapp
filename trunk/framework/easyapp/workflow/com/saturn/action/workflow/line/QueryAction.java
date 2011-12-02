package com.saturn.action.workflow.line;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowLine;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String flowId = request.getParameter("flowId");
		
		FlowLine vo = FlowLine.get(id);
		
		request.setAttribute("line", vo);
		return new JspView("/app/workflow/line/edit.jsp?flowId=" + flowId);
	}

	public String requestMapping() {
		return "/app/workflow/line/query.action";
	}

}
