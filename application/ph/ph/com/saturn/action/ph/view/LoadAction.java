package com.saturn.action.ph.view;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.ph.PH;
import com.saturn.ph.PHManager;
import com.saturn.tc.utils.ItemUtils;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Item;

public class LoadAction implements IAction {

	public String requestMapping() {
		return "/app/pep/view/load.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String name = (String)request.getParameter("name");
//		String platformType = (String)request.getParameter("platformType");
		
		Item item = PH.getQueryService().queryItemByName(name);
		
		if (item == null) {
			return new JspErrorView("Item:Name=[" + name + "] 不存在");
		}
		
		String project = name.split("_")[0];
		String roadmap = name.split("_")[1];
		request.getSession().setAttribute("milepost", roadmap);
		request.getSession().setAttribute("project", project);
		
		Map<String, Object> formIds = ItemUtils.getLastRevisionFormIds(item);
		List<String> indexes = new ArrayList<String>();
		
		if(formIds.size() > 0){
			indexes = PHManager.getIndexes(roadmap, formIds);
		}
		request.getSession().setAttribute("indexes", indexes);
		request.setAttribute("current", "1");
		
		//PH下存在数据
		if (indexes != null && indexes.size() > 0) {
			return new JspView(indexes.get(0));
		}
		//PH下不存在符合条件的数据
		return new JspView("/app/pep/blank.jsp");
	}
	
}
