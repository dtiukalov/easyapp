package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowFormItem;

public class GetCreateSqlAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("flowId");
		String sql = FlowFormItem.getCreateTableSql(id);
		
		request.setAttribute("sql", sql);
		return new JspView("/app/workflow/item/createTable.jsp?flowId=" + id);
	}

	public String requestMapping() {
		return "/app/workflow/item/getsql.action";
	}

}
