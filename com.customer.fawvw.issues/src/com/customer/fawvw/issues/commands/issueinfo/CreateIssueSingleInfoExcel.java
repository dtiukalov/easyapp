package com.customer.fawvw.issues.commands.issueinfo;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.dev.HSSF;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;


import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.ImageCellInfo;
import com.customer.fawvw.issues.utils.ImageUtil;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class CreateIssueSingleInfoExcel {

	public static final String LOGO_FILE_PATH = "/xls/logo.JPG"; 
	
	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\IssueSingleInfoReport_Template.xls";  

	private static final float PX_DEFAULT = 32.00f;

	private static final float PX_MODIFIED = 36.56f;

	private static final int PX_ROW = 15;

	public static void createExcel(InterfaceAIFComponent targetcompontent, String file, 
			TCSession session) throws Exception {

		
		FileOutputStream fileOut = null;

		try {
			fileOut = new FileOutputStream(new File(file));
			
			System.out.println("模板位置：" + TEMPLATE_FILE_PATH); 
			File excelTmp = new File(TEMPLATE_FILE_PATH);
			InputStream inputStream = new FileInputStream(excelTmp);

			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			HSSFSheet sheet = workbook.getSheetAt(0);
			HSSFPatriarch patri = sheet.createDrawingPatriarch();
			
			System.out.println("获取模板成功");  
			
			importData(workbook, sheet, patri, targetcompontent, session);

			workbook.write(fileOut);
			
			System.out.println("创建Excel成功"); 
			
		} catch (FileNotFoundException e) {

			throw new FawvmLoaderException("Excel模板不存在"); 
			
		} catch (Exception e) {
			
			throw new FawvmLoaderException(e.getMessage());
			
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

/**
 * 获得数据写Excel
 * 
 * 
 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static void importData(HSSFWorkbook wb, HSSFSheet sheet,
			HSSFPatriarch patri, InterfaceAIFComponent targetcompontent, 
			TCSession session) throws Exception {

		try {
			Map<String, Object> values = ReportIssueSingleInfoLoader.load(targetcompontent);
			
			System.out.println("开始写入报表"); 
			//定义样式
			HSSFCellStyle cellStyle=wb.createCellStyle();   
			cellStyle.setWrapText(true);   
			cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			cellStyle.setBorderBottom((short)1);
			cellStyle.setBorderLeft((short)1);
			cellStyle.setBorderRight((short)1);
			cellStyle.setBorderTop((short)1);
			
			//定义问题涉及零件号样式
			HSSFCellStyle centerStyle = wb.createCellStyle();
			centerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			centerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			centerStyle.setBottomBorderColor((short)1);
			
			//写表头的图片logo
			ImageCellInfo imageCell = new ImageCellInfo(0, 5, 0, 5);
			ImageUtil.GenerateImage(wb, sheet, patri, imageCell, ImageUtil.getLogoImage());
			System.out.println("写入报表的logo图片"); 
			
			//项目名称
			TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
					((TCComponentItem)targetcompontent).getLatestItemRevision(),
					"fv9ProjectLov"); 
			String[] projectNames = ComponentUtils.getProjectInfos(projects, "project_name"); 
			String projectInfos = StringUtil.ArrayToString(projectNames);
			
			HSSFRow row1 = sheet.getRow(1);
			HSSFCell projectCell = row1.createCell(1);
			
			if (projectNames.length > 0) {
				projectCell.setCellValue(new HSSFRichTextString(projectInfos)); 
			} else {
				projectCell.setCellValue(new HSSFRichTextString("")); 
			}
			projectCell.setCellStyle(cellStyle);
			System.out.println("写入项目名称"); 
			
			HSSFCell dateCell = row1.createCell(5);
			dateCell.setCellValue(new HSSFRichTextString(new DateUtil().getSysDate()));
			dateCell.setCellStyle(cellStyle);
			System.out.println("写入制表日期"); 
			
			HSSFRow row2 = sheet.getRow(2);
			HSSFCell nameCell = row2.getCell((short)1);
			nameCell.setCellValue(new HSSFRichTextString((String)values.get("fv9Proposer")));  
			nameCell.setCellStyle(cellStyle);
			System.out.println("写入提出人"); 
			
			HSSFCell ProposedDateCell = row2.getCell((short)3);
			if (!"".equals(values.get("fv9ProposedDate"))) {  
				ProposedDateCell.setCellValue(new HSSFRichTextString(
						DateUtil.transformTime((String)values.get("fv9ProposedDate"), "YYYY.MM.dd")));  
				
			} else {
				ProposedDateCell.setCellValue(new HSSFRichTextString(""));  
			}
			ProposedDateCell.setCellStyle(cellStyle);
			System.out.println("写入提出日期"); 
	
			HSSFRow row3 = sheet.getRow(3);
			HSSFCell SupplierNameCell = row3.getCell((short)4);
			SupplierNameCell.setCellValue(new HSSFRichTextString(values.get("ItemID")+""));  
			SupplierNameCell.setCellStyle(cellStyle);
			System.out.println("写入问题单号"); 
			
			HSSFRow row5 = sheet.getRow(5);
			HSSFCell ProductRankCell = row5.getCell((short)4);
			ProductRankCell.setCellValue(new HSSFRichTextString(values.get("fv9IssueDesc")+""));  
			ProductRankCell.setCellStyle(cellStyle);
			System.out.println("写入问题描述"); 
			
			HSSFRow row7 = sheet.getRow(7);
			HSSFCell ProblemCell = row7.getCell((short)4);
			ProblemCell.setCellValue(new HSSFRichTextString(values.get("fv9PartNumber") + " " + values.get("fv9PartName")));   
			ProblemCell.setCellStyle(cellStyle);
			System.out.println("写入涉及零件号"); 
			
			HSSFRow row9 = sheet.getRow(9);
			HSSFCell SolutionCell = row9.getCell((short)4);
			String fv9Solution = ""; 
			String fv9SlResOwner = ""; 
			int solCount = 1;
			//临时措施
			if (!"".equals(values.get("fv9IssueTempSolution"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9IssueTempSolution") + "\r\n";     
				if (!"".equals(values.get("fv9TempSolutionImpOwner"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9TempSolutionImpOwner") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//TE措施
			if (!"".equals(values.get("fv9SolutionTE"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionTE") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerTE"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerTE") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//QAPP措施
			if (!"".equals(values.get("fv9SolutionQAPP"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionQAPP") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerQAPP"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerQAPP") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//SU措施
			if (!"".equals(values.get("fv9SolutionSU"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionSU") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerSU"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerSU") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//PL措施
			if (!"".equals(values.get("fv9SolutionPL"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionPL") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerPL"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerPL") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//VSC措施
			if (!"".equals(values.get("fv9SolutionVSC"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionVSC") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerVSC"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerVSC") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//LO措施
			if (!"".equals(values.get("fv9SolutionLO"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionLO") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerLO"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerLO") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//CP1-ME措施
			if (!"".equals(values.get("fv9SolutionCP1_ME"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionCP1_ME") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerCP1_ME"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerCP1_ME") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//CP2-ME措施
			if (!"".equals(values.get("fv9SolutionCP2_ME"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionCP2_ME") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerCP2_ME"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerCP2_ME") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//CP1-BS措施
			if (!"".equals(values.get("fv9SolutionBS"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionBS") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerBS"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerBS") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//CP1-PA措施
			if (!"".equals(values.get("fv9SolutionPA"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionPA") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerPA"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerPA") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}

			//CP1-CA措施
			if (!"".equals(values.get("fv9SolutionCA"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionCA") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerCA"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerCA") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//CP2-BS措施
			if (!"".equals(values.get("fv9SolutionCP2BS"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionCP2BS") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerCP2BS"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerCP2BS") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			//CP2-PA措施
			if (!"".equals(values.get("fv9SolutionCP2PA"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionCP2PA") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerCP2PA"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerCP2PA") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}

			//CP2-CA措施
			if (!"".equals(values.get("fv9SolutionCP2CA"))) {  
				fv9Solution += solCount + "、" + (String)values.get("fv9SolutionCP2CA") + "\r\n";     
				if (!"".equals(values.get("fv9SlResOwnerCP2CA"))) {  
					fv9SlResOwner += solCount + "、" + (String)values.get("fv9SlResOwnerCP2CA") + ";  ";
				} else {
					fv9SlResOwner += solCount + "、无; ";
				}
				solCount++;
			}
			
			SolutionCell.setCellValue(new HSSFRichTextString(fv9Solution));
			SolutionCell.setCellStyle(cellStyle);
			System.out.println("写入解决措施"); 
			
			HSSFRow row17 = sheet.getRow(17);
			HSSFCell RespPersonCell = row17.getCell((short)1);
			RespPersonCell.setCellValue(new HSSFRichTextString(fv9SlResOwner));
			RespPersonCell.setCellStyle(cellStyle);
			System.out.println("写入负责人"); 
			
			HSSFRow row15 = sheet.getRow(15);
			HSSFCell IssueReqCarNoCell = row15.getCell((short)4);
			IssueReqCarNoCell.setCellValue(new HSSFRichTextString(values.get("fv9IssueReqCarNo")+""));  
			IssueReqCarNoCell.setCellStyle(cellStyle);
			System.out.println("写入涉及车辆编号"); 
			
			//红绿灯图片转换
			ImageCellInfo lightCell = new ImageCellInfo(16, 5, 17, 5);
			String fv9RGStatus = (String)values.get("fv9RGStatus"); 
			if ("红".equals(fv9RGStatus)) {  
				ImageUtil.GenerateImage(wb, sheet, patri, lightCell, ImageUtil
						.getRedLightR());
			}
			if ("黄".equals(fv9RGStatus)) {  
				ImageUtil.GenerateImage(wb, sheet, patri, lightCell, ImageUtil
						.getYellowLightR());
			}
			if ("绿".equals(fv9RGStatus)) {  
				ImageUtil.GenerateImage(wb, sheet, patri, lightCell, ImageUtil
						.getGreenLightR());
			}
			System.out.println("写入红绿灯状态"); 
			
			HSSFRow row18 = sheet.getRow(18);
			HSSFCell VerifierCell = row18.getCell((short)1);
			VerifierCell.setCellValue(new HSSFRichTextString(values.get("fv9Verifier")+""));  
			VerifierCell.setCellStyle(cellStyle);
			System.out.println("写入验证人"); 
			
			HSSFCell SolDeadlineDateCell = row18.getCell((short)5);
			if (!"".equals((String)values.get("fv9SolDeadlineDate"))) {  
				SolDeadlineDateCell.setCellValue(new HSSFRichTextString(
						DateUtil.transformTime((String)values.get("fv9SolDeadlineDate"), "YYYY.MM.dd")));  
			} else {
				SolDeadlineDateCell.setCellValue(new HSSFRichTextString(""));  
			}
			SolDeadlineDateCell.setCellStyle(cellStyle);
			System.out.println("写入解决期限"); 
																				
			//添加图片数据 
			if (((HashMap)values.get("problemImage")).containsKey("FV9DescPhoto")) {  
				HSSFClientAnchor anchor = new HSSFClientAnchor();
				Map<String, Object> problemImage = (Map<String, Object>)values.get("problemImage"); 
				BufferedImage imageBuffer = (BufferedImage)problemImage.get("FV9DescPhoto"); 
				byte[] imageValue = ImageUtil.getImgValue((BufferedImage)(problemImage.get("FV9DescPhoto"))); 
	
				HSSFPicture picture = patri.createPicture(anchor, wb.addPicture(
						imageValue, HSSFWorkbook.PICTURE_TYPE_JPEG));
				ImageCellInfo problemCellnfo = new ImageCellInfo(3, 0, 16, 3);	
				ImageUtil.GenerateImage(wb, sheet, patri, problemCellnfo, imageBuffer);
				System.out.println("写入问题描述图片"); 
			} 
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		}		


	}
	

}
