package com.saturn.action.ph;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.ph.FormManager;
import com.saturn.ph.PH;
import com.saturn.tc.utils.DatasetUtils;
import com.saturn.tc.utils.DateUtils;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class PreviewAction implements IAction {

	public String requestMapping() {
		return "/app/pep/do/preview.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String uid = (String)request.getParameter("uid");
		/*Integer current = Integer.parseInt(request.getParameter("current").toString());
		if(current != null){
			int curr = current.intValue();
			if(curr >= 0){
				request.setAttribute("current", String.valueOf(curr));
			}
		}*/
		ModelObject object = PH.getDataService().loadModelObjectRefresh(uid);
		
		if (object == null) {
			return new JspErrorView("Uid=[" + uid + "] 不存在");
		}

		String type = object.getType().getName();
		if(type.equalsIgnoreCase("FV9PHJPEG")){
			try {
				type = object.getProperty("object_name").getDisplayableValue();
			} catch (NotLoadedException e) {
				e.printStackTrace();
			}
		}
		
		Map<String, Object> form = FormManager.getFormValue(type, uid, true);
		request.setAttribute("uid", uid);
		request.setAttribute("type", type);
		request.setAttribute("form", form);
		
		if (request.getSession().getAttribute("FV9_11ProjectTermin") == null ||
				request.getSession().getAttribute("FV9_11VorserienTer") == null) {
			//获取公用的信息
			List<String> otherUids = new ArrayList<String>();//(List)form.get("fv9OtherUid");
			otherUids.add("wVJ9jSq148kgXB");
			otherUids.add("wxC9jSq148kgXB");
			
			if (otherUids != null && otherUids.size() > 0) {
				
				for (int k=0; k<otherUids.size(); k++) {
					//获取UID
					String public_uid = otherUids.get(k);
					//根据UID获取对象
					ModelObject public_object = PH.getDataService().loadModelObjectRefresh(public_uid);
					if (public_object == null) {
						return new JspErrorView("public_uid=[" + public_uid + "] 不存在");
					}
					//获取对象的类型
					String public_type = public_object.getType().getName();
					Map<String, Object> otherForm = FormManager.getFormValue(
							public_type, 
							public_uid, 
							true);
					
					if ("FV9_11ProjectTermin".equals(public_type)) {
						request.getSession().setAttribute(public_type, otherForm);
						
						//里程碑开始时间
						String VFF = (String)otherForm.get("fv9VFFMLDate") + " 00:00";   //2013-07-31
						String PVS = (String)otherForm.get("fv9PVSMLDate") + " 00:00"; //2013-10-31
						String OS = (String)otherForm.get("fv90SMLDate") + " 00:00"; //2014-03-29
						String SOP = (String)otherForm.get("fv9SOPMLDate") + " 00:00"; //2014-06-30
						String ME = (String)otherForm.get("fv9MEMLDate") + " 00:00";
						
						//里程碑开始周
						int VFF_KW =DateUtils.getWeekOfYear(VFF);
						int PVS_KW = DateUtils.getWeekOfYear(PVS);
						int OS_KW = DateUtils.getWeekOfYear(OS);
						int SOP_KW = DateUtils.getWeekOfYear(SOP);
						int ME_KW = DateUtils.getWeekOfYear(ME);
						
						//每个里程碑经历的周数
						int vffKWNo = 0, pvsKWNo = 0, osKWNo = 0, sopKWNo = 0;
						vffKWNo = DateUtils.getWeekNumBetweenStartAndEnd(VFF, PVS);
						pvsKWNo = DateUtils.getWeekNumBetweenStartAndEnd(PVS, OS);
						osKWNo = DateUtils.getWeekNumBetweenStartAndEnd(OS, SOP);
						sopKWNo = DateUtils.getWeekNumBetweenStartAndEnd(SOP, ME);
						
						//计算每个里程碑所占的比例
						double sum = Double.parseDouble((vffKWNo + pvsKWNo + osKWNo + sopKWNo) + "");
						double vff = 0.0, pvs = 0.0, os = 0.0, sop = 0.0;
						vff = (vffKWNo/sum)*100; System.out.println("vff = " + vff);
						pvs = (pvsKWNo/sum)*100; System.out.println("pvs = " + pvs);
						os = (osKWNo/sum)*100; System.out.println("os = " + os);
						sop = (sopKWNo/sum)*100; System.out.println("sop = " + sop);

						request.getSession().setAttribute("SOP_DATE", SOP);
					}
					
					if ("FV9_11VorserienTer".equals(public_type)) {
						request.getSession().setAttribute(public_type, otherForm);
						
						String fv9VFFTBTZP5 = (String)otherForm.get("fv9VFFTBTZP5");
						String fv9VFFTBTZP7 = (String)otherForm.get("fv9VFFTBTZP7");
						
						String fv9PVSTBTZP5 = (String)otherForm.get("fv9PVSTBTZP5");
						String fv9PVSTBTZP7 = (String)otherForm.get("fv9PVSTBTZP7");
						
						String fv90STBTZP5 = (String)otherForm.get("fv90STBTZP5");
						String fv90STBTZP7 = (String)otherForm.get("fv90STBTZP7");
						
						//ZP7的SOP取自项目的SOP，ZP5的SOP是ZP7 SOP的前两周
						String fv9ZP7SOP = (String)request.getSession().getAttribute("SOP_DATE");
						String fv9ZP5SOP = DateUtils.oneDateAddOrSubDays(fv9ZP7SOP, 2, "-");
						
						request.getSession().setAttribute("fv9VFFTBTZP5", fv9VFFTBTZP5);
						request.getSession().setAttribute("fv9VFFTBTZP7", fv9VFFTBTZP7);
						request.getSession().setAttribute("fv9PVSTBTZP5", fv9PVSTBTZP5);
						request.getSession().setAttribute("fv9PVSTBTZP7", fv9PVSTBTZP7);
						request.getSession().setAttribute("fv90STBTZP5", fv90STBTZP5);
						request.getSession().setAttribute("fv90STBTZP7", fv90STBTZP7);
						request.getSession().setAttribute("fv9ZP7SOP", fv9ZP7SOP);
						request.getSession().setAttribute("fv9ZP5SOP", fv9ZP5SOP);
						
					}
					
				}
				
				
				
				
				
				
				
			}
			
			
		}
		
		
		
		return new JspView(FormManager.getJspPath(type));
	}
}
