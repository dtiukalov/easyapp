package com.saturn.action.workflow.condition;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.NodeCondition;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		String nodeId = request.getParameter("nodeId");
		
		NodeCondition.removes(ids);
		return new JspView("/app/workflow/condition/show.jsp?nodeId=" + nodeId);
	}

	public String requestMapping() {
		return "/app/workflow/condition/delete.action";
	}

}
