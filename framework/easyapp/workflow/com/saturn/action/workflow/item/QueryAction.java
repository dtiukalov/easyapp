package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowFormItem;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String flowId = request.getParameter("flowId");
		
		FlowFormItem vo = FlowFormItem.get(id);
		
		request.setAttribute("item", vo);
		return new JspView("/app/workflow/item/edit.jsp?flowId=" + flowId);
	}

	public String requestMapping() {
		return "/app/workflow/item/query.action";
	}

}
