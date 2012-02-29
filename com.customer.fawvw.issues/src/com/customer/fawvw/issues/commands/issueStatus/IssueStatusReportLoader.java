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
		String selectMileStone = (String)parameters.get("mile_stone"); //$NON-NLS-1$
		String project_id = (String)parameters.get("project_id"); //$NON-NLS-1$

		//查询所有问题对象
		TCComponent[] tcComponents = ComponentUtils
			.findTCComponentItemByType((TCSession)parameters.get("session"), "FV9Issue");  //$NON-NLS-1$ //$NON-NLS-2$
		
		//筛选问题对象：问题所属项目包含选中的项目，且问题的里程碑为选中的里程碑
		if (tcComponents.length > 0) {
			for (int i = 0; i < tcComponents.length; i++) {
				TCComponentItemRevision itemRevision = ((TCComponentItem)tcComponents[i])
					.getLatestItemRevision();
				String RGStatus = itemRevision.getProperty("fv9RGStatus"); //$NON-NLS-1$
				String AssPlacement = itemRevision.getProperty("fv9AssPlacement"); //$NON-NLS-1$
				String FindMileStone = itemRevision.getProperty("fv9IssueFindMileStone"); //$NON-NLS-1$
				
				System.out.println("RGStatus = " + RGStatus); //$NON-NLS-1$
				System.out.println("AssPlacement = " + AssPlacement); //$NON-NLS-1$
				System.out.println("FindMileStone = " + FindMileStone); //$NON-NLS-1$
				
				//获取项目ID
				TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
						itemRevision, "fv9ProjectLov"); //$NON-NLS-1$
				String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id"); //$NON-NLS-1$
				String projectInfos = StringUtil.ArrayToString(projectIds);
System.out.println("projectInfos = " + projectInfos);	 //$NON-NLS-1$
				
				if (!"".equals(projectInfos) && //$NON-NLS-1$
						StringUtil.containsNo(projectInfos, project_id) &&
						matchMileStone(selectMileStone, FindMileStone)) {
					HashMap<String, Object> issue = new HashMap<String, Object>();
					issue.put("item_id", itemRevision.getProperty("item_id")); //$NON-NLS-1$ //$NON-NLS-2$
					issue.put("fv9RGStatus", itemRevision.getProperty("fv9RGStatus")); //$NON-NLS-1$ //$NON-NLS-2$
					issue.put("fv9AssPlacement", itemRevision.getProperty("fv9AssPlacement")); //$NON-NLS-1$ //$NON-NLS-2$
					issue.put("fv9IssueFindMileStone", itemRevision.getProperty("fv9IssueFindMileStone")); //$NON-NLS-1$ //$NON-NLS-2$
					issueList.add(issue);
				}
			
			
			}
			
			if (!"0".equals((String)parameters.get("forecast"))) { //$NON-NLS-1$ //$NON-NLS-2$
				int n = Integer.parseInt((String)parameters.get("forecast")); //$NON-NLS-1$
				String currentKW = ""; //$NON-NLS-1$
				if (((String)parameters.get("week")).split("/")[0].length() > 3) { //$NON-NLS-1$ //$NON-NLS-2$
					currentKW = ((String)parameters.get("week")).split("/")[0].substring(2, 4); //$NON-NLS-1$ //$NON-NLS-2$
				} else {
					currentKW = ((String)parameters.get("week")).split("/")[0].substring(2, 3); //$NON-NLS-1$ //$NON-NLS-2$
				}
				
				String currentYear = ((String)parameters.get("week")).split("/")[1]; //$NON-NLS-1$ //$NON-NLS-2$
				for (int i = 1; i < n+1; i++) {
					HashMap<String , Object> forecastMap = new HashMap<String, Object>();
					int size = getForecastWeek(tcComponents, parameters, i).size();
					if (size > 0) {
						forecastMap.put("forecastNum", size); //$NON-NLS-1$
						forecastMap.put("forecastWeek", "KW" + (Integer.parseInt(currentKW) + i) + "/" + currentYear); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
						issues.put("forecast" + i, forecastMap); //$NON-NLS-1$
					}
					
				}
				
			}
			
			issues.put("status", IssueStatusStatistics.getStatusStatistics(issueList)); //$NON-NLS-1$
			issues.put("assPlacement", IssueStatusStatistics.getAssplacementStatistics(issueList)); //$NON-NLS-1$
			issues.put("project_name", (String)(parameters.get("project_name"))); //$NON-NLS-1$ //$NON-NLS-2$
			issues.put("week", (String)(parameters.get("week"))); //$NON-NLS-1$ //$NON-NLS-2$
	System.out.println("values\n" + issues);		 //$NON-NLS-1$
			
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
				String RGStatus = itemRevision.getProperty("fv9RGStatus"); //$NON-NLS-1$
				String SolDeadlineDate = (String)itemRevision.getProperty("fv9SolDeadlineDate"); //$NON-NLS-1$
				if ("红".equals(RGStatus) || 
						"黄".equals(RGStatus)) {
					if (!"".equals(SolDeadlineDate) && //$NON-NLS-1$
							SolDeadlineDate != null &&
							timeAllow(SolDeadlineDate, parameters, forecastDay)){
						HashMap<String, Object> issue = new HashMap<String, Object>();
						issue.put("item_id", itemRevision.getProperty("item_id")); //$NON-NLS-1$ //$NON-NLS-2$
						issue.put("fv9RGStatus", itemRevision.getProperty("fv9RGStatus")); //$NON-NLS-1$ //$NON-NLS-2$
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
	System.out.println("forecastWeek = " + forecastWeek); //$NON-NLS-1$
	System.out.println("compTime = " + compTime); //$NON-NLS-1$
	System.out.println("current week = " + (String)parameters.get("week")); //$NON-NLS-1$ //$NON-NLS-2$
			String currentKW = ""; //$NON-NLS-1$
			if (((String)parameters.get("week")).split("/")[0].length() > 3) { //$NON-NLS-1$ //$NON-NLS-2$
				currentKW = ((String)parameters.get("week")).split("/")[0].substring(2, 4); //$NON-NLS-1$ //$NON-NLS-2$
			} else {
				currentKW = ((String)parameters.get("week")).split("/")[0].substring(2, 3); //$NON-NLS-1$ //$NON-NLS-2$
			}
	System.out.println("currentKW = " + currentKW); //$NON-NLS-1$
			int week = Integer.parseInt(currentKW) + forecastWeek;
	System.out.println("forecast week = " + week); //$NON-NLS-1$
			Date weekend = DateUtil.getLastDayOfWeek(2011, week);
			Date time = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(compTime);  //$NON-NLS-1$
	System.out.println("weekend = " + weekend); //$NON-NLS-1$
	System.out.println("time    = " + time); //$NON-NLS-1$
	System.out.println(weekend.getTime() - time.getTime());
			if ((weekend.getTime() - time.getTime())/3600/24/1000 > 0) {
	System.out.println("yes"); //$NON-NLS-1$
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
		if (!"".equals(selectMileStone) && !"ALL".equals(selectMileStone) &&  //$NON-NLS-1$ //$NON-NLS-2$
				selectMileStone.equals(FindMileStone)){ //$NON-NLS-1$ //$NON-NLS-2$
			return true;
		}
		
		if ("ALL".equals(selectMileStone) && inMileStone(FindMileStone)) { //$NON-NLS-1$
			return true;
		}
		
		return false;
	}
	
	public static Boolean inMileStone(String FindMileStone) {
		
		if ("LF".equals(FindMileStone) || //$NON-NLS-1$
				"VFF".equals(FindMileStone) || //$NON-NLS-1$
				"PVS".equals(FindMileStone) || //$NON-NLS-1$
				"0S".equals(FindMileStone)) { //$NON-NLS-1$
			return true;
		}
		
		return false;
	}
		
}
