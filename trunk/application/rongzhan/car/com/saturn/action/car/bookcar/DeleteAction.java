package com.saturn.action.car.bookcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.BookCar;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		BookCar.removes(ids);
		return new JspView("/app/car/bookcar/show.jsp");
	}

	public String requestMapping() {
		return "/app/car/bookcar/delete.action";
	}

}
