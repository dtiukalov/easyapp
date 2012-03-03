package com.saturn.action.tc.foton.gys;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.Attachment;
import com.teamcenter.soa.client.model.strong.User;

public class ListAttachmentAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		TCSession session = (TCSession)request.getSession().getAttribute("TC_session");
		String uid = ((User)request.getSession().getAttribute("TC_USER")).getUid();
		String attachmentPath = request.getRealPath("/");
		String id = request.getParameter("id");
		
		List<Attachment> attachment = Attachment.getByMailId( session, id, uid, attachmentPath);

		return new JsonView(JSONUtils.getDataGridJSON(attachment.size(),
				attachment));
	}
	
	public String requestMapping() {
		return "/app/tc/foton/gys/listAttachment.action";
	}
	
}





