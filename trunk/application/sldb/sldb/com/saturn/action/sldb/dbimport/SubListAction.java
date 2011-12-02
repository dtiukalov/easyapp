package com.saturn.action.sldb.dbimport;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.Import;
import com.saturn.sldb.ImportUtils;

public class SubListAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		DataGridInfo dataGridInfo = new DataGridInfo(request);

		String id = request.getParameter("iid");
		Map vo = ImportUtils.getBean(request, id);
		
		ListData<HashMap> data = Import.getAllImport(vo, id, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(ImportUtils.getDataGridJSON(data.getTotal(),
				data.getList(), null));
	}
	
	public String requestMapping() {
		return "/app/sldb/import/sub/list.action";
	}
	
}





