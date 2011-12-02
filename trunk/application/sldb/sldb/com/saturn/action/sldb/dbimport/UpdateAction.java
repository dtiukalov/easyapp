package com.saturn.action.sldb.dbimport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Import;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Import dict = BeanUtils.getBean(request, Import.class);
		
		if (Import.edit(dict) == 1) {
			return new JspView("/app/sldb/import/show.jsp");
		} else {
			return new JspErrorView("修改数据导入失败");
		}
	}

	public String requestMapping() {
		return "/app/sldb/import/update.action";
	}

}
