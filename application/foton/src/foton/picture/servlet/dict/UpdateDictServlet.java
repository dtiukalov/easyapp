package foton.picture.servlet.dict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foton.picture.xml.DictionaryManager;

/**
 * Servlet implementation class for Servlet: UpdateDictServlet
 * 
 */
public class UpdateDictServlet extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public UpdateDictServlet() {
		super();
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String key = (String) request.getParameter("type");
		String old = (String) request.getParameter("oldvalue");
		String newValue = (String) request.getParameter("newvalue");
		request.getSession().setAttribute("type", key);
		String result = DictionaryManager.getInstance().updateValue(key, old, newValue);
		if ("true".equalsIgnoreCase(result)) {
			request.getRequestDispatcher("/SearchDictServlet?type=" + key).forward(request, response);
		} else {
			request.setAttribute("error", result);
			request.getRequestDispatcher("/dict/error.jsp").forward(request, response);
		}
	}
}