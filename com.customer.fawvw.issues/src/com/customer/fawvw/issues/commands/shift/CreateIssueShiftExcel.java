package com.customer.fawvw.issues.commands.shift;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ExcelUtil;
import com.customer.fawvw.issues.utils.ImageCellInfo;
import com.customer.fawvw.issues.utils.ImageUtil;
import com.teamcenter.rac.util.MessageBox;

public class CreateIssueShiftExcel {

	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\IssueShiftReport_Template.xls"; //$NON-NLS-1$ //$NON-NLS-2$
	
	public static Boolean createExcel(HashMap<String, Object> parameters, String file) throws Exception{

		FileOutputStream fileOut = null;
		Boolean flag = false;
		
		try {
			System.out.println("模板位置：" + TEMPLATE_FILE_PATH); //$NON-NLS-1$
			//创建新的Excel
			fileOut = new FileOutputStream(new File(file));
			//判断模板是否存在
			File excelTmp = new File(TEMPLATE_FILE_PATH);
			InputStream inputStream = new FileInputStream(excelTmp);
			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			System.out.println("获取模板成功"); //$NON-NLS-1$
			
			Map<String, Object> issueShiftReportData =  IssueShiftReportLoader.load(parameters);
			
			//数据存在
			
			
			if (issueShiftReportData != null &&
					((ArrayList<Map<String, Object>>)issueShiftReportData.get("planIssues")).size() > 0 && //$NON-NLS-1$
					((ArrayList<Map<String, Object>>)issueShiftReportData.get("actualIssues")).size() > 0) { //$NON-NLS-1$
				
				HSSFWorkbook workbook = new HSSFWorkbook(fs);
				HSSFSheet sheet = workbook.getSheetAt(0);
				HSSFPatriarch patri = sheet.createDrawingPatriarch();
				importData(workbook, sheet, patri, issueShiftReportData);

				HSSFSheet sheet1 = workbook.getSheetAt(1);
				HSSFPatriarch patri1 = sheet1.createDrawingPatriarch();
				importData1(workbook, sheet1, patri1, issueShiftReportData);
				workbook.write(fileOut);
				
				System.out.println("创建Excel成功"); //$NON-NLS-1$
				
				flag = true;
				
			} else {
				MessageBox.post("不存在符合条件的问题", "零件批次问题报表", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-1$
			}
			
		} catch (FileNotFoundException e) {

			throw new FawvmLoaderException("Excel模板不存在"); //$NON-NLS-1$
			
		} catch (Exception e) {
			throw new FawvmLoaderException(e.getMessage());
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	@SuppressWarnings( { "unchecked", "deprecation" })
	public static void importData(HSSFWorkbook wb, HSSFSheet sheet,
			HSSFPatriarch patri, Map<String, Object> values) throws Exception{
		if (values != null) {
			System.out.println("开始写入零件批次计划解决问题报表"); //$NON-NLS-1$
			try {
				ImageCellInfo imageCell = new ImageCellInfo(0, 7, 0, 9);
				ImageUtil.GenerateImage(wb, sheet, patri, imageCell, ImageUtil.getLogoImage());
				System.out.println("写入报表logo图片"); //$NON-NLS-1$
				
				/* 生成数据 */
				HSSFRow baserow = sheet.getRow(1);
				if (baserow == null) {
					baserow = sheet.createRow(1);
				}
				
				HSSFCell namecell = baserow.getCell((short) 1);// 项目名称
				namecell.setCellValue(new HSSFRichTextString(values.get("ProjectName") //$NON-NLS-1$
						.toString()));
				System.out.println("写入项目名称"); //$NON-NLS-1$
				
				HSSFCell timecell1 = baserow.getCell((short) 8);// 制表日期
				timecell1.setCellValue(new HSSFRichTextString(values.get("CreatTime") //$NON-NLS-1$
						.toString()));
				System.out.println("写入制表日期"); //$NON-NLS-1$

				List<Map<String, Object>> planIssues = (List<Map<String, Object>>) values
						.get("planIssues"); //$NON-NLS-1$
				
				if (planIssues.size() > 0) {
					int i = 3;

					for (Map<String, Object> planIssue : planIssues) {
						HSSFRow row = sheet.getRow(i);
						HSSFRow rowStyle = sheet.getRow(3);
						if (row == null) {
							row = sheet.createRow(i);
						}
						
						if (!"".equals(planIssue.get("item_id"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(0).setCellValue(
									new HSSFRichTextString(planIssue.get("item_id") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(0).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(0).setCellStyle(rowStyle.getCell(0).getCellStyle());
	
						if (!"".equals(planIssue.get("fv9IssueDesc"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(1).setCellValue(
									new HSSFRichTextString((String)planIssue.get("fv9IssueDesc"))); //$NON-NLS-1$
						} else {
							row.createCell(1).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(1).setCellStyle(rowStyle.getCell(1).getCellStyle());
						
						//措施
						String fv9Solution = ""; 
						String slResDep = "";
						if (!"".equals(planIssue.get("fv9SolutionTE"))) {
							fv9Solution += "TE:" + ((String)planIssue.get("fv9SolutionTE")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
							slResDep += "TE";
						}
						if (!"".equals(planIssue.get("fv9SolutionQAPP"))) {  
							fv9Solution += "\r\n" + "QAPP:" + ((String)planIssue.get("fv9SolutionQAPP")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
							slResDep += "\r\nQAPP";
						}
						if (!"".equals(planIssue.get("fv9SolutionSU"))) {  
							fv9Solution += "\r\n" + "SU:" + ((String)planIssue.get("fv9SolutionSU")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nSU";
						}
						if (!"".equals(planIssue.get("fv9SolutionPL"))) {  
							fv9Solution += "\r\n" + "PL:" + ((String)planIssue.get("fv9SolutionPL")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nPL";
						}
						if (!"".equals(planIssue.get("fv9SolutionVSC"))) {  
							fv9Solution += "\r\n" + "VSC:" + ((String)planIssue.get("fv9SolutionVSC")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nVSC";
						}
						if (!"".equals(planIssue.get("fv9SolutionLO"))) {  
							fv9Solution += "\r\n" + "LO:" + ((String)planIssue.get("fv9SolutionLO")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$
							slResDep += "\r\nLO"; //$NON-NLS-5$ 
						}
						if (!"".equals(planIssue.get("fv9SolutionCP1_ME"))) {  
							fv9Solution += "\r\n" + "CP1-ME:" + ((String)planIssue.get("fv9SolutionCP1_ME")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-ME";
						}
						if (!"".equals(planIssue.get("fv9SolutionCP2_ME"))) {  
							fv9Solution += "\r\n" + "CP2-ME:" + ((String)planIssue.get("fv9SolutionCP2_ME")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-ME";
						}
						if (!"".equals(planIssue.get("fv9SolutionBS"))) {  
							fv9Solution += "\r\n" + "CP1-BS:" + ((String)planIssue.get("fv9SolutionBS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-BS";
						}
						if (!"".equals(planIssue.get("fv9SolutionPA"))) {  
							fv9Solution += "\r\n" + "CP1-PA:" + ((String)planIssue.get("fv9SolutionPA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-PA";
						}
						if (!"".equals(planIssue.get("fv9SolutionCA"))) {  
							fv9Solution += "\r\n" + "CP1-CA:" + ((String)planIssue.get("fv9SolutionCA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-CA";
						}
						if (!"".equals(planIssue.get("fv9SolutionCP2BS"))) {  
							fv9Solution += "\r\n" + "CP2-BS:" + ((String)planIssue.get("fv9SolutionCP2BS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-BS";
						}
						if (!"".equals(planIssue.get("fv9SolutionCP2PA"))) {  
							fv9Solution += "\r\n" + "CP2-PA:" + ((String)planIssue.get("fv9SolutionCP2PA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-PA";
						}
						if (!"".equals(planIssue.get("fv9SolutionCP2CA"))) {  
							fv9Solution += "\r\n" + "CP2-CA:" + ((String)planIssue.get("fv9SolutionCP2CA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-CA";
						}
						
						if (!"".equals(fv9Solution)) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(2).setCellValue(
									new HSSFRichTextString(fv9Solution)); //$NON-NLS-1$
						} else {
							row.createCell(2).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(2).setCellStyle(rowStyle.getCell(2).getCellStyle());
						
						row.createCell(3).setCellValue(new HSSFRichTextString());
						row.getCell(3).setCellStyle(rowStyle.getCell(3).getCellStyle());
						if (!"".equals(planIssue.get("fv9RGStatus"))) { //$NON-NLS-1$ //$NON-NLS-2$
							ExcelUtil.fillTheCellColor(wb,row.getCell(3),planIssue.get("fv9RGStatus") //$NON-NLS-1$
									.toString(), ""); //$NON-NLS-1$
						}
						
						if (!"".equals(planIssue.get("carNumber"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(4).setCellValue(
									new HSSFRichTextString(planIssue.get("carNumber") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(4).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(4).setCellStyle(rowStyle.getCell(4).getCellStyle());
						
						if (!"".equals(planIssue.get("fv9RoundNo"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(5).setCellValue(
									new HSSFRichTextString(planIssue.get("fv9RoundNo") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(5).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(5).setCellStyle(rowStyle.getCell(5).getCellStyle());
						
						if (!"".equals(planIssue.get("fv9PlImTime"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(6).setCellValue(
									new HSSFRichTextString(planIssue.get("fv9PlImTime") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(6).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(6).setCellStyle(rowStyle.getCell(6).getCellStyle());
						
						if (!"".equals(planIssue.get("fv9ProposedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(7).setCellValue(
									new HSSFRichTextString(planIssue.get("fv9ProposedDate") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(7).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(7).setCellStyle(rowStyle.getCell(7).getCellStyle());
						
						if (!"".equals(planIssue.get("fv9SolDeadlineDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(8).setCellValue(
									new HSSFRichTextString(planIssue.get("fv9SolDeadlineDate") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(8).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(8).setCellStyle(rowStyle.getCell(8).getCellStyle());
						
						if (!"".equals(slResDep)) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(9).setCellValue(slResDep);
						} else {
							row.createCell(9).setCellValue(new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(9).setCellStyle(rowStyle.getCell(9).getCellStyle());
						
						System.out.println("写入" + planIssue.get("itemRevision") + "信息"); //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$
						i++;
					}
				} else {
					System.out.println("系统不存在符合条件的问题"); //$NON-NLS-1$
				}
				
				
				System.out.println("写入零件批次计划解决问题报表结束"); //$NON-NLS-1$
			} catch (Exception e) {
				// TODO Auto-generated catch block
				
				throw new FawvmLoaderException("执行程序失败，请参考日志"); //$NON-NLS-1$
			}
		}
		
		
	}

	public static void importData1(HSSFWorkbook wb, HSSFSheet sheet,
			HSSFPatriarch patri, Map<String, Object> values) throws Exception{
		if (values != null) {
			System.out.println("开始写入零件批次实际解决问题报表"); //$NON-NLS-1$
			try {
				ImageCellInfo imageCell = new ImageCellInfo(0, 8, 0, 10);
				ImageUtil.GenerateImage(wb, sheet, patri, imageCell, ImageUtil.getLogoImage());
				System.out.println("写入报表logo图片"); //$NON-NLS-1$
				
				/* 生成数据 */
				HSSFRow baserow = sheet.getRow(1);
				if (baserow == null) {
					baserow = sheet.createRow(1);
				}

				HSSFCell namecell = baserow.getCell(1);// 项目名称
				namecell.setCellValue(new HSSFRichTextString(values.get("ProjectName") //$NON-NLS-1$
						.toString()));
				System.out.println("写入项目名称"); //$NON-NLS-1$
				
				HSSFCell timecell1 = baserow.getCell(9);// 制表日期
				timecell1.setCellValue(new HSSFRichTextString(values.get("CreatTime") //$NON-NLS-1$
						.toString()));
				System.out.println("写入制表日期"); //$NON-NLS-1$

				List<Map<String, Object>> actualIssues = (List<Map<String, Object>>) values
						.get("actualIssues"); //$NON-NLS-1$
				
				if (actualIssues.size() > 0) {
					int i = 3;

					for (Map<String, Object> actualIssue : actualIssues) {
						HSSFRow row = sheet.getRow(i);
						HSSFRow rowStyle = sheet.getRow(2);
						if (row == null) {
							row = sheet.createRow(i);
						}
						//问题号
						if (!"".equals(actualIssue.get("item_id"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(0).setCellValue(
									new HSSFRichTextString(actualIssue.get("item_id") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(0).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(0).setCellStyle(rowStyle.getCell(0).getCellStyle());
						
						//问题描述
						if (!"".equals(actualIssue.get("fv9IssueDesc"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(1).setCellValue(
									new HSSFRichTextString(actualIssue.get("fv9IssueDesc") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(1).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(1).setCellStyle(rowStyle.getCell(1).getCellStyle());
						
						//措施
						String fv9Solution = ""; 
						String slResDep = "";
						if (!"".equals(actualIssue.get("fv9SolutionTE"))) {
							fv9Solution += "TE:" + ((String)actualIssue.get("fv9SolutionTE")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
							slResDep += "TE";
						}
						if (!"".equals(actualIssue.get("fv9SolutionQAPP"))) {  
							fv9Solution += "\r\n" + "QAPP:" + ((String)actualIssue.get("fv9SolutionQAPP")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
							slResDep += "\r\nQAPP";
						}
						if (!"".equals(actualIssue.get("fv9SolutionSU"))) {  
							fv9Solution += "\r\n" + "SU:" + ((String)actualIssue.get("fv9SolutionSU")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nSU";
						}
						if (!"".equals(actualIssue.get("fv9SolutionPL"))) {  
							fv9Solution += "\r\n" + "PL:" + ((String)actualIssue.get("fv9SolutionPL")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nPL";
						}
						if (!"".equals(actualIssue.get("fv9SolutionVSC"))) {  
							fv9Solution += "\r\n" + "VSC:" + ((String)actualIssue.get("fv9SolutionVSC")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nVSC";
						}
						if (!"".equals(actualIssue.get("fv9SolutionLO"))) {  
							fv9Solution += "\r\n" + "LO:" + ((String)actualIssue.get("fv9SolutionLO")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$
							slResDep += "\r\nLO"; //$NON-NLS-5$ 
						}
						if (!"".equals(actualIssue.get("fv9SolutionCP1_ME"))) {  
							fv9Solution += "\r\n" + "CP1-ME:" + ((String)actualIssue.get("fv9SolutionCP1_ME")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-ME";
						}
						if (!"".equals(actualIssue.get("fv9SolutionCP2_ME"))) {  
							fv9Solution += "\r\n" + "CP2-ME:" + ((String)actualIssue.get("fv9SolutionCP2_ME")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-ME";
						}
						if (!"".equals(actualIssue.get("fv9SolutionBS"))) {  
							fv9Solution += "\r\n" + "CP1-BS:" + ((String)actualIssue.get("fv9SolutionBS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-BS";
						}
						if (!"".equals(actualIssue.get("fv9SolutionPA"))) {  
							fv9Solution += "\r\n" + "CP1-PA:" + ((String)actualIssue.get("fv9SolutionPA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-PA";
						}
						if (!"".equals(actualIssue.get("fv9SolutionCA"))) {  
							fv9Solution += "\r\n" + "CP1-CA:" + ((String)actualIssue.get("fv9SolutionCA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP1-CA";
						}
						if (!"".equals(actualIssue.get("fv9SolutionCP2BS"))) {  
							fv9Solution += "\r\n" + "CP2-BS:" + ((String)actualIssue.get("fv9SolutionCP2BS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-BS";
						}
						if (!"".equals(actualIssue.get("fv9SolutionCP2PA"))) {  
							fv9Solution += "\r\n" + "CP2-PA:" + ((String)actualIssue.get("fv9SolutionCP2PA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-PA";
						}
						if (!"".equals(actualIssue.get("fv9SolutionCP2CA"))) {  
							fv9Solution += "\r\n" + "CP2-CA:" + ((String)actualIssue.get("fv9SolutionCP2CA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
							slResDep += "\r\nCP2-CA";
						}
						if (!"".equals(fv9Solution)) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(2).setCellValue(
									new HSSFRichTextString(fv9Solution));
						} else {
							row.createCell(2).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(2).setCellStyle(rowStyle.getCell(2).getCellStyle());
							
						//状态
						row.createCell(3).setCellValue(new HSSFRichTextString());
						row.getCell(3).setCellStyle(rowStyle.getCell(3).getCellStyle());
						if (!"".equals(actualIssue.get("fv9RGStatus"))) { //$NON-NLS-1$ //$NON-NLS-2$
							ExcelUtil.fillTheCellColor(wb,row.getCell(3),actualIssue.get("fv9RGStatus") //$NON-NLS-1$
									.toString(), ""); //$NON-NLS-1$
						}
						
						//零件号
						if (!"".equals(actualIssue.get("carNumber"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(4).setCellValue(
									new HSSFRichTextString(actualIssue.get("carNumber") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(4).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(4).setCellStyle(rowStyle.getCell(4).getCellStyle());
						
						//批次号
						if (!"".equals(actualIssue.get("fv9RoundNo"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(5).setCellValue(
									new HSSFRichTextString(actualIssue.get("fv9RoundNo") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(5).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(5).setCellStyle(rowStyle.getCell(5).getCellStyle());
						
						//批次优化计划完成日期
						if (!"".equals(actualIssue.get("fv9ReImTime"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(6).setCellValue(
									new HSSFRichTextString(actualIssue.get("fv9ReImTime") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(6).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(6).setCellStyle(rowStyle.getCell(6).getCellStyle());
						
						//提出时间
						if (!"".equals(actualIssue.get("fv9ProposedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(7).setCellValue(
									new HSSFRichTextString(actualIssue.get("fv9ProposedDate") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(7).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(7).setCellStyle(rowStyle.getCell(7).getCellStyle());

						
						//解决期限
						if (!"".equals(actualIssue.get("fv9SolDeadlineDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(8).setCellValue(
									new HSSFRichTextString(actualIssue.get("fv9SolDeadlineDate") //$NON-NLS-1$
											.toString())); //$NON-NLS-1$
						} else {
							row.createCell(8).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(8).setCellStyle(rowStyle.getCell(8).getCellStyle());
						
						//实际完成时间
						if (!"".equals(actualIssue.get("fv9CompletedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(9).setCellValue(
									new HSSFRichTextString(actualIssue.get("fv9CompletedDate") //$NON-NLS-1$
											.toString()));
						} else {
							row.createCell(9).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(9).setCellStyle(rowStyle.getCell(9).getCellStyle());
						
						//责任部门
						if (!"".equals(slResDep)) { //$NON-NLS-1$ //$NON-NLS-2$
							row.createCell(10).setCellValue(slResDep);
						} else {
							row.createCell(10).setCellValue(
									new HSSFRichTextString("")); //$NON-NLS-1$
						}
						row.getCell(10).setCellStyle(rowStyle.getCell(10).getCellStyle());
						
						System.out.println("写入" + actualIssue.get("itemRevision") + "信息"); //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$
						
						i++;
						
					}
				}
				
				System.out.println("写入零件批次实际解决问题报表结束"); //$NON-NLS-1$
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new FawvmLoaderException("执行程序失败，请参考日志"); //$NON-NLS-1$
			}
		}
	}
}
