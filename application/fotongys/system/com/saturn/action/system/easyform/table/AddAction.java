package com.saturn.action.system.easyform.table;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.Table;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Table vo = BeanUtils.getBean(request, Table.class);
		
		if (Table.add(vo) == 1) {
			return new JspView("/app/system/easyform/table/show.jsp");
		} else {
			return new JspErrorView("添加表失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/table/add.action";
	}
	
}
