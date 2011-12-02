package com.saturn.action.workflow.condition;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.NodeCondition;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		NodeCondition dict = BeanUtils.getBean(request, NodeCondition.class);
		String nodeId = request.getParameter("nodeId");
		dict.setValue(request.getParameter("values"));
		if (NodeCondition.edit(dict) == 1) {
			return new JspView("/app/workflow/condition/show.jsp?nodeId=" + nodeId);
		} else {
			return new JspErrorView("修改节点条件失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/condition/update.action";
	}
}
