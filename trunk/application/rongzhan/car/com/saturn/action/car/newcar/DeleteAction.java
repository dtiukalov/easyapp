package com.saturn.action.car.newcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.NewCar;

public class DeleteAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		NewCar.removes(ids);
		return new JspView("/app/car/newcar/show.jsp");
	}

	public String requestMapping() {
		return "/app/car/newcar/delete.action";
	}

}
