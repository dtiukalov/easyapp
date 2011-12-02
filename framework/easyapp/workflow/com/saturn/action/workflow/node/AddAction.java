package com.saturn.action.workflow.node;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowNode;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FlowNode vo = BeanUtils.getBean(request, FlowNode.class);
		
		if (FlowNode.add(vo) == 1) {
			return new JspView("/app/workflow/node/show.jsp?flowId=" + vo.getFlowId());
		} else {
			return new JspErrorView("添加节点失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/node/add.action";
	}
	
}
