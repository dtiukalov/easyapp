package com.saturn.action.sldb.person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Person dict = BeanUtils.getBean(request, Person.class);
		
		if (Person.edit(dict) == 1) {
			return new JspView("/app/sldb/person/apply.jsp");
		} else {
			return new JspErrorView("修改申请低保信息失败");
		}
	}

	public String requestMapping() {
		return "/app/sldb/person/update.action";
	}

}
