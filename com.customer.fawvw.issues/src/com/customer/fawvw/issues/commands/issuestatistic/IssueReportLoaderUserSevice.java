package com.customer.fawvw.issues.commands.issuestatistic;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.customer.fawvw.issues.commands.common.loader.DeptLoader;
import com.customer.fawvw.issues.commands.common.loader.MajorLoader;
import com.customer.fawvw.issues.commands.common.loader.TimeLoader;

public class IssueReportLoaderUserSevice {
	
	public static HashMap<String, Object> loadTxtData(File txt) {
		HashMap<String, Object> values = null;
		try {
			values = new HashMap<String, Object>();

			ArrayList<HashMap<String, Object>> issuelist = new ArrayList<HashMap<String, Object>>();

			String encoding = "GB2312";  //$NON-NLS-1$
			String s = null;
			StringBuffer result=new StringBuffer();
			FileInputStream in=new FileInputStream(txt);
			InputStreamReader r = new InputStreamReader(in, encoding);
			BufferedReader rin=new BufferedReader(r);
			while((s=rin.readLine())!=null){
			    result.append(s);
			}
			String printstr = result.toString();
			issuelist = stringToList(printstr);
			
			Map<String,Object> department = DeptLoader.load(issuelist);
			Map<String,Object> mMvalues = MajorLoader.load(issuelist);
			Map<String, Object> TimeIssues = TimeLoader.load(issuelist);
			Map<String, Object> assPlacement = AssPlacementLoader.load(issuelist);
			
			values.put("department",department); //$NON-NLS-1$
			values.put("mMvalues",mMvalues); //$NON-NLS-1$
			values.put("issues",issuelist); //$NON-NLS-1$
			values.put("TimeIssues", TimeIssues); //$NON-NLS-1$
			values.put("assPlacement", assPlacement); //$NON-NLS-1$
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     
		return values;
	}
	
	public static ArrayList<HashMap<String, Object>> stringToList(String str) {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		String item_id;//问题单号
		String fv9PartNumber;//涉及零件号
		String fv9PartName;//涉及零件名称
		String fv9IssueDesc;//问题描述
		String fv9IssueReqCarNo;//涉及车辆编号
		String fv9IssueVeriCarNo;//验证车辆编号
		String fv9IssueCause;//问题原因
		String fv9SolDeadlineDate;//解决期限
		String fv9CompletedDate;//实际完成日期
		String fv9IssueTempSolution;//临时措施
		String fv9Priority;//重要程度
		String fv9Solution1;//措施1
		String fv9SlDLDate1;//措施1完成期限
		String fv9SlResDep1;//措施1责任部门
		String fv9SlResOwner1;//措施1责任人
		String fv9Solution2;//措施2
		String fv9SlDLDate2;//措施2完成期限
		String fv9SlResDep2;//措施2责任部门
		String fv9SlResOwner2;//措施2责任人
		String fv9Solution3;//措施3
		String fv9SlDLDate3;//措施3完成期限
		String fv9SlResDep3;//措施3责任部门
		String fv9SlResOwner3;//措施3责任人
		String fv9Solution4;//措施4
		String fv9SlDLDate4;//措施4完成期限
		String fv9SlResDep4;//措施4责任部门
		String fv9SlResOwner4;//措施4责任人
		String fv9Solution5;//措施5
		String fv9SlDLDate5;//措施5完成期限
		String fv9SlResDep5;//措施5责任部门
		String fv9SlResOwner5;//措施5责任人
		String fv9AssPlacement;//装车位置
		String fv9ManagingMajor;//所属专业
		String fv9RGStatus;//红绿灯状态
		String fv9IssueStatus;//问题处理状态
		String fv9TimeChangeRed;//问题提交日期
		String fv9TimeAnalyzed;//问题分析日期 
		String fv9TimeDispatched;//问题分派日期
		String fv9TimeChangeYellow;//解决方案完成日期
		String fv9TimeImplemented;//问题方案实施日期
		String fv9TimeValidated;//问题验证日期
		String fv9TimeChangeGreen;//问题关闭日期
		String fv9IssueFindMileStone;//里程碑阶段
		String fv9IsRelToAuditScore;//是否与Audit降分相关
		String fv9AuditScoreDecreased;//可降Audit分值
		String fv9FactoryName;//分厂名称
		String fv9WorkshopName;//车间名称
		String fv9WorkSegmentName;//工段名称
		String fv9Proposer;//提出人
		String fv9TelOfProposer;//提出人电话
		String fv9ProposedDate;//提出时间
		String fv9Submiter;//填写人
		String fv9SupplierID;//供应商号
		String fv9SupplierName;//供应商名称
		String fv9Verifier;//验证人
		String fv9IssueComments;//备注
		
		String[] issueArr = str.split("#"); //$NON-NLS-1$
		for (int i = 1; i < issueArr.length; i++) {
			
			HashMap<String, Object> item = new HashMap<String, Object>();
			String[] issueInfo = issueArr[i].split("@"); //$NON-NLS-1$
			
			item_id = issueInfo[0];
			fv9PartNumber = issueInfo[1];
			fv9PartName = issueInfo[2];
			fv9IssueDesc = issueInfo[3];
			fv9IssueReqCarNo = issueInfo[4];
			fv9IssueVeriCarNo = issueInfo[5];
			fv9IssueCause = issueInfo[6];
			fv9SolDeadlineDate = issueInfo[7];
			fv9CompletedDate = issueInfo[8];
			fv9IssueTempSolution = issueInfo[9];
			fv9Priority = issueInfo[10];
			fv9Solution1 = issueInfo[11];
			fv9SlDLDate1 = issueInfo[12];
			fv9SlResDep1 = issueInfo[13];
			fv9SlResOwner1 = issueInfo[14];
			fv9Solution2 = issueInfo[15];
			fv9SlDLDate2 = issueInfo[16];
			fv9SlResDep2 = issueInfo[17];
			fv9SlResOwner2 = issueInfo[18];
			fv9Solution3 = issueInfo[19];
			fv9SlDLDate3 = issueInfo[20];
			fv9SlResDep3 = issueInfo[21];
			fv9SlResOwner3 = issueInfo[22];
			fv9Solution4 = issueInfo[23];
			fv9SlDLDate4 = issueInfo[24];
			fv9SlResDep4 = issueInfo[25];
			fv9SlResOwner4 = issueInfo[26];
			fv9Solution5 = issueInfo[27];
			fv9SlDLDate5 = issueInfo[28];
			fv9SlResDep5 = issueInfo[29];
			fv9SlResOwner5 = issueInfo[30];
			fv9AssPlacement = issueInfo[31];
			fv9ManagingMajor = issueInfo[32];
			fv9RGStatus = issueInfo[33];
			fv9IssueStatus = issueInfo[34];
			fv9TimeChangeRed = issueInfo[35];
			fv9TimeAnalyzed = issueInfo[36];
			fv9TimeDispatched = issueInfo[37];
			fv9TimeChangeYellow = issueInfo[38];
			fv9TimeImplemented = issueInfo[39];
			fv9TimeValidated = issueInfo[40];
			fv9TimeChangeGreen = issueInfo[41];
			fv9IssueFindMileStone = issueInfo[42];
			fv9IsRelToAuditScore = issueInfo[43];
			fv9AuditScoreDecreased = issueInfo[44];
			fv9FactoryName = issueInfo[45];
			fv9WorkshopName = issueInfo[46];
			fv9WorkSegmentName = issueInfo[47];
			fv9Proposer = issueInfo[48];
			fv9TelOfProposer = issueInfo[49];
			fv9ProposedDate = issueInfo[50];
			fv9Submiter = issueInfo[51];
			fv9SupplierID = issueInfo[52];
			fv9SupplierName = issueInfo[53];
			fv9Verifier = issueInfo[54];
			fv9IssueComments = issueInfo[55];
			
			item.put("item_id", item_id); //$NON-NLS-1$
			item.put("fv9PartNumber", fv9PartNumber); //$NON-NLS-1$
			item.put("fv9PartName", fv9PartName); //$NON-NLS-1$
			item.put("fv9IssueDesc", fv9IssueDesc); //$NON-NLS-1$
			item.put("fv9IssueReqCarNo", fv9IssueReqCarNo); //$NON-NLS-1$
			item.put("fv9IssueVeriCarNo", fv9IssueVeriCarNo); //$NON-NLS-1$
			item.put("fv9IssueCause", fv9IssueCause); //$NON-NLS-1$
			item.put("fv9SolDeadlineDate", fv9SolDeadlineDate); //$NON-NLS-1$
			item.put("fv9CompletedDate", fv9CompletedDate); //$NON-NLS-1$
			item.put("fv9IssueTempSolution", fv9IssueTempSolution); //$NON-NLS-1$
			item.put("fv9Priority", fv9Priority); //$NON-NLS-1$
			item.put("fv9Solution1", fv9Solution1); //$NON-NLS-1$
			item.put("fv9SlDLDate1", fv9SlDLDate1); //$NON-NLS-1$
			item.put("fv9SlResDep1", fv9SlResDep1); //$NON-NLS-1$
			item.put("fv9SlResOwner1", fv9SlResOwner1); //$NON-NLS-1$
			item.put("fv9Solution2", fv9Solution2); //$NON-NLS-1$
			item.put("fv9SlDLDate2", fv9SlDLDate2); //$NON-NLS-1$
			item.put("fv9SlResDep2", fv9SlResDep2); //$NON-NLS-1$
			item.put("fv9SlResOwner2", fv9SlResOwner2); //$NON-NLS-1$
			item.put("fv9Solution3", fv9Solution3); //$NON-NLS-1$
			item.put("fv9SlDLDate3", fv9SlDLDate3); //$NON-NLS-1$
			item.put("fv9SlResDep3", fv9SlResDep3); //$NON-NLS-1$
			item.put("fv9SlResOwner3", fv9SlResOwner3); //$NON-NLS-1$
			item.put("fv9Solution4", fv9Solution4); //$NON-NLS-1$
			item.put("fv9SlDLDate4", fv9SlDLDate4); //$NON-NLS-1$
			item.put("fv9SlResDep4", fv9SlResDep4); //$NON-NLS-1$
			item.put("fv9SlResOwner4", fv9SlResOwner4); //$NON-NLS-1$
			item.put("fv9Solution5", fv9Solution5); //$NON-NLS-1$
			item.put("fv9SlDLDate5", fv9SlDLDate5); //$NON-NLS-1$
			item.put("fv9SlResDep5", fv9SlResDep5); //$NON-NLS-1$
			item.put("fv9SlResOwner5", fv9SlResOwner5); //$NON-NLS-1$
			item.put("fv9AssPlacement", fv9AssPlacement); //$NON-NLS-1$
			item.put("fv9ManagingMajor", fv9ManagingMajor); //$NON-NLS-1$
			item.put("fv9RGStatus", fv9RGStatus); //$NON-NLS-1$
			item.put("fv9IssueStatus", fv9IssueStatus); //$NON-NLS-1$
			item.put("fv9TimeChangeRed", fv9TimeChangeRed); //$NON-NLS-1$
			item.put("fv9TimeAnalyzed", fv9TimeAnalyzed); //$NON-NLS-1$
			item.put("fv9TimeDispatched", fv9TimeDispatched); //$NON-NLS-1$
			item.put("fv9TimeChangeYellow", fv9TimeChangeYellow); //$NON-NLS-1$
			item.put("fv9TimeImplemented", fv9TimeImplemented); //$NON-NLS-1$
			item.put("fv9TimeValidated", fv9TimeValidated); //$NON-NLS-1$
			item.put("fv9TimeChangeGreen", fv9TimeChangeGreen); //$NON-NLS-1$
			item.put("fv9IssueFindMileStone", fv9IssueFindMileStone); //$NON-NLS-1$
			item.put("fv9IsRelToAuditScore", fv9IsRelToAuditScore); //$NON-NLS-1$
			item.put("fv9AuditScoreDecreased", fv9AuditScoreDecreased); //$NON-NLS-1$
			item.put("fv9FactoryName", fv9FactoryName); //$NON-NLS-1$
			item.put("fv9WorkshopName", fv9WorkshopName); //$NON-NLS-1$
			item.put("fv9WorkSegmentName", fv9WorkSegmentName); //$NON-NLS-1$
			item.put("fv9Proposer", fv9Proposer); //$NON-NLS-1$
			item.put("fv9TelOfProposer", fv9TelOfProposer); //$NON-NLS-1$
			item.put("fv9ProposedDate", fv9ProposedDate); //$NON-NLS-1$
			item.put("fv9Submiter", fv9Submiter); //$NON-NLS-1$
			item.put("fv9SupplierID", fv9SupplierID); //$NON-NLS-1$
			item.put("fv9SupplierName", fv9SupplierName); //$NON-NLS-1$
			item.put("fv9Verifier", fv9Verifier); //$NON-NLS-1$
			item.put("fv9IssueComments", fv9IssueComments);		 //$NON-NLS-1$
			
			result.add(item);
		}
		return result;
	}
}
