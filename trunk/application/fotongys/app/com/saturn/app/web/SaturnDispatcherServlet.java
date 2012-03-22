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
		if (host != null && !"".equals(host)) {
			WorkspaceUtils.HOST = host;
			EmailUtils.host = emailhost;
			EmailUtils.fromEmail = fromEmail;
			EmailUtils.fromPass = fromPass;
			EmailUtils.mailSession = mailSeesion.trim();
		}
		super.init(config);
	}
}
