package com.saturn.action.sldb.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportItem;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		String infoId = request.getParameter("infoId");
		
		ImportItem.removes(ids);
		return new JspView("/app/sldb/item/show.jsp?infoId="+infoId);
	}

	public String requestMapping() {
		return "/app/sldb/item/delete.action";
	}

}
