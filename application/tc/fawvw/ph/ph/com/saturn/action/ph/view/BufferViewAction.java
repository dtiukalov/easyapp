package com.saturn.action.ph.view;

import java.util.HashMap;
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
import com.saturn.ph.PHBuffer;
import com.saturn.tc.utils.DateUtils;
import com.saturn.tc.utils.WorkspaceUtils;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class BufferViewAction implements IAction {

	public String requestMapping() {
		return "/app/pep/do/bufferview.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String uid = (String)request.getParameter("uid");
		Map<String, Object> formBuffer = null;
		
		PHBuffer buffer = (PHBuffer) request.getSession().getAttribute(PHBuffer.PH_BUFFER);
		if (buffer != null) {
			formBuffer = buffer.getFormBuffer(uid);
		}
		
		if (formBuffer == null) {
			formBuffer = new HashMap<String, Object>();
			
			ModelObject object = PH.getDataService().loadModelObjectRefresh(uid);
			
			if (object == null) {
				return new JspErrorView("Uid=[" + uid + "] 不存在");
			}
	
			String type = object.getType().getName();
			if(type.equalsIgnoreCase(WorkspaceUtils.DatasetType)){
				try {
					PH.getDataService().getProperties(object, WorkspaceUtils.DatasetPageName);
					type = object.getProperty(WorkspaceUtils.DatasetPageName).getDisplayableValue();
				} catch (NotLoadedException e) {
					e.printStackTrace();
				}
			}
			
			formBuffer.put("uid", uid);
			formBuffer.put("type", type);
			formBuffer.put("form", FormManager.getFormValue(type, uid, true));
			buffer.addBuffer(uid, formBuffer);
		} 

		Map<String, Object> form = (Map<String, Object>)formBuffer.get("form");
		String type = (String)formBuffer.get("type");
		
		request.setAttribute("uid", formBuffer.get("uid"));
		request.setAttribute("type", type);
		request.setAttribute("form", form);
		
		initcCommunalData(request,form);
		return new JspView(FormManager.getJspPath(type));
	}

	private Boolean initcCommunalData(HttpServletRequest request,Map<String, Object> form) {
		Boolean result = false;
		if (request.getSession().getAttribute("FV9_11ProjectTermin") == null ||
				request.getSession().getAttribute("FV9_11VorserienTer") == null) {
		//获取公用的信息
			List<String> otherUids = (List<String>)form.get(WorkspaceUtils.OtherUid);
			
			if (otherUids != null && otherUids.size() > 0) {
				
				for (int k=0; k<otherUids.size(); k++) {
					//获取UID
					String public_uid = otherUids.get(k);
					//根据UID获取对象
					ModelObject public_object = PH.getDataService().loadModelObjectRefresh(public_uid);
					if (public_object == null) {
						return result;
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
						String DATE_VFF = getDateValue(otherForm.get("fv9VFFMLDate")) + " 00:00";   //2013-07-31
						String DATE_PVS = getDateValue(otherForm.get("fv9PVSMLDate")) + " 00:00"; //2013-10-31
						String DATE_0S = getDateValue(otherForm.get("fv90SMLDate")) + " 00:00"; //2014-03-29
						String DATE_SOP = getDateValue(otherForm.get("fv9SOPMLDate")) + " 00:00"; //2014-06-30
						String DATE_ME = getDateValue(otherForm.get("fv9MEMLDate")) + " 00:00";
						
						request.getSession().setAttribute("DATE_VFF", DATE_VFF);
						request.getSession().setAttribute("DATE_PVS", DATE_PVS);
						request.getSession().setAttribute("DATE_0S", DATE_0S);
						request.getSession().setAttribute("DATE_SOP", DATE_SOP);
						request.getSession().setAttribute("DATE_ME", DATE_ME);
						
						request.getSession().setAttribute("SOP_DATE", getDateValue(otherForm.get("fv9SOPMLDate")));

						//里程碑开始周
						int KW_VFF =DateUtils.getWeekOfYear(DATE_VFF);
						int KW_PVS = DateUtils.getWeekOfYear(DATE_PVS);
						int KW_0S = DateUtils.getWeekOfYear(DATE_0S);
						int KW_SOP = DateUtils.getWeekOfYear(DATE_SOP);
						int KW_ME = DateUtils.getWeekOfYear(DATE_ME);
						
						request.getSession().setAttribute("KW_VFF", KW_VFF);
						request.getSession().setAttribute("KW_PVS", KW_PVS);
						request.getSession().setAttribute("KW_0S", KW_0S);
						request.getSession().setAttribute("KW_SOP", KW_SOP);
						request.getSession().setAttribute("KW_ME", KW_ME);
						
						//每个里程碑经历的周数
						int KWNo_VFF = 0, KWNo_PVS = 0, KWNo_0S = 0, KWNo_SOP = 0;
						KWNo_VFF = DateUtils.getWeekNumBetweenStartAndEnd(DATE_VFF, DATE_PVS);
						KWNo_PVS = DateUtils.getWeekNumBetweenStartAndEnd(DATE_PVS, DATE_0S);
						KWNo_0S = DateUtils.getWeekNumBetweenStartAndEnd(DATE_0S, DATE_SOP);
						KWNo_SOP = DateUtils.getWeekNumBetweenStartAndEnd(DATE_SOP, DATE_ME);
						
						request.getSession().setAttribute("KWNo_VFF", KWNo_VFF);
						request.getSession().setAttribute("KWNo_PVS", KWNo_PVS);
						request.getSession().setAttribute("KWNo_0S", KWNo_0S);
						request.getSession().setAttribute("KWNo_SOP", KWNo_SOP);
						
						//计算每个里程碑所占的比例
						double sum = Double.parseDouble((KWNo_VFF + KWNo_PVS + KWNo_0S + KWNo_SOP) + "");
						double vff = 0.0, pvs = 0.0, os = 0.0, sop = 0.0;
						vff = (KWNo_VFF/sum)*100;
						pvs = (KWNo_PVS/sum)*100;
						os = (KWNo_0S/sum)*100;
						sop = (KWNo_SOP/sum)*100;
					}
					
					if ("FV9_11VorserienTer".equals(public_type)) {
						request.getSession().setAttribute(public_type, otherForm);
						
						String fv9VFFTBTZP5 = getDateValue(otherForm.get("fv9VFFTBTZP5")) + " 00:00"; //2011-12-10
						String fv9VFFTBTZP7 = getDateValue(otherForm.get("fv9VFFTBTZP7")) + " 00:00"; //2012-01-10
						
						String fv9PVSTBTZP5 = getDateValue(otherForm.get("fv9PVSTBTZP5")) + " 00:00"; //2012-01-30
						String fv9PVSTBTZP7 = getDateValue(otherForm.get("fv9PVSTBTZP7")) + " 00:00"; //2012-02-04
						
						String fv90STBTZP5 = getDateValue(otherForm.get("fv90STBTZP5")) + " 00:00"; //2012-03-22
						String fv90STBTZP7 = getDateValue(otherForm.get("fv90STBTZP7")) + " 00:00"; //2012-04-11
						
						//ZP7的SOP取自项目的SOP，ZP5的SOP是ZP7 SOP的前两周
						String fv9ZP7SOP = (String)getDateValue(request.getSession().getAttribute("SOP_DATE")) + " 00:00";
						String fv9ZP5SOP = DateUtils.oneDateAddOrSubDays(fv9ZP7SOP, 2, "-") + " 00:00";
						
						request.getSession().setAttribute("fv9VFFTBTZP5", fv9VFFTBTZP5);
						request.getSession().setAttribute("fv9VFFTBTZP7", fv9VFFTBTZP7);
						request.getSession().setAttribute("fv9PVSTBTZP5", fv9PVSTBTZP5);
						request.getSession().setAttribute("fv9PVSTBTZP7", fv9PVSTBTZP7);
						request.getSession().setAttribute("fv90STBTZP5", fv90STBTZP5);
						request.getSession().setAttribute("fv90STBTZP7", fv90STBTZP7);
						request.getSession().setAttribute("fv9ZP7SOP", fv9ZP7SOP);
						request.getSession().setAttribute("fv9ZP5SOP", fv9ZP5SOP);
						
						int VFFTBTZP5 = DateUtils.getWeekOfYear(fv9VFFTBTZP5);
						int VFFTBTZP7 = DateUtils.getWeekOfYear(fv9VFFTBTZP7);
						int PVSTBTZP5 = DateUtils.getWeekOfYear(fv9PVSTBTZP5);
						int PVSTBTZP7 = DateUtils.getWeekOfYear(fv9PVSTBTZP7);
						int OSTBTZP5 = DateUtils.getWeekOfYear(fv90STBTZP5);
						int OSTBTZP7 = DateUtils.getWeekOfYear(fv90STBTZP7);
						int ZP7SOP = DateUtils.getWeekOfYear(fv9ZP7SOP );
						int ZP5SOP = DateUtils.getWeekOfYear(fv9ZP5SOP);
						
						request.getSession().setAttribute("VFFTBTZP5", VFFTBTZP5);
						request.getSession().setAttribute("VFFTBTZP7", VFFTBTZP7);
						request.getSession().setAttribute("PVSTBTZP5", PVSTBTZP5);
						request.getSession().setAttribute("PVSTBTZP7", PVSTBTZP7);
						request.getSession().setAttribute("OSTBTZP5", OSTBTZP5);
						request.getSession().setAttribute("OSTBTZP7", OSTBTZP7);
						request.getSession().setAttribute("ZP7SOP", ZP7SOP);
						request.getSession().setAttribute("ZP5SOP", ZP5SOP);
					}
					result = true;
				}
			}
		}
		return result;
	}
	
	private String getDateValue(Object o){
		String result = DateUtils.getSysDate();
		if(o != null){
			result = o.toString();
		}
		return result;
	}
}
