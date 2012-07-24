package com.saturn.action.system.easyform.query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.system.easyform.QueryFormItem;

public class AjaxUpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		QueryFormItem dict = BeanUtils.getBean(request, QueryFormItem.class);
		
		if (QueryFormItem.edit(dict) == 1) {
			return new JsonView("true");
		} else {
			return new JsonView("false");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/query/ajaxupdate.action";
	}
}
