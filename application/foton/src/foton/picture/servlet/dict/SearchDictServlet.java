package foton.picture.servlet.dict;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foton.picture.xml.DictionaryManager;
import foton.picture.xml.DictionaryLoader;

/**
 * Servlet implementation class for Servlet: SearchDictServlet
 * 
 */
public class SearchDictServlet extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public SearchDictServlet() {
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
		String type = (String) request.getParameter("type");
		//type = praseChinese(type);
		List<String> dicts = DictionaryManager.getInstance().getDict(type);
		int allItemsCount = this.getCount(15, dicts);
		List<String> list = getDictListByPage(dicts, 1, 15);

		request.getSession().setAttribute("type", type);
		request.getSession().setAttribute("dictresultList", list);
		request.getSession().setAttribute("dictcount", allItemsCount);
		if (DictionaryLoader.ANGLEINTER.equalsIgnoreCase(type)
				|| DictionaryLoader.ANGLEOUTER.equalsIgnoreCase(type)
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

	private int getCount(int perCount, List<String> results) {
		int allItemsCount = results.size();
		int count = allItemsCount / perCount + 1;

		if (allItemsCount % perCount == 0) {
			count = allItemsCount / perCount;
		}
		return allItemsCount;
	}
	
	public String praseChinese(String inStr){
		String s =null;
		byte temp[];
		if(inStr == null){
			return new String("");
		}
		
		try{
			temp = inStr.getBytes("iso-8859-1");
			s = new String(temp,"utf-8");
		}catch(UnsupportedEncodingException e){
			System.out.println(e.getMessage());
		
		}
		return s;
	}
}