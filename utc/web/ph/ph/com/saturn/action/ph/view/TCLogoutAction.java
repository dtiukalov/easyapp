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
		
		request.getSession().removeAttribute("TC_SESSION"); //TC_SESSION
		request.getSession().removeAttribute("TC_USER"); //TC_USER
		request.getSession().removeAttribute("TC_USER_UID"); //TC_USER_UID
		request.getSession().removeAttribute("CURR_USER_PHITEM_LIST"); //符合条件的itemList
		request.getSession().removeAttribute("CURR_USER_GROUP"); //Item所属组织
		
		request.getSession().removeAttribute("FV9_11ProjectTermin"); //1.1 ProjectTemin
		request.getSession().removeAttribute("FV9_11VorserienTer");//1.1 Vorserienterminplan
		request.getSession().removeAttribute("FuntionsmasseUID");//3.4 Funktionsmaße nach Bauteilen的UID
		
		request.getSession().removeAttribute("DATE_VFF"); //VFF日期
		request.getSession().removeAttribute("DATE_PVS");//PVS日期
		request.getSession().removeAttribute("DATE_0S");//0S日期
		request.getSession().removeAttribute("DATE_SOP");//SOP日期
		request.getSession().removeAttribute("DATE_ME");//ME日期
		
		request.getSession().removeAttribute("KW_VFF");//VFF周数
		request.getSession().removeAttribute("KW_PVS");//PVS周数
		request.getSession().removeAttribute("KW_0S");//0S周数
		request.getSession().removeAttribute("KW_SOP");//SOP周数
		request.getSession().removeAttribute("KW_ME");//ME周数
		
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
		
		request.getSession().removeAttribute("milepost");//里程碑信息
		request.getSession().removeAttribute("project");//项目信息
		request.getSession().removeAttribute("indexes"); //页面索引
		
		request.getSession().removeAttribute("fv9ReportKW"); //汇报周
		request.getSession().removeAttribute("creation_date"); //创建日期
		
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
		
//		都不存在，即返回
		if(!Web.getObjectYesOrNo(userUid) && !Web.getObjectYesOrNo(defaultUserUid)){
			return ;
		}
//		if(!Web.getObjectYesOrNo(defaultUserUid)){
//			return ;
//		}
		
		String datasetpath = "attachment" + File.separator + userUid + File.separator;
		String defaultdatasetpath = "attachment" + File.separator + userUid + File.separator;
		
		String path = request.getRealPath("/") ;
		//判断realPath后有没有 “/”没有就加上
		if(Web.getObjectYesOrNo(path)){
			if(path.split("ph")[1]!= File.separator){
				path = path + File.separator;
				System.out.println("path: " + path);
			}
		}

		try {
			//清理缓存
			System.out.println("清理缓存");
			System.out.println(path + datasetpath);
			deleteFile(path + datasetpath);
			System.out.println(path + defaultdatasetpath);
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

