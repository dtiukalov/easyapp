package com.saturn.action.car.bookcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.BookCar;

public class QueryAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		BookCar vo = BookCar.get(id);
		
		request.setAttribute("bookcar", vo);
		return new JspView("/app/car/bookcar/edit.jsp");
	}

	public String requestMapping() {
		return "/app/car/bookcar/query.action";
	}

}
