package com.saturn.action.auth.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.auth.User;

public class ListUserAction implements IAction {

	public String requestMapping() {
		return "/app/auth/user/listUsers.action";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		DataGridInfo dataGridInfo = new DataGridInfo(request);

		User user = new User(request.getParameter("id"),
				request.getParameter("name"), null,
				request.getParameter("email"), request.getParameter("phone"));

		ListData<User> data = User.getUsers(user, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}
}
