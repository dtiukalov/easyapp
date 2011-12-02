package com.saturn.action.workflow.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.workflow.FlowFormItem;

public class CreateTableAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String sqlStr = request.getParameter("sql");
		String flowId = request.getParameter("flowId");
		
		String sql = sqlStr.replace("\r", " ");
		sql = sql.replace('\n', ' ');
		sql = sql.replace('\t', ' ');
		
		request.setAttribute("sql", sqlStr);
		
		if (1 == FlowFormItem.createTable(sql)) {
			return new JspView("/app/workflow/item/createTable.jsp?result=true&flowId="+flowId);
		} else {
			return new JspView("/app/workflow/item/createTable.jsp?result=false&flowId="+flowId);
		}
	}

	public String requestMapping() {
		return "/app/workflow/item/createTable.action";
	}

}
