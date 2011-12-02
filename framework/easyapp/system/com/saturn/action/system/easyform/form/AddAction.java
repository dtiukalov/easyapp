package com.saturn.action.system.easyform.form;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.FormItem;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		FormItem vo = BeanUtils.getBean(request, FormItem.class);
		String formType = request.getParameter("formType");
		String tableId = request.getParameter("tableId");
		
		if (FormItem.add(vo) == 1) {
			return new JspView("/app/system/easyform/form/show.jsp?tableId="+tableId+"&formType="+formType);
		} else {
			return new JspErrorView("添加表单项失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/form/add.action";
	}
	
}
