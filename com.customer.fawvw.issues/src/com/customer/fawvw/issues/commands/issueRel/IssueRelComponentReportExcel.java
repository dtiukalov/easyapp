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

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.ExcelUtil;

public class IssueRelComponentReportExcel {


	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\IssueRelComponetReport_Template.xls";  //$NON-NLS-1$ //$NON-NLS-2$
	private static String file = ""; //$NON-NLS-1$ 
	private static String project_name = ""; //$NON-NLS-1$
	private static String now = ""; //$NON-NLS-1$
	
	public static void createExcel(ArrayList<HashMap<String, Object>> dataList,
			HashMap<String, Object> parameters)  throws Exception{
		

		//按装车位置统计
		HashMap<String, Object> assPlacement = IssueRelComponentReportAssPlacementLoader.load(dataList);
		//按责任部门统计
		HashMap<String, Object> departments = IssueRelComponentReportResDepartLoader.load(dataList);
		
		now = DateUtil.getSysDate();
		project_name = (String)parameters.get("project_name"); //$NON-NLS-1$
		file = (String)parameters.get("file"); //$NON-NLS-1$
		System.out.println("datalist = " + dataList); //$NON-NLS-1$
		System.out.println("file = " + file); //$NON-NLS-1$
		
		FileOutputStream fileOut = null;
		try {
			
			if (dataList.size() > 0 && dataList != null) {
				//创建新的Excel
				fileOut = new FileOutputStream(new File(file));
				
				//判断模板是否存在
				System.out.println("模板位置：" + TEMPLATE_FILE_PATH);  //$NON-NLS-1$
				File excelTmp = new File(TEMPLATE_FILE_PATH);
				InputStream inputStream = new FileInputStream(excelTmp);
				POIFSFileSystem fs = new POIFSFileSystem(inputStream);
				
				System.out.println("获取模板成功");  //$NON-NLS-1$
				try {
					HSSFWorkbook workbook = new HSSFWorkbook(fs);
					HSSFSheet sheet = workbook.getSheetAt(0);
					HSSFSheet sheet1 = workbook.getSheetAt(1);
					HSSFSheet sheet2 = workbook.getSheetAt(2);
					
					importData(workbook, sheet, dataList);
					importData1(workbook, sheet1, departments);//按责任部门统计
					importData2(workbook, sheet2, assPlacement);//按装车位置统计
					
					
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
			throw new FawvmLoaderException("模板不存在"); //$NON-NLS-1$
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
			System.out.println(""); //$NON-NLS-1$
			
			HSSFRow baserow = sheet.getRow(1);
			if (baserow == null) {
				baserow = sheet.createRow(1);
			}
			
			HSSFCell namecell = baserow.createCell(1);// 项目名称
			namecell.setCellValue(new HSSFRichTextString(project_name));
			baserow.getCell(1).setCellStyle(baserow.getCell(0).getCellStyle());
			System.out.println(""); //$NON-NLS-1$
			
			HSSFCell dateCell = baserow.createCell(5);
			dateCell.setCellValue(new HSSFRichTextString(now));//制表日期
			baserow.getCell(5).setCellStyle(baserow.getCell(4).getCellStyle());
			System.out.println(""); //$NON-NLS-1$
			
			for (int i = 0; i < values.size(); i++) {
				HSSFRow datarow = sheet.createRow(i+3);
				
				HSSFCell NoCell = datarow.createCell(0);
				NoCell.setCellValue(i+1);
				
				String structNo = (String)((HashMap<String, Object>)values.get(i)).
					get("issueRelStructNo"); //$NON-NLS-1$
				HSSFCell structNoCell = datarow.createCell(1);
				structNoCell.setCellValue(new HSSFRichTextString(structNo));
				
				String item_name = (String)((HashMap<String, Object>)values.get(i)).
					get("item_name"); //$NON-NLS-1$
				HSSFCell item_nameCell = datarow.createCell(2);
				item_nameCell.setCellValue(new HSSFRichTextString(item_name));
				
				String itemID = (String)((HashMap<String, Object>)values.get(i)).
					get("item_id"); //$NON-NLS-1$
				HSSFCell itemIdCell = datarow.createCell(3);
				itemIdCell.setCellValue(new HSSFRichTextString(itemID));
				
				String itemDesc = (String)((HashMap<String, Object>)values.get(i)).
					get("item_desc"); //$NON-NLS-1$
				HSSFCell itemDescCell = datarow.createCell(4);
				itemDescCell.setCellValue(new HSSFRichTextString(itemDesc));
				
				String carId = (String)((HashMap<String, Object>)values.get(i)).
					get("issueReqCarNo"); //$NON-NLS-1$
				HSSFCell carIdCell = datarow.createCell(5);
				carIdCell.setCellValue(new HSSFRichTextString(carId));
				
				String assPlacement = (String)((HashMap<String, Object>)values.get(i)).
					get("assPlacement"); //$NON-NLS-1$
				HSSFCell assPlacementCell = datarow.createCell(6);
				assPlacementCell.setCellValue(new HSSFRichTextString(assPlacement));
				
				String issueCause = (String)((HashMap<String, Object>)values.get(i)).
					get("issueCause"); //$NON-NLS-1$
				HSSFCell issueCauseCell = datarow.createCell(7);
				issueCauseCell.setCellValue(new HSSFRichTextString(issueCause));
				
				String Solution1 = (String)((HashMap<String, Object>)values.get(i)).
					get("Solution1"); //$NON-NLS-1$
				HSSFCell Solution1Cell = datarow.createCell(8);
				Solution1Cell.setCellValue(new HSSFRichTextString(Solution1));
				
				String SlResDep1 = (String)((HashMap<String, Object>)values.get(i)).
					get("SlResDep1"); //$NON-NLS-1$
				HSSFCell SlResDep1Cell = datarow.createCell(9);
				SlResDep1Cell.setCellValue(new HSSFRichTextString(SlResDep1));
				
				String Solution2 = (String)((HashMap<String, Object>)values.get(i)).
					get("Solution2"); //$NON-NLS-1$
				HSSFCell Solution2Cell = datarow.createCell(10);
				Solution2Cell.setCellValue(new HSSFRichTextString(Solution2));
				
				String SlResDep2 = (String)((HashMap<String, Object>)values.get(i)).
					get("SlResDep2"); //$NON-NLS-1$
				HSSFCell SlResDep2Cell = datarow.createCell(11);
				SlResDep2Cell.setCellValue(new HSSFRichTextString(SlResDep2));
				
				String RGStatus = (String)((HashMap<String, Object>)values.get(i)).
					get("RGStatus"); //$NON-NLS-1$
				HSSFCell RGStatusCell = datarow.createCell(12);
				ExcelUtil.fillTheCellColor(wb, RGStatusCell, RGStatus, ""); //$NON-NLS-1$
				
				String SolDeadlineDate = (String)((HashMap<String, Object>)values.get(i)).
					get("SolDeadlineDate"); //$NON-NLS-1$
				HSSFCell SolDeadlineDateCell = datarow.createCell(13);
				SolDeadlineDateCell.setCellValue(new HSSFRichTextString(SolDeadlineDate));
				
				String CompletedDate = (String)((HashMap<String, Object>)values.get(i)).
					get("CompletedDate"); //$NON-NLS-1$
				HSSFCell CompletedDateCell = datarow.createCell(14);
				CompletedDateCell.setCellValue(new HSSFRichTextString(CompletedDate));
				
				String IssueStatus = (String)((HashMap<String, Object>)values.get(i)).
					get("IssueStatus"); //$NON-NLS-1$
				HSSFCell IssueStatusCell = datarow.createCell(15);
				IssueStatusCell.setCellValue(new HSSFRichTextString(IssueStatus));
				
				System.out.println("写入问题数据[ " + item_name + " ]");  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$ //$NON-NLS-1$
				
			}
			
		}
	}
	

	public static void importData1(HSSFWorkbook wb, HSSFSheet sheet,
			HashMap<String, Object> departments) throws Exception{
		System.out.println("按部门统计：" //$NON-NLS-1$
				+ "\r\n" + "PM:" + departments.get("PM")   //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ "\r\n" + "SU:" + departments.get("SU")  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ "\r\n" + "PE:" + departments.get("PE") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ "\r\n" + "ME:" + departments.get("ME") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ "\r\n" + "PL:" + departments.get("PL") //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ "\r\n" + "QA:" + departments.get("QA")  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ "\r\n" + "VSC:" + departments.get("VSC")  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ "\r\n" + "LO" + departments.get("LO"));  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		
		
		if (departments != null) { //$NON-NLS-1$

			HSSFRow red_depart = sheet.getRow(25);
			HSSFCell red_pe = red_depart.getCell(3);
			red_pe.setCellValue(((Map<String, Integer>) departments.get("PE")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
						
			HSSFCell red_qa = red_depart.getCell(4);
			red_qa.setCellValue(((Map<String, Integer>) departments.get("QA")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_lo = red_depart.getCell(5);
			red_lo.setCellValue(((Map<String, Integer>) departments.get("LO")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_me = red_depart.getCell(6);
			red_me.setCellValue(((Map<String, Integer>) departments.get("ME")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_pl = red_depart.getCell(7);
			red_pl.setCellValue(((Map<String, Integer>) departments.get("PL")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_su = red_depart.getCell(8);
			red_su.setCellValue(((Map<String, Integer>) departments.get("SU")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_vsc = red_depart.getCell(9);
			red_vsc.setCellValue(((Map<String, Integer>) departments.get("VSC")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_pm = red_depart.getCell(10);
			red_pm.setCellValue(((Map<String, Integer>) departments.get("PM")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_total = red_depart.getCell(11);
			red_total.setCellFormula("SUM(D26:K26)"); //$NON-NLS-1$
	
			
			HSSFRow yellow_depart = sheet.getRow(26);
			HSSFCell yellow_pe = yellow_depart.getCell(3);
			yellow_pe.setCellValue(((Map<String, Integer>) departments.get("PE")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_qa = yellow_depart.getCell(4);
			yellow_qa.setCellValue(((Map<String, Integer>) departments.get("QA")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_lo = yellow_depart.getCell(5);
			yellow_lo.setCellValue(((Map<String, Integer>) departments.get("LO")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_me = yellow_depart.getCell(6);
			yellow_me.setCellValue(((Map<String, Integer>) departments.get("ME")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_pl = yellow_depart.getCell(7);
			yellow_pl.setCellValue(((Map<String, Integer>) departments.get("PL")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_su = yellow_depart.getCell(8);
			yellow_su.setCellValue(((Map<String, Integer>) departments.get("SU")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_vsc = yellow_depart.getCell(9);
			yellow_vsc.setCellValue(((Map<String, Integer>) departments.get("VSC")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_pm = yellow_depart.getCell(10);
			yellow_pm.setCellValue(((Map<String, Integer>) departments.get("PM")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_total = yellow_depart.getCell(11);
			yellow_total.setCellFormula("SUM(D27:K27)"); //$NON-NLS-1$
			
			HSSFRow green_depart = sheet.getRow(27);
			HSSFCell green_pe = green_depart.getCell(3);
			green_pe.setCellValue(((Map<String, Integer>) departments.get("PE")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_qa = green_depart.getCell(4);
			green_qa.setCellValue(((Map<String, Integer>) departments.get("QA")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_lo = green_depart.getCell(5);
			green_lo.setCellValue(((Map<String, Integer>) departments.get("LO")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_me = green_depart.getCell(6);
			green_me.setCellValue(((Map<String, Integer>) departments.get("ME")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_pl = green_depart.getCell(7);
			green_pl.setCellValue(((Map<String, Integer>) departments.get("PL")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_su = green_depart.getCell(8);
			green_su.setCellValue(((Map<String, Integer>) departments.get("SU")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_vsc = green_depart.getCell(9);
			green_vsc.setCellValue(((Map<String, Integer>) departments.get("VSC")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_pm = green_depart.getCell(10);
			green_pm.setCellValue(((Map<String, Integer>) departments.get("PM")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_total = green_depart.getCell(11);
			green_total.setCellFormula("SUM(D28:K28)"); //$NON-NLS-1$
			
			System.out.println("写入按部门统计页"); //$NON-NLS-1$
			
		}
	}
	
	public static void importData2(HSSFWorkbook wb, HSSFSheet sheet,
			HashMap<String, Object> values) throws Exception{
		
		if (values != null) {
			System.out.println("按装车位置统计" //$NON-NLS-1$
					+ "\r\n" + "前端" + values.get("front")   //$NON-NLS-1$ //$NON-NLS-2$  //$NON-NLS-3$ //$NON-NLS-2$
					+ "\r\n" + "后部" + values.get("behind")  //$NON-NLS-"1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-1$ //$NON-NLS-3$ //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-2$
					+ "\r\n" + "车门" + values.get("door")  //$NON-NLS-1$ //$NON-NLS-2$  //$NON-NLS-3$ //$NON-NLS-2$
					+ "\r\n" + "内饰" + values.get("inner")  //$NON-NLS-1$ //$NON-NLS-2$  //$NON-NLS-3$ //$NON-NLS-2$
					+ "\r\n" + "底盘" + values.get("chassis")  //$NON-NLS-1$ //$NON-NLS-2$  //$NON-NLS-3$ //$NON-NLS-2$
					+ "\r\n" + "驱动模块" + values.get("driver")  //$NON-NLS-1$ //$NON-NLS-2$  //$NON-NLS-3$ //$NON-NLS-2$
					+ "\r\n" + "电器" + values.get("electronik"));  //$NON-NLS-1$ //$NON-NLS-2$  //$NON-NLS-3$ //$NON-NLS-2$

			
			HSSFRow red_row = sheet.getRow(25);
			HSSFCell red_front = red_row.getCell(3);
			red_front.setCellValue(((Map<String, Integer>) values.get("front")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_back = red_row.getCell(4);
			red_back.setCellValue(((Map<String, Integer>) values.get("behind")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_door = red_row.getCell(5);
			red_door.setCellValue(((Map<String, Integer>) values.get("door")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_inner = red_row.getCell(6);
			red_inner.setCellValue(((Map<String, Integer>) values.get("inner")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_chassis = red_row.getCell(7);
			red_chassis.setCellValue(((Map<String, Integer>) values.get("chassis")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_driver = red_row.getCell(8);
			red_driver.setCellValue(((Map<String, Integer>) values.get("driver")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_electronik = red_row.getCell(9);
			red_electronik.setCellValue(((Map<String, Integer>) values.get("electronik")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell red_total = red_row.getCell(10);
			red_total.setCellFormula("SUM(D26:J26)");  //$NON-NLS-1$
			
			HSSFRow yellow_row = sheet.getRow(26);
			HSSFCell yellow_front = yellow_row.getCell(3);
			yellow_front.setCellValue(((Map<String, Integer>) values.get("front")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_back = yellow_row.getCell(4);
			yellow_back.setCellValue(((Map<String, Integer>) values.get("behind")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_door = yellow_row.getCell(5);
			yellow_door.setCellValue(((Map<String, Integer>) values.get("door")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_inner = yellow_row.getCell(6);
			yellow_inner.setCellValue(((Map<String, Integer>) values.get("inner")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_chassis = yellow_row.getCell(7);
			yellow_chassis.setCellValue(((Map<String, Integer>) values.get("chassis")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_driver = yellow_row.getCell(8);
			yellow_driver.setCellValue(((Map<String, Integer>) values.get("driver")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_electronik = yellow_row.getCell(9);
			yellow_electronik.setCellValue(((Map<String, Integer>) values.get("electronik")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell yellow_total = yellow_row.getCell(10);
			yellow_total.setCellFormula("SUM(D27:J27)");  //$NON-NLS-1$
			
			HSSFRow green_row = sheet.getRow(27);
			HSSFCell green_front = green_row.getCell(3);
			green_front.setCellValue(((Map<String, Integer>) values.get("front")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_back = green_row.getCell(4);
			green_back.setCellValue(((Map<String, Integer>) values.get("behind")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_door = green_row.getCell(5);
			green_door.setCellValue(((Map<String, Integer>) values.get("door")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_inner = green_row.getCell(6);
			green_inner.setCellValue(((Map<String, Integer>) values.get("inner")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_chassis = green_row.getCell(7);
			green_chassis.setCellValue(((Map<String, Integer>) values.get("chassis")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_driver = green_row.getCell(8);
			green_driver.setCellValue(((Map<String, Integer>) values.get("driver")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_electronik = green_row.getCell(9);
			green_electronik.setCellValue(((Map<String, Integer>) values.get("electronik")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell green_total = green_row.getCell(10);
			green_total.setCellFormula("SUM(D28:J28)");  //$NON-NLS-1$
			
			System.out.println("写入按装车位置统计页"); //$NON-NLS-1$
			
		}
	}
}
