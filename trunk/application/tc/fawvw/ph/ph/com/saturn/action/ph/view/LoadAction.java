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
import com.saturn.ph.IndexManager;
import com.saturn.ph.PH;
import com.saturn.ph.PHManager;
import com.saturn.ph.PHResource;
import com.saturn.ph.PHSortManager;
import com.saturn.ph.ReportPage;
import com.saturn.tc.utils.ItemUtils;
import com.saturn.tc.utils.SortUtils;
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
		"FV9CP1PH_Rel",
		"FV9PHBackup_Rel"
	};
	
	public String requestMapping() {
		return "/app/pep/view/load.do";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String name = (String)request.getParameter("name");
		String uid = (String)request.getParameter("uid");
		
/*		PHBuffer buffer = (PHBuffer) request.getSession().getAttribute(PHBuffer.PH_BUFFER);
		if (buffer == null) {
			buffer = new PHBuffer();
			request.getSession().setAttribute(PHBuffer.PH_BUFFER, buffer);
		}*/
		
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
//		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ReportPage> indexes = new ArrayList<ReportPage>();
		
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
							"project_ids", "fv9MLName", "fv9ReportKW", "fv9PlatformType",
							"fv9FrontTitle", "fv9FrontSubTitle", "fv9ProjectCode");
					
					PH.getDataService().getProperties(itemRev, relations);
					PH.getDataService().refreshObjects(itemRev);
					String projects = itemRev.getPropertyDisplayableValue("project_ids");
					String platformType = itemRev.getPropertyDisplayableValue("fv9PlatformType");
					String fv9FrontTitle = itemRev.getProperty("fv9FrontTitle").getDisplayableValue();
					String fv9FrontSubTitle = itemRev.getProperty("fv9FrontSubTitle").getDisplayableValue();
					String fv9ProjectCode = itemRev.getProperty("fv9ProjectCode").getDisplayableValue();
					
					if (!"".equals(projects)) {
						project = projects.split(",")[0];
					}
					roadmap = itemRev.getPropertyDisplayableValue("fv9MLName");
					
					request.getSession().setAttribute("milepost", roadmap);
					request.getSession().setAttribute("project", project);
					request.getSession().setAttribute("platformType", platformType);
					request.getSession().setAttribute("fv9FrontTitle", fv9FrontTitle);
					request.getSession().setAttribute("fv9FrontSubTitle", fv9FrontSubTitle);
					request.getSession().setAttribute("fv9ProjectCode", fv9ProjectCode);
					
//					加载PHReportRevision下各个关系下的FV9PHForm/FV9PHImage/FV9PHBackup
					formIds = ItemUtils.getLastRevisionFormIds(itemRev, relations ,request);
					
//					list = ItemUtils.getFormIds(itemRev, relations ,request);
					
					if(formIds!= null && formIds.size() > 0){
//					if(list!= null && list.size() > 0){
//						加载符合条件的数据
						indexes = PHManager.getIndexes(roadmap, formIds);
//						汇报页排序
						indexes = SortUtils.phSort(indexes);
						
//						indexes = PHSortManager.getIndexs(list);
						//PHManager.doBuffer(formIds, buffer);
					}
					
					
					
					String fv9ReportKW = (String)itemRev.getPropertyDisplayableValue("fv9ReportKW");
					
					if(fv9ReportKW != null && !"".equals(fv9ReportKW)){
						fv9ReportKW = fv9ReportKW.replaceAll("KW", "");
					}
					
					request.getSession().setAttribute("fv9ReportKW", fv9ReportKW);
					request.getSession().setAttribute("indexes", indexes);
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
System.out.println("indexes size = " + indexes.size());
System.out.println("indexes.get(0) = " + indexes.get(0));		
			List<PHResource> indexList = IndexManager.getListTree(indexes);
			request.getSession().setAttribute("indexList", indexList);
		
			return new JspView(indexes.get(0).getPath());
	//		return new JspView("/app/pep/show.jsp");
		}
		//PH下不存在符合条件的数据
			return new JspView("/app/pep/blank.jsp");
	}
	
}
