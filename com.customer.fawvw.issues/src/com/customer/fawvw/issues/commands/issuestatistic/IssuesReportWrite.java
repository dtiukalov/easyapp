package com.customer.fawvw.issues.commands.issuestatistic;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.ExcelUtil;
import com.teamcenter.rac.kernel.TCComponentProject;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;

public class IssuesReportWrite {
	/*
	 * 写入问题列表页
	 */
	static void importDataPage(HSSFWorkbook wb, HSSFSheet sheet,
			HashMap<String, Object> values, HashMap<String, Object> parameters) throws Exception {
		
			
		//行号
		HSSFRow row0 = sheet.getRow(0);
		
		//项目名称
		HSSFCell prjCell = row0.getCell(3);
		if (prjCell == null) {
			prjCell = row0.createCell(3);
		}
//			prjCell.setCellValue(new HSSFRichTextString(
//					((TCComponentProject)parameters.get("projectInfo")).getProperty("project_name"))); 
		String projectID = ((TCComponentProject)parameters.get("projectInfo")).getProperty("project_id");
		String projrctName = ((TCComponentProject)parameters.get("projectInfo")).getProperty("project_name");
		prjCell.setCellValue(projectID + " - " + projrctName + " – 问题清单  Streifenliste");
		
		//制表日期
//			HSSFCell sysDateCell =row1.getCell(7);
//			if (sysDateCell == null) {
//				sysDateCell = row1.createCell(7);
//			}
//			sysDateCell.setCellValue(new HSSFRichTextString(DateUtil.getSysDate()));
			
		ArrayList<HashMap<String, Object>> Issues = (ArrayList<HashMap<String, Object>>)values.get("issues"); //$NON-NLS-1$
		int i=3;
		int rowNumber =1;
		 
		if (Issues.size() > 0){
			for (HashMap<String, Object> Issue : Issues) {
				 //
				 HSSFRow rowStyle = sheet.getRow(2);
				 
				 HSSFRow row = sheet.getRow(i);
				 if (row == null) {
					 row = sheet.createRow(i);
				 }
				 //序号
				 HSSFCell cell_i0 = row.getCell(0);	
				 if (cell_i0 == null) {
					 cell_i0 = row.createCell(0);
				 }
				 cell_i0.setCellValue(new HSSFRichTextString(rowNumber + "")); 
				 row.getCell(0).setCellStyle(rowStyle.getCell(0).getCellStyle());
				 
				 //问题单号	 
				 HSSFCell cell_i1 = row.getCell(1);		
				 if (cell_i1 == null) {
					 cell_i1 = row.createCell(1);
				 }
				 cell_i1.setCellValue(new HSSFRichTextString((String) Issue.get("item_id"))); 
				 row.getCell(1).setCellStyle(rowStyle.getCell(1).getCellStyle());
				 
				 //提报日期
				 HSSFCell cell_i2 = row.getCell(2);	
				 if (cell_i2 == null) {
					 cell_i2 = row.createCell(2);
				 }
				 cell_i2.setCellValue(DateUtil.transDateToString((Date)Issue.get("fv9ProposedDate"), "yyyy-MM-dd")); 
				 row.getCell(2).setCellStyle(rowStyle.getCell(2).getCellStyle());
				 
				 //装车位置
				 HSSFCell cell_i3 = row.getCell(3);
				 if (cell_i3 == null) {
					 cell_i3 = row.createCell(3);
				 }
				 cell_i3.setCellValue(new HSSFRichTextString((String) Issue.get("fv9AssPlacement"))); 
				 row.getCell(3).setCellStyle(rowStyle.getCell(3).getCellStyle());
				 
				 //问题描述
				 HSSFCell cell_i4 = row.getCell(4);
				 if (cell_i4 == null) {
					 cell_i4 = row.createCell(4);
				 }
				 cell_i4.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueDesc")));  
				 row.getCell(4).setCellStyle(rowStyle.getCell(4).getCellStyle());
				 
				 //问题原因
				 HSSFCell cell_i5 = row.getCell(5);		
				 if (cell_i5 == null) {
					 cell_i5 = row.createCell(5);
				 }
				 cell_i5.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueCause"))); 
				 row.getCell(5).setCellStyle(rowStyle.getCell(5).getCellStyle());
				 
				 //临时措施
				 HSSFCell cell_i6 = row.getCell(6);	
				 if (cell_i6 == null) {
					 cell_i6 = row.createCell(6);
				 }
				 cell_i6.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueTempSolution"))); 
				 row.getCell(6).setCellStyle(rowStyle.getCell(6).getCellStyle());
				 
				 //临时措施完成期限
				 HSSFCell cell_i7 = row.getCell(7);		
				 if (cell_i7 == null) {
					 cell_i7 = row.createCell(7);
				 }
				 if ((Date)Issue.get("fv9TempSolutionDL") != null) {
					 cell_i7.setCellValue("KW" + DateUtil.getWeekOfYear2((Date)Issue.get("fv9TempSolutionDL"))); 
				 } else {
					 cell_i7.setCellValue(""); 
				 }
				 
				 row.getCell(7).setCellStyle(rowStyle.getCell(7).getCellStyle());
				 
				 String solution = Issue.get("fv9Solution1") + "\r\n" + 
				 					Issue.get("fv9Solution2") + "\r\n" +
				 					Issue.get("fv9Solution3") + "\r\n" +  
				 					Issue.get("fv9Solution4") + "\r\n" + 
				 					Issue.get("fv9Solution5");
				 String resDep = Issue.get("fv9SlResDep1") + "\r\n" + 
				 					Issue.get("fv9SlResDep2") + "\r\n" +
				 					Issue.get("fv9SlResDep3") + "\r\n" +  
				 					Issue.get("fv9SlResDep4") + "\r\n" + 
				 					Issue.get("fv9SlResDep5");
				 String resOwner = Issue.get("fv9SlResOwner1") + "\r\n" + 
				 					Issue.get("fv9SlResOwner2") + "\r\n" +
				 					Issue.get("fv9SlResOwner3") + "\r\n" +  
				 					Issue.get("fv9SlResOwner4") + "\r\n" + 
				 					Issue.get("fv9SlResOwner5");

				 //措施
				 HSSFCell cell_i8 = row.getCell(8);	
				 if (cell_i8 == null) {
					 cell_i8 = row.createCell(8);
				 }
				 cell_i8.setCellValue(solution); 
				 row.getCell(8).setCellStyle(rowStyle.getCell(8).getCellStyle());
				 
				 //措施责任部门
				 HSSFCell cell_i9 = row.getCell(9);	
				 if (cell_i9 == null) {
					 cell_i9 = row.createCell(9);
				 }
				 cell_i9.setCellValue(resDep); 
				 row.getCell(9).setCellStyle(rowStyle.getCell(9).getCellStyle());
				 
				 //措施负责人
				 HSSFCell cell_i10 = row.getCell(10);	
				 if (cell_i10 == null) {
					 cell_i10 = row.createCell(10);
				 }
				 cell_i10.setCellValue(resOwner); 
				 row.getCell(10).setCellStyle(rowStyle.getCell(10).getCellStyle());
				 
				 //实际完成日期——解决日期
				 HSSFCell cell_i11 = row.getCell(11);	
				 if (cell_i11 == null) {
					 cell_i11 = row.createCell(11);
				 }
				 if (Issue.get("fv9CompletedDate") != null) { 
					 cell_i11.setCellValue(new HSSFRichTextString("KW" + DateUtil.getWeekOfYear2( 
							 (Date)Issue.get("fv9CompletedDate")))); 
				 } else {
					 cell_i11.setCellValue(new HSSFRichTextString("")); 
				 }
				 row.getCell(11).setCellStyle(rowStyle.getCell(11).getCellStyle());
				 
				//红绿灯状态
				HSSFCell cell_i12 = row.getCell(12);	
				if (cell_i12 == null) {
					cell_i12 = row.createCell(12);
				}
				row.getCell(12).setCellStyle(rowStyle.getCell(12).getCellStyle());
				if (!"".equals((String) Issue.get("fv9RGStatus"))) {  
					ExcelUtil.fillTheCellColor(wb, cell_i12, (String) Issue.get("fv9RGStatus"), "yes");  
				}
				
				 //问题类型
				 HSSFCell cell_i13 = row.getCell(13);	
				 if (cell_i13 == null) {
					 cell_i13 = row.createCell(13);
				 }
				 cell_i13.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueType"))); 
				 row.getCell(13).setCellStyle(rowStyle.getCell(13).getCellStyle());
				 
				 i++;
				 rowNumber++;
				 }
			 }
	}
}
