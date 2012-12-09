package com.saturn.action.ph.view;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.DateUtils;
import com.saturn.web.Web;

public class TCLogoutAction implements IAction {

	public String requestMapping() {
		return "/app/pep/logout.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		TCSession session = (TCSession) request.getSession().getAttribute(
				"TC_session");
		
		clearCache(request,session);
		
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
		
	//	session.logout();
		if (session != null) {
			session.logout();
		}
		return new JspView("/app/pep/login.jsp");
	}
	@SuppressWarnings("deprecation")
	private void clearCache(HttpServletRequest request, TCSession session) {
		Object userUid = request.getSession().getAttribute("TC_USER_UID");
		Object defaultUserUid = request.getSession().getAttribute("TC_DEFAULT_USER_UID");
		
		if(!Web.getObjectYesOrNo(userUid)){
			return ;
		}
		if(!Web.getObjectYesOrNo(defaultUserUid)){
			return ;
		}
		
		String datasetpath = "attachment" + File.separator + DateUtils.getSysTime() + File.separator + userUid + File.separator;
		String defaultdatasetpath = "attachment" + File.separator + DateUtils.getSysTime() + File.separator + userUid + File.separator;
		
		String path = request.getRealPath("/") ;
		//判断realPath后有没有 “/”没有就加上
		if(Web.getObjectYesOrNo(path)){
			if(path.split("ph")[1]!= File.separator){
				path = path + File.separator;
				System.out.println("path: " + path);
			}
		}

		try {
			deleteFile(path + datasetpath);
			deleteFile(path + defaultdatasetpath);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public static boolean deleteFile(String delpath) throws FileNotFoundException, IOException {
		try {
			File file = new File(delpath);
			if (!file.isDirectory()) {
				file.delete();
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File delfile = new File(delpath + File.separator + filelist[i]);
					if (!delfile.isDirectory()) {
						delfile.delete();
					} else if (delfile.isDirectory()) {
						deleteFile(delpath + File.separator + filelist[i]);
					}
				}
				file.delete();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		}
		return true;
	}
}

