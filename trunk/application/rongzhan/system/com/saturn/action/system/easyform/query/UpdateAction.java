package com.saturn.action.system.easyform.query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.QueryFormItem;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String tableId = request.getParameter("tableId");
		QueryFormItem dict = BeanUtils.getBean(request, QueryFormItem.class);
		
		if (QueryFormItem.edit(dict) == 1) {
			return new JspView("/app/system/easyform/query/show.jsp?tableId=" + tableId);
		} else {
			return new JspErrorView("修改查询表单属性失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/query/update.action";
	}
}
