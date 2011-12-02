package com.saturn.action.workflow.node;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowNode;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FlowNode dict = BeanUtils.getBean(request, FlowNode.class);
		String flowId = request.getParameter("flowId");
		
		if (FlowNode.edit(dict) == 1) {
			return new JspView("/app/workflow/node/show.jsp?flowId=" + flowId);
		} else {
			return new JspErrorView("修改节点失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/node/update.action";
	}
}
