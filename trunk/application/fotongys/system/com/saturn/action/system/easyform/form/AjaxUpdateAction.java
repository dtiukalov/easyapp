package com.saturn.action.system.easyform.form;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.system.easyform.FormItem;

public class AjaxUpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FormItem dict = BeanUtils.getBean(request, FormItem.class);
		
		if (FormItem.edit(dict) == 1) {
			return new JsonView("true");
		} else {
			return new JsonView("false");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/form/ajaxupdate.action";
	}
}
