package com.saturn.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.saturn.ph.PH;
import com.saturn.tc.clientx.TCSession;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.soa.client.model.strong.User;

public class TcSessionListener implements ServletContextListener {

	private static final String TC_USERNAME_ATTR = "username";
	private static final String TC_PASSWORD_ATTR = "password";
	private static final String TC_URL_ATTR = "url";
	
	private static final String TC_USERNAME_DEFAULT = "infodba";
	private static final String TC_PASSWORD_DEFAULT = "infodba";
	private static final String TC_URL_DEFAULT = "http://192.168.7.13:7001/tc";

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
		
		TCSession tcsession = new TCSession(url);
		
		User user = null;
		
		try {
			user = tcsession.login(username, password);
			PH.setContext(context);
			
			context.setAttribute("TC_SESSION", tcsession);
			context.setAttribute("TC_USER", user);
			//PH.setSession(tcsession);
			//PH.setUser(user);
		} catch (InvalidCredentialsException e) {
		}
	}

	public void contextDestroyed(ServletContextEvent event) {
	}
}
