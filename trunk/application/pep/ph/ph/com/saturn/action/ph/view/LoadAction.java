package com.saturn.action.ph.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.WebHelper;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.ph.PH;
import com.saturn.ph.PHBuffer;
import com.saturn.ph.PHManager;
import com.saturn.tc.utils.ItemUtils;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class LoadAction implements IAction {
	
	private static final String[] relations = {
		"FV9LOPH_Rel",
		"FV9PLPH_Rel",
		"FV9PMPH_Rel",
		"FV9QAPH_Rel",
		"FV9SUPH_Rel",
		"FV9TEPH_Rel",
		"FV9VSCPH_Rel",
		"FV9SCPH_Rel",
		"FV9PHBackup_Rel"
	};
	
	public String requestMapping() {
		return "/app/pep/view/load.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String name = (String)request.getParameter("name");
		String uid = (String)request.getParameter("uid");
		
		PHBuffer buffer = (PHBuffer) request.getSession().getAttribute(PHBuffer.PH_BUFFER);
		if (buffer == null) {
			buffer = new PHBuffer();
			request.getSession().setAttribute(PHBuffer.PH_BUFFER, buffer);
		}
		
//		String platformType = (String)request.getParameter("platformType");		
		Item item = null;
		ModelObject object = PH.getDataService().loadModelObjectRefresh(uid);
		
		if(object != null ){
			if(object instanceof Item){
				item = (Item)object;
			} else {
				item = PH.getQueryService().queryItemByName(name);
			}
		}

		PH.getDataService().getProperties(item, "object_name",
			"displayable_revisions");
		
		String project = "";
		String roadmap = "";
		Map<String, Object> formIds = new HashMap<String, Object>();
		List<String> indexes = new ArrayList<String>();
		
		if (item != null) {
			try {
				ModelObject[] itemRevs = (ModelObject[]) item.get_displayable_revisions();
				
				if (itemRevs.length > 0) {
					ItemRevision itemRev = (ItemRevision) itemRevs[itemRevs.length - 1];
					
					PH.getDataService().getProperties(itemRev, "object_name",
							"item_revision_id", "current_revision_id",
							"IMAN_specification", "view", "IMAN_requirement",
							"IMAN_reference", "TC_WorkContext_Relation",
							"TC_Attaches", "VisItemRevCreatedSnapshot2D",
							"project_ids", "fv9MLName","fv9ReportKW");
					
					PH.getDataService().getProperties(itemRev, relations);
					PH.getDataService().refreshObjects(itemRev);
					String projects = itemRev.getPropertyDisplayableValue("project_ids");
					if (!"".equals(projects)) {
						project = projects.split(",")[0];
					}
					roadmap = itemRev.getPropertyDisplayableValue("fv9MLName");
					
					request.getSession().setAttribute("milepost", roadmap);
					request.getSession().setAttribute("project", project);
					
					formIds = ItemUtils.getLastRevisionFormIds(itemRev, relations ,request);
					
					if(formIds.size() > 0){
						indexes = PHManager.getIndexes(roadmap, formIds);
						//PHManager.doBuffer(formIds, buffer);
					}
					request.getSession().setAttribute("indexes", indexes);
					String fv9ReportKW = (String)itemRev.getPropertyDisplayableValue("fv9ReportKW");
					
					if(fv9ReportKW != null && !"".equals(fv9ReportKW)){
						fv9ReportKW = fv9ReportKW.replaceAll("KW", "");
					}
					
					request.getSession().setAttribute("fv9ReportKW", fv9ReportKW);
					
					request.setAttribute("current", "1");
				}
			} catch (NotLoadedException e1) {
				request.setAttribute(WebHelper.ERROR_MESSAGE, e1.getMessage());
				e1.printStackTrace();
			}
		} else {
			return new JspErrorView("Item:Name=[" + name + "] 不存在");
		}
		
		//PH下存在数据
		if (indexes != null && indexes.size() > 0) {
			return new JspView(indexes.get(0));
		}
		//PH下不存在符合条件的数据
		return new JspView("/app/pep/blank.jsp");
	}
	
}
