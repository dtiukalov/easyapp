package com.customer.fawvw.issues.commands.issuestatistic;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class DepartmentStatusWrite {

	/**
	 *写入“按责任部门统计”页
	 */
	static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, Map<String, Object> values) {
		
		if (values.get("department") != null) { 

			Map<String, Object> departments = (Map<String, Object>) values.get("department"); 
	
			HSSFRow row21 = sheetPage.getRow(21);
			
			HSSFCell cell_21_2 = row21.getCell(2);
			if (cell_21_2 == null) {
				cell_21_2 = row21.createCell(2);
			}
			cell_21_2.setCellValue(((Map<String, Integer>) departments.get("PE")) 
					.get("red")); 
			
			HSSFCell cell_21_3 = row21.getCell(3);
			if (cell_21_3 == null) {
				cell_21_3 = row21.createCell(3);
			}
			cell_21_3.setCellValue(((Map<String, Integer>) departments
					.get("QA")).get("red"));  
			
			HSSFCell cell_21_4 = row21.getCell(4);
			if (cell_21_4 == null) {
				cell_21_4 = row21.createCell(4);
			}
			cell_21_4.setCellValue(((Map<String, Integer>) departments.get("LO")) 
							.get("red")); 
			
			HSSFCell cell_21_5 = row21.getCell(5);
			if (cell_21_5 == null) {
				cell_21_5 = row21.createCell(5);
			}
			cell_21_5.setCellValue(((Map<String, Integer>) departments
					.get("ME")).get("red"));  
			
			HSSFCell cell_21_6 = row21.getCell(6);
			if (cell_21_6 == null) {
				cell_21_6 = row21.createCell(6);
			}
			cell_21_6.setCellValue(((Map<String, Integer>) departments.get("PL")) 
					.get("red")); 
			
			HSSFCell cell_21_7 = row21.getCell(7);
			if (cell_21_7 == null) {
				cell_21_7 = row21.createCell(7);
			}
			cell_21_7.setCellValue(((Map<String, Integer>) departments.get("SU")) 
					.get("red")); 
			
			HSSFCell cell_21_8 = row21.getCell(8);
			if (cell_21_8 == null) {
				cell_21_8 = row21.createCell(8);
			}
			cell_21_8.setCellValue(((Map<String, Integer>) departments.get("VSC")) 
					.get("red")); 
			
			HSSFCell cell_21_9 = row21.getCell(9);
			if (cell_21_9 == null) {
				cell_21_9 = row21.createCell(9);
			}
			cell_21_9.setCellValue(((Map<String, Integer>) departments.get("PM")) 
					.get("red")); 
			
			HSSFCell cell_21_10 = row21.getCell(10);
			if (cell_21_10 == null) {
				cell_21_10 = row21.createCell(10);
			}
			cell_21_10.setCellFormula("SUM(C22:J22)"); 
	
			HSSFRow row22 = sheetPage.getRow(22);
	
			HSSFCell cell_22_2 = row22.getCell(2);
			if (cell_22_2 == null) {
				cell_22_2 = row22.createCell(2);
			}
			cell_22_2.setCellValue(((Map<String, Integer>) departments.get("PE")) 
					.get("yellow")); 
			
			HSSFCell cell_22_3 = row22.getCell(3);
			if (cell_22_3 == null) {
				cell_22_3 = row22.createCell(3);
			}
			cell_22_3.setCellValue(((Map<String, Integer>) departments
					.get("QA")).get("yellow"));  
			
			HSSFCell cell_22_4 = row22.getCell(4);
			if (cell_22_4 == null) {
				cell_22_4 = row22.createCell(4);
			}
			cell_22_4.setCellValue(((Map<String, Integer>) departments.get("LO")) 
					.get("yellow")); 
			
			HSSFCell cell_22_5 = row22.getCell(5);
			if (cell_22_5 == null) {
				cell_22_5 = row22.createCell(5);
			}
			cell_22_5.setCellValue(((Map<String, Integer>) departments.get("ME")) 
					.get("yellow"));  
			
			HSSFCell cell_22_6 = row22.getCell(6);
			if (cell_22_6 == null) {
				cell_22_6 = row22.createCell(6);
			}
			cell_22_6.setCellValue(((Map<String, Integer>) departments.get("PL")) 
					.get("yellow")); 
			
			HSSFCell cell_22_7 = row22.getCell(7);
			if (cell_22_7 == null) {
				cell_22_7 = row22.createCell(7);
			}
			cell_22_7.setCellValue(((Map<String, Integer>) departments.get("SU")) 
					.get("yellow")); 
			
			HSSFCell cell_22_8 = row22.getCell(8);
			if (cell_22_8 == null) {
				cell_22_8 = row22.createCell(8);
			}
			cell_22_8.setCellValue(((Map<String, Integer>) departments.get("VSC")) 
					.get("yellow")); 
			
			HSSFCell cell_22_9 = row22.getCell(9);
			if (cell_22_9 == null) {
				cell_22_9 = row22.createCell(9);
			}
			cell_22_9.setCellValue(((Map<String, Integer>) departments.get("PM")) 
					.get("yellow")); 
			
			HSSFCell cell_22_10 = row22.getCell(10);
			if (cell_22_10 == null) {
				cell_22_10 = row22.createCell(10);
			}
			cell_22_10.setCellFormula("SUM(C23:J23)"); 
			
	
			HSSFRow row23 = sheetPage.getRow(23);
	
			HSSFCell cell_23_2 = row23.getCell(2);
			if (cell_23_2 == null) {
				cell_23_2 = row23.createCell(2);
			}
			cell_23_2.setCellValue(((Map<String, Integer>) departments.get("PE")) 
					.get("green")); 
			
			HSSFCell cell_23_3 = row23.getCell(3);
			if (cell_23_3 == null) {
				cell_23_3 = row23.createCell(3);
			}
			cell_23_3.setCellValue(((Map<String, Integer>) departments
					.get("QA")).get("green"));  
			
			HSSFCell cell_23_4 = row23.getCell(4);
			if (cell_23_4 == null) {
				cell_23_4 = row23.createCell(4);
			}
			cell_23_4.setCellValue(((Map<String, Integer>) departments.get("LO")) 
							.get("green")); 
			
			HSSFCell cell_23_5 = row23.getCell(5);
			if (cell_23_5 == null) {
				cell_23_5 = row23.createCell(5);
			}
			cell_23_5.setCellValue(((Map<String, Integer>) departments
					.get("ME")).get("green"));  
			
			HSSFCell cell_23_6 = row23.getCell(6);
			if (cell_23_6 == null) {
				cell_23_6 = row23.createCell(6);
			}
			cell_23_6.setCellValue(((Map<String, Integer>) departments.get("PL")) 
					.get("green")); 
			
			HSSFCell cell_23_7 = row23.getCell(7);
			if (cell_23_7 == null) {
				cell_23_7 = row23.createCell(7);
			}
			cell_23_7.setCellValue(((Map<String, Integer>) departments.get("SU")) 
					.get("green")); 
			
			HSSFCell cell_23_8 = row23.getCell(8);
			if (cell_23_8 == null) {
				cell_23_8 = row23.createCell(8);
			}
			cell_23_8.setCellValue(((Map<String, Integer>) departments.get("VSC")) 
					.get("green")); 
			
			HSSFCell cell_23_9 = row23.getCell(9);
			if (cell_23_9 == null) {
				cell_23_9 = row23.createCell(9);
			}
			cell_23_9.setCellValue(((Map<String, Integer>) departments.get("PM")) 
					.get("green")); 
			
			HSSFCell cell_23_10 = row23.getCell(10);
			if (cell_23_10 == null) {
				cell_23_10 = row23.createCell(10);
			}
			cell_23_10.setCellFormula("SUM(C24:J24)"); 
		}
	}
}
