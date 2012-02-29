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
			
			values.put("fv9IssueDesc", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9IssueDesc")); //$NON-NLS-1$
			System.out.println("问题描述：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9IssueDesc")); //$NON-NLS-1$
			
			values.put("fv9Solution1", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Solution1")); //$NON-NLS-1$
			System.out.println("措施1：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Solution1")); //$NON-NLS-1$
			
			values.put("fv9Solution2", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Solution2")); //$NON-NLS-1$
			System.out.println("措施2：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Solution2")); //$NON-NLS-1$
			
			values.put("fv9Solution3", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Solution3")); //$NON-NLS-1$
			System.out.println("措施3：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Solution3")); //$NON-NLS-1$
			
			values.put("fv9Solution4", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Solution4")); //$NON-NLS-1$
			System.out.println("措施4：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Solution4")); //$NON-NLS-1$
			
			values.put("fv9Solution5", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Solution5")); //$NON-NLS-1$
			System.out.println("措施5：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Solution5")); //$NON-NLS-1$
			
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
			
			values.put("fv9SlResOwner1", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9SlResOwner1")); //$NON-NLS-1$
			System.out.println("措施1责任人:" +  //$NON-NLS-1$
					fv9IssueRevisio.getProperty("fv9SlResOwner1")); //$NON-NLS-1$
			
			values.put("fv9SlResOwner2", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9SlResOwner2")); //$NON-NLS-1$
			System.out.println("措施2责任人:" +  //$NON-NLS-1$
					fv9IssueRevisio.getProperty("fv9SlResOwner2")); //$NON-NLS-1$
			
			values.put("fv9SlResOwner3", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9SlResOwner3")); //$NON-NLS-1$
			System.out.println("措施3责任人:" +  //$NON-NLS-1$
					fv9IssueRevisio.getProperty("fv9SlResOwner3")); //$NON-NLS-1$
			
			values.put("fv9SlResOwner4", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9SlResOwner4")); //$NON-NLS-1$
			System.out.println("措施4责任人:" +  //$NON-NLS-1$
					fv9IssueRevisio.getProperty("fv9SlResOwner4")); //$NON-NLS-1$
			
			values.put("fv9SlResOwner5", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9SlResOwner5")); //$NON-NLS-1$
			System.out.println("措施5责任人:" +  //$NON-NLS-1$
					fv9IssueRevisio.getProperty("fv9SlResOwner5")); //$NON-NLS-1$
			
			values.put("fv9Verifier", fv9IssueRevisio //$NON-NLS-1$
					.getProperty("fv9Verifier")); //$NON-NLS-1$
			System.out.println("验证人：" + fv9IssueRevisio  //$NON-NLS-1$
					.getProperty("fv9Verifier")); //$NON-NLS-1$
			
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
