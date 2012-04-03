package com.saturn.action.warning.farmer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.Dict;
import com.saturn.warning.date.farmer.FarmerPig;

public class WashOutAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Map pigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_WASHOUT);
		FarmerPig p1 = (FarmerPig)pigs.get("能繁母猪");
		FarmerPig p2 = (FarmerPig)pigs.get("后备母猪");
		
		inital(p1, "1", request);
		inital(p2, "2", request);
		
		return new JspView("/app/warning/farmer/main.jsp");
	}
	
	public void inital(FarmerPig pig, String postfix, HttpServletRequest request) {
		String num = request.getParameter("num" + postfix);
		String price = request.getParameter("price" + postfix);
		String total = request.getParameter("total" + postfix);
		
		if (num != null && !"".equals(num.trim())) {
			pig.setNum(num);
		} else {
			pig.setNum("");
		}
		
		if (price != null && !"".equals(price.trim())) {
			pig.setPrice(price);
		} else {
			pig.setPrice("");
		}
		
		if (total != null && !"".equals(total.trim())) {
			pig.setTotal(total);
		} else {
			pig.setTotal("");
		}
	}

	public String requestMapping() {
		return "/app/warning/farmer/washout.action";
	}
	
}
