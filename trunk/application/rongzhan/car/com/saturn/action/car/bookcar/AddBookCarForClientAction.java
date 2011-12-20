package com.saturn.action.car.bookcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.car.BookCar;
import com.saturn.website.Message;

public class AddBookCarForClientAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		BookCar vo = BeanUtils.getBean(request, BookCar.class);
		if (BookCar.add(vo) == 1) {
			return new JsonView("true");
		} else {
			return new JsonView("false");
		}
	}

	public String requestMapping() {
		return "/app/car/bookcar/addByClient.do";
	}
	
}
