package foton.picture.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamcenter.query.Query;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.SavedQueryResults;

import foton.picture.util.IConstants;
import foton.picture.vo.PictureVO;

/**
 * Servlet implementation class for Servlet: SearchServlet
 * 
 */
public class SearchServlet extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	public SearchServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> attributeMap = new HashMap<String, Object>();

		request.setCharacterEncoding("utf-8");
		String country = (String) request.getParameter("country");
		String band = (String) request.getParameter("band");
		String subband = (String) request.getParameter("subband");
		String year = (String) request.getParameter("year");
		String interouter = (String) request.getParameter("interouter");
		String angle = (String) request.getParameter("angle");
		String outer = (String) request.getParameter("outer");
		String inter = (String) request.getParameter("inter");
		String cartype = (String) request.getParameter("carType");
		String createDateAfter = (String) request
				.getParameter("createDateAfter");
		String createDateBefore = (String) request
				.getParameter("createDateBefore");
		String updateDateAfter = (String) request
				.getParameter("updateDateAfter");
		String updateDateBefore = (String) request
				.getParameter("updateDateBefore");
		String offerDateAfter = (String) request.getParameter("offerDateAfter");
		String offerDateBefore = (String) request
				.getParameter("offerDateBefore");

		attributeMap.put(IConstants.COUNTRY, country);
		attributeMap.put(IConstants.BAND, band);
		attributeMap.put(IConstants.SUB_BAND, subband);
		attributeMap.put(IConstants.YEAR, year);
		attributeMap.put(IConstants.INTER_OUTER, interouter);
		attributeMap.put(IConstants.ANGLE, angle);
		attributeMap.put(IConstants.OUTER, outer);
		attributeMap.put(IConstants.INTER, inter);
		attributeMap.put(IConstants.CAR_TYPE, cartype);
		attributeMap.put(IConstants.CREATE_DATE_AFTER, createDateAfter);
		attributeMap.put(IConstants.CREATE_DATE_BEFORE, createDateBefore);
		attributeMap.put(IConstants.UPDATE_DATE_AFTER, updateDateAfter);
		attributeMap.put(IConstants.UPDATE_DATE_BEFORE, updateDateBefore);
		attributeMap.put(IConstants.OFFER_DATE_AFTER, offerDateAfter);
		attributeMap.put(IConstants.OFFER_DATE_BEFORE, offerDateBefore);

		try {
			String sessionTime = this.getCurrentSessionTime();
			
			Query query = new Query();
			SavedQueryResults results = query
					.queryAllItemRevisionByAttribute(attributeMap);
			request.getSession().setAttribute("results" + sessionTime, results);
			int allItemsCount = this.getCount(IConstants.PERCOUNT, results);

			List<PictureVO> list = query.getPictureVOByPage(results, 1,
					IConstants.PERCOUNT, request.getSession());

			Map<String, PictureVO> map = (Map<String, PictureVO>) request
					.getSession().getAttribute("map");
			this.initMap(map, list);

			request.getSession().setAttribute("map", map);
			request.getSession().setAttribute("resultList" + sessionTime, list);
			request.setAttribute("sessionTime",sessionTime);
			request.getSession().setAttribute("count", allItemsCount);
			request.getSession().setAttribute("message", "search");
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

	private void initMap(Map<String, PictureVO> map, List<PictureVO> list) {
		for (PictureVO pic : list) {
			map.put(pic.getKey(), pic);
		}
	}

	private int getCount(int perCount, SavedQueryResults results) {
		int allItemsCount = results.numOfObjects;
		int count = allItemsCount / perCount + 1;

		if (allItemsCount % perCount == 0) {
			count = allItemsCount / perCount;
		}
		return allItemsCount;
	}
	
	private String getCurrentSessionTime() {
		return System.currentTimeMillis() + "";
	}
}