package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowFormItem;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FlowFormItem dict = BeanUtils.getBean(request, FlowFormItem.class);
		String flowId = request.getParameter("flowId");
		
		if (FlowFormItem.edit(dict) == 1) {
			return new JspView("/app/workflow/item/show.jsp?flowId=" + flowId);
		} else {
			return new JspErrorView("修改工作流表单项失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/item/update.action";
	}
}
