package com.saturn.action.workflow.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.WorkFlow;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		WorkFlow vo = BeanUtils.getBean(request, WorkFlow.class);
		
		if (WorkFlow.add(vo) == 1) {
			return new JspView("/app/workflow/info/show.jsp");
		} else {
			return new JspErrorView("添加工作流失败");
		}
	}

	public String requestMapping() {
		return "/app/workflow/info/add.action";
	}
	
}
