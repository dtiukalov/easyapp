package com.customer.fawvw.issues.commands.impart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;

public class ImPartVO {
	
	
	
	private String object_name; //总成名称
	private List<HashMap<String, Object>> impart_Issue;
	public static final String PROPERTY_ISSUESTATUS = "已实施"; //$NON-NLS-1$

	
	//输入重点件，查找重点件需验证的问题
	public static ImPartVO loadImPart (TCComponentItemRevision itemRevision, 
			TCSession session, HashMap<String, Object> parameters) throws Exception {
		ImPartVO imPartVO = new ImPartVO();
		
		try {
			//获得当前的零件
			imPartVO.object_name = itemRevision.getProperty("object_name"); //$NON-NLS-1$
			//获得当前零件的零件号
			String PartNo  = itemRevision.getProperty("fv9PartNo"); //$NON-NLS-1$
			//获得当前零件对应的问题
			imPartVO.impart_Issue = getImPartissue(session, PartNo, itemRevision, parameters);
	
		} catch (TCException e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		}
		
		return  imPartVO;
		
	}
	
	/**
	 * 获得当前的零件的问题的集合
	 * */
	public static List<HashMap<String, Object>> getImPartissue(TCSession session, 
			String PartNo, TCComponentItemRevision itemRevision,
			HashMap<String, Object> parameters) throws Exception {

		TCComponent[] tcCompontents = ComponentUtils.findTCComponentItemByType(session, "FV9Issue"); //$NON-NLS-1$
		List<HashMap<String, Object>> imPartIssues = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> imPartIssue;
		List<String> solutions;
		//选中项目ID
		String project_id = (String)parameters.get("project_id"); //$NON-NLS-1$
			for (int i = 0; i < tcCompontents.length; i++) {
				
				try {
					solutions = new ArrayList<String>();
					imPartIssue = new HashMap<String, Object>();
					TCComponent tcComponent = tcCompontents[i];
					TCComponentItemRevision IssueItemRevision = ((TCComponentItem) tcCompontents[i])
							.getLatestItemRevision();

					//获取项目ID
					TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
							IssueItemRevision, "fv9ProjectLov"); //$NON-NLS-1$
					String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id"); //$NON-NLS-1$
					String projectInfos = StringUtil.ArrayToString(projectIds);
System.out.println("projectInfos = " + projectInfos);	 //$NON-NLS-1$

					//问题的所属零件号包含某一重点件的零件号
					//问题的处理状态为“已实施”
					//问题的所属项目为选中项目
					if (StringUtil.containsNo(IssueItemRevision.getProperty("fv9PartNumber"), PartNo) &&  //$NON-NLS-1$
							PROPERTY_ISSUESTATUS.equals(IssueItemRevision.getProperty("fv9IssueStatus")) && //$NON-NLS-1$
							StringUtil.containsNo(projectInfos, project_id)) {
						
						imPartIssue.put("fv9IssueDesc", IssueItemRevision //$NON-NLS-1$
								.getProperty("fv9IssueDesc")); //$NON-NLS-1$
						
						imPartIssue.put("fv9AuditScoreDecreased", IssueItemRevision //$NON-NLS-1$
								.getProperty("fv9AuditScoreDecreased")); //$NON-NLS-1$

						solutions.add(IssueItemRevision
								.getProperty("fv9Solution1")); //$NON-NLS-1$
						solutions.add(IssueItemRevision
								.getProperty("fv9Solution2")); //$NON-NLS-1$
						solutions.add(IssueItemRevision
								.getProperty("fv9Solution3")); //$NON-NLS-1$
						solutions.add(IssueItemRevision
								.getProperty("fv9Solution4")); //$NON-NLS-1$
						solutions.add(IssueItemRevision
								.getProperty("fv9Solution5")); //$NON-NLS-1$
						
						imPartIssue.put("FV9Solution", solutions); //$NON-NLS-1$
						imPartIssue.put("itemRevision", IssueItemRevision); //$NON-NLS-1$
						imPartIssues.add(imPartIssue);
							
					}
					
				} catch (TCException e) {
					// TODO Auto-generated catch block
					throw new FawvmLoaderException("程序执行失败，请参考日志"); //$NON-NLS-1$
				}
			}
		return imPartIssues;
	}
	
	public String getObject_name() {
		return object_name;
	}

	public void setObject_name(String objectName) {
		object_name = objectName;
	}

	public List<HashMap<String, Object>> getImpart_Issue() {
		return impart_Issue;
	}

	public void setImpart_Issue(List<HashMap<String, Object>> impartIssue) {
		impart_Issue = impartIssue;
	}

	
}
