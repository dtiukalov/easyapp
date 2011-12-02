package com.saturn.action.sldb.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportItem;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ImportItem vo = BeanUtils.getBean(request, ImportItem.class);
		String infoId = request.getParameter("infoId");
		
		if (ImportItem.add(vo) == 1) {
			return new JspView("/app/sldb/item/show.jsp?infoId="+infoId);
		} else {
			return new JspErrorView("添加导入表格字段信息失败");
		}
	}

	public String requestMapping() {
		return "/app/sldb/item/add.action";
	}
	
}
