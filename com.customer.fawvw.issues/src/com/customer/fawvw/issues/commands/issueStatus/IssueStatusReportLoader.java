package com.customer.fawvw.issues.commands.issueStatus;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;

public class IssueStatusReportLoader {

	public static HashMap<String, Object> load(HashMap<String, Object> parameters) 
		throws Exception{
		HashMap<String, Object> issues = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> issueList = new ArrayList<HashMap<String,Object>>();
		String selectMileStone = (String) parameters.get("mile_stone"); 
		String project_id = (String)parameters.get("project_id"); 

		//查询所有问题对象
		TCComponent[] tcComponents = ComponentUtils
			.findTCComponentItemByType((TCSession)parameters.get("session"), "FV9Issue");   
		
		//筛选问题对象：问题所属项目包含选中的项目，且问题的里程碑为选中的里程碑
		if (tcComponents.length > 0) {
			for (int i = 0; i < tcComponents.length; i++) {
				TCComponentItemRevision itemRevision = ((TCComponentItem)tcComponents[i])
					.getLatestItemRevision();
				String RGStatus = itemRevision.getProperty("fv9RGStatus"); 
				String AssPlacement = itemRevision.getProperty("fv9AssPlacement"); 
				String FindMileStone = itemRevision.getProperty("fv9IssueFindMileStone"); 
				
				System.out.println("RGStatus = " + RGStatus); 
				System.out.println("AssPlacement = " + AssPlacement); 
				System.out.println("FindMileStone = " + FindMileStone); 
				
				//获取项目ID
				TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
						itemRevision, "fv9ProjectLov"); 
				String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id"); 
				String projectInfos = StringUtil.ArrayToString(projectIds);
				
				if (!"".equals(projectInfos) && 
						StringUtil.containsNo(projectInfos, project_id) &&
						matchMileStone(selectMileStone, FindMileStone)) {
					HashMap<String, Object> issue = new HashMap<String, Object>();
					issue.put("item_id", itemRevision.getProperty("item_id"));  
					issue.put("fv9RGStatus", itemRevision.getProperty("fv9RGStatus"));  
					issue.put("fv9AssPlacement", itemRevision.getProperty("fv9AssPlacement"));  
					issue.put("fv9IssueFindMileStone", itemRevision.getProperty("fv9IssueFindMileStone"));  
					issueList.add(issue);
				}
			
			
			}
			
			if (!"0".equals((String)parameters.get("forecast"))) {  
				int n = Integer.parseInt((String)parameters.get("forecast")); 
				
				String currentKW = ((String)parameters.get("week")).split("-")[0];  
				String currentYear = ((String)parameters.get("week")).split("-")[1];
				
				for (int i = 1; i < n+1; i++) {
					HashMap<String , Object> forecastMap = new HashMap<String, Object>();
					int size = getForecastWeek(tcComponents, parameters, i).size();
					if (size > 0) {
						forecastMap.put("forecastNum", size); 
						forecastMap.put("forecastWeek", (Integer.parseInt(currentKW) + i) + "-" + currentYear);   //$NON-NLS-3$
						issues.put("forecast" + i, forecastMap); 
					}
					
				}
				
			}
			
			issues.put("status", IssueStatusStatistics.getStatusStatistics(issueList)); 
			issues.put("assPlacement", IssueStatusStatistics.getAssplacementStatistics(issueList)); 
			issues.put("project_name", (String)(parameters.get("project_name")));  
			issues.put("week", (String)(parameters.get("week")));  
			
		}
		return issues;
		
	}
	
	/*
	 * 获取数据：问题状态为红灯或者黄灯，且解决期限在当前周+预测周之前的 
	 */
	public static ArrayList<HashMap<String, Object>> getForecastWeek(
			TCComponent[] tcComponents, HashMap<String, Object> parameters, int forecastDay) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		for (int i = 0; i < tcComponents.length; i++) {
			try {
				TCComponentItemRevision itemRevision = ((TCComponentItem)tcComponents[i])
					.getLatestItemRevision();
				String RGStatus = itemRevision.getProperty("fv9RGStatus"); 
				String SolDeadlineDate = (String)itemRevision.getProperty("fv9SolDeadlineDate"); 
				if ("红".equals(RGStatus) || 
						"黄".equals(RGStatus)) {
					if (!"".equals(SolDeadlineDate) && 
							SolDeadlineDate != null &&
							timeAllow(SolDeadlineDate, parameters, forecastDay)){
						HashMap<String, Object> issue = new HashMap<String, Object>();
						issue.put("item_id", itemRevision.getProperty("item_id"));  
						issue.put("fv9RGStatus", itemRevision.getProperty("fv9RGStatus"));  
						list.add(issue);
					}
				}
			} catch (TCException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return list;
	}
	
	/*
	 * 解决期限在当前周+预测周数之内
	 */
	public static Boolean timeAllow(String compTime, HashMap<String, Object> parameters, int forecastWeek) {
		try {
 
			String currentKW = ((String)parameters.get("week")).split("-")[0];  
			int week = Integer.parseInt(currentKW) + forecastWeek;
			Date weekend = DateUtil.getLastDayOfWeek(2011, week);
			Date time = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(compTime);  
			if ((weekend.getTime() - time.getTime())/3600/24/1000 > 0) {
				return true;
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;

	}
	
	public static Boolean matchMileStone(String selectMileStone, String FindMileStone) {
		if (!"".equals(selectMileStone) && !"ALL".equals(selectMileStone) &&   
				selectMileStone.equals(FindMileStone)){  
			return true;
		}
		
		if ("ALL".equals(selectMileStone) && inMileStone(FindMileStone)) { 
			return true;
		}
		
		return false;
	}
	
	public static Boolean inMileStone(String FindMileStone) {
		
		if ("LF".equals(FindMileStone) || 
				"VFF".equals(FindMileStone) || 
				"PVS".equals(FindMileStone) || 
				"0S".equals(FindMileStone)) { 
			return true;
		}
		
		return false;
	}
		
}
