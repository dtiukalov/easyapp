package com.saturn.action.ph.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.ph.PH;
import com.saturn.ph.PHBuffer;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.WorkspaceUtils;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.User;

public class LoginAction implements IAction {

	public String requestMapping() {
		return "/app/pep/login.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String username = (String)request.getParameter("ua");
		String password = (String)request.getParameter("pd");
	
		TCSession tcsession = new TCSession(WorkspaceUtils.HOST);
		
		User user = null;
		
		try {
			user = tcsession.login(username, password);
			
			if(tcsession != null){
				request.getSession().setAttribute("TC_SESSION", tcsession);
			}
			
			if(user != null){
				request.getSession().setAttribute("TC_USER", user);
				request.getSession().setAttribute("TC_USER_UID", user.getUid());
				Map<String,Item>  phItemMap = WorkspaceUtils.initPHItemlist(tcsession, user);
				request.getSession().setAttribute("CURR_USER_PHITEM_LIST", phItemMap);
				
				PHBuffer buffer = (PHBuffer) request.getSession().getAttribute(PHBuffer.PH_BUFFER);
				if (buffer != null) {
					request.getSession().removeAttribute(PHBuffer.PH_BUFFER);
				}
			}
			
			return new JspView("/app/pep/initworkspace.jsp");
		} catch (InvalidCredentialsException e) {
			request.setAttribute("msg", "用户名或密码错误，请重新登录!");
			return new JspView("/app/pep/login.jsp");
		}
		
	}

}
