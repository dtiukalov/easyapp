package com.saturn.action.warning.farmer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.warning.date.farmer.FarmerForage;

public class ForageAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Map forages = (Map)request.getSession().getAttribute(FarmerForage.SESSION_FORAGE);
		FarmerForage p1 = (FarmerForage)forages.get("浓缩料");
		FarmerForage p2 = (FarmerForage)forages.get("玉米");
		FarmerForage p3 = (FarmerForage)forages.get("麸皮");
		FarmerForage p4 = (FarmerForage)forages.get("仔猪全价料");
		FarmerForage p5 = (FarmerForage)forages.get("育肥猪全价料");
		
		inital(p1, "1", request);
		inital(p2, "2", request);
		inital(p3, "3", request);
		inital(p4, "4", request);
		inital(p5, "5", request);
		
		return new JspView("/app/warning/farmer/main.jsp");
	}
	
	public void inital(FarmerForage forage, String postfix, HttpServletRequest request) {
		String num = request.getParameter("num" + postfix);
		String price = request.getParameter("price" + postfix);
		String total = request.getParameter("total" + postfix);
		
		if (num != null && !"".equals(num.trim())) {
			forage.setNum(num);
		} else {
			forage.setNum("");
		}
		
		if (price != null && !"".equals(price.trim())) {
			forage.setPrice(price);
		} else {
			forage.setPrice("");
		}
		
		if (total != null && !"".equals(total.trim())) {
			forage.setTotal(total);
		} else {
			forage.setTotal("");
		}
	}

	public String requestMapping() {
		return "/app/warning/farmer/forage.action";
	}
	
}
