package com.saturn.action.system.easyform.tablecolumn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.system.easyform.TableColumn;

public class IsRepeatTableColumnAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String name = request.getParameter("name");
		String tableId = request.getParameter("tableId");

		if ("id".equalsIgnoreCase(name) || TableColumn.getByName(name, tableId) != null) {
			return new JsonView("true");
		}
		return new JsonView("false");
	}

	public String requestMapping() {
		return "/app/system/easyform/tablecolumn/isRepeatTableColumnName.action";
	}

}
