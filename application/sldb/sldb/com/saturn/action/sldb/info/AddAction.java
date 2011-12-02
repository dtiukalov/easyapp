package com.saturn.action.sldb.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportInfo;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ImportInfo vo = BeanUtils.getBean(request, ImportInfo.class);
		
		if (ImportInfo.add(vo) == 1) {
			return new JspView("/app/sldb/info/show.jsp");
		} else {
			return new JspErrorView("添加导入表格信息失败");
		}
	}

	public String requestMapping() {
		return "/app/sldb/info/add.action";
	}
	
}
