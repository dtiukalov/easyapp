package foton.picture.servlet.dict;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foton.picture.xml.DictionaryLoader;
import foton.picture.xml.DictionaryManager;

/**
 * Servlet implementation class for Servlet: PageDictServlet
 *
 */
 public class PageDictServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public PageDictServlet() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int page = Integer.parseInt(request.getParameter("page"));
		String type = (String)request.getParameter("type");
		int perCount = 15;
		List<String> dicts = DictionaryManager.getInstance().getDict(type);
		List<String> list = getDictListByPage(dicts, page, perCount);
		
		request.getSession().setAttribute("type", type);
		request.getSession().setAttribute("dictresultList", list);
		request.getSession().setAttribute("dict_current_page", page - 1);
		
		if (DictionaryLoader.ANGLE.equalsIgnoreCase(type)
				|| DictionaryLoader.YEAR.equalsIgnoreCase(type)
				|| DictionaryLoader.INTEROUTER.equalsIgnoreCase(type)
				|| DictionaryLoader.OUTER.equalsIgnoreCase(type)
				|| DictionaryLoader.INTER.equalsIgnoreCase(type)
				|| DictionaryLoader.CARTYPE.equalsIgnoreCase(type)) {
			request.getRequestDispatcher("/dict/commonList.jsp").forward(
					request, response);
		} else {
			request.getRequestDispatcher("/dict/countryList.jsp").forward(
					request, response);
		}
		
	}   	
	
	private List<String> getDictListByPage(List<String> dicts, int page,
			int perCount) {
		
		List<String> result = new ArrayList<String>();
		int begin = (page - 1) * perCount;
		int end = page * perCount - 1;

		if (dicts.size() - 1 < end) {
			end = dicts.size() - 1;
		}

		int i = 0;

		for (begin = (page - 1) * perCount; begin <= end; begin++) {
			result.add(i, dicts.get(begin));
			i++;
		}

		return result;
	}
}