package com.saturn.action.sldb.person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.PersonState;

public class StateAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		PersonState vo = BeanUtils.getBean(request, PersonState.class);
		
		ListData<PersonState> data = PersonState.getAll(vo, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	public String requestMapping() {
		return "/app/sldb/person/state.action";
	}

}
