package com.saturn.action.workflow.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.WorkFlow;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		WorkFlow vo = WorkFlow.get(id);
		
		request.setAttribute("info", vo);
		return new JspView("/app/workflow/info/edit.jsp");
	}

	public String requestMapping() {
		return "/app/workflow/info/query.action";
	}

}
