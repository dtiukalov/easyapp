package com.saturn.action.ph.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.WebHelper;
import com.saturn.app.web.view.JspView;

public class ViewAction implements IAction {

	public String requestMapping() {
		return "/app/pep/view/view.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String result = WebHelper.ERROR_JSP;
		
		String current = (String)request.getParameter("current");
		List<String> indexes = (List<String>)request.getSession().getAttribute("indexes");
		
		int cur = Integer.parseInt(current);
		request.setAttribute("current", current);
		
		if(indexes != null){
			result = indexes.get(cur-1);
		} else {
			return new JspView("/app/pep/login.jsp?flag=1");
//			request.setAttribute(WebHelper.ERROR_MESSAGE, "Session过期  重新登陆 !!");
		}
		
		return new JspView(result);
	}
}
