package com.customer.fawvw.issues.commands.forpre;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class IssueForPreReportLoader {

	private IssueForPreReportLoader() {

	}

	public static Map<String, Object> load(
			HashMap<String, Object> parameters) throws Exception {
		List<Map<String, Object>> issues = new ArrayList<Map<String, Object>>();
		Map<String, Object> values = new HashMap<String, Object>();

		try {
			TCSession session = (TCSession) parameters.get("session"); //$NON-NLS-1$
			String curr_prj = (String)parameters.get("project_id"); //$NON-NLS-1$
			
			System.out.println("选中项目Id为：" + curr_prj); //$NON-NLS-1$
			
			System.out.println("开始获取数据"); //$NON-NLS-1$
			
			TCComponent[] tcComponents = ComponentUtils
					.findTCComponentItemByType(session, "FV9Issue"); //$NON-NLS-1$
System.out.println("tcComponents.length = " + tcComponents.length); //$NON-NLS-1$
			if (tcComponents.length > 0) {
				for (TCComponent component : tcComponents) {
					TCComponentItemRevision itemRevision = ((TCComponentItem) component)
							.getLatestItemRevision();
					//涉及车辆编号
					String relCarNo = itemRevision.getProperty("fv9IssueReqCarNo"); //$NON-NLS-1$
					//获取项目ID
					TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
							itemRevision, "fv9ProjectLov"); //$NON-NLS-1$
					String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id"); //$NON-NLS-1$
					String projectInfos = StringUtil.ArrayToString(projectIds);
System.out.println("projectInfos = " + projectInfos);					 //$NON-NLS-1$

					//问题的项目列表包含项目ID
					// TODO:判断“涉及车辆编号（IssueReqCarNo）”属性值包含用户输入的预批量车编号
					if (!"".equals(projectInfos) && //$NON-NLS-1$
							StringUtil.containsNo(projectInfos, curr_prj) &&
							StringUtil.containsNo(relCarNo, (String) parameters.get("carNumber"))) { //$NON-NLS-1$
						System.out.println("-------------yes------------");					 //$NON-NLS-1$
				
						System.out.println("获取问题" + itemRevision + "的信息");
						
						Map<String, Object> issue = new HashMap<String, Object>();
						
						issue.put("item_id", itemRevision //$NON-NLS-1$
								.getProperty("item_id")); // 问题单号 //$NON-NLS-1$
						
						issue.put("fv9IssueDesc", itemRevision //$NON-NLS-1$
								.getProperty("fv9IssueDesc"));// 问题描述 //$NON-NLS-1$
						
						issue.put("fv9Solution1", itemRevision //$NON-NLS-1$
								.getProperty("fv9Solution1"));// 措施 1//$NON-NLS-1$
						
						issue.put("fv9Solution2", itemRevision //$NON-NLS-1$
								.getProperty("fv9Solution2"));// 措施 2//$NON-NLS-1$
						
						issue.put("fv9Solution3", itemRevision //$NON-NLS-1$
								.getProperty("fv9Solution3"));// 措施 1//$NON-NLS-1$
						
						issue.put("fv9Solution4", itemRevision //$NON-NLS-1$
								.getProperty("fv9Solution4"));// 措施 1//$NON-NLS-1$
						
						issue.put("fv9Solution5", itemRevision //$NON-NLS-1$
								.getProperty("fv9Solution5"));// 措施 1//$NON-NLS-1$
						
						issue.put("fv9RGStatus", itemRevision //$NON-NLS-1$
								.getProperty("fv9RGStatus"));// 红绿灯状态 //$NON-NLS-1$
						
						
						if (!"".equals(itemRevision.getProperty("fv9ProposedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
							issue.put("fv9ProposedDate",  //$NON-NLS-1$
									DateUtil.transformTime(itemRevision.getProperty("fv9ProposedDate"), "MM.dd"));// 提出时间 //$NON-NLS-1$ //$NON-NLS-2$
						} else {
							issue.put("fv9ProposedDate", "");// 提出时间 //$NON-NLS-1$ //$NON-NLS-2$
						}
						
						if (!"".equals(itemRevision.getProperty("fv9SolDeadlineDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
							issue.put("fv9SolDeadlineDate", DateUtil.getWeekOfYear(itemRevision //$NON-NLS-1$
									.getProperty("fv9SolDeadlineDate")));// 解决期限 //$NON-NLS-1$
						} else {
							issue.put("fv9SolDeadlineDate", "");// 解决期限 //$NON-NLS-1$ //$NON-NLS-2$
						}
						
						issue.put("fv9SlResDep1", itemRevision //$NON-NLS-1$
								.getProperty("fv9SlResDep1"));// 责任部门 //$NON-NLS-1$
						
						issue.put("fv9IssueReqCarNo", itemRevision.getProperty("fv9IssueReqCarNo"));// 车号 //$NON-NLS-1$ //$NON-NLS-2$
						
						issue.put("itemRevision", itemRevision); //$NON-NLS-1$
						
						issues.add(issue);
					}
				}
					
			}
			
			
			values.put("Issues", issues); //$NON-NLS-1$
			
			values.put("ProjectName", (String)parameters.get("project_name"));// TODO:项目名称 //$NON-NLS-1$ //$NON-NLS-2$
			
			values.put("CreatTime", new DateUtil().getSysDate());// TODO:制表日期 //$NON-NLS-1$
			System.out.println("获取数据成功"); //$NON-NLS-1$
						
			
System.out.println("values = \n" + values);			 //$NON-NLS-1$
		} catch (Exception e) {
			
			throw new FawvmLoaderException("程序执行失败，请参考日志"); //$NON-NLS-1$
			
		} 
		return values;
	}
	
	
}
