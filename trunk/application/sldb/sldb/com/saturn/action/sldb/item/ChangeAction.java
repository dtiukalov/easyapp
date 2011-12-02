package com.saturn.action.sldb.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportItem;

public class ChangeAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String firstId = request.getParameter("first");
		String secondId = request.getParameter("second");
		String infoId = request.getParameter("infoId");
		
		ImportItem.change(firstId, secondId);
		return new JspView("/app/sldb/item/show.jsp?infoId="+infoId);
	}

	public String requestMapping() {
		return "/app/sldb/item/change.action";
	}

}
