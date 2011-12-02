package com.saturn.action.sldb.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportInfo;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		ImportInfo.removes(ids);
		return new JspView("/app/sldb/info/show.jsp");
	}

	public String requestMapping() {
		return "/app/sldb/info/delete.action";
	}

}
