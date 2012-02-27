package foton.picture.servlet.dict;

import java.io.IOException;
import java.io.PrintWriter;
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
public class SelectDictServlet extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public SelectDictServlet() {
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
		response.setCharacterEncoding("utf-8");           
	    response.setHeader("Cache-Control ","no-cache");
		request.setCharacterEncoding("utf-8");
		
		String type = (String) request.getParameter("type");
		String flag = (String) request.getParameter("flag");

		String carTypeValue = (String)request.getParameter("carType");
		if (!"".equals(carTypeValue)) {
			request.getSession().setAttribute("carTypeValue", carTypeValue);
		} else {
			request.getSession().removeAttribute("carTypeValue");
		}
		String yearValue = (String)request.getParameter("year");
		if (!"".equals(yearValue)) {
			request.getSession().setAttribute("yearValue", yearValue);
		} else {
			request.getSession().removeAttribute("yearValue");
		}
		String interouterValue = (String)request.getParameter("interouter");
		if (!"".equals(interouterValue)) {
			request.getSession().setAttribute("interouterValue", interouterValue);
		} else {
			request.getSession().removeAttribute("interouterValue");
		}
		String outerValue = (String)request.getParameter("outer");
		if (!"".equals(outerValue)) {
			request.getSession().setAttribute("outerValue", outerValue);
		} else {
			request.getSession().removeAttribute("outerValue");
		}
		String interValue = (String)request.getParameter("inter");
		if (!"".equals(interValue)) {
			request.getSession().setAttribute("interValue", interValue);
		} else {
			request.getSession().removeAttribute("interValue");
		}
		String angleValue = (String)request.getParameter("angle");
		if (!"".equals(angleValue)) {
			request.getSession().setAttribute("angleValue", angleValue);
		} else {
			request.getSession().removeAttribute("angleValue");
		}
		
		List<String> dicts = DictionaryManager.getInstance().getDict(type);
		if ("countryFlag".equals(flag)) {
			request.getSession().removeAttribute("bandList");
			request.getSession().removeAttribute("subbandList");
			request.getSession().removeAttribute("countryValue");
			request.getSession().removeAttribute("bandValue");
			request.getSession().removeAttribute("subbandValue");
		}
		if ("bandFlag".equals(flag)) {
			request.getSession().removeAttribute("subbandList");
			request.getSession().removeAttribute("subbandValue");
			request.getSession().removeAttribute("bandList");
			request.getSession().removeAttribute("bandValue");
			request.getSession().setAttribute("bandList", dicts);
			request.getSession().setAttribute("countryValue", type);
		}
		if ("subbandFlag".equals(flag)) {
			request.getSession().removeAttribute("subbandList");
			request.getSession().removeAttribute("bandValue");
			request.getSession().setAttribute("subbandList", dicts);
			request.getSession().setAttribute("bandValue", type);
		}
		if ("nullbandFlag".equals(flag)){
			request.getSession().removeAttribute("subbandList");
			request.getSession().removeAttribute("subbandValue");
			request.getSession().removeAttribute("bandValue");
		}
		if ("nullCountryFlag".equals(flag)) {
			request.getSession().removeAttribute("bandList");
			request.getSession().removeAttribute("subbandList");
			request.getSession().removeAttribute("countryValue");
			request.getSession().removeAttribute("subbandValue");
		}

	}



}