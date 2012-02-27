package foton.picture.filter;

import java.io.File;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamcenter.clientx.Session;

public class SessionTimeOutFilter implements Filter {
	private FilterConfig config = null;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String loginAction = httpRequest.getRequestURI();
		loginAction = loginAction.substring(loginAction.lastIndexOf("/"),loginAction.length());
		Session tcsession = (Session) httpRequest.getSession().getAttribute(
				"USER");
		if (tcsession.getConnection() == null && ! ("/login.jsp").equals(loginAction)
				&& !("/login").equals(loginAction)) {
			request.setAttribute("SESSIONTIMEOUT", "SESSIONTIMEOUT");
			request.getRequestDispatcher("/error.jsp").forward(httpRequest,
					httpResponse);
		} else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

}
