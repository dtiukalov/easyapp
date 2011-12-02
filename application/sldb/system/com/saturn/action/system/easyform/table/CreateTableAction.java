package com.saturn.action.system.easyform.table;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.Table;

public class CreateTableAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String sqlStr = request.getParameter("sql");
		
		
		String sql = sqlStr.replace("\r", " ");
		sql = sql.replace('\n', ' ');
		sql = sql.replace('\t', ' ');
		
		request.setAttribute("sql", sqlStr);
		
		if (1 == Table.createTable(sql)) {
			return new JspView("/app/system/easyform/table/createTable.jsp?result=true");
		} else {
			return new JspView("/app/system/easyform/table/createTable.jsp?result=false");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/table/createTable.action";
	}

}
