package com.saturn.ph;

import javax.servlet.ServletContext;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.saturn.tc.utils.server.EasyFileManagementService;
import com.saturn.tc.utils.server.EasyQueryService;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.soa.client.model.strong.User;

public class PH {

	public static final String TC_SESSION = "TC_SESSION";
	public static final String TC_USER = "TC_USER";

	private static TCSession session;
	private static User user;
	private static EasyDataManagementService dataService;
	private static EasyFileManagementService fileService;
	private static EasyQueryService queryService;
	private static ServletContext context;

	public static EasyDataManagementService getDataService() {
		if (PH.dataService == null) {
			PH.dataService = new EasyDataManagementService(getSession());
		}
		return PH.dataService;
	}
	
	public static EasyFileManagementService getFileService() {
		if (PH.fileService == null) {
			PH.fileService = new EasyFileManagementService(getSession());
		}
		return PH.fileService;
	}

	public static EasyQueryService getQueryService() {
		if (PH.queryService == null) {
			PH.queryService = new EasyQueryService(getSession());
		}
		return PH.queryService;
	}

	public static TCSession getSession() {
		if (session == null) {
			String url = (String)context.getAttribute("__TC_URL");
			String username = (String)context.getAttribute("__TC_USER");
			String password = (String)context.getAttribute("__TC_PASSWORD");
			
			session = new TCSession(url);
			User user = null;
			try {
				user = session.login(username, password);
			} catch (InvalidCredentialsException e) {
				e.printStackTrace();
			}
			
			context.setAttribute("TC_SESSION", session);
			context.setAttribute("TC_USER_ADMIN", user);
		}
		return session;
	}
	
	public static void setSession(TCSession session) {
		PH.session = session;
	}

	public static void setUser(User user) {
		PH.user = user;
	}

	public static User getUser() {
		if (user == null) {
			user = (User) context.getAttribute("TC_USER");
		}
		return user;
	}

	public static void setContext(ServletContext context) {
		PH.context = context;
	}

	private PH() {

	}
}
