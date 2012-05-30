package com.customer.fawvw.issues.commands.issueinfo;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import com.customer.fawvw.issues.utils.ComponentUtils;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCException;

public class ReportIssueSingleInfoLoader {
	
	private ReportIssueSingleInfoLoader() {
	}

	public static Map<String, Object> load(
			InterfaceAIFComponent targetcompontent) {

		Map<String, Object> values = new HashMap<String, Object>();

		InterfaceAIFComponent fv9IssueRevisio;
		try {
			System.out.println("开始获取数据"); //$NON-NLS-1$
			
			fv9IssueRevisio = ((TCComponentItem) targetcompontent)
					.getLatestItemRevision();
			values.put("fv9IssueRevision", fv9IssueRevisio); //$NON-NLS-1$
			
			Map<String, Object> problemImage = ComponentUtils
					.loadComponentItemRelatedImage1(
							(TCComponentItem) targetcompontent, "FV9DescPhoto"); //$NON-NLS-1$
			values.put("problemImage", problemImage); //$NON-NLS-1$
			if (problemImage.containsKey("datasetName")) { //$NON-NLS-1$
				System.out.println("对象关系为FV9DescPhoto的Image数据集为：" + problemImage.get("datasetName")); //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$
				
			}
			
			values.put("ItemID", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("item_id")); //$NON-NLS-1$
			System.out.println("问题单号：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("item_id")); //$NON-NLS-1$
			
			values.put("fv9PartNumber", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9PartNumber")); //$NON-NLS-1$
			System.out.println("涉及零件号：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9PartNumber")); //$NON-NLS-1$
			
			values.put("fv9PartName", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9PartName")); //$NON-NLS-1$
			System.out.println("涉及零件名称：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9PartName")); //$NON-NLS-1$
			
			values.put("fv9IssueReqCarNo", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9IssueReqCarNo")); //$NON-NLS-1$
			System.out.println("涉及车辆编号：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9IssueReqCarNo")); //$NON-NLS-1$
			
			values.put("fv9Proposer", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Proposer")); //$NON-NLS-1$
			System.out.println("提出人：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Proposer")); //$NON-NLS-1$
			
			values.put("fv9ProposedDate", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9ProposedDate")); //$NON-NLS-1$
			System.out.println("提出日期：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9ProposedDate")); //$NON-NLS-1$
			
			values.put("fv9RGStatus", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9RGStatus")); //$NON-NLS-1$
			System.out.println("红绿灯状态：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9RGStatus")); //$NON-NLS-1$
			
			values.put("fv9SolDeadlineDate", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9SolDeadlineDate")); //$NON-NLS-1$
			System.out.println("解决期限：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9SolDeadlineDate")); //$NON-NLS-1$
			
			values.put("fv9Verifier", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Verifier")); //$NON-NLS-1$
			System.out.println("验证人：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Verifier")); //$NON-NLS-1$
			
			values.put("fv9IssueTempSolution", fv9IssueRevisio 
					.getProperty("fv9IssueTempSolution")); 
			System.out.println("临时措施：" + fv9IssueRevisio 
					.getProperty("fv9IssueTempSolution")); 
			
			values.put("fv9TempSolutionDL", fv9IssueRevisio 
					.getProperty("fv9TempSolutionDL")); 
			System.out.println("临时措施完成期限：" + fv9IssueRevisio 
					.getProperty("fv9TempSolutionDL")); 
			
			values.put("fv9TempSolutionImpOwner", fv9IssueRevisio 
					.getProperty("fv9TempSolutionImpOwner")); 
			System.out.println("临时措施负责人：" + fv9IssueRevisio 
					.getProperty("fv9TempSolutionImpOwner")); 
							
			values.put("fv9SolutionLO", fv9IssueRevisio 
					.getProperty("fv9SolutionLO")); 
			System.out.println("LO措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionLO")); 
			
			values.put("fv9SlDLDateLO", fv9IssueRevisio 
					.getProperty("fv9SlDLDateLO")); 
			System.out.println("LO措施完成期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateLO")); 
			
			values.put("fv9SlResOwnerLO", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerLO")); 
			System.out.println("LO措施责任人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerLO")); 
			
			values.put("fv9SolutionPL", fv9IssueRevisio 
					.getProperty("fv9SolutionPL")); 
			System.out.println("PL措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionPL")); 
			
