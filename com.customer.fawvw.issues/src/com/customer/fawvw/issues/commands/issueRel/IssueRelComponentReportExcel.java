package com.customer.fawvw.issues.commands.issueRel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.customer.fawvw.issues.commands.common.loader.AssPlacementLoader;
import com.customer.fawvw.issues.commands.common.loader.DeptLoader;
import com.customer.fawvw.issues.commands.common.write.AssPlacementWrite;
import com.customer.fawvw.issues.commands.common.write.DeptWrite;
import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.ExcelUtil;

public class IssueRelComponentReportExcel {


	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\IssueRelComponetReport_Template.xls";   
	private static String file = "";  
	private static String project_name = ""; 
	private static String now = ""; 
	
	public static void createExcel(ArrayList<HashMap<String, Object>> dataList,
			HashMap<String, Object> parameters)  throws Exception{

		//按装车位置统计
		HashMap<String, Object> assPlacement = AssPlacementLoader.load(dataList);
		//按责任部门统计
		Map<String, Object> departments = DeptLoader.load(dataList);
		
		HashMap<String, Object> values = new HashMap<String, Object>();
		values.put("department", departments);
		values.put("assPlacement", assPlacement);
		
		now = DateUtil.getSysDate();
		project_name = (String)parameters.get("project_name"); 
		file = (String)parameters.get("file"); 
		System.out.println("datalist = " + dataList); 
		System.out.println("file = " + file); 
		
		FileOutputStream fileOut = null;
		try {
			
			if (dataList.size() > 0 && dataList != null) {
				//创建新的Excel
				fileOut = new FileOutputStream(new File(file));
				
				//判断模板是否存在
				System.out.println("模板位置：" + TEMPLATE_FILE_PATH);  
				File excelTmp = new File(TEMPLATE_FILE_PATH);
				InputStream inputStream = new FileInputStream(excelTmp);
				POIFSFileSystem fs = new POIFSFileSystem(inputStream);
				
				System.out.println("获取模板成功");  
				try {
					HSSFWorkbook workbook = new HSSFWorkbook(fs);
					HSSFSheet sheet = workbook.getSheetAt(0);
					HSSFSheet sheet1 = workbook.getSheetAt(1);
					HSSFSheet sheet2 = workbook.getSheetAt(2);
					
					importData(workbook, sheet, dataList);
					DeptWrite.importDataPage(workbook, sheet1, values);//按责任部门统计
					AssPlacementWrite.importData(workbook, sheet2, values);//按装车位置统计
					
					workbook.write(fileOut);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
//			MessageBox.post(Messages.IssueRelComponentReportExcel_temp_is_not_exist, 
//					Messages.IssueRelComponentReportExcel_IssueRelComponentReport, MessageBox.INFORMATION);
			throw new FawvmLoaderException("模板不存在"); 
//			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
		
	}
	
	public static void importData(HSSFWorkbook wb, HSSFSheet sheet,
			ArrayList<HashMap<String, Object>> values) throws Exception{
		
		if (values != null) {
			System.out.println(""); 
			
			HSSFRow baserow = sheet.getRow(1);
			if (baserow == null) {
				baserow = sheet.createRow(1);
			}
			
			HSSFCell namecell = baserow.createCell(1);// 项目名称
			namecell.setCellValue(new HSSFRichTextString(project_name));
			baserow.getCell(1).setCellStyle(baserow.getCell(0).getCellStyle());
			System.out.println(""); 
			
			HSSFCell dateCell = baserow.createCell(5);
			dateCell.setCellValue(new HSSFRichTextString(now));//制表日期
			baserow.getCell(5).setCellStyle(baserow.getCell(4).getCellStyle());
			System.out.println(""); 
			
			for (int i = 0; i < values.size(); i++) {
				
				String item_name = (String)((HashMap<String, Object>)values.get(i)).
					get("item_name"); 
				
				HSSFRow datarow = sheet.createRow(i+3);
				
				HSSFCell NoCell = datarow.createCell(0);
				NoCell.setCellValue(i+1);
				
				String structNo = (String)((HashMap<String, Object>)values.get(i)).
					get("issueRelStructNo"); 
				HSSFCell structNoCell = datarow.createCell(1);
				structNoCell.setCellValue(new HSSFRichTextString(structNo));
				
				String itemID = (String)((HashMap<String, Object>)values.get(i)).
					get("item_id"); 
				HSSFCell itemIdCell = datarow.createCell(2);
				itemIdCell.setCellValue(new HSSFRichTextString(itemID));
				
//				HSSFCell item_nameCell = datarow.createCell(2);
//				item_nameCell.setCellValue(new HSSFRichTextString(item_name));
				
				String itemDesc = (String)((HashMap<String, Object>)values.get(i)).
					get("item_desc"); 
				HSSFCell itemDescCell = datarow.createCell(3);
				itemDescCell.setCellValue(new HSSFRichTextString(itemDesc));
				
				String carId = (String)((HashMap<String, Object>)values.get(i)).
					get("issueReqCarNo"); 
				HSSFCell carIdCell = datarow.createCell(4);
				carIdCell.setCellValue(new HSSFRichTextString(carId));
				
				String assPlacement = (String)((HashMap<String, Object>)values.get(i)).
					get("assPlacement"); 
				HSSFCell assPlacementCell = datarow.createCell(5);
				assPlacementCell.setCellValue(new HSSFRichTextString(assPlacement));
				
				String issueCause = (String)((HashMap<String, Object>)values.get(i)).
					get("issueCause"); 
				HSSFCell issueCauseCell = datarow.createCell(6);
				issueCauseCell.setCellValue(new HSSFRichTextString(issueCause));
				
				String fv9Solution = ""; 
				String slResDep = "";
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionTE"))) {
					fv9Solution += "TE:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionTE")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
					slResDep += "TE";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionQAPP"))) {  
					fv9Solution += "\r\n" + "QAPP:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionQAPP")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
					slResDep += "\r\nQAPP";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionSU"))) {  
					fv9Solution += "\r\n" + "SU:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionSU")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nSU";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionPL"))) {  
					fv9Solution += "\r\n" + "PL:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionPL")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nPL";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionVSC"))) {  
					fv9Solution += "\r\n" + "VSC:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionVSC")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nVSC";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionLO"))) {  
					fv9Solution += "\r\n" + "LO:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionLO")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$
					slResDep += "\r\nLO"; //$NON-NLS-5$ 
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP1_ME"))) {  
					fv9Solution += "\r\n" + "CP1-ME:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP1_ME")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP1-ME";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2_ME"))) {  
					fv9Solution += "\r\n" + "CP2-ME:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2_ME")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP2-ME";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionBS"))) {  
					fv9Solution += "\r\n" + "CP1-BS:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionBS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP1-BS";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionPA"))) {  
					fv9Solution += "\r\n" + "CP1-PA:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionPA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP1-PA";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionCA"))) {  
					fv9Solution += "\r\n" + "CP1-CA:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP1-CA";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2BS"))) {  
					fv9Solution += "\r\n" + "CP2-BS:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2BS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP2-BS";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2PA"))) {  
					fv9Solution += "\r\n" + "CP2-PA:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2PA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP2-PA";
				}
				if (!"".equals(((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2CA"))) {  
					fv9Solution += "\r\n" + "CP2-CA:" + ((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCP2CA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
					slResDep += "\r\nCP2-CA";
				}
				
				HSSFCell Solution1Cell = datarow.createCell(7);
				Solution1Cell.setCellValue(new HSSFRichTextString(fv9Solution));
				
				HSSFCell SlResDep1Cell = datarow.createCell(8);
				SlResDep1Cell.setCellValue(new HSSFRichTextString(slResDep));
				
				String fv9RGStatus = (String)((HashMap<String, Object>)values.get(i)).
					get("fv9RGStatus"); 
				HSSFCell RGStatusCell = datarow.createCell(9);
				ExcelUtil.fillTheCellColor(wb, RGStatusCell, fv9RGStatus, ""); 
				
				String SolDeadlineDate = (String)((HashMap<String, Object>)values.get(i)).
					get("SolDeadlineDate"); 
				HSSFCell SolDeadlineDateCell = datarow.createCell(10);
				SolDeadlineDateCell.setCellValue(new HSSFRichTextString(SolDeadlineDate));
				
				String CompletedDate = (String)((HashMap<String, Object>)values.get(i)).
					get("CompletedDate"); 
				HSSFCell CompletedDateCell = datarow.createCell(11);
				CompletedDateCell.setCellValue(new HSSFRichTextString(CompletedDate));
				
				String IssueStatus = (String)((HashMap<String, Object>)values.get(i)).
					get("IssueStatus"); 
				HSSFCell IssueStatusCell = datarow.createCell(12);
				IssueStatusCell.setCellValue(new HSSFRichTextString(IssueStatus));
				
				System.out.println("写入问题数据[ " + item_name + " ]");           
				
			}
			
		}
	}
	

	
	
}
