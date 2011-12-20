package com.saturn.action.sldb.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.IdCheck;
import com.saturn.sldb.ImportInfo;

public class ShowAction implements IAction{

	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String num = request.getParameter("num");
		IdCheck check = IdCheck.get(num);
		
		String type = check.getInfoType();
		ImportInfo info = ImportInfo.get(type);

		request.setAttribute("info", info);
		request.setAttribute("values", check.getValue());
		
		return new JspView("/app/sldb/check/view.jsp");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/check/show.action";
	}

}
