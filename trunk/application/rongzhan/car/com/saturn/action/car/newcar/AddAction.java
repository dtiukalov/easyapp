package com.saturn.action.car.newcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.NewCar;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		NewCar vo = BeanUtils.getBean(request, NewCar.class);
		
		if (NewCar.add(vo) == 1) {
			return new JspView("/app/car/newcar/show.jsp");
		} else {
			return new JspErrorView("添加留言失败");
		}
	}

	public String requestMapping() {
		return "/app/car/newcar/add.action";
	}
	
}
