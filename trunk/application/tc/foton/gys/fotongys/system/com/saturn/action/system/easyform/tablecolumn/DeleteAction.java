package com.saturn.action.system.easyform.tablecolumn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.TableColumn;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String tableId = request.getParameter("tableId");
		String[] ids = idStr.split("__");
		
		TableColumn.removes(ids);
		return new JspView("/app/system/easyform/tablecolumn/show.jsp?tableId="+tableId);
	}

	public String requestMapping() {
		return "/app/system/easyform/tablecolumn/delete.action";
	}

}
