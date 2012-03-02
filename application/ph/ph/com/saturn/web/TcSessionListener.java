package com.saturn.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.saturn.ph.PH;
import com.saturn.tc.utils.WorkspaceUtils;

public class TcSessionListener implements ServletContextListener {

	private static final String TC_USERNAME_ATTR = "username";
	private static final String TC_PASSWORD_ATTR = "password";
	private static final String TC_URL_ATTR = "url";
	
	private static final String TC_USERNAME_DEFAULT = "infodba";
	private static final String TC_PASSWORD_DEFAULT = "infodba";
//	private static final String TC_URL_DEFAULT = "http://192.168.214.128:7001/tc";
	private static final String TC_URL_DEFAULT = "http://localhost:7001/tc";
	private static final String TC_URL = "";

	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		
		String username = context.getInitParameter(TC_USERNAME_ATTR);
		String password = context.getInitParameter(TC_PASSWORD_ATTR);
		String url = context.getInitParameter(TC_URL_ATTR);

		if (username == null) {
			username = TC_USERNAME_DEFAULT;
		}
		
		if (password == null) {
			password = TC_PASSWORD_DEFAULT;
		}
		
		if (url == null) {
			url = TC_URL_DEFAULT;
		} 
		
		WorkspaceUtils.HOST = url;
		
		PH.setContext(context);
		//context.setAttribute("TC_SESSION", tcsession);
		context.setAttribute("__TC_URL", url);
		context.setAttribute("__TC_USER", username);
		context.setAttribute("__TC_PASSWORD", password);
		//context.setAttribute("TC_USER", user);
		
	}

	public void contextDestroyed(ServletContextEvent event) {
	}
}
