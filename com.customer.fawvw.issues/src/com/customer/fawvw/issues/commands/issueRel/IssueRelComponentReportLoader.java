package com.customer.fawvw.issues.commands.issueRel;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;

public class IssueRelComponentReportLoader {

	
	public ArrayList<HashMap<String, Object>> getDataByCondition (
			HashMap<String, Object> parameters) throws Exception {
		
		ArrayList<HashMap<String, Object>> components = new ArrayList<HashMap<String,Object>>();
		
		
		String structNo = (String)parameters.get("structNo");
		String[] structNos = structNo.split(";");
		
		String project_id = (String)parameters.get("project_id");

		//查询所有问题对象
		TCComponent[] componentsByProject = ComponentUtils
			.findTCComponentItemByType((TCSession)parameters.get("session"), "FV9Issue"); 
		
		//筛选问题：问题所属项目包含选中项目，且问题涉及专业编码包含选中专业编码
		if (componentsByProject.length > 0) {
			
			try {
				for (int i = 0; i < componentsByProject.length; i++) {
					
					TCComponentItemRevision itemRevision = ((TCComponentItem)componentsByProject[i]).getLatestItemRevision();
					String fv9IssueRelStruNo = itemRevision.getProperty("fv9IssueRelStruNo");
					System.out.println("fv9IssueRelStruNo = " + fv9IssueRelStruNo);
					
					//获取项目ID
					TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
							itemRevision, "fv9ProjectLov");
					String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id");
					String projectInfos = StringUtil.ArrayToString(projectIds);
					System.out.println("projectInfos = " + projectInfos);
					
					if (!"".equals(structNo) &&
							!"".equals(fv9IssueRelStruNo) &&
							StringUtil.containsNo(projectInfos, project_id) &&
							compareStructNo(structNos, fv9IssueRelStruNo)) {
						HashMap<String, Object> tempData = new HashMap<String, Object>();
						tempData.clear();
						tempData.put("item_id", itemRevision.getProperty("item_id"));
						tempData.put("item_name", itemRevision.getProperty("object_name"));
						tempData.put("item_desc", itemRevision.getProperty("fv9IssueDesc"));
						tempData.put("issueRelStructNo", itemRevision.getProperty("fv9IssueRelStruNo"));
						tempData.put("assPlacement", itemRevision.getProperty("fv9AssPlacement"));
						tempData.put("issueReqCarNo", itemRevision.getProperty("fv9IssueReqCarNo"));
						tempData.put("issueCause", itemRevision.getProperty("fv9IssueCause"));
						
						tempData.put("fv9SolutionLO", itemRevision.getProperty("fv9SolutionLO"));
						tempData.put("fv9SolutionPL", itemRevision.getProperty("fv9SolutionPL"));
						tempData.put("fv9SolutionQAPP", itemRevision.getProperty("fv9SolutionQAPP"));
						tempData.put("fv9SolutionSU", itemRevision.getProperty("fv9SolutionSU"));
						tempData.put("fv9SolutionVSC", itemRevision.getProperty("fv9SolutionVSC"));
						tempData.put("fv9SolutionTE", itemRevision.getProperty("fv9SolutionTE"));
						tempData.put("fv9SolutionCP1_ME", itemRevision.getProperty("fv9SolutionCP1_ME"));
						tempData.put("fv9SolutionBS", itemRevision.getProperty("fv9SolutionBS"));
						tempData.put("fv9SolutionCA", itemRevision.getProperty("fv9SolutionCA"));
						tempData.put("fv9SolutionPA", itemRevision.getProperty("fv9SolutionPA"));
						tempData.put("fv9SolutionCP2_ME", itemRevision.getProperty("fv9SolutionCP2_ME"));
						tempData.put("fv9SolutionCP2BS", itemRevision.getProperty("fv9SolutionCP2BS"));
						tempData.put("fv9SolutionCP2PA", itemRevision.getProperty("fv9SolutionCP2PA"));
						tempData.put("fv9SolutionCP2CA", itemRevision.getProperty("fv9SolutionCP2CA"));
						
						tempData.put("fv9RGStatus", itemRevision.getProperty("fv9RGStatus"));
						tempData.put("SolDeadlineDate", itemRevision.getProperty("fv9SolDeadlineDate"));
						tempData.put("CompletedDate", itemRevision.getProperty("fv9CompletedDate"));
						tempData.put("IssueStatus", itemRevision.getProperty("fv9IssueStatus"));
						components.add(tempData);
					}
					
				}
				
				
			} catch (TCException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("old components = " + components);
			sortByStructNo(components);
			System.out.println("new components = " + components);
		}
		
		return components;
	}
	
	public boolean compareStructNo(String[] structNos, String structNo) {
		
		for (int i = 0; i < structNos.length; i++) {
			if (structNo.equals(structNos[i]) || structNo.contains(structNos[i])) {
				return true;
			}
		}
		return false;
	}
	
	public ArrayList<HashMap<String, Object>> sortByStructNo(
			ArrayList<HashMap<String, Object>> components) {
//		ArrayList<HashMap<String, Object>> newComponents = new ArrayList<HashMap<String, Object>>();
		Collections.sort(components, new Comparator<HashMap<String, Object>>() {
			public int compare(HashMap<String, Object> map1,
					HashMap<String, Object> map2) {
				String str1 = ((String)map1.get("issueRelStructNo"));
				String str2 = ((String)map2.get("issueRelStructNo"));
				int n1 = str1.length();
				int n2 = str2.length();
				if (!str1.equals(str2)){
					
					for (int i1=0, i2=0; i1<n1 && i2<n2; i1++, i2++) {
		                char c1 = str1.charAt(i1);
		                char c2 = str2.charAt(i2);
		                if (c1 != c2) {
		                    c1 = Character.toUpperCase(c1);
		                    c2 = Character.toUpperCase(c2);
		                    if (c1 != c2) {
		                        c1 = Character.toLowerCase(c1);
		                        c2 = Character.toLowerCase(c2);
		                        if (c1 != c2) {
		                            return c1 - c2;
		                        }
		                    }
		                }
					}
				}
				return n1 - n2;
				
			}
		});
		return components;
	}

}
