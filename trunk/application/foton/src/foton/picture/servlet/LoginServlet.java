package foton.picture.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.teamcenter.clientx.Session;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;

import foton.picture.util.IConstants;
import foton.picture.vo.PictureVO;
import foton.picture.xml.DictionaryManager;

/**
 * Servlet implementation class for Servlet: LoginServlet
 * 
 */
public class LoginServlet extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	private String host;

	private String port;

	private String instance;

	private String tc_user_name;

	private String tc_user_pass;

	private String web_user;

	private String web_user_pass;

	private String web_dba;

	private String web_dba_pass;

	private ServletConfig config;

	public LoginServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		this.config = config;
		this.host = config.getServletContext().getInitParameter("host");
		this.port = config.getServletContext().getInitParameter("port");
		this.instance = config.getServletContext().getInitParameter("instance");

		this.tc_user_name = config.getServletContext().getInitParameter(
				"tc_user_name");
		this.tc_user_pass = config.getServletContext().getInitParameter(
				"tc_user_pass");

		this.web_user = config.getServletContext().getInitParameter("web_user");
		this.web_user_pass = config.getServletContext().getInitParameter(
				"web_user_pass");

		this.web_dba = config.getServletContext().getInitParameter("web_dba");
		this.web_dba_pass = config.getServletContext().getInitParameter(
				"web_dba_pass");
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = (String) request.getParameter("name");
		String password = (String) request.getParameter("password");
		// String loginUser = name;
	//	ServletContext application = this.config.getServletContext();

		if (this.web_user.equalsIgnoreCase(name)
				&& this.web_user_pass.equalsIgnoreCase(password)) {
			requestView(request, response);
			request.getSession().setAttribute("loginUser", this.web_user);
			return;
		} else if (this.web_dba.equalsIgnoreCase(name)
				&& this.web_dba_pass.equalsIgnoreCase(password)) {

			/*if (application.getAttribute("loginDbaCount") == null) {
				// application.setAttribute("loginUser", this.web_dba);
				application.setAttribute("loginDbaCount", "1");
			} else {
				request.setAttribute("LOGINERROR", "dba user already login! ");

				request.getRequestDispatcher(IConstants.LOGIN_PAGE).forward(
						request, response);
				return;
			}*/
			request.getSession().setAttribute("loginUser", this.web_dba);
			requestView(request, response);
			return;
		} else {
			request.setAttribute("LOGINERROR", "user name or password error!");
			request.getRequestDispatcher(IConstants.LOGIN_PAGE).forward(
					request, response);
			return;
		}
	}

	private void requestView(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// String serverHost = "iiop:192.168.1.101:2557/TcServer1"; // 两层连接
		String serverHost = "http://" + this.host + ":" + this.port + "/"
				+ this.instance;
		try {
			Session tcsession = new Session(serverHost);
			tcsession.login(this.tc_user_name, this.tc_user_pass);

			Map<String, PictureVO> map = new HashMap<String, PictureVO>();
			Map<String, PictureVO> picListmap = new HashMap<String, PictureVO>();
			request.getSession().setAttribute("map", map);
			request.getSession().setAttribute("picListmap", picListmap);
			request.getSession().setAttribute("USER", tcsession);
			request.getSession().setAttribute("message", "login");
			request.getRequestDispatcher(IConstants.INDEX_PAGE).forward(
					request, response);
			
			List<String> dicts = DictionaryManager.getInstance().getDict("country");
			request.getSession().removeAttribute("countryList");
			request.getSession().removeAttribute("bandList");
			request.getSession().removeAttribute("subbandList");
			request.getSession().removeAttribute("countryValue");
			request.getSession().removeAttribute("bandValue");
			request.getSession().removeAttribute("subbandValue");
			request.getSession().removeAttribute("carTypeValue");
			request.getSession().removeAttribute("yearValue");
			request.getSession().removeAttribute("interouterValue");
			request.getSession().removeAttribute("outerValue");
			request.getSession().removeAttribute("interValue");
			request.getSession().removeAttribute("angleValue");
			
			request.getSession().setAttribute("countryList", dicts);
						
			return;
		} catch (InvalidCredentialsException e) {
			request.setAttribute("LOGINERROR",
					"TCLoginUser ERROR : TC user error!");
			e.printStackTrace();
			request.getRequestDispatcher(IConstants.LOGIN_PAGE).forward(
					request, response);
			return;
		} catch (Exception e) {
			request.setAttribute("LOGINERROR",
					"TCServer ERROR : ConnectionException Could not connect to "
							+ serverHost);
			e.printStackTrace();
			request.getRequestDispatcher(IConstants.LOGIN_PAGE).forward(
					request, response);
			return;
		}
	}
}