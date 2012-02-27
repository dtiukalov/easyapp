package foton.picture.servlet.dict;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foton.picture.xml.DictionaryManager;

/**
 * Servlet implementation class for Servlet: QueryDictListServlet
 * 
 */
public class QueryDictListServlet extends javax.servlet.http.HttpServlet
		implements javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public QueryDictListServlet() {
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
		
		String value = (String) request.getParameter("type");
		String key = findParentKey(value);
	
		if (!"false".equalsIgnoreCase(key)) {	
			request.getSession().setAttribute("type", key);
			request.getRequestDispatcher("/SearchDictServlet?type=" + key).forward(request, response);
		} else {
			request.getSession().setAttribute("type", value);
			request.setAttribute("error", key);
			request.getRequestDispatcher("/dict/error.jsp").forward(request, response);
		}
		
	}

	private String findParentKey(String value) {
		Set<String> keys = DictionaryManager.getInstance().getDicts().keySet();
		
		for(String key : keys){
			Boolean result = false;
			if(DictionaryManager.getInstance().getDict(key)!= null){
				result =DictionaryManager.getInstance().getDict(key).contains(value);
			}
			
			if(result){
				return key;
			}
		}
		
		return "false";
	}
}