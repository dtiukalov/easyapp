package com.saturn.action.car.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.car.NewCar;

public class UpdateNewCarAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		NewCar newcar = BeanUtils.getBean(request, NewCar.class);
		
		if (NewCar.edit(newcar) == 1) {
			String cid = newcar.getCid();
			return new JspView("/app/car/admin/newcarShow.jsp?cid="+cid);
		} else {
			return new JspErrorView("修改留言失败");
		}
	}

	public String requestMapping() {
		return "/app/car/admin/newcarUpdate.action";
	}

}
