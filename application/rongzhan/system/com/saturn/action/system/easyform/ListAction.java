package com.saturn.action.system.easyform;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.TableUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.system.easyform.TableDao;

public class ListAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String tableId = request.getParameter("tableId");
		
		if (tableId == null) {
			return new JspErrorView("表标识为空!");
		}
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		Map vo = TableUtils.getBean(request, tableId);

		ListData<HashMap> data = TableDao.getAll(vo, tableId, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(TableUtils.getDataGridJSON(data.getTotal(),
				data.getList(), null));
	}

	public String requestMapping() {
		return "/app/system/easyform/list.action";
	}

}
