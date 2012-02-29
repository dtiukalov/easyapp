package com.customer.fawvw.issues.commands.issuestatistic;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;

public class IssueReportLoaderRichClient {

	private IssueReportLoaderRichClient() {
	}
	
	public static List<TCComponent> selectComponent (TCComponent[] tccomponents,HashMap<String, Object> parameters){
		
		List<TCComponent> selectedTccomponents = new ArrayList<TCComponent>();
	
		try {
		
			String projectId = ((TCComponentProject)parameters.get("projectInfo")).getProperty("project_id"); //$NON-NLS-1$ //$NON-NLS-2$
	System.out.println("projectId = " + projectId);		 //$NON-NLS-1$
			for (int i = 0; i < tccomponents.length; i++) {
					
				TCComponentItemRevision itemRevision = ((TCComponentItem)tccomponents[i]).getLatestItemRevision();
				String selectedtime = itemRevision.getProperty("fv9ProposedDate"); //$NON-NLS-1$ //$NON-NLS-2$
				//项目所属项目ID
				TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
						itemRevision, "fv9ProjectLov"); //$NON-NLS-1$
				String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id"); //$NON-NLS-1$
				String projectInfos = StringUtil.ArrayToString(projectIds);
				if (DateUtil.betweenStartAndEnd(selectedtime, 
						(String)parameters.get("startTime"),  //$NON-NLS-1$
						(String)parameters.get("endTime")) && //$NON-NLS-1$
						StringUtil.containsNo(projectInfos, projectId)) {
					selectedTccomponents.add(tccomponents[i]);
				}
			}
		} catch (TCException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectedTccomponents;
	}

