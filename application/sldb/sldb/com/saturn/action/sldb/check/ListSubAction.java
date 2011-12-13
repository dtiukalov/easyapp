package com.saturn.action.sldb.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.IdCheck;
import com.saturn.sldb.PersonSub;

public class ListSubAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		DataGridInfo dataGridInfo = new DataGridInfo(request);

		String pid = request.getParameter("pid");

		PersonSub person = PersonSub.get(pid);
		String id = pid + "_" + person.getIdentify();
		
		ListData<IdCheck> data = IdCheck.getAll(id, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}
	
	public String requestMapping() {
		return "/app/sldb/check/listSub.action";
	}
	
}





