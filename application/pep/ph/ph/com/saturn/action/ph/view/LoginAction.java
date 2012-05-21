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
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.soa.client.model.strong.Item;
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
				
				List<Map<String,Item>>  itemList = WorkspaceUtils.
					initPHItemlist(tcsession, user);
				
				//将获取到的item按创建时间倒序排序
				Collections.sort(itemList, new Comparator<Map<String,Item>>() {
					public int compare(Map<String,Item> map1, Map<String,Item> map2) {
						String key1 = map1.keySet().iterator().next().toString();
						Item item1 = map1.get(key1);
						String key2 = map2.keySet().iterator().next().toString();
						Item item2 = map2.get(key2);
				System.out.println("key1 = " + key1 + " key2 = " + key2);
//						service.refreshObjects(item1);
//						service.refreshObjects(item2);
						service.getProperties(item1, "creation_date");
						service.getProperties(item2, "creation_date");
						Date date1 = new Date();
						Date date2 = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:MM");
						try {
							date1 = item1.getProperty("creation_date").getDateValue().getTime();
							date2 = item2.getProperty("creation_date").getDateValue().getTime();
				System.out.println("date1 = " + date1 + " date2 = " + date2);
				
						} catch (NotLoadedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
						long time1 = date1.getTime();
						long time2 = date2.getTime();

						int result = (int)(time2 - time1);
				System.out.println("result = " + result);		
						return result;
					}
				});
				
//				ComparatorDate comparator = new ComparatorDate();  
//				Collections.sort(itemList, comparator);
				
				request.getSession().setAttribute("CURR_USER_PHITEM_LIST", itemList);
				
				/*PHBuffer buffer = (PHBuffer) request.getSession().getAttribute(PHBuffer.PH_BUFFER);
				if (buffer != null) {
					request.getSession().removeAttribute(PHBuffer.PH_BUFFER);
				}*/
			}
			
			return new JspView("/app/pep/initworkspace.jsp");
		} catch (InvalidCredentialsException e) {
			request.setAttribute("msg", "用户名或密码错误，请重新登录!");
			return new JspView("/app/pep/login.jsp");
		}
		
	}

}
