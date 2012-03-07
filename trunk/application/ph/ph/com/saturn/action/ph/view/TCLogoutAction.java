package com.saturn.action.ph.view;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;

public class TCLogoutAction implements IAction {

	public String requestMapping() {
		return "/app/pep/logout.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		TCSession session = (TCSession) request.getSession().getAttribute(
				"TC_session");
		
		request.getSession().removeAttribute("TC_SESSION");
		request.getSession().removeAttribute("TC_USER");
		request.getSession().removeAttribute("TC_USER_UID");
		request.getSession().removeAttribute("CURR_USER_PHITEM_LIST");
		
		request.getSession().removeAttribute("FV9_11ProjectTermin");
		request.getSession().removeAttribute("FV9_11VorserienTer");
		
		request.getSession().removeAttribute("DATE_VFF");
		request.getSession().removeAttribute("DATE_PVS");
		request.getSession().removeAttribute("DATE_0S");
		request.getSession().removeAttribute("DATE_SOP");
		request.getSession().removeAttribute("DATE_ME");
		
		request.getSession().removeAttribute("KW_VFF");
		request.getSession().removeAttribute("KW_PVS");
		request.getSession().removeAttribute("KW_0S");
		request.getSession().removeAttribute("KW_SOP");
		request.getSession().removeAttribute("KW_ME");
		
		request.getSession().removeAttribute("KWNo_VFF");
		request.getSession().removeAttribute("KWNo_PVS");
		request.getSession().removeAttribute("KWNo_0S");
		request.getSession().removeAttribute("KWNo_SOP");
		
		request.getSession().removeAttribute("fv9VFFTBTZP5");
		request.getSession().removeAttribute("fv9VFFTBTZP7");
		request.getSession().removeAttribute("fv9PVSTBTZP5");
		request.getSession().removeAttribute("fv9PVSTBTZP7");
		request.getSession().removeAttribute("fv90STBTZP5");
		request.getSession().removeAttribute("fv90STBTZP7");
		request.getSession().removeAttribute("fv9ZP7SOP");
		request.getSession().removeAttribute("fv9ZP5SOP");
		
		request.getSession().removeAttribute("VFFTBTZP5");
		request.getSession().removeAttribute("VFFTBTZP7");
		request.getSession().removeAttribute("PVSTBTZP5");
		request.getSession().removeAttribute("PVSTBTZP7");
		request.getSession().removeAttribute("OSTBTZP5");
		request.getSession().removeAttribute("OSTBTZP7");
		request.getSession().removeAttribute("ZP7SOP");
		request.getSession().removeAttribute("ZP5SOP");
		
		request.getSession().removeAttribute("milepost");
		request.getSession().removeAttribute("project");
		request.getSession().removeAttribute("indexes");

		session.logout();
		
		return new JspView("/app/tc/index.jsp");
	}


}

