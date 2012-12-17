package com.saturn.action.ph.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.ph.PH;
import com.saturn.ph.PHBuffer;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.DateUtils;
import com.saturn.tc.utils.SortUtils;
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.services.strong.core.DataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Group;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.TC_Project;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.exceptions.NotLoadedException;

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
		
		final EasyDataManagementService service = new EasyDataManagementService(tcsession);
		
		try {
			user = tcsession.login(username, password);
			
			if(tcsession != null){
				request.getSession().setAttribute("TC_SESSION", tcsession);
			}
			
			if(user != null){
				request.getSession().setAttribute("TC_USER", user);
				request.getSession().setAttribute("TC_USER_UID", user.getUid());
				
				//获取用户所在的项目
				ModelObject[] projectList = (ModelObject[])user.get_user_projects();
				//此用户的项目不为空，继续寻找Item
				if (projectList != null && projectList.length > 0) {
					List<Map<String,Item>> itemList = WorkspaceUtils.
						initPHItemlist(tcsession, user, projectList);
				
				//将获取到的item按创建时间倒序排序
				SortUtils.sortPHReportItem(service, itemList);
				
				request.getSession().setAttribute("CURR_USER_PHITEM_LIST", itemList);
				
				}
			}
			
			return new JspView("/app/pep/initworkspace.jsp");
		} catch (NotLoadedException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", "用户项目有误，请修改项目后重新登录!");
			return new JspView("/app/pep/login.jsp");
		} catch (InvalidCredentialsException e) {
			request.setAttribute("msg", "用户名或密码错误，请重新登录!");
			return new JspView("/app/pep/login.jsp");
		}
		
	}

}
