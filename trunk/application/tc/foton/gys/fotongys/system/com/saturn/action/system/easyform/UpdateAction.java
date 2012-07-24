package com.saturn.action.system.easyform;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.TableUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.easyform.Table;
import com.saturn.system.easyform.TableDao;

public class UpdateAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String tableId = request.getParameter("tableId");
		Map vo = TableUtils.getBean(request, tableId);
		String name = Table.get(tableId).getName();
		
		if (TableDao.edit(vo, tableId) == 1) {
			return new JspView("/app/system/easyform/show.jsp?tableId=" + tableId);
		} else {
			return new JspErrorView("修改" + name + "失败");
		}
	}

	public String requestMapping() {
		return "/app/system/easyform/update.action";
	}
}
