package com.saturn.action.system.easyform.form;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.FormItem;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FormItem dict = BeanUtils.getBean(request, FormItem.class);
		String formType = request.getParameter("formType");
		String tableId = request.getParameter("tableId");
		
		if (FormItem.edit(dict) == 1) {
			return new JspView("/app/system/easyform/form/show.jsp?tableId="+tableId + "&formType="+formType);
		} else {
			return new JspErrorView("修改表单属性失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/form/update.action";
	}
}