	public static HashMap<String, Object> load(HashMap<String, Object> parameters) throws Exception{
		try {
			System.out.println("选中项目：" + parameters.get("projectInfo") + "\r\n" +  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$
					"选中时间段：" + parameters.get("startTime") + " - " + parameters.get("endTime"));  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$
			
			System.out.println("开始获取数据"); //$NON-NLS-1$
			
			HashMap<String, Object> values = new HashMap<String, Object>();
			
			TCSession session = (TCSession)parameters.get("session"); //$NON-NLS-1$
			
//			自定义查询[issues_RichClient]
			String[] conditions = new String[] {"ID"}; //$NON-NLS-1$
//			String[] inputs = new String[] {"*" + ((TCComponentProject)(parameters.get("projectInfo"))).getProperty("project_id") + "*"}; //$NON-NLS-1$ //$NON-NLS-2$
			String[] inputs = new String[] {"*"}; //$NON-NLS-1$ //$NON-NLS-2$
			TCComponent[] tcComponents = ComponentUtils.findTCComponentByQuery(
						(TCSession)parameters.get("session"),  //$NON-NLS-1$
						"issues_RichClient", //$NON-NLS-1$
						conditions, inputs);
System.out.println("tcComponents.length = " + tcComponents.length);			 //$NON-NLS-1$
			if (tcComponents.length > 0) {
				
				List<TCComponent> rightComponent = selectComponent(tcComponents, parameters);
				
				if (rightComponent.size() > 0) {
					ArrayList<HashMap<String, Object>> issuelist = new ArrayList<HashMap<String, Object>>();
					
					for (TCComponent tcComponent : rightComponent) {
						HashMap<String, Object> item = new HashMap<String, Object>();
						TCComponentItemRevision fv9IssueRevision = ((TCComponentItem) tcComponent).getLatestItemRevision();
						System.out.println("获取问题：" + fv9IssueRevision + "的信息");
						item.put("item_id", fv9IssueRevision.getProperty("item_id"));  //$NON-NLS-1$ //$NON-NLS-2$
						item.put("object_name", fv9IssueRevision.getProperty("object_name"));  //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9AssPlacement", fv9IssueRevision.getProperty("fv9AssPlacement")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9IssueDesc", fv9IssueRevision.getProperty("fv9IssueDesc")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9IssueCause", fv9IssueRevision.getProperty("fv9IssueCause")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9IssueTempSolution", fv9IssueRevision.getProperty("fv9IssueTempSolution"));  //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9Solution1", fv9IssueRevision.getProperty("fv9Solution1")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9SlResDep1", fv9IssueRevision.getProperty("fv9SlResDep1")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9SlResOwner1", fv9IssueRevision.getProperty("fv9SlResOwner1")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9Solution2", fv9IssueRevision.getProperty("fv9Solution2"));  //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9SlResDep2", fv9IssueRevision.getProperty("fv9SlResDep2"));  //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9SlResOwner2", fv9IssueRevision.getProperty("fv9SlResOwner2"));  //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9CompletedDate", fv9IssueRevision.getDateProperty("fv9CompletedDate")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9RGStatus", fv9IssueRevision.getProperty("fv9RGStatus")); //$NON-NLS-1$ //$NON-NLS-2$
						item.put("fv9IssueType", fv9IssueRevision.getProperty("fv9IssueType")); //$NON-NLS-1$ //$NON-NLS-2$
						
//						item.put("fv9PartNumber", fv9IssueRevision.getProperty("fv9PartNumber")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9PartName", fv9IssueRevision.getProperty("fv9PartName")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9IssueReqCarNo", fv9IssueRevision.getProperty("fv9IssueReqCarNo")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9IssueVeriCarNo", fv9IssueRevision.getProperty("fv9IssueVeriCarNo")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SolDeadlineDate", fv9IssueRevision.getProperty("fv9SolDeadlineDate")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9Priority", fv9IssueRevision.getProperty("fv9Priority")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlDLDate1", fv9IssueRevision.getProperty("fv9SlDLDate1")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlDLDate2", fv9IssueRevision.getProperty("fv9SlDLDate2")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9Solution3", fv9IssueRevision.getProperty("fv9Solution3")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlDLDate3", fv9IssueRevision.getProperty("fv9SlDLDate3")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlResDep3", fv9IssueRevision.getProperty("fv9SlResDep3")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlResOwner3", fv9IssueRevision.getProperty("fv9SlResOwner3")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9Solution4", fv9IssueRevision.getProperty("fv9Solution4")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlDLDate4", fv9IssueRevision.getProperty("fv9SlDLDate4")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlResDep4", fv9IssueRevision.getProperty("fv9SlResDep4")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlResOwner4", fv9IssueRevision.getProperty("fv9SlResOwner4")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9Solution5", fv9IssueRevision.getProperty("fv9Solution5")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlDLDate5", fv9IssueRevision.getProperty("fv9SlDLDate5")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlResDep5", fv9IssueRevision.getProperty("fv9SlResDep5")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SlResOwner5", fv9IssueRevision.getProperty("fv9SlResOwner5")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9ManagingMajor", fv9IssueRevision.getProperty("fv9ManagingMajor")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9IssueStatus", fv9IssueRevision.getProperty("fv9IssueStatus")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TimeChangeRed", fv9IssueRevision.getProperty("fv9TimeChangeRed")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TimeAnalyzed", fv9IssueRevision.getProperty("fv9TimeAnalyzed")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TimeDispatched", fv9IssueRevision.getProperty("fv9TimeDispatched")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TimeChangeYellow", fv9IssueRevision.getProperty("fv9TimeChangeYellow")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TimeImplemented", fv9IssueRevision.getProperty("fv9TimeImplemented")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TimeValidated", fv9IssueRevision.getProperty("fv9TimeValidated")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TimeChangeGreen", fv9IssueRevision.getProperty("fv9TimeChangeGreen")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9IssueFindMileStone", fv9IssueRevision.getProperty("fv9IssueFindMileStone")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9IsRelToAuditScore", fv9IssueRevision.getProperty("fv9IsRelToAuditScore")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9AuditScoreDecreased", fv9IssueRevision.getProperty("fv9AuditScoreDecreased")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9FactoryName", fv9IssueRevision.getProperty("fv9FactoryName")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9WorkshopName", fv9IssueRevision.getProperty("fv9WorkshopName")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9WorkSegmentName", fv9IssueRevision.getProperty("fv9WorkSegmentName")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9Proposer", fv9IssueRevision.getProperty("fv9Proposer")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9TelOfProposer", fv9IssueRevision.getProperty("fv9TelOfProposer")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9ProposedDate", fv9IssueRevision.getProperty(Messages.ReportIssueLoader_0)); //$NON-NLS-1$
//						item.put("fv9Submiter", fv9IssueRevision.getProperty("fv9Submiter")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SupplierID", fv9IssueRevision.getProperty("fv9SupplierID")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9SupplierName", fv9IssueRevision.getProperty("fv9SupplierName")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9Verifier", fv9IssueRevision.getProperty("fv9Verifier")); //$NON-NLS-1$ //$NON-NLS-2$
//						item.put("fv9IssueComments", fv9IssueRevision.getProperty("fv9IssueComments"));		 //$NON-NLS-1$ //$NON-NLS-2$
						issuelist.add(item);
					}
					
//					ArrayList<HashMap<String, Object>> issuelist = transVOToArrayList(issueVos);
					//按照各个维度统计数据
					//责任部门
					Map<String,Object> department = DepartmentStatusLoader.load(issuelist);
					System.out.println("按责任部门统计" //$NON-NLS-1$
							+ "\r\n" + "PM:" + department.get("PM")  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "SU:" + department.get("SU") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "PE:" + department.get("PE") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "ME:" + department.get("ME") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "PL:" + department.get("PL") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "QA:" + department.get("QA") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "VSC:" + department.get("VSC") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "LO" + department.get("LO")); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
					
					//零件类型
					Map<String,Object> partType = PartTypeStatusLoader.load(issuelist);
					System.out.println("零件类型："  //$NON-NLS-1$
							+ "\r\n" + "零件状态：" + partType.get("partStatus") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "车身尺寸：" + partType.get("bodySize") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "工艺及设备：" + partType.get("techAndEqu") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "零件匹配：" + partType.get("partMatch") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
							+ "\r\n" + "PDM：" + partType.get("pdm")); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
					
					//专业组
//					Map<String,Object> mMvalues = MajorLoader.load(issuelist);
//					System.out.println(Messages.major
//							+ "\r\n" + Messages.mm + mMvalues.get("car")  //$NON-NLS-1$//$NON-NLS-2$
//							+ "\r\n" + Messages.eqipment + mMvalues.get("accoutrement") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.carbody + mMvalues.get("bodywork") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.electronic + mMvalues.get("eleAppliances") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.chassis + mMvalues.get("chassis") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.total + mMvalues.get("total")); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$

					//按时间统计
//					Map<String, Object> TimeIssues = TimeLoader.load(issuelist);
//					
					//装车位置
//					Map<String, Object> assPlacement = AssPlacementLoader.load(issuelist);
//					System.out.println(Messages.assplacement
//							+ "\r\n" + Messages.ReportIssueLoader_7 + assPlacement.get("front")  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.behind + assPlacement.get("behind") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.door + assPlacement.get("door") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.inner + assPlacement.get("inner") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.chassis2 + assPlacement.get("chassis") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.driver + assPlacement.get("driver") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
//							+ "\r\n" + Messages.electronic2 + assPlacement.get("electronik")); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
					
					values.put("issues", issuelist); //$NON-NLS-1$
					values.put("department", department); //$NON-NLS-1$
					values.put("partType", partType); //$NON-NLS-1$
//					values.put("mMvalues", mMvalues); //$NON-NLS-1$
//					values.put("TimeIssues", TimeIssues); //$NON-NLS-1$
//					values.put("assPlacement", assPlacement); //$NON-NLS-1$
					
					System.out.println("获取数据结束"); //$NON-NLS-1$
					
					return values;
				}
				return null;
				
			} else {
				
				System.out.println("系统中不存在问题"); //$NON-NLS-1$
				return null;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new FawvmLoaderException(e.getMessage());
			
		}

	}
	
	
	
}
