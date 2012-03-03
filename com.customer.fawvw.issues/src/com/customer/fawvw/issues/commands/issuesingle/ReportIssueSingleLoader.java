package com.customer.fawvw.issues.commands.issuesingle;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.DateUtil;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentForm;
import com.teamcenter.rac.kernel.TCComponentGroup;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentRole;
import com.teamcenter.rac.kernel.TCComponentUser;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class ReportIssueSingleLoader {

	private ReportIssueSingleLoader() {
	}

	public static Map<String, Object> load(
			InterfaceAIFComponent targetcompontent,
			TCSession session) throws Exception {

		Map<String, Object> values = new HashMap<String, Object>();

		InterfaceAIFComponent fv9IssueRevision;
		
		try {
			fv9IssueRevision = ((TCComponentItem) targetcompontent).getLatestItemRevision();
			values.put("fv9IssueRevision", fv9IssueRevision); 
			
			try {
				Map<String, Object> problemImage = ComponentUtils
					.loadComponentItemRelatedImage1(
						(TCComponentItem) targetcompontent, "FV9DescPhoto"); 
				values.put("problemImage", problemImage); 
				
				if (problemImage.containsKey("datasetName")) { 
					System.out.println("对象关系为FV9DescPhoto的Image数据集为：" + problemImage.get("datasetName")); //$NON-NLS-2$         
				}
				
				values.put("fv9PartNumber", fv9IssueRevision 
						.getProperty("fv9PartNumber")); 
				System.out.println("涉及零件编号：" + fv9IssueRevision 
						.getProperty("fv9PartNumber")); 
				
				values.put("fv9PartName", fv9IssueRevision 
						.getProperty("fv9PartName")); 
				System.out.println("零件名称：" + fv9IssueRevision  
						.getProperty("fv9PartName")); 
				
				values.put("fv9IssueDesc", fv9IssueRevision 
						.getProperty("fv9IssueDesc")); 
				System.out.println("问题描述：" + fv9IssueRevision  
						.getProperty("fv9IssueDesc")); 
				
				values.put("fv9IssueTempSolution", fv9IssueRevision 
						.getProperty("fv9IssueTempSolution")); 
				System.out.println("临时措施：" + fv9IssueRevision 
						.getProperty("fv9IssueTempSolution")); 
				
				values.put("fv9TempSolutionDL", fv9IssueRevision 
						.getProperty("fv9TempSolutionDL")); 
				System.out.println("临时措施完成期限：" + fv9IssueRevision 
						.getProperty("fv9TempSolutionDL")); 
				
				values.put("fv9SolutionBS", fv9IssueRevision 
						.getProperty("fv9SolutionBS")); 
				System.out.println("BS措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionBS")); 
				
				values.put("fv9SlDLDateBS", fv9IssueRevision 
						.getProperty("fv9SlDLDateBS")); 
				System.out.println("BS措施完成期限： " + fv9IssueRevision  
						.getProperty("fv9SlDLDateBS")); 
			
				values.put("fv9SolutionCA", fv9IssueRevision 
						.getProperty("fv9SolutionCA")); 
				System.out.println("CA措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionCA")); 
				
				values.put("fv9SlDLDateCA", fv9IssueRevision 
						.getProperty("fv9SlDLDateCA")); 
				System.out.println("CA措施完成期限：" + fv9IssueRevision  
						.getProperty("fv9SlDLDateCA")); 
								
				values.put("fv9SolutionLO", fv9IssueRevision 
						.getProperty("fv9SolutionLO")); 
				System.out.println("LO措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionLO")); 
				
				values.put("fv9SlDLDateLO", fv9IssueRevision 
						.getProperty("fv9SlDLDateLO")); 
				System.out.println("LO措施完成期限：" + fv9IssueRevision  
						.getProperty("fv9SlDLDateLO")); 
				
				values.put("fv9SolutionPA", fv9IssueRevision 
						.getProperty("fv9SolutionPA")); 
				System.out.println("PA措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionPA")); 
				
				values.put("fv9SlDLDatePA", fv9IssueRevision 
						.getProperty("fv9SlDLDatePA")); 
				System.out.println("PA措施完成期限： " + fv9IssueRevision  
						.getProperty("fv9SlDLDatePA")); 
				
				values.put("fv9SolutionPL", fv9IssueRevision 
						.getProperty("fv9SolutionPL")); 
				System.out.println("PL措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionPL")); 
				
				values.put("fv9SlDLDatePL", fv9IssueRevision 
						.getProperty("fv9SlDLDatePL")); 
				System.out.println("PL措施完成期限：" + fv9IssueRevision  
						.getProperty("fv9SlDLDatePL")); 
				
				values.put("fv9SolutionQAPP", fv9IssueRevision 
						.getProperty("fv9SolutionQAPP")); 
				System.out.println("QAPP措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionQAPP")); 
				
				values.put("fv9SlDLDateQAPP", fv9IssueRevision 
						.getProperty("fv9SlDLDateQAPP")); 
				System.out.println("QAPP措施完成期限：" + fv9IssueRevision  
						.getProperty("fv9SlDLDateQAPP")); 
				
				values.put("fv9SolutionSU", fv9IssueRevision 
						.getProperty("fv9SolutionSU")); 
				System.out.println("SU措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionSU")); 
				
				values.put("fv9SlDLDateSU", fv9IssueRevision 
						.getProperty("fv9SlDLDateSU")); 
				System.out.println("SU措施完成期限：" + fv9IssueRevision  
						.getProperty("fv9SlDLDateSU")); 
				
				values.put("fv9SolutionVSC", fv9IssueRevision 
						.getProperty("fv9SolutionVSC")); 
				System.out.println("VSC措施：" + fv9IssueRevision  
						.getProperty("fv9SolutionVSC")); 
				
				values.put("fv9SlDLDateVSC", fv9IssueRevision 
						.getProperty("fv9SlDLDateVSC")); 
				System.out.println("VSC措施完成期限：" + fv9IssueRevision  
						.getProperty("fv9SlDLDateVSC")); 
				
				values.put("fv9RGStatus", fv9IssueRevision 
						.getProperty("fv9RGStatus")); 
			
				System.out.println("红绿灯状态：" + fv9IssueRevision  
						.getProperty("fv9RGStatus")); 
				
				values.put("fv9SupplierID", fv9IssueRevision 
						.getProperty("fv9SupplierID")); 
				System.out.println("供应商号：" + fv9IssueRevision 
						.getProperty("fv9SupplierID")); 
				
				values.put("fv9SupplierName", fv9IssueRevision 
						.getProperty("fv9SupplierName")); 
				
				System.out.println("供应商名称：" + fv9IssueRevision  
						.getProperty("fv9SupplierName")); 
				
				values.put("itemId", fv9IssueRevision.getProperty("item_id"));  //$NON-NLS-2$
				
				//项目所属项目ID
				TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
						fv9IssueRevision, "fv9ProjectLov"); 
				String project_id = ""; 
				//取第一个项目的SOP TBT等时间
				if (projects.length > 0) {
					project_id = projects[0].getProperty("project_id"); 
				}
				//如果问题属于某个项目，获取属于该项目的FV9PHReportItemRev
				//条件是：FV9PHReportItemRev已发放，Owner的角色是产品经理，且创建时间最晚
				String[] condition = {"项目 ID", "名称"};  //$NON-NLS-2$
				String[] value = {project_id, "TCM Released"}; 
				TCComponent[] PHReportItemRevs = ComponentUtils.findTCComponentByQuery(
						session, "QueryLastPHReportRevision", condition, value); 
				
				List<TCComponent> list = new ArrayList<TCComponent>();
				//遍历符合条件的owning_user，找到所有者角色为"产品经理"的PHReportItemRevs
				//符合条件的添加到list中
				for (int i = 0; i < PHReportItemRevs.length; i++) {
					
					TCComponent itemRev = (TCComponent)PHReportItemRevs[i];
					TCComponent owning_user = itemRev.getReferenceProperty("owning_user"); 
					if (owning_user instanceof TCComponentUser) {
						TCComponentUser user = (TCComponentUser)owning_user;
						Map groupRoles = user.getGroupRolesTable();
						System.out.println("groupRoles = " + groupRoles); 
						
						Collection<List<TCComponentRole>> allRoles = groupRoles.values();
						
						Iterator it = allRoles.iterator();
						
						for (; it.hasNext(); ) {
							List<TCComponentRole> roleList = (List<TCComponentRole>)it.next();
							for (TCComponentRole role : roleList) {
								if ("产品经理".equals(role.getProperty("role_name"))) {  //$NON-NLS-2$
									list.add(itemRev);
								}
							}
						}

					}
				}
				
				//不存在符合条件的PHReportItemRevs
				if (list.size() <= 0) {
					values.put("PH_SOP", null); 
					values.put("TBT_VFF", null); 
					values.put("TBT_PVS", null); 
					values.put("TBT_0S", null); 
				} else {
					//获取创建日期最晚的
					//FV9_11ProjectTermin的fv9SOPMLDate
					//FV9_11VorserienTer的fv9VFFTBTZP7、fv9PVSTBTZP7、fv90STBTZP7
					TCComponent PHReportRev = QueryLastCreateTCComponent(list);
//					InterfaceAIFComponent FV9_11ProjectTermin = ComponentUtils.
//						getChildComponentByType(PHReportRev, "FV9_11ProjectTermin"); 
					if ((List<TCComponent>)ComponentUtils.getComponentByRelationAndType(
							PHReportRev, "FV9PMPH_Rel", "FV9_11ProjectTermin") != null &&
						((List<TCComponent>)ComponentUtils.getComponentByRelationAndType(
							PHReportRev, "FV9PMPH_Rel", "FV9_11ProjectTermin")).size() > 0) {
						
						TCComponent FV9_11ProjectTermin = ((List<TCComponent>)ComponentUtils.getComponentByRelationAndType(
								PHReportRev, "FV9PMPH_Rel", "FV9_11ProjectTermin")).get(0);
						
						if (FV9_11ProjectTermin instanceof TCComponentForm) {
							TCComponentForm form = (TCComponentForm)FV9_11ProjectTermin;
							Date vff = form.getDateProperty("fv9VFFMLDate");
							Date pvs = form.getDateProperty("fv9PVSMLDate");
							Date os = form.getDateProperty("fv90SMLDate");
							Date sop = form.getDateProperty("fv9SOPMLDate"); 
							if (vff == null) {
								values.put("PH_VFF", null);
							} else {
								values.put("PH_VFF", vff);
							}
							if (pvs == null) {
								values.put("PH_PVS", null);
							} else {
								values.put("PH_PVS", pvs);
							}
							if (os == null) {
								values.put("PH_0S", null);
							} else {
								values.put("PH_0S", os);
							}
							if (sop == null) {
								values.put("PH_SOP", null); 
							} else {
								values.put("PH_SOP", sop); 
							}
							
						}
					}
					
//					InterfaceAIFComponent FV9_11VorserienTer = ComponentUtils.
//						getChildComponentByType(PHReportRev, "FV9_11VorserienTer"); 
					if ((List<TCComponent>)ComponentUtils.getComponentByRelationAndType(
							PHReportRev, "FV9PMPH_Rel", "FV9_11VorserienTer") != null &&
						((List<TCComponent>)ComponentUtils.getComponentByRelationAndType(
							PHReportRev, "FV9PMPH_Rel", "FV9_11VorserienTer")).size() > 0) {
						
						TCComponent FV9_11VorserienTer = ((List<TCComponent>)ComponentUtils.getComponentByRelationAndType(
								PHReportRev, "FV9PMPH_Rel", "FV9_11VorserienTer")).get(0);
						
						if (FV9_11VorserienTer instanceof TCComponentForm) {
							TCComponentForm form = (TCComponentForm)FV9_11VorserienTer;
							Date TBT_VFF = form.getDateProperty("fv9VFFTBTZP7"); 
							if (TBT_VFF == null) {
								values.put("TBT_VFF", null); 
							} else {
								values.put("TBT_VFF", TBT_VFF); 
							}
							
							Date TBT_PVS = form.getDateProperty("fv9PVSTBTZP7"); 
							if (TBT_PVS == null) {
								values.put("TBT_PVS", null); 
							} else {
								values.put("TBT_PVS", TBT_PVS); 
							}
							
							Date TBT_0S = form.getDateProperty("fv90STBTZP7"); 
							if (TBT_0S == null) {
								values.put("TBT_0S", null); 
							} else {
								values.put("TBT_0S", TBT_0S); 
							}
							
						}
					}
					
				}
				
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new FawvmLoaderException("程序执行失败,请参考日志"); 
			}

		} catch (TCException e) {
			e.printStackTrace();
			throw new FawvmLoaderException("程序执行失败,请参考日志"); 
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new FawvmLoaderException("程序执行失败,请参考日志"); 
			
		}

		return values;
	}

	private static TCComponent QueryLastCreateTCComponent(List<TCComponent> list) {
		
		//如果只有一个PHReportItemRevs，则取此PHReportItemRevs
		//如果存在一个以上的PHReportItemRevs，则取创建时间最晚的
		if (list.size() > 0) {
			//按创建时间倒序排序(晚——>早)
			Collections.sort(list, new Comparator<TCComponent>() {
				public int compare(TCComponent tc1, TCComponent tc2) {
					Date date1;
					Date date2;
					try {
						date1 = tc1.getDateProperty("creation_date"); 
						date2 = tc2.getDateProperty("creation_date"); 
						return DateUtil.dateDiffSecond(date1,date2);
					} catch (TCException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					return 0;
					
				}
			});

		}
		return list.get(0);
	}
	
}
