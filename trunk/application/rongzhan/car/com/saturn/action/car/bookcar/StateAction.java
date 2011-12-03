package com.saturn.action.car.bookcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.BookCar;

public class StateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String show = request.getParameter("state");
		
		BookCar.state(show);
		return new JspView("/app/car/bookcar/show.jsp");
	}

	public String requestMapping() {
		return "/app/car/bookcar/state.action";
	}

}
