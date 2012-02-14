package com.saturn.action.system.easyform.query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.system.easyform.QueryFormItem;

public class IsRepeatQueryFormItemAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String name = request.getParameter("name");
		String tableId = request.getParameter("tableId");

		if ("id".equalsIgnoreCase(name) || QueryFormItem.getByName(name, tableId) != null) {
			return new JsonView("true");
		}
		return new JsonView("false");
	}

	public String requestMapping() {
		return "/app/system/easyform/query/isRepeatQueryFormItemName.action";
	}

}
