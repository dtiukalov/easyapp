package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowFormItem;

public class ChangeAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String firstId = request.getParameter("first");
		String secondId = request.getParameter("second");
		String flowId = request.getParameter("flowId");
		
		FlowFormItem.change(firstId, secondId);
		return new JspView("/app/workflow/item/show.jsp?flowId="+flowId);
	}

	public String requestMapping() {
		return "/app/workflow/item/change.action";
	}

}
