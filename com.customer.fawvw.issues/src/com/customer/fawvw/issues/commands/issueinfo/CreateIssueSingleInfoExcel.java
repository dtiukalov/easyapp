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

	public static final String LOGO_FILE_PATH = "/xls/logo.JPG"; //$NON-NLS-1$
	
	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\IssueSingleInfoReport_Template.xls"; //$NON-NLS-1$ //$NON-NLS-2$

	private static final float PX_DEFAULT = 32.00f;

	private static final float PX_MODIFIED = 36.56f;

	private static final int PX_ROW = 15;

	public static void createExcel(InterfaceAIFComponent targetcompontent, String file, 
			TCSession session) throws Exception {

		
		FileOutputStream fileOut = null;

		try {
			fileOut = new FileOutputStream(new File(file));
			
			System.out.println("模板位置：" + TEMPLATE_FILE_PATH); //$NON-NLS-1$
			File excelTmp = new File(TEMPLATE_FILE_PATH);
			InputStream inputStream = new FileInputStream(excelTmp);

			POIFSFileSystem fs = new POIFSFileSystem(inputStream);
			HSSFWorkbook workbook = new HSSFWorkbook(fs);
			HSSFSheet sheet = workbook.getSheetAt(0);
			HSSFPatriarch patri = sheet.createDrawingPatriarch();
			
			System.out.println("获取模板成功");  //$NON-NLS-1$
			
			importData(workbook, sheet, patri, targetcompontent, session);

			workbook.write(fileOut);
			
			System.out.println("创建Excel成功"); //$NON-NLS-1$
			
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
			
			System.out.println("开始写入报表"); //$NON-NLS-1$
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
			System.out.println("写入报表的logo图片"); //$NON-NLS-1$
			
			//项目名称
			TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
					((TCComponentItem)targetcompontent).getLatestItemRevision(),
					"fv9ProjectLov"); //$NON-NLS-1$
			String[] projectNames = ComponentUtils.getProjectInfos(projects, "project_name"); //$NON-NLS-1$
			String projectInfos = StringUtil.ArrayToString(projectNames);
			
			HSSFRow row1 = sheet.getRow(1);
			HSSFCell projectCell = row1.createCell(1);
			
			if (projectNames.length > 0) {
				projectCell.setCellValue(new HSSFRichTextString(projectInfos)); //$NON-NLS-1$
			} else {
				projectCell.setCellValue(new HSSFRichTextString("")); //$NON-NLS-1$
			}
			projectCell.setCellStyle(cellStyle);
			System.out.println("写入项目名称"); //$NON-NLS-1$
			
			HSSFCell dateCell = row1.createCell(5);
			dateCell.setCellValue(new HSSFRichTextString(new DateUtil().getSysDate()));
			dateCell.setCellStyle(cellStyle);
			System.out.println("写入制表日期"); //$NON-NLS-1$
			
			HSSFRow row2 = sheet.getRow(2);
			HSSFCell nameCell = row2.getCell((short)1);
			nameCell.setCellValue(new HSSFRichTextString((String)values.get("fv9Proposer"))); //$NON-NLS-1$ //$NON-NLS-2$
			nameCell.setCellStyle(cellStyle);
			System.out.println("写入负责人"); //$NON-NLS-1$
			
			HSSFCell ProposedDateCell = row2.getCell((short)3);
			if (!"".equals(values.get("fv9ProposedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
				ProposedDateCell.setCellValue(new HSSFRichTextString(
						DateUtil.transformTime((String)values.get("fv9ProposedDate"), "YYYY.MM.dd"))); //$NON-NLS-1$ //$NON-NLS-2$
				
			} else {
				ProposedDateCell.setCellValue(new HSSFRichTextString("")); //$NON-NLS-1$ //$NON-NLS-2$
			}
			ProposedDateCell.setCellStyle(cellStyle);
			System.out.println("写入提出日期"); //$NON-NLS-1$
	
			HSSFRow row3 = sheet.getRow(3);
			HSSFCell SupplierNameCell = row3.getCell((short)4);
			SupplierNameCell.setCellValue(new HSSFRichTextString(values.get("ItemID")+"")); //$NON-NLS-1$ //$NON-NLS-2$
			SupplierNameCell.setCellStyle(cellStyle);
			System.out.println("写入问题单号"); //$NON-NLS-1$
			
			HSSFRow row5 = sheet.getRow(5);
			HSSFCell ProductRankCell = row5.getCell((short)4);
			ProductRankCell.setCellValue(new HSSFRichTextString(values.get("fv9IssueDesc")+"")); //$NON-NLS-1$ //$NON-NLS-2$
			ProductRankCell.setCellStyle(cellStyle);
			System.out.println("写入问题描述"); //$NON-NLS-1$
			
			HSSFRow row7 = sheet.getRow(7);
			HSSFCell ProblemCell = row7.getCell((short)4);
			ProblemCell.setCellValue(new HSSFRichTextString(values.get("fv9PartNumber") + " " + values.get("fv9PartName"))); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
			ProblemCell.setCellStyle(cellStyle);
			System.out.println("写入涉及零件号"); //$NON-NLS-1$
			
			HSSFRow row9 = sheet.getRow(9);
			HSSFCell SolutionCell = row9.getCell((short)4);
			String fv9Solution = ""; //$NON-NLS-1$
			if (!"".equals(values.get("fv9Solution1"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9Solution += "1、" + ((String)values.get("fv9Solution1")).replaceAll("\n", ";");  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-1$
			}
			if (!"".equals(values.get("fv9Solution2"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9Solution += "\r\n2、" + ((String)values.get("fv9Solution2")).replaceAll("\n", ";");  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-1$
			}
			if (!"".equals(values.get("fv9Solution3"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9Solution += "\r\n3、" + ((String)values.get("fv9Solution3")).replaceAll("\n", ";");  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-1$
			}
			if (!"".equals(values.get("fv9Solution4"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9Solution += "\r\n4、" + ((String)values.get("fv9Solution4")).replaceAll("\n", ";");  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-1$
			}
			if (!"".equals(values.get("fv9Solution5"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9Solution += "\r\n5、" + ((String)values.get("fv9Solution5")).replaceAll("\n", ";");  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-1$
			}
			SolutionCell.setCellValue(new HSSFRichTextString(fv9Solution));
			SolutionCell.setCellStyle(cellStyle);
			System.out.println("写入解决措施"); //$NON-NLS-1$
			
			HSSFRow row15 = sheet.getRow(15);
			HSSFCell IssueReqCarNoCell = row15.getCell((short)4);
			IssueReqCarNoCell.setCellValue(new HSSFRichTextString(values.get("fv9IssueReqCarNo")+"")); //$NON-NLS-1$ //$NON-NLS-2$
			IssueReqCarNoCell.setCellStyle(cellStyle);
			System.out.println("写入涉及车辆编号"); //$NON-NLS-1$
			
			//红绿灯图片转换
			ImageCellInfo lightCell = new ImageCellInfo(16, 5, 17, 5);
			String fv9RGStatus = (String)values.get("fv9RGStatus"); //$NON-NLS-1$
			if ("红".equals(fv9RGStatus)) {  //$NON-NLS-1$
				ImageUtil.GenerateImage(wb, sheet, patri, lightCell, ImageUtil
						.getRedLightR());
			}
			if ("黄".equals(fv9RGStatus)) {  //$NON-NLS-1$
				ImageUtil.GenerateImage(wb, sheet, patri, lightCell, ImageUtil
						.getYellowLightR());
			}
			if ("绿".equals(fv9RGStatus)) {  //$NON-NLS-1$
				ImageUtil.GenerateImage(wb, sheet, patri, lightCell, ImageUtil
						.getGreenLightR());
			}
			System.out.println("写入红绿灯状态"); //$NON-NLS-1$
			
			HSSFRow row17 = sheet.getRow(17);
			HSSFCell RespPersonCell = row17.getCell((short)1);
			String fv9SlResOwner = ""; //$NON-NLS-1$
			if (!"".equals(values.get("fv9SlResOwner1"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9SlResOwner += values.get("fv9SlResOwner1"); //$NON-NLS-1$
			}
			if (!"".equals(values.get("fv9SlResOwner2"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9SlResOwner += "; " + values.get("fv9SlResOwner2"); //$NON-NLS-1$ //$NON-NLS-2$
			}
			if (!"".equals(values.get("fv9SlResOwner3"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9SlResOwner += "; " + values.get("fv9SlResOwner3"); //$NON-NLS-1$ //$NON-NLS-2$
			}
			if (!"".equals(values.get("fv9SlResOwner4"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9SlResOwner += "; " + values.get("fv9SlResOwner4"); //$NON-NLS-1$ //$NON-NLS-2$
			}
			if (!"".equals(values.get("fv9SlResOwner5"))) { //$NON-NLS-1$ //$NON-NLS-2$
				fv9SlResOwner += "; " + values.get("fv9SlResOwner5"); //$NON-NLS-1$ //$NON-NLS-2$
			}
			RespPersonCell.setCellValue(new HSSFRichTextString(fv9SlResOwner)); //$NON-NLS-1$ //$NON-NLS-2$
			RespPersonCell.setCellStyle(cellStyle);
			System.out.println("写入负责人"); //$NON-NLS-1$
			
			HSSFRow row18 = sheet.getRow(18);
			HSSFCell VerifierCell = row18.getCell((short)1);
			VerifierCell.setCellValue(new HSSFRichTextString(values.get("fv9Verifier")+"")); //$NON-NLS-1$ //$NON-NLS-2$
			VerifierCell.setCellStyle(cellStyle);
			System.out.println("写入验证人"); //$NON-NLS-1$
			
			HSSFCell SolDeadlineDateCell = row18.getCell((short)5);
			if (!"".equals((String)values.get("fv9SolDeadlineDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
				SolDeadlineDateCell.setCellValue(new HSSFRichTextString(
						DateUtil.transformTime((String)values.get("fv9SolDeadlineDate"), "YYYY.MM.dd"))); //$NON-NLS-1$ //$NON-NLS-2$
			} else {
				SolDeadlineDateCell.setCellValue(new HSSFRichTextString("")); //$NON-NLS-1$ //$NON-NLS-2$
			}
			SolDeadlineDateCell.setCellStyle(cellStyle);
			System.out.println("写入解决期限"); //$NON-NLS-1$
																				
			//添加图片数据 
			if (((HashMap)values.get("problemImage")).containsKey("FV9DescPhoto")) { //$NON-NLS-1$ //$NON-NLS-2$
				HSSFClientAnchor anchor = new HSSFClientAnchor();
				Map<String, Object> problemImage = (Map<String, Object>)values.get("problemImage"); //$NON-NLS-1$
				BufferedImage imageBuffer = (BufferedImage)problemImage.get("FV9DescPhoto"); //$NON-NLS-1$
				byte[] imageValue = ImageUtil.getImgValue((BufferedImage)(problemImage.get("FV9DescPhoto"))); //$NON-NLS-1$
	
				HSSFPicture picture = patri.createPicture(anchor, wb.addPicture(
						imageValue, HSSFWorkbook.PICTURE_TYPE_JPEG));
				ImageCellInfo problemCellnfo = new ImageCellInfo(3, 0, 16, 3);	
				ImageUtil.GenerateImage(wb, sheet, patri, problemCellnfo, imageBuffer);
				System.out.println("写入问题描述图片"); //$NON-NLS-1$
			} 
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		}		


	}
	

}
