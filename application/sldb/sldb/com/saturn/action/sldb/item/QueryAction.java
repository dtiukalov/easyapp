package com.saturn.action.sldb.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportItem;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		ImportItem vo = ImportItem.get(id);
		
		request.setAttribute("item", vo);
		return new JspView("/app/sldb/item/edit.jsp");
	}

	public String requestMapping() {
		return "/app/sldb/item/query.action";
	}

}
