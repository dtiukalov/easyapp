package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowFormItem;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FlowFormItem vo = BeanUtils.getBean(request, FlowFormItem.class);
		
		if (FlowFormItem.add(vo) == 1) {
			return new JspView("/app/workflow/item/show.jsp?flowId=" + vo.getFlowId());
		} else {
			return new JspErrorView("添加工作流表单项失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/item/add.action";
	}
	
}
