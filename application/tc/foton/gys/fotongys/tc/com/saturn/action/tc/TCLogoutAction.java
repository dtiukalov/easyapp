package com.saturn.action.tc;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.action.tc.foton.gys.DownLoadAction;
import com.saturn.action.tc.foton.gys.ListAction;
import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.DownLoadAttachmentUtil;
import com.saturn.tc.utils.International;
import com.teamcenter.soa.client.model.strong.User;

public class TCLogoutAction implements IAction {

	public String requestMapping() {
		return "/app/tc/logout.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		TCSession session = (TCSession) request.getSession().getAttribute(
				"TC_session");
		clearCache(request, session);

		request.getSession().removeAttribute("TC_USER");
		request.getSession().removeAttribute("authUser");
		request.getSession().removeAttribute("TC_session");
		request.getSession().removeAttribute(ListAction.TC_MAIL_LIST);
		request.getSession().removeAttribute(International.LOCAL);

		return new JspView("/app/tc/index.jsp");
	}

	@SuppressWarnings("deprecation")
	private void clearCache(HttpServletRequest request, TCSession session) {
		User user = (User)request.getSession().getAttribute("TC_USER");
		if (user == null) {
			return;
		}
		
		String attachmentPath = request.getRealPath("/");
		String uid = user.getUid();
		String dir = DownLoadAction.ATTACHMENT_ROOT + File.separator
				+ DateUtils.getSystemDate() + File.separator + uid;

		String dir2 = DownLoadAction.ATTACHMENT_ROOT + File.separator + uid;

		if (session != null) {
			session.logout();
		}

		try {
			DownLoadAttachmentUtil.deleteFile(attachmentPath + dir);
			DownLoadAttachmentUtil.deleteFile(attachmentPath + dir2);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
