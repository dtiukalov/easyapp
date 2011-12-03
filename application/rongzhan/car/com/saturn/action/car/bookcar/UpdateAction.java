package com.saturn.action.car.bookcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.BookCar;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		BookCar dict = BeanUtils.getBean(request, BookCar.class);
		
		if (BookCar.edit(dict) == 1) {
			return new JspView("/app/car/bookcar/show.jsp");
		} else {
			return new JspErrorView("修改留言失败");
		}
	}

	public String requestMapping() {
		return "/app/car/bookcar/update.action";
	}

}
