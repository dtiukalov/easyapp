package com.saturn.action.tc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.action.tc.foton.gys.ListAction;
import com.saturn.app.utils.CodeUtils;
import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.foton.gys.UserInfo;
import com.saturn.tc.utils.WorkspaceUtils;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.schemas.soa._2006_03.exceptions.InvalidCredentialsException;
import com.teamcenter.soa.client.model.strong.Person;
import com.teamcenter.soa.client.model.strong.User;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class TCLoginAction implements IAction {

	public String requestMapping() {
		return "/app/tc/login.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		request.getSession().removeAttribute(ListAction.TC_MAIL_LIST);
		
		String userid = (String) request.getParameter("name");
		String password = (String) request.getParameter("password");
		
		if(userid == null || userid.equalsIgnoreCase("")){
			request.setAttribute("msg", "请输入用户名!");
			return new JspView("/app/tc/index.jsp");
		}
		
		if(password == null || password.equalsIgnoreCase("") ){
			request.setAttribute("msg", "请输入密码!");
			return new JspView("/app/tc/index.jsp");
		}
	
		UserInfo user = UserInfo.get(userid);

		if(user == null){//user为空，说明DB中没有这个用户
			if(userid.equalsIgnoreCase("admin") && password.equalsIgnoreCase(WorkspaceUtils.GYS_TC_PASSWORD)){
				UserInfo adminuser = new UserInfo();
				adminuser.setUserid(userid);
				adminuser.setUserpass(WorkspaceUtils.GYS_TC_PASSWORD);
				UserInfo.addUserInfotoDB(adminuser);
				request.getSession().setAttribute("authUser", adminuser);
				request.setAttribute("userid", userid);
				return new JspView("/app/tc/chpass.jsp");
			} else if(userid.equalsIgnoreCase("admin") && !password.equalsIgnoreCase(WorkspaceUtils.GYS_TC_PASSWORD)){
				request.setAttribute("msg", "密码错误");
				return new JspView("/app/tc/index.jsp");
			} else if(password.equalsIgnoreCase(WorkspaceUtils.GYS_TC_PASSWORD)){
				String host = WorkspaceUtils.HOST;
				TCSession tcsession = new TCSession(host);
				User tctestuser =null;
				try {
				     tctestuser = tcsession.login(userid, password);
				} catch (InvalidCredentialsException e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
					request.setAttribute("msg", "TC用户名有误,如果您不确定用户名，请联系管理员");
					return new JspView("/app/tc/index.jsp");
				}
				if(tctestuser != null){
						UserInfo dbuser = UserInfo.get(userid);
						UserInfo adduser = null;
						if(dbuser == null){
							adduser = new UserInfo();
							adduser.setUserid(userid);
							adduser.setUserpass(WorkspaceUtils.GYS_TC_PASSWORD);
							UserInfo.addUserInfotoDB(adduser);
						} else {
							adduser = dbuser;
						}
					
						EasyDataManagementService service = new EasyDataManagementService(
								tcsession);
						service.getProperties(tctestuser, "userid", "user_name", "password");
						String company = "";
						try {
							Person per = (Person) tctestuser.get_person();
							service.refreshObjects(per);
							service.getProperties(per, "PA6");
							company =  per.get_PA6();
						} catch (NotLoadedException e) {
							e.printStackTrace();
							System.out.println(e.getMessage());
							request.setAttribute("msg", "TC系统错误");
							return new JspView("/app/tc/index.jsp");
						}
						
						String datetime = DateUtils.getSystemTime();
						request.getSession().setAttribute("TC_USER", tctestuser);
						request.getSession().setAttribute("authUser", adduser);
						request.getSession().setAttribute("logintime", datetime);
						request.getSession().setAttribute("company", company);
						request.getSession().setAttribute("TC_session", tcsession);
						request.setAttribute("userid", userid);
						return new JspView("/app/tc/main.jsp");
				} else {
						request.setAttribute("msg", "TC用户名有误,如果您不确定用户名，请联系管理员");
						return new JspView("/app/tc/index.jsp");
				}
			} else {
				request.setAttribute("msg", "密码有误，请用默认密码尝试登录");
				return new JspView("/app/tc/index.jsp");
			}
		} else {
		    if(CodeUtils.encode(password).equalsIgnoreCase(user.getUserpass())){
				if(userid.equalsIgnoreCase("admin")){
					String datetime = DateUtils.getSystemTime();
					request.getSession().setAttribute("authUser", user);
					request.getSession().setAttribute("TC_session", null);
					request.getSession().setAttribute("logintime", datetime);
					return new JspView("/app/tc/manage/showUsers.jsp");
				} else {
					String host = WorkspaceUtils.HOST;
					TCSession tcsession = new TCSession(host);
					User tcuser = null;
					try {
						tcuser = tcsession.login(userid, WorkspaceUtils.GYS_TC_PASSWORD);
					} catch (InvalidCredentialsException e) {
						request.setAttribute("msg", "TC用户名有误,如果您不确定用户名，请联系管理员");
						return new JspView("/app/tc/index.jsp");
					}
						EasyDataManagementService service = new EasyDataManagementService(
								tcsession);
						service.getProperties(tcuser, "userid", "user_name", "password");
						String company = "";
						try {
							Person per = (Person) tcuser.get_person();
							service.refreshObjects(per);
							service.getProperties(per, "PA6");
							company =  per.get_PA6();
						} catch (NotLoadedException e) {
							e.printStackTrace();
							request.setAttribute("msg", "TC系统错误");
							return new JspView("/app/tc/index.jsp");
						}
						String datetime = DateUtils.getSystemTime();
						request.getSession().setAttribute("company", company);
						request.getSession().setAttribute("TC_USER", tcuser);
						request.getSession().setAttribute("authUser", user);
						request.getSession().setAttribute("TC_session", tcsession);
						request.getSession().setAttribute("logintime", datetime);
						return new JspView("/app/tc/main.jsp");
				}
			} else {
				request.setAttribute("msg", "用户密码错误");
				return new JspView("/app/tc/index.jsp");
			}
		}
	}
}
