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


	public static final String TEMPLATE_FILE_PATH = System.getenv("TPR") + "\\plugins\\Template\\IssueRelComponetReport_Template.xls";   
	private static String file = "";  
	private static String project_name = ""; 
	private static String now = ""; 
	
	public static void createExcel(ArrayList<HashMap<String, Object>> dataList,
			HashMap<String, Object> parameters)  throws Exception{
		

		//按装车位置统计
		HashMap<String, Object> assPlacement = IssueRelComponentReportAssPlacementLoader.load(dataList);
		//按责任部门统计
		HashMap<String, Object> departments = IssueRelComponentReportResDepartLoader.load(dataList);
		
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
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionBS"))) {  
					fv9Solution += "BS:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionBS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCA"))) {  
					fv9Solution += "\r\n" + "CA:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionCA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionLO"))) {  
					fv9Solution += "\r\n" + "LO:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionLO")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionPA"))) {  
					fv9Solution += "\r\n" + "PA:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionPA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionPL"))) {  
					fv9Solution += "\r\n" + "PL:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionPL")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionQAPP"))) {  
					fv9Solution += "\r\n" + "QAPP:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionQAPP")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionSU"))) {  
					fv9Solution += "\r\n" + "SU:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionSU")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionVSC"))) {  
					fv9Solution += "\r\n" + "VSC:" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SolutionVSC")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				HSSFCell Solution1Cell = datarow.createCell(7);
				Solution1Cell.setCellValue(new HSSFRichTextString(fv9Solution));
				
				String slResDep = "";
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepBS"))) {  
					slResDep += ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepBS")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepCA"))) {  
					slResDep += "\r\n" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepCA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepLO"))) {  
					slResDep += "\r\n" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepLO")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepPA"))) {  
					slResDep += "\r\n" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepPA")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepPL"))) {  
					slResDep += "\r\n" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepPL")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepQAPP"))) {  
					slResDep += "\r\n" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepQAPP")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepSU"))) {  
					slResDep += "\r\n" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepSU")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				if (!"".equals((String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepVSC"))) {  
					slResDep += "\r\n" + ((String)(String)((HashMap<String, Object>)values.get(i)).get("fv9SlResDepVSC")).replaceAll("\n", ";");   //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$ 
				}
				HSSFCell SlResDep1Cell = datarow.createCell(8);
				SlResDep1Cell.setCellValue(new HSSFRichTextString(slResDep));
				
				String RGStatus = (String)((HashMap<String, Object>)values.get(i)).
					get("RGStatus"); 
				HSSFCell RGStatusCell = datarow.createCell(9);
				ExcelUtil.fillTheCellColor(wb, RGStatusCell, RGStatus, ""); 
				
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
	

	public static void importData1(HSSFWorkbook wb, HSSFSheet sheet,
			HashMap<String, Object> department) throws Exception{
		System.out.println("按责任部门统计" 
				+ "\r\n" + "BS:" + department.get("BS")  
				+ "\r\n" + "CA:" + department.get("CA") 
				+ "\r\n" + "LO:" + department.get("LO") 
				+ "\r\n" + "PA:" + department.get("PA") 
				+ "\r\n" + "PL:" + department.get("PL") 
				+ "\r\n" + "QAPP:" + department.get("QAPP") 
				+ "\r\n" + "SU:" + department.get("SU") 
				+ "\r\n" + "VSC" + department.get("VSC")); 
		
		if (department != null) { 

			HSSFRow red_depart = sheet.getRow(25);
			HSSFCell red_pe = red_depart.getCell(3);
			red_pe.setCellValue(((Map<String, Integer>) department.get("PL")).get("red"));   
						
			HSSFCell red_qa = red_depart.getCell(4);
			red_qa.setCellValue(((Map<String, Integer>) department.get("QAPP")).get("red"));  
			
			HSSFCell red_lo = red_depart.getCell(5);
			red_lo.setCellValue(((Map<String, Integer>) department.get("LO")).get("red"));   
			
			HSSFCell red_me = red_depart.getCell(6);
			red_me.setCellValue(((Map<String, Integer>) department.get("BS")).get("red"));   
			
			HSSFCell red_pl = red_depart.getCell(7);
			red_pl.setCellValue(((Map<String, Integer>) department.get("PA")).get("red"));  
			
			HSSFCell red_su = red_depart.getCell(8);
			red_su.setCellValue(((Map<String, Integer>) department.get("SU")).get("red"));  
			
			HSSFCell red_vsc = red_depart.getCell(9);
			red_vsc.setCellValue(((Map<String, Integer>) department.get("VSC")).get("red"));   
			
			HSSFCell red_pm = red_depart.getCell(10);
			red_pm.setCellValue(((Map<String, Integer>) department.get("CA")).get("red"));   
			
			HSSFCell red_total = red_depart.getCell(11);
			red_total.setCellFormula("SUM(D26:K26)"); 
	
			
			HSSFRow yellow_depart = sheet.getRow(26);
			HSSFCell yellow_pe = yellow_depart.getCell(3);
			yellow_pe.setCellValue(((Map<String, Integer>) department.get("PL")).get("yellow"));   
			
			HSSFCell yellow_qa = yellow_depart.getCell(4);
			yellow_qa.setCellValue(((Map<String, Integer>) department.get("QAPP")).get("yellow"));  
			
			HSSFCell yellow_lo = yellow_depart.getCell(5);
			yellow_lo.setCellValue(((Map<String, Integer>) department.get("LO")).get("yellow"));   
			
			HSSFCell yellow_me = yellow_depart.getCell(6);
			yellow_me.setCellValue(((Map<String, Integer>) department.get("BS")).get("yellow"));   
			
			HSSFCell yellow_pl = yellow_depart.getCell(7);
			yellow_pl.setCellValue(((Map<String, Integer>) department.get("PA")).get("yellow"));  
			
			HSSFCell yellow_su = yellow_depart.getCell(8);
			yellow_su.setCellValue(((Map<String, Integer>) department.get("SU")).get("yellow"));  
			
			HSSFCell yellow_vsc = yellow_depart.getCell(9);
			yellow_vsc.setCellValue(((Map<String, Integer>) department.get("VSC")).get("yellow"));   
			
			HSSFCell yellow_pm = yellow_depart.getCell(10);
			yellow_pm.setCellValue(((Map<String, Integer>) department.get("CA")).get("yellow"));   
			
			HSSFCell yellow_total = yellow_depart.getCell(11);
			yellow_total.setCellFormula("SUM(D27:K27)"); 
			
			HSSFRow green_depart = sheet.getRow(27);
			HSSFCell green_pe = green_depart.getCell(3);
			green_pe.setCellValue(((Map<String, Integer>) department.get("PL")).get("green"));   
			
			HSSFCell green_qa = green_depart.getCell(4);
			green_qa.setCellValue(((Map<String, Integer>) department.get("QAPP")).get("green"));  
			
			HSSFCell green_lo = green_depart.getCell(5);
			green_lo.setCellValue(((Map<String, Integer>) department.get("LO")).get("green"));   
			
			HSSFCell green_me = green_depart.getCell(6);
			green_me.setCellValue(((Map<String, Integer>) department.get("BS")).get("green"));   
			
			HSSFCell green_pl = green_depart.getCell(7);
			green_pl.setCellValue(((Map<String, Integer>) department.get("PA")).get("green"));  
			
			HSSFCell green_su = green_depart.getCell(8);
			green_su.setCellValue(((Map<String, Integer>) department.get("SU")).get("green"));  
			
			HSSFCell green_vsc = green_depart.getCell(9);
			green_vsc.setCellValue(((Map<String, Integer>) department.get("VSC")).get("green"));   
			
			HSSFCell green_pm = green_depart.getCell(10);
			green_pm.setCellValue(((Map<String, Integer>) department.get("CA")).get("green"));   
			
			HSSFCell green_total = green_depart.getCell(11);
			green_total.setCellFormula("SUM(D28:K28)"); 
			
			System.out.println("写入按部门统计页"); 
			
		}
	}
	
	public static void importData2(HSSFWorkbook wb, HSSFSheet sheet,
			HashMap<String, Object> values) throws Exception{
		
		if (values != null) {
			System.out.println("按装车位置统计" 
					+ "\r\n" + "前端" + values.get("front")      //$NON-NLS-3$ 
					+ "\r\n" + "后部" + values.get("behind")  //$NON-NLS-"1$  //$NON-NLS-3$  //$NON-NLS-3$     
					+ "\r\n" + "车门" + values.get("door")     //$NON-NLS-3$ 
					+ "\r\n" + "内饰" + values.get("inner")     //$NON-NLS-3$ 
					+ "\r\n" + "底盘" + values.get("chassis")     //$NON-NLS-3$ 
					+ "\r\n" + "驱动模块" + values.get("driver")     //$NON-NLS-3$ 
					+ "\r\n" + "电器" + values.get("electronik"));     //$NON-NLS-3$ 

			
			HSSFRow red_row = sheet.getRow(25);
			HSSFCell red_front = red_row.getCell(3);
			red_front.setCellValue(((Map<String, Integer>) values.get("front")).get("red"));  
			
			HSSFCell red_back = red_row.getCell(4);
			red_back.setCellValue(((Map<String, Integer>) values.get("behind")).get("red"));  
			
			HSSFCell red_door = red_row.getCell(5);
			red_door.setCellValue(((Map<String, Integer>) values.get("door")).get("red"));  
			
			HSSFCell red_inner = red_row.getCell(6);
			red_inner.setCellValue(((Map<String, Integer>) values.get("inner")).get("red"));  
			
			HSSFCell red_chassis = red_row.getCell(7);
			red_chassis.setCellValue(((Map<String, Integer>) values.get("chassis")).get("red"));  
			
			HSSFCell red_driver = red_row.getCell(8);
			red_driver.setCellValue(((Map<String, Integer>) values.get("driver")).get("red"));  
			
			HSSFCell red_electronik = red_row.getCell(9);
			red_electronik.setCellValue(((Map<String, Integer>) values.get("electronik")).get("red"));  
			
			HSSFCell red_total = red_row.getCell(10);
			red_total.setCellFormula("SUM(D26:J26)");  
			
			HSSFRow yellow_row = sheet.getRow(26);
			HSSFCell yellow_front = yellow_row.getCell(3);
			yellow_front.setCellValue(((Map<String, Integer>) values.get("front")).get("yellow"));  
			
			HSSFCell yellow_back = yellow_row.getCell(4);
			yellow_back.setCellValue(((Map<String, Integer>) values.get("behind")).get("yellow"));  
			
			HSSFCell yellow_door = yellow_row.getCell(5);
			yellow_door.setCellValue(((Map<String, Integer>) values.get("door")).get("yellow"));  
			
			HSSFCell yellow_inner = yellow_row.getCell(6);
			yellow_inner.setCellValue(((Map<String, Integer>) values.get("inner")).get("yellow"));  
			
			HSSFCell yellow_chassis = yellow_row.getCell(7);
			yellow_chassis.setCellValue(((Map<String, Integer>) values.get("chassis")).get("yellow"));  
			
			HSSFCell yellow_driver = yellow_row.getCell(8);
			yellow_driver.setCellValue(((Map<String, Integer>) values.get("driver")).get("yellow"));  
			
			HSSFCell yellow_electronik = yellow_row.getCell(9);
			yellow_electronik.setCellValue(((Map<String, Integer>) values.get("electronik")).get("yellow"));  
			
			HSSFCell yellow_total = yellow_row.getCell(10);
			yellow_total.setCellFormula("SUM(D27:J27)");  
			
			HSSFRow green_row = sheet.getRow(27);
			HSSFCell green_front = green_row.getCell(3);
			green_front.setCellValue(((Map<String, Integer>) values.get("front")).get("green"));  
			
			HSSFCell green_back = green_row.getCell(4);
			green_back.setCellValue(((Map<String, Integer>) values.get("behind")).get("green"));  
			
			HSSFCell green_door = green_row.getCell(5);
			green_door.setCellValue(((Map<String, Integer>) values.get("door")).get("green"));  
			
			HSSFCell green_inner = green_row.getCell(6);
			green_inner.setCellValue(((Map<String, Integer>) values.get("inner")).get("green"));  
			
			HSSFCell green_chassis = green_row.getCell(7);
			green_chassis.setCellValue(((Map<String, Integer>) values.get("chassis")).get("green"));  
			
			HSSFCell green_driver = green_row.getCell(8);
			green_driver.setCellValue(((Map<String, Integer>) values.get("driver")).get("green"));  
			
			HSSFCell green_electronik = green_row.getCell(9);
			green_electronik.setCellValue(((Map<String, Integer>) values.get("electronik")).get("green"));  //$NON-NLS-2$
			
			HSSFCell green_total = green_row.getCell(10);
			green_total.setCellFormula("SUM(D28:J28)");  
			
			System.out.println("写入按装车位置统计页"); 
			
		}
	}
}
