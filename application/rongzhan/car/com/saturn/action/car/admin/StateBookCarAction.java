package com.saturn.action.car.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.BookCar;

public class StateBookCarAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("state");
		
		BookCar.state(id);
		BookCar bookcar = BookCar.get(id);
		
		String cid = bookcar.getCid();
		return new JspView("/app/car/admin/bookcarShow.jsp?cid="+cid);
	}

	public String requestMapping() {
		return "/app/car/admin/state.action";
	}

}
