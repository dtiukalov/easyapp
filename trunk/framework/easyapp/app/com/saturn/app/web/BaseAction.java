package com.saturn.app.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.view.JspErrorView;

public class BaseAction implements IAction {

	private String mapping = null;
	
	public BaseAction(String mapping) {
		this.mapping = mapping;
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		return new JspErrorView("未定义实现, mapping: " + this.mapping);
	}

	public String requestMapping() {
		return this.mapping;
	}

}
