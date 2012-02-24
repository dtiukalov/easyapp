package com.saturn.action.ph;

import java.util.ArrayList;
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
						
						String LF = (String)otherForm.get("fv9LFMLDate") + " 00:00";//2013-04-30
						String VFF = (String)otherForm.get("fv9VFFMLDate") + " 00:00";   //2013-07-31
						String PVS = (String)otherForm.get("fv9PVSMLDate") + " 00:00"; //2013-10-31
						String OS = (String)otherForm.get("fv90SMLDate") + " 00:00"; //2014-03-29
						String SOP = (String)otherForm.get("fv9SOPMLDate") + " 00:00"; //2014-06-30
						
						int LF_KW = DateUtils.getWeekOfYear(LF);
						int VFF_KW =DateUtils.getWeekOfYear(VFF);
						int PVS_KW = DateUtils.getWeekOfYear(PVS);
						int OS_KW = DateUtils.getWeekOfYear(OS);
						int SOP_KW = DateUtils.getWeekOfYear(SOP);
						
						request.getSession().setAttribute("LF_KW", LF_KW);
						request.getSession().setAttribute("VFF_KW", VFF_KW);
						request.getSession().setAttribute("PVS_KW", PVS_KW);
						request.getSession().setAttribute("OS_KW", OS_KW);
						request.getSession().setAttribute("SOP_KW", SOP_KW);
						
						//每个里程碑经历的周数
						int vffKWNo = 0, pvsKWNo = 0, osKWNo = 0, sopKWNo = 0;
						vffKWNo = DateUtils.getWeekNumBetweenStartAndEnd(LF, VFF);
						pvsKWNo = DateUtils.getWeekNumBetweenStartAndEnd(VFF, PVS);
						osKWNo = DateUtils.getWeekNumBetweenStartAndEnd(PVS, OS);
						sopKWNo = DateUtils.getWeekNumBetweenStartAndEnd(OS, SOP);
						
						request.getSession().setAttribute("vffKWNo", vffKWNo);
						request.getSession().setAttribute("pvsKWNo", pvsKWNo);
						request.getSession().setAttribute("osKWNo", osKWNo);
						request.getSession().setAttribute("sopKWNo", sopKWNo);
						
						double sum = Double.parseDouble((vffKWNo + pvsKWNo + osKWNo + sopKWNo) + "");
						double vff = 0.0, pvs = 0.0, os = 0.0, sop = 0.0;
						vff = (vffKWNo/sum)*100; System.out.println("vff = " + vff);
						pvs = (pvsKWNo/sum)*100; System.out.println("pvs = " + pvs);
						os = (osKWNo/sum)*100; System.out.println("os = " + os);
						sop = (sopKWNo/sum)*100; System.out.println("sop = " + sop);
						
						request.getSession().setAttribute("vff", vff);
						request.getSession().setAttribute("pvs", pvs);
						request.getSession().setAttribute("os", os);
						request.getSession().setAttribute("sop", sop);
					}
					
					if ("FV9_11VorserienTer".equals(public_type)) {
						request.getSession().setAttribute(public_type, otherForm);
					}
					
				}
				
				
				
				
				
				
				
			}
			
			
		}
		
		
		
		return new JspView(FormManager.getJspPath(type));
	}
}
