package com.saturn.action.system.easyform;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.TableDao;

public class QueryAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String tableId = request.getParameter("tableId");
		
		Map vo = TableDao.get(tableId, id);
		
		request.setAttribute("form", vo);
		return new JspView("/app/system/easyform/edit.jsp?tableId=" + tableId);
	}

	public String requestMapping() {
		return "/app/system/easyform/query.action";
	}

}
