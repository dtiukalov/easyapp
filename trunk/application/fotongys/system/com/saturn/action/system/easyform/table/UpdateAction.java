package com.saturn.action.system.easyform.table;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.Table;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Table dict = BeanUtils.getBean(request, Table.class);
		
		if (Table.edit(dict) == 1) {
			return new JspView("/app/system/easyform/table/show.jsp");
		} else {
			return new JspErrorView("修改表失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/table/update.action";
	}
}
