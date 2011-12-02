package com.saturn.action.sldb.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.ImportItem;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		ImportItem dict = BeanUtils.getBean(request, ImportItem.class);
		String infoId = request.getParameter("infoId");
		
		if (ImportItem.edit(dict) == 1) {
			return new JspView("/app/sldb/item/show.jsp?infoId="+infoId);
		} else {
			return new JspErrorView("修改导入表格字段信息失败");
		}
	}

	public String requestMapping() {
		return "/app/sldb/item/update.action";
	}

}
