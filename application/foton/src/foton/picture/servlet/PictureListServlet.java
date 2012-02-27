package foton.picture.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foton.picture.vo.PictureVO;

/**
 * Servlet implementation class for Servlet: PictureListServlet
 * 
 */
public class PictureListServlet extends javax.servlet.http.HttpServlet
		implements javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public PictureListServlet() {
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
		String keys = (String) request.getParameter("keys");
		String type = (String) request.getParameter("type");

		Map<String, PictureVO> map = (Map<String, PictureVO>) request
				.getSession().getAttribute("map");
		Map<String, PictureVO> picListmap = (Map<String, PictureVO>) request
				.getSession().getAttribute("picListmap");
		

		
		String url = "/top.jsp";
		String statue = "fail";
		if (!"".equals(type) && type != null) {
			if ("add".equalsIgnoreCase(type)) {
				if (!"".equals(keys) && keys != null) {
					keys = keys.substring(0, keys.length() - 1);
					String[] indexs = keys.split("%");
					
					int addCount = indexs.length;
					for (int index = 0; index < indexs.length; index++) {
						String key = indexs[index];
						if(picListmap.containsKey(key)){
							addCount--;
						}
					}
					int count = picListmap.size() + addCount;
					
					if (count <= 10) {
						for (int index = 0; index < indexs.length; index++) {
							String key = indexs[index];
							if (map.containsKey(key)) {
								picListmap.put(key, map.get(key));
							}
						}
						statue = "ok";
					} else {
						statue = "over";
					}
				}
			}
			if ("remove".equalsIgnoreCase(type)) {
				if (!"".equals(keys) && keys != null) {
					keys = keys.substring(0, keys.length() - 1);
					String[] indexs = keys.split("%");

					for (String index : indexs) {
						if (picListmap.containsKey(index)) {
							picListmap.remove(index);
						}
					}

					url = "/piclist.jsp";
					statue = "ok";
				}
			}
		}
		request.getSession().setAttribute("picListmap", picListmap);
		request.setAttribute("PICINFO", statue);
		request.getRequestDispatcher(url).forward(request, response);
	}
}