package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowFormItem;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		String flowId = request.getParameter("flowId");
		
		FlowFormItem.removes(ids);
		return new JspView("/app/workflow/item/show.jsp?flowId=" + flowId);
	}

	public String requestMapping() {
		return "/app/workflow/item/delete.action";
	}

}
