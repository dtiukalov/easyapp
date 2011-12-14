package com.saturn.action.website.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.website.Message;

public class AddMessageForClientAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Message vo = BeanUtils.getBean(request, Message.class);
		
		if (Message.add(vo) == 1) {
			return new JsonView("true");
		} else {
			return new JspErrorView("false");
		}
	}

	public String requestMapping() {
		return "/app/website/message/addByClient.do";
	}
	
}
