package com.saturn.action.tc;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.action.tc.foton.gys.DownLoadAction;
import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.DownLoadAttachmentUtil;

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

		return new JspView("/app/tc/index.jsp");
	}

	@SuppressWarnings("deprecation")
	private void clearCache(HttpServletRequest request, TCSession session) {
		String attachmentPath = request.getRealPath("/");
		
		String dir = DownLoadAction.ATTACHMENT_ROOT + File.separator
				+ DateUtils.getSystemDate() + File.separator
				+ request.getSession().getAttribute("TC_uid");
		
		String dir2 = DownLoadAction.ATTACHMENT_ROOT + File.separator
		+  request.getSession().getAttribute("TC_uid");
		
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
