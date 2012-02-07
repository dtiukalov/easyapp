package com.saturn.ph;

import javax.servlet.ServletContext;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.strong.User;

public class PH {
	
	public static final String TC_SESSION = "TC_SESSION";
	public static final String TC_USER = "TC_USER";
	
	private static TCSession session;
	private static User user;
	private static EasyDataManagementService dataService;
	private static ServletContext context;
	
	public static EasyDataManagementService getDataService() {
		if (PH.dataService == null) {
			PH.dataService = new EasyDataManagementService(getSession());
		}
		return PH.dataService;
	}

	public static TCSession getSession() {
		if (session == null) {
			session = (TCSession)context.getAttribute("TC_SESSION");
		}
		return session;
	}

	public static User getUser() {
		if (user == null) {
			user = (User)context.getAttribute("TC_USER");
		}
		return user;
	}

	public static void setContext(ServletContext context) {
		PH.context = context;
	}

	private PH() {
		
	}
}
