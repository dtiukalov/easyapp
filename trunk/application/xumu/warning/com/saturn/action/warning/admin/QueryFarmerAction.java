package com.saturn.action.warning.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.warning.date.farmer.Farmer;

public class QueryFarmerAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");

		Farmer farmer = Farmer.get(id);
		
		request.setAttribute("farmer", farmer);
		return new JspView("/app/warning/admin/itemShow.jsp");
	}

	public String requestMapping() {
		return "/app/warning/farmer/queryFarmer.action";
	}

}
