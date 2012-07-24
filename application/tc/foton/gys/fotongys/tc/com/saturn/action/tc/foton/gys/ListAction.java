package com.saturn.action.tc.foton.gys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.Mail;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.client.model.strong.WorkspaceObject;

public class ListAction implements IAction {

	public final static String TC_MAIL_LIST = "TC_MAIL_LIST";

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		TCSession session = (TCSession) request.getSession().getAttribute(
				"TC_session");

		User user = (User) request.getSession().getAttribute("TC_USER");

		WorkspaceObject[] workspaceObjects = (WorkspaceObject[]) request
				.getSession().getAttribute(TC_MAIL_LIST);

		if (workspaceObjects == null) {
			workspaceObjects = Mail.getAllTcMailObject(user, session);
			request.getSession().setAttribute(TC_MAIL_LIST, workspaceObjects);
		}

		DataGridInfo dataGridInfo = new DataGridInfo(request);
		Mail vo = BeanUtils.getBean(request, Mail.class);
		ListData<Mail> data = Mail.getAll(user, session, workspaceObjects, vo,
				dataGridInfo.getStartPage(), dataGridInfo.getRows());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	public String requestMapping() {
		return "/app/tc/foton/gys/list.action";
	}

}
