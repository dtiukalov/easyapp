package com.saturn.action.system.easyform.tablecolumn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.TableColumn;

public class UpdateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		TableColumn dict = BeanUtils.getBean(request, TableColumn.class);
		
		if (TableColumn.edit(dict) == 1) {
			return new JspView("/app/system/easyform/tablecolumn/show.jsp");
		} else {
			return new JspErrorView("修改表列失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/tablecolumn/update.action";
	}
}
