package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.workflow.FlowFormItem;

public class AjaxUpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FlowFormItem dict = BeanUtils.getBean(request, FlowFormItem.class);
		
		if (FlowFormItem.edit(dict) == 1) {
			return new JsonView("true");
		} else {
			return new JsonView("false");
		}
	}

	public String requestMapping() {
		return "/app/workflow/item/ajaxupdate.action";
	}
}
