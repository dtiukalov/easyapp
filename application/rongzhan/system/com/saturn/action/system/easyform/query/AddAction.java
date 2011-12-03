package com.saturn.action.system.easyform.query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.QueryFormItem;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		QueryFormItem vo = BeanUtils.getBean(request, QueryFormItem.class);
		
		if (QueryFormItem.add(vo) == 1) {
			return new JspView("/app/system/easyform/query/show.jsp");
		} else {
			return new JspErrorView("添加查询表单项失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/query/add.action";
	}
	
}
