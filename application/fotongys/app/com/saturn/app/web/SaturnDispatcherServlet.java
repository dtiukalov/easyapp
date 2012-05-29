package com.saturn.app.web;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.tc.utils.EmailUtils;
import com.saturn.tc.utils.WorkspaceUtils;

public class SaturnDispatcherServlet extends HttpServlet {

	private static final long serialVersionUID = 490104697474185624L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			WebHelper webHelper = new WebHelper(request, response);
			IView view = webHelper.execute();
			if (view != null) {
				view.dispather(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		String host = config.getServletContext().getInitParameter("host");
		String emailhost = config.getServletContext().getInitParameter("emailHost");
		String fromEmail = config.getServletContext().getInitParameter("fromEmail");
		String fromPass = config.getServletContext().getInitParameter("fromPass");
		String mailSeesion = config.getServletContext().getInitParameter("mailSeesion");
		String gysTCPass = config.getServletContext().getInitParameter("gysTCPass");
		
		if (host != null && !"".equals(host)) {
			WorkspaceUtils.HOST = host;
		}
		
		if (gysTCPass != null && !"".equals(gysTCPass)) {
			WorkspaceUtils.GYS_TC_PASSWORD = gysTCPass;
		}
		
		if (emailhost != null && !"".equals(emailhost)) {
			EmailUtils.host = emailhost;
		}
		
		if (fromEmail != null && !"".equals(fromEmail)) {
			EmailUtils.fromEmail = fromEmail;
		}
		
		if (fromPass != null && !"".equals(fromPass)) {
			EmailUtils.fromPass = fromPass;
		}
		
		if (mailSeesion != null && !"".equals(mailSeesion)) {
			EmailUtils.mailSession = mailSeesion;
		}
		super.init(config);
	}
}
