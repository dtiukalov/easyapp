package com.saturn.action.workflow.line;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowLine;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FlowLine dict = BeanUtils.getBean(request, FlowLine.class);
		String flowId = request.getParameter("flowId");
		
		if (FlowLine.edit(dict) == 1) {
			return new JspView("/app/workflow/line/show.jsp?flowId=" + flowId);
		} else {
			return new JspErrorView("修改工作流出口失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/line/update.action";
	}
}
