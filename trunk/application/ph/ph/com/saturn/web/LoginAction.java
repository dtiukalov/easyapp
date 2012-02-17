package com.saturn.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;

public class LoginAction implements IAction {

	public String requestMapping() {
		return "/app/pep/login.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String ua = (String)request.getParameter("ua");
		String pd = (String)request.getParameter("pd");
		
	
		return new JspView("");
		
	}

}
