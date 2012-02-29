package com.customer.fawvw.issues.commands.impart;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.ImageCellInfo;
import com.customer.fawvw.issues.utils.ImageUtil;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class CreateImPartIssuesExcel {

	public static final String LOGO_FILE_PATH = "/xls/logo.JPG"; //$NON-NLS-1$

//	public static final String TEMPLATE_FILE_PATH = "/xls/ImPartIssueReport_Template.xls"; //$NON-NLS-1$
	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\ImPartIssueReport_Template.xls"; //$NON-NLS-1$ //$NON-NLS-2$
	
	private static final float PX_DEFAULT = 32.00f;

	private static final float PX_MODIFIED = 36.56f;

	private static final int PX_ROW = 15;

	public static Boolean createExcel(TCSession session, 
			HashMap<String, Object> parameters) throws Exception {
		//获取数据
		Map<String, Object> values = ReportImPartIssueLoader.load(session, parameters);
System.out.println("------------create------------");		 //$NON-NLS-1$
		if (values.get("imparts") != null &&  //$NON-NLS-1$
				((List<ImPartVO>)values.get("imparts")).size() > 0){ //$NON-NLS-1$
System.out.println("-------if-------");			 //$NON-NLS-1$
			FileOutputStream fileOut = null;
			String file = (String)parameters.get("file"); //$NON-NLS-1$
			try {
				fileOut = new FileOutputStream(new File(file));

				File excelTmp = new File(TEMPLATE_FILE_PATH);
				InputStream inputStream = new FileInputStream(excelTmp);
				System.out.println("模板位置：" + TEMPLATE_FILE_PATH); //$NON-NLS-1$

				POIFSFileSystem fs = new POIFSFileSystem(inputStream);
				System.out.println("获取模板成功"); //$NON-NLS-1$
				
				HSSFWorkbook workbook = new HSSFWorkbook(fs);
				HSSFSheet sheet = workbook.getSheetAt(0);
				HSSFPatriarch patri = sheet.createDrawingPatriarch();
				
				importData(workbook, sheet, patri, session, values, parameters);

				workbook.write(fileOut);
				
				System.out.println("创建Excel成功"); //$NON-NLS-1$
				
				return true;
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
		} else {
System.out.println("----------elsr------"); //$NON-NLS-1$
			return false;
		}
		
	}

/**
 * 获得数据写Excel
 * 
 * 
 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static void importData(HSSFWorkbook wb, HSSFSheet sheet,
			HSSFPatriarch patri, TCSession session,
			Map<String, Object> values,
			HashMap<String, Object> parameters) throws Exception {
		
		try {
			
			//定义样式
			HSSFCellStyle cellStyle=wb.createCellStyle();   
			cellStyle.setWrapText(true);   
			cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			cellStyle.setBorderBottom((short)1);
			cellStyle.setBorderLeft((short)1);
			cellStyle.setBorderRight((short)1);
			cellStyle.setBorderTop((short)1);	
			
			// 写表头的图片logo
			ImageCellInfo imageCell = new ImageCellInfo(0, 10, 0, 13);
			ImageUtil.GenerateImage(wb, sheet, patri, imageCell, ImageUtil
					.getLogoImage());
			System.out.println("写入报表logo图片"); //$NON-NLS-1$
			
			//项目名称
			HSSFRow row1 = sheet.getRow(1);
			HSSFCell projectCell = row1.createCell(1);
			projectCell.setCellValue(new HSSFRichTextString((String)parameters.get("project_name"))); //$NON-NLS-1$
			projectCell.setCellStyle(cellStyle);
			System.out.println("写入项目名称"); //$NON-NLS-1$
			
			String sysDate = new DateUtil().getSysDate();
			HSSFCell dateCell = row1.createCell(12);
			dateCell.setCellValue(new HSSFRichTextString(sysDate));
			dateCell.setCellStyle(cellStyle);
			System.out.println("写入制表日期"); //$NON-NLS-1$
			
			List<ImPartVO> imparts = new LinkedList<ImPartVO>();
		
			if (((List<ImPartVO>)values.get("imparts")).size() > 0) { //$NON-NLS-1$
				imparts =(List<ImPartVO>)values.get("imparts"); //$NON-NLS-1$
				
				int i=5;
				
				for (ImPartVO imPartVO : imparts) {
					
					List<HashMap<String, Object>> issues = imPartVO.getImpart_Issue();
					
					//存在问题时
					if (issues != null && issues.size() > 0) {
						HSSFRow rowStyle = sheet.getRow(5);
						
						HSSFRow rowi = sheet.createRow(i);
						//总成
						HSSFCell nameCell = rowi.createCell((short)0);
						nameCell.setCellValue(new HSSFRichTextString(imPartVO.getObject_name()));
						nameCell.setCellStyle(cellStyle);
						nameCell.setCellStyle(rowStyle.getCell(0).getCellStyle());
						
						sheet.addMergedRegion(new  Region(i,  (short)0, i+issues.size()-1,  (short)  0));  
						
						for (HashMap<String, Object> issue : issues) {
							
							HSSFRow row = sheet.getRow(i);
							if (row==null) {
								row = sheet.createRow(i);
							}
	
							//缺陷
							HSSFCell issueCell = row.createCell((short)1);
							issueCell.setCellValue(new HSSFRichTextString(issue.get("fv9IssueDesc")+"")); //$NON-NLS-1$ //$NON-NLS-2$
							issueCell.setCellStyle(cellStyle);
							issueCell.setCellStyle(rowStyle.getCell(1).getCellStyle());
							
							
							//每车分值
							HSSFCell scoreCell = row.createCell((short)2);
							scoreCell.setCellValue(new HSSFRichTextString(issue.get("fv9AuditScoreDecreased")+"")); //$NON-NLS-1$ //$NON-NLS-2$
							scoreCell.setCellStyle(cellStyle);
							row.getCell(2).setCellStyle(rowStyle.getCell(2).getCellStyle());
							
							List<String> solutions = (List<String>)issue.get("FV9Solution"); //$NON-NLS-1$
						
							String solutionContent=""; //$NON-NLS-1$
							
							for (String solution : solutions) {
								solutionContent += solution + "\r\n"; //$NON-NLS-1$
							}
							//改进内容
							HSSFCell solutionCell = row.createCell((short)3);
							solutionCell.setCellValue(new HSSFRichTextString(solutionContent));
							solutionCell.setCellStyle(cellStyle);
							row.getCell(3).setCellStyle(rowStyle.getCell(3).getCellStyle());
							
							i++;
							
							System.out.println("写入问题\"" + issue.get("itemRevision") + "\"");
						}
					} 
				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new FawvmLoaderException(e.getMessage());
		}	

	}

}
