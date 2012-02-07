package com.saturn.app.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.view.JspView;

public class WebHelper {

	public static final String ERROR_JSP = "/error.jsp";

	public static final String ERROR_MESSAGE = "__ERROR_MESSAGE__";

	private HttpServletRequest request;

	private HttpServletResponse response;

	public WebHelper(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public IView execute() throws Exception {
		try {
			String actionKey = this.getActionKey(this.getRequest()
					.getRequestURI());

			IAction action = ActionManager.get(actionKey);
			return action.execute(request, response);
		} catch (Exception e) {
			request.setAttribute(ERROR_MESSAGE, e.getMessage());
			return new JspView(ERROR_JSP);
		}
	}

	private String getActionKey(String requestURI) {
		return requestURI.substring(requestURI.indexOf("/", 1));
	}
}
