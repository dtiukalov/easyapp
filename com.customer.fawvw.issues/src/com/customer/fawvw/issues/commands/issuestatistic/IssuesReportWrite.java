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
		
		try {
			
			//行号
			HSSFRow row1 = sheet.getRow(1);
			
			//项目名称
			HSSFCell prjCell = row1.getCell(2);
			if (prjCell == null) {
				prjCell = row1.createCell(2);
			}
			prjCell.setCellValue(new HSSFRichTextString(
					((TCComponentProject)parameters.get("projectInfo")).getProperty("project_name"))); //$NON-NLS-1$ //$NON-NLS-2$
			
			//制表日期
			HSSFCell sysDateCell =row1.getCell(7);
			if (sysDateCell == null) {
				sysDateCell = row1.createCell(7);
			}
			sysDateCell.setCellValue(new HSSFRichTextString(DateUtil.getSysDate()));
			
			ArrayList<HashMap<String, Object>> Issues = (ArrayList<HashMap<String, Object>>)values.get("issues"); //$NON-NLS-1$
			int i=3;
			int rowNumber =1;
			 
			if (Issues.size() > 0){
				for (HashMap<String, Object> Issue : Issues) {
					 //
					 HSSFRow rowStyle = sheet.getRow(3);
					 
					 HSSFRow row = sheet.getRow(i);
					 if (row == null) {
						 row = sheet.createRow(i);
					 }
					 //序号
					 HSSFCell cell_i0 = row.getCell(0);	
					 if (cell_i0 == null) {
						 cell_i0 = row.createCell(0);
					 }
					 cell_i0.setCellValue(new HSSFRichTextString(rowNumber + "")); //$NON-NLS-1$
					 row.getCell(0).setCellStyle(rowStyle.getCell(0).getCellStyle());
					 
					 //问题单号	 
					 HSSFCell cell_i1 = row.getCell(1);		
					 if (cell_i1 == null) {
						 cell_i1 = row.createCell(1);
					 }
					 cell_i1.setCellValue(new HSSFRichTextString((String) Issue.get("item_id"))); //$NON-NLS-1$
					 row.getCell(1).setCellStyle(rowStyle.getCell(1).getCellStyle());
					 
					 //问题摘要
					 HSSFCell cell_i2 = row.getCell(2);	
					 if (cell_i2 == null) {
						 cell_i2 = row.createCell(2);
					 }
					 cell_i2.setCellValue(new HSSFRichTextString((String) Issue.get("object_name"))); //$NON-NLS-1$
					 row.getCell(2).setCellStyle(rowStyle.getCell(2).getCellStyle());
					 
					 //装车位置
					 HSSFCell cell_i3 = row.getCell(3);
					 if (cell_i3 == null) {
						 cell_i3 = row.createCell(3);
					 }
					 cell_i3.setCellValue(new HSSFRichTextString((String) Issue.get("fv9AssPlacement"))); //$NON-NLS-1$
					 row.getCell(3).setCellStyle(rowStyle.getCell(3).getCellStyle());
					 
					 //问题描述
					 HSSFCell cell_i4 = row.getCell(4);
					 if (cell_i4 == null) {
						 cell_i4 = row.createCell(4);
					 }
					 cell_i4.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueDesc")));  //$NON-NLS-1$
					 row.getCell(4).setCellStyle(rowStyle.getCell(4).getCellStyle());
					 
					 //问题原因
					 HSSFCell cell_i5 = row.getCell(5);		
					 if (cell_i5 == null) {
						 cell_i5 = row.createCell(5);
					 }
					 cell_i5.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueCause"))); //$NON-NLS-1$
					 row.getCell(5).setCellStyle(rowStyle.getCell(5).getCellStyle());
					 
					 //临时措施
					 HSSFCell cell_i6 = row.getCell(6);	
					 if (cell_i6 == null) {
						 cell_i6 = row.createCell(6);
					 }
					 cell_i6.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueTempSolution"))); //$NON-NLS-1$
					 row.getCell(6).setCellStyle(rowStyle.getCell(6).getCellStyle());
					 
					 //措施1
					 HSSFCell cell_i7 = row.getCell(7);		
					 if (cell_i7 == null) {
						 cell_i7 = row.createCell(7);
					 }
					 cell_i7.setCellValue(new HSSFRichTextString((String) Issue.get("fv9Solution1"))); //$NON-NLS-1$
					 row.getCell(7).setCellStyle(rowStyle.getCell(7).getCellStyle());
					 
					 //措施1责任部门
					 HSSFCell cell_i8 = row.getCell(8);	
					 if (cell_i8 == null) {
						 cell_i8 = row.createCell(8);
					 }
					 cell_i8.setCellValue(new HSSFRichTextString((String) Issue.get("fv9SlResDep1"))); //$NON-NLS-1$
					 row.getCell(8).setCellStyle(rowStyle.getCell(8).getCellStyle());
					 
					 //措施1负责人
					 HSSFCell cell_i9 = row.getCell(9);	
					 if (cell_i9 == null) {
						 cell_i9 = row.createCell(9);
					 }
					 cell_i9.setCellValue(new HSSFRichTextString((String) Issue.get("fv9SlResOwner1"))); //$NON-NLS-1$
					 row.getCell(9).setCellStyle(rowStyle.getCell(9).getCellStyle());
					 
					 //措施2
					 HSSFCell cell_i10 = row.getCell(10);	
					 if (cell_i10 == null) {
						 cell_i10 = row.createCell(10);
					 }
					 cell_i10.setCellValue(new HSSFRichTextString((String) Issue.get("fv9Solution2"))); //$NON-NLS-1$
					 row.getCell(10).setCellStyle(rowStyle.getCell(10).getCellStyle());
					 
					 //措施2责任部门
					 HSSFCell cell_i11 = row.getCell(11);	
					 if (cell_i11 == null) {
						 cell_i11 = row.createCell(11);
					 }
					 cell_i11.setCellValue(new HSSFRichTextString((String) Issue.get("fv9SlResDep2"))); //$NON-NLS-1$
					 row.getCell(11).setCellStyle(rowStyle.getCell(11).getCellStyle());
					 
					 //措施2责任人
					 HSSFCell cell_i12 = row.getCell(12);	
					 if (cell_i12 == null) {
						 cell_i12 = row.createCell(12);
					 }
					 cell_i12.setCellValue(new HSSFRichTextString((String) Issue.get("fv9SlResOwner2"))); //$NON-NLS-1$
					 row.getCell(12).setCellStyle(rowStyle.getCell(12).getCellStyle());
					 
					 //实际完成日期——解决日期
					 HSSFCell cell_i13 = row.getCell(13);	
					 if (cell_i13 == null) {
						 cell_i13 = row.createCell(13);
					 }
					 if (Issue.get("fv9CompletedDate") != null) { //$NON-NLS-1$
						 cell_i13.setCellValue(new HSSFRichTextString("KW" + DateUtil.getWeekOfYear2( //$NON-NLS-1$
								 (Date)Issue.get("fv9CompletedDate")))); //$NON-NLS-1$
					 } else {
						 cell_i13.setCellValue(new HSSFRichTextString("")); //$NON-NLS-1$
					 }
					 row.getCell(13).setCellStyle(rowStyle.getCell(13).getCellStyle());
					 
					//红绿灯状态
					HSSFCell cell_i14 = row.getCell(14);	
					if (cell_i14 == null) {
						cell_i14 = row.createCell(14);
					}
//					cell_i14.setCellValue(new HSSFRichTextString((String) Issue.get("fv9RGStatus")));
					row.getCell(14).setCellStyle(rowStyle.getCell(14).getCellStyle());
					if (!"".equals((String) Issue.get("fv9RGStatus"))) { //$NON-NLS-1$ //$NON-NLS-2$
						ExcelUtil.fillTheCellColor(wb, cell_i14, (String) Issue.get("fv9RGStatus"), "yes"); //$NON-NLS-1$ //$NON-NLS-2$
					}
					 
					
					 //问题类型
					 HSSFCell cell_i15 = row.getCell(15);	
					 if (cell_i15 == null) {
						 cell_i15 = row.createCell(15);
					 }
					 cell_i15.setCellValue(new HSSFRichTextString((String) Issue.get("fv9IssueType"))); //$NON-NLS-1$
					 row.getCell(15).setCellStyle(rowStyle.getCell(15).getCellStyle());
					 
					 i++;
					 rowNumber++;
					 }
			 }
			 
		} catch (TCException e) {

			throw new FawvmLoaderException(e.getMessage());
			
		}

	}
}
