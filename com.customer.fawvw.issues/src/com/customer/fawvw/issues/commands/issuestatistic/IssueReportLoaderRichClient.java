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
		
			String projectId = ((TCComponentProject)parameters.get("projectInfo")).getProperty("project_id");  
			for (int i = 0; i < tccomponents.length; i++) {
					
				TCComponentItemRevision itemRevision = ((TCComponentItem)tccomponents[i]).getLatestItemRevision();
				String selectedtime = itemRevision.getProperty("fv9ProposedDate");  
				//项目所属项目ID
				TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
						itemRevision, "fv9ProjectLov"); 
				String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id"); 
				String projectInfos = StringUtil.ArrayToString(projectIds);
				if (DateUtil.betweenStartAndEnd(selectedtime, 
						(String)parameters.get("startTime"),  
						(String)parameters.get("endTime")) && 
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
			System.out.println("选中项目：" + parameters.get("projectInfo") + "\r\n" +   //$NON-NLS-3$
					"选中时间段：" + parameters.get("startTime") + " - " + parameters.get("endTime"));   //$NON-NLS-3$ //$NON-NLS-4$
			
			System.out.println("开始获取数据"); 
			
			HashMap<String, Object> values = new HashMap<String, Object>();
			
			TCSession session = (TCSession)parameters.get("session"); 
			
//			自定义查询[issues_RichClient]
			String[] conditions = new String[] {"ID"}; 
//			String[] inputs = new String[] {"*" + ((TCComponentProject)(parameters.get("projectInfo"))).getProperty("project_id") + "*"};  
			String[] inputs = new String[] {"*"};  
			TCComponent[] tcComponents = ComponentUtils.findTCComponentByQuery(
						(TCSession)parameters.get("session"),  
						"issues_RichClient", 
						conditions, inputs);
System.out.println("tcComponents.length = " + tcComponents.length);			 
			if (tcComponents.length > 0) {
				
				List<TCComponent> rightComponent = selectComponent(tcComponents, parameters);
				
				if (rightComponent.size() > 0) {
					ArrayList<HashMap<String, Object>> issuelist = new ArrayList<HashMap<String, Object>>();
					
					for (TCComponent tcComponent : rightComponent) {
						HashMap<String, Object> item = new HashMap<String, Object>();
						TCComponentItemRevision fv9IssueRevision = ((TCComponentItem) tcComponent).getLatestItemRevision();
						System.out.println("获取问题：" + fv9IssueRevision + "的信息");
						item.put("item_id", fv9IssueRevision.getProperty("item_id"));  
						item.put("fv9ProposedDate", fv9IssueRevision.getDateProperty("fv9ProposedDate"));  
						item.put("fv9AssPlacement", fv9IssueRevision.getProperty("fv9AssPlacement")); 
						item.put("fv9IssueDesc", fv9IssueRevision.getProperty("fv9IssueDesc")); 
						item.put("fv9IssueCause", fv9IssueRevision.getProperty("fv9IssueCause")); 
						item.put("fv9IssueTempSolution", fv9IssueRevision.getProperty("fv9IssueTempSolution"));  
						item.put("fv9TempSolutionDL", fv9IssueRevision.getDateProperty("fv9TempSolutionDL"));  
						
						item.put("fv9SolutionBS", fv9IssueRevision.getProperty("fv9SolutionBS"));
						item.put("fv9SolutionCA", fv9IssueRevision.getProperty("fv9SolutionCA"));
						item.put("fv9SolutionLO", fv9IssueRevision.getProperty("fv9SolutionLO"));
						item.put("fv9SolutionPA", fv9IssueRevision.getProperty("fv9SolutionPA"));
						item.put("fv9SolutionPL", fv9IssueRevision.getProperty("fv9SolutionPL"));
						item.put("fv9SolutionQAPP", fv9IssueRevision.getProperty("fv9SolutionQAPP"));
						item.put("fv9SolutionSU", fv9IssueRevision.getProperty("fv9SolutionSU"));
						item.put("fv9SolutionVSC", fv9IssueRevision.getProperty("fv9SolutionVSC"));
						item.put("fv9SolutionTE", fv9IssueRevision.getProperty("fv9SolutionTE"));
						
//						item.put("fv9SlResDepBS", fv9IssueRevision.getProperty("fv9SlResDepBS"));
//						item.put("fv9SlResDepCA", fv9IssueRevision.getProperty("fv9SlResDepCA"));
//						item.put("fv9SlResDepLO", fv9IssueRevision.getProperty("fv9SlResDepLO"));
//						item.put("fv9SlResDepPA", fv9IssueRevision.getProperty("fv9SlResDepPA"));
//						item.put("fv9SlResDepPL", fv9IssueRevision.getProperty("fv9SlResDepPL"));
//						item.put("fv9SlResDepQAPP", fv9IssueRevision.getProperty("fv9SlResDepQAPP"));
//						item.put("fv9SlResDepSU", fv9IssueRevision.getProperty("fv9SlResDepSU"));
//						item.put("fv9SlResDepVSC", fv9IssueRevision.getProperty("fv9SlResDepVSC"));
						
						item.put("fv9SlResOwnerBS", fv9IssueRevision.getProperty("fv9SlResOwnerBS"));
						item.put("fv9SlResOwnerCA", fv9IssueRevision.getProperty("fv9SlResOwnerCA"));
						item.put("fv9SlResOwnerLO", fv9IssueRevision.getProperty("fv9SlResOwnerLO"));
						item.put("fv9SlResOwnerPA", fv9IssueRevision.getProperty("fv9SlResOwnerPA"));
						item.put("fv9SlResOwnerPL", fv9IssueRevision.getProperty("fv9SlResOwnerPL"));
						item.put("fv9SlResOwnerQAPP", fv9IssueRevision.getProperty("fv9SlResOwnerQAPP"));
						item.put("fv9SlResOwnerSU", fv9IssueRevision.getProperty("fv9SlResOwnerSU"));
						item.put("fv9SlResOwnerVSC", fv9IssueRevision.getProperty("fv9SlResOwnerVSC"));
						item.put("fv9SlResOwnerTE", fv9IssueRevision.getProperty("fv9SlResOwnerTE"));
						
						item.put("fv9CompletedDate", fv9IssueRevision.getDateProperty("fv9CompletedDate")); 
						item.put("fv9RGStatus", fv9IssueRevision.getProperty("fv9RGStatus")); 
						item.put("fv9IssueType", fv9IssueRevision.getProperty("fv9IssueType")); 
						
						issuelist.add(item);
					}
					
//					ArrayList<HashMap<String, Object>> issuelist = transVOToArrayList(issueVos);
					//按照各个维度统计数据
					//责任部门

					Map<String,Object> department = DepartmentStatusLoader.load(issuelist);
					System.out.println("按责任部门统计" 
							+ "\r\n" + "BS:" + department.get("BS")  
							+ "\r\n" + "CA:" + department.get("CA") 
							+ "\r\n" + "LO:" + department.get("LO") 
							+ "\r\n" + "PA:" + department.get("PA") 
							+ "\r\n" + "PL:" + department.get("PL") 
							+ "\r\n" + "QAPP:" + department.get("QAPP") 
							+ "\r\n" + "SU:" + department.get("SU") 
							+ "\r\n" + "VSC" + department.get("VSC")); 
					
					//零件类型
					Map<String,Object> partType = PartTypeStatusLoader.load(issuelist);
					System.out.println("零件类型："  
							+ "\r\n" + "零件状态：" + partType.get("partStatus") 
							+ "\r\n" + "车身尺寸：" + partType.get("bodySize") 
							+ "\r\n" + "零件匹配：" + partType.get("partMatch") 
							+ "\r\n" + "PDM：" + partType.get("pdm")
							+ "\r\n" + "结构：" + partType.get("structure")
							+ "\r\n" + "零件质量：" + partType.get("quality")
							+ "\r\n" + "明细表：" + partType.get("detail")
							+ "\r\n" + "其它：" + partType.get("other")); 
				    
					//专业组
//					Map<String,Object> mMvalues = MajorLoader.load(issuelist);
//					System.out.println(Messages.major
//							+ "\r\n" + Messages.mm + mMvalues.get("car")  
//							+ "\r\n" + Messages.eqipment + mMvalues.get("accoutrement") 
//							+ "\r\n" + Messages.carbody + mMvalues.get("bodywork") 
//							+ "\r\n" + Messages.electronic + mMvalues.get("eleAppliances") 
//							+ "\r\n" + Messages.chassis + mMvalues.get("chassis") 
//							+ "\r\n" + Messages.total + mMvalues.get("total")); 

					//按时间统计
//					Map<String, Object> TimeIssues = TimeLoader.load(issuelist);
//					
					//装车位置
//					Map<String, Object> assPlacement = AssPlacementLoader.load(issuelist);
//					System.out.println(Messages.assplacement
//							+ "\r\n" + Messages.ReportIssueLoader_7 + assPlacement.get("front")  
//							+ "\r\n" + Messages.behind + assPlacement.get("behind") 
//							+ "\r\n" + Messages.door + assPlacement.get("door") 
//							+ "\r\n" + Messages.inner + assPlacement.get("inner") 
//							+ "\r\n" + Messages.chassis2 + assPlacement.get("chassis") 
//							+ "\r\n" + Messages.driver + assPlacement.get("driver") 
//							+ "\r\n" + Messages.electronic2 + assPlacement.get("electronik")); 
					
					values.put("issues", issuelist); 
					values.put("department", department); 
					values.put("partType", partType); 
//					values.put("mMvalues", mMvalues); 
//					values.put("TimeIssues", TimeIssues); 
//					values.put("assPlacement", assPlacement); 
					
					System.out.println("获取数据结束"); 
					
					return values;
				}
				return null;
				
			} else {
				
				System.out.println("系统中不存在问题"); 
				return null;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new FawvmLoaderException(e.getMessage());
			
		}

	}
	
	
	
}