			values.put("fv9SlDLDatePL", fv9IssueRevisio 
					.getProperty("fv9SlDLDatePL")); 
			System.out.println("PL措施完成期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDatePL")); 
			
			values.put("fv9SlResOwnerPL", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerPL")); 
			System.out.println("PL措施责任人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerPL")); 
			
			values.put("fv9SolutionQAPP", fv9IssueRevisio 
					.getProperty("fv9SolutionQAPP")); 
			System.out.println("QAPP措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionQAPP")); 
			
			values.put("fv9SlDLDateQAPP", fv9IssueRevisio 
					.getProperty("fv9SlDLDateQAPP")); 
			System.out.println("QAPP措施完成期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateQAPP")); 
			
			values.put("fv9SlResOwnerQAPP", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerQAPP")); 
			System.out.println("QAPP措施责任人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerQAPP")); 
			
			values.put("fv9SolutionSU", fv9IssueRevisio 
					.getProperty("fv9SolutionSU")); 
			System.out.println("SU措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionSU")); 
			
			values.put("fv9SlDLDateSU", fv9IssueRevisio 
					.getProperty("fv9SlDLDateSU")); 
			System.out.println("SU措施完成期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateSU")); 
			
			values.put("fv9SlResOwnerSU", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerSU")); 
			System.out.println("SU措施责任人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerSU")); 
			
			values.put("fv9SolutionVSC", fv9IssueRevisio 
					.getProperty("fv9SolutionVSC")); 
			System.out.println("VSC措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionVSC")); 
			
			values.put("fv9SlDLDateVSC", fv9IssueRevisio 
					.getProperty("fv9SlDLDateVSC")); 
			System.out.println("VSC措施完成期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateVSC")); 
			
			values.put("fv9SlResOwnerVSC", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerVSC")); 
			System.out.println("VSC措施责任人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerVSC")); 

			values.put("fv9SolutionTE", fv9IssueRevisio 
					.getProperty("fv9SolutionTE")); 
			System.out.println("TE措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionTE")); 
			
			values.put("fv9SlDLDateTE", fv9IssueRevisio 
					.getProperty("fv9SlDLDateTE")); 
			System.out.println("TE措施完成期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateTE")); 
			
			values.put("fv9SlResOwnerTE", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerTE")); 
			System.out.println("TE措施责任人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerTE")); 
			
			values.put("fv9SolutionCP1_ME", fv9IssueRevisio 
					.getProperty("fv9SolutionCP1_ME"));
			System.out.println("CP1-ME措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionCP1_ME")); 
			
			values.put("fv9SlDLDateCP1_ME", fv9IssueRevisio 
					.getProperty("fv9SlDLDateCP1_ME"));
			System.out.println("CP1-ME措施解决期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateCP1_ME")); 
			
			values.put("fv9SlResOwnerCP1_ME", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerCP1_ME")); 
			System.out.println("CP1-ME措施负责人： " + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerCP1_ME")); 
			
			values.put("fv9SolutionBS", fv9IssueRevisio 
					.getProperty("fv9SolutionBS")); 
			System.out.println("CP1-BS措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionBS")); 
			
			values.put("fv9SlDLDateBS", fv9IssueRevisio 
					.getProperty("fv9SlDLDateBS")); 
			System.out.println("CP1-BS措施完成期限： " + fv9IssueRevisio  
					.getProperty("fv9SlDLDateBS")); 
			
			values.put("fv9SlResOwnerBS", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerBS")); 
			System.out.println("CP1-BS措施负责人： " + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerBS")); 
		
			values.put("fv9SolutionCA", fv9IssueRevisio 
					.getProperty("fv9SolutionCA")); 
			System.out.println("CP1-CA措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionCA")); 
			
			values.put("fv9SlDLDateCA", fv9IssueRevisio 
					.getProperty("fv9SlDLDateCA")); 
			System.out.println("CP1-CA措施完成期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateCA")); 
			
			values.put("fv9SlResOwnerCA", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerCA")); 
			System.out.println("CP1-CA措施负责人： " + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerCA")); 
			
			values.put("fv9SolutionPA", fv9IssueRevisio 
					.getProperty("fv9SolutionPA")); 
			System.out.println("CP1-PA措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionPA")); 
			
			values.put("fv9SlDLDatePA", fv9IssueRevisio 
					.getProperty("fv9SlDLDatePA")); 
			System.out.println("CP1-PA措施完成期限： " + fv9IssueRevisio  
					.getProperty("fv9SlDLDatePA")); 
			
			values.put("fv9SlResOwnerPA", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerPA")); 
			System.out.println("CP1-PA措施负责人： " + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerPA")); 
			
			values.put("fv9SolutionCP2_ME", fv9IssueRevisio 
					.getProperty("fv9SolutionCP2_ME"));
			System.out.println("CP2-ME措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionCP2_ME")); 
			
			values.put("fv9SlDLDateCP2_ME", fv9IssueRevisio 
					.getProperty("fv9SlDLDateCP2_ME"));
			System.out.println("CP2-ME措施解决期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateCP2_ME")); 
			
			values.put("fv9SlResOwnerCP2_ME", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerCP2_ME")); 
			System.out.println("CP2-ME措施负责人： " + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerCP2_ME")); 
			
			values.put("fv9SolutionCP2BS", fv9IssueRevisio 
					.getProperty("fv9SolutionCP2BS"));
			System.out.println("CP2-BS措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionCP2BS")); 
			
			values.put("fv9SlDLDateCP2BS", fv9IssueRevisio 
					.getProperty("fv9SlDLDateCP2BS"));
			System.out.println("CP2-BS措施解决期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateCP2BS")); 
			
			values.put("fv9SlResOwnerCP2BS", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerCP2BS"));
			System.out.println("CP2-BS措施负责人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerCP2BS")); 
			
			values.put("fv9SolutionCP2PA", fv9IssueRevisio 
					.getProperty("fv9SolutionCP2PA"));
			System.out.println("CP2-PA措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionCP2PA")); 
			
			values.put("fv9SlDLDateCP2PA", fv9IssueRevisio 
					.getProperty("fv9SlDLDateCP2PA"));
			System.out.println("CP2-PA措施解决期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateCP2PA")); 
			
			values.put("fv9SlResOwnerCP2PA", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerCP2PA"));
			System.out.println("CP2-PA措施负责人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerCP2PA")); 
			
			values.put("fv9SolutionCP2CA", fv9IssueRevisio 
					.getProperty("fv9SolutionCP2CA"));
			System.out.println("CP2-CA措施：" + fv9IssueRevisio  
					.getProperty("fv9SolutionCP2CA")); 
			
			values.put("fv9SlDLDateCP2CA", fv9IssueRevisio 
					.getProperty("fv9SlDLDateCP2CA"));
			System.out.println("CP2-CA措施解决期限：" + fv9IssueRevisio  
					.getProperty("fv9SlDLDateCP2CA")); 
			
			values.put("fv9SlResOwnerCP2CA", fv9IssueRevisio 
					.getProperty("fv9SlResOwnerCP2CA"));
			System.out.println("CP2-CA措施负责人：" + fv9IssueRevisio  
					.getProperty("fv9SlResOwnerCP2CA")); 
			
			values.put("fv9IssueDesc", fv9IssueRevisio 
					.getProperty("fv9IssueDesc"));
			System.out.println("问题描述：" + fv9IssueRevisio  
					.getProperty("fv9IssueDesc")); 
			
			values.put("project_ids", fv9IssueRevisio.getProperty("project_ids")); //$NON-NLS-1$ //$NON-NLS-2$
			
			System.out.println("获取数据结束"); //$NON-NLS-1$
		} catch (TCException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return values;
	}
}
