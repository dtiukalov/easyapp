package com.saturn.action.system.easyform.tablecolumn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.TableColumn;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		TableColumn vo = TableColumn.get(id);
		
		request.setAttribute("tablecolumn", vo);
		return new JspView("/app/system/easyform/tablecolumn/edit.jsp");
	}

	public String requestMapping() {
		return "/app/system/easyform/tablecolumn/query.action";
	}

}
