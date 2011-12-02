package com.saturn.action.workflow.line;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowLine;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FlowLine vo = BeanUtils.getBean(request, FlowLine.class);
		
		if (FlowLine.add(vo) == 1) {
			return new JspView("/app/workflow/line/show.jsp?flowId=" + vo.getFlowId());
		} else {
			return new JspErrorView("添加工作流出口失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/line/add.action";
	}
	
}
