package com.saturn.action.warning.farmer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.warning.date.farmer.FarmerSpend;

public class SpendAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Map spends = (Map)request.getSession().getAttribute(FarmerSpend.SESSION_SPEND);
		FarmerSpend p1 = (FarmerSpend)spends.get("人员工资");
		FarmerSpend p2 = (FarmerSpend)spends.get("疫苗、治疗、劁猪费");
		FarmerSpend p3 = (FarmerSpend)spends.get("水、电、燃料费");
		
		inital(p1, "1", request);
		inital(p2, "2", request);
		inital(p3, "3", request);
		
		return new JspView("/app/warning/farmer/main.jsp");
	}
	
	public void inital(FarmerSpend spend, String postfix, HttpServletRequest request) {
		String price = request.getParameter("price" + postfix);
		
		if (price != null && !"".equals(price.trim())) {
			spend.setPrice(price);
		} else {
			spend.setPrice("");
		}
	}

	public String requestMapping() {
		return "/app/warning/farmer/spend.do";
	}
	
}
