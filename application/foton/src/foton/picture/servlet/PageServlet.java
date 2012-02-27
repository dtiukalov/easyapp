package foton.picture.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamcenter.query.Query;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.SavedQueryResults;

import foton.picture.util.IConstants;
import foton.picture.vo.PictureVO;

public class PageServlet extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	public PageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		String sessionTime = (String) request.getParameter("sessionTime");
		try {
			int perCount = IConstants.PERCOUNT;
			Query query = new Query();
			List<PictureVO> list = query.getPictureVOByPage(
					(SavedQueryResults) request.getSession().getAttribute(
							"results" + sessionTime), page, perCount, request.getSession());

			Map<String, PictureVO> map = (Map<String, PictureVO>) request
					.getSession().getAttribute("map");
			this.initMap(list, map);
			request.getSession().setAttribute("map", map);

			request.getSession().setAttribute("resultList" + sessionTime, list);
			request.setAttribute("sessionTime",sessionTime);
			request.getSession().setAttribute("message", "search");
			request.getSession().setAttribute("current_page", page - 1);
			request.getRequestDispatcher(IConstants.RIGHT_PAGE).forward(
					request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("message", "error");
			request.setAttribute("messageError", e.getMessage());
			request.getRequestDispatcher(IConstants.RIGHT_PAGE).forward(
					request, response);
		}
	}

	private void initMap(List<PictureVO> list, Map<String, PictureVO> map) {
		for (PictureVO pic : list) {
			map.put(pic.getKey(), pic);
		}
	}
}