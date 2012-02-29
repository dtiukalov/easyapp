package filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginFilter implements Filter{
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String uri = httpRequest.getRequestURI();	
		if(!"//server//crm::loginModule//action//Login.action".equals(uri)&&!"//server//crm/loginModule//web//login.jsp".equals(uri)){
			Map<String, String> crm_user = (Map<String, String>) httpRequest.getSession().getAttribute("CRM_USER");		
			if (crm_user == null) {
				forword(request, response);
			} else {
				chain.doFilter(httpRequest, httpResponse);
			}
		}else {
			chain.doFilter(httpRequest, httpResponse);
		}
	}
	
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	private void forword(ServletRequest request, ServletResponse response)
		throws IOException, ServletException {
			request.getRequestDispatcher("/crm/loginModule/web/login.jsp").forward(request,response);
	}
}
