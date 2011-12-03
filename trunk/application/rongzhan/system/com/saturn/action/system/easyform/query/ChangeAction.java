package com.saturn.action.system.easyform.query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.QueryFormItem;

public class ChangeAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String firstId = request.getParameter("first");
		String secondId = request.getParameter("second");
		String tableId = request.getParameter("tableId");
		
		QueryFormItem.change(firstId, secondId);
		return new JspView("/app/system/easyform/query/show.jsp?tableId="+tableId);
	}

	public String requestMapping() {
		return "/app/system/easyform/query/change.action";
	}

}
