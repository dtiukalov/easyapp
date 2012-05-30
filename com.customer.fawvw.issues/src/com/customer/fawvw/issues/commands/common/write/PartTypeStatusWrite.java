package com.customer.fawvw.issues.commands.common.write;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class PartTypeStatusWrite {

	/**
	 *写入“按零件类型统计”页
	 */
	public static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, Map<String, Object> values) {
		
		if (values.get("partType") != null) { 

			Map<String, Object> partType = (Map<String, Object>) values.get("partType"); 
	
			HSSFRow row21 = sheetPage.getRow(21);

			HSSFCell cell_21_2 = row21.createCell(2);
			cell_21_2.setCellValue(((Map<String, Integer>) partType
					.get("partStatus")).get("red"));  
			
			HSSFCell cell_21_3 = row21.createCell(3);
			cell_21_3.setCellValue(((Map<String, Integer>) partType
					.get("bodySize")).get("red"));  
			
			HSSFCell cell_21_4 = row21.createCell(4);
			cell_21_4.setCellValue(((Map<String, Integer>) partType
					.get("partMatch")).get("red"));  
			
			HSSFCell cell_21_5 = row21.createCell(5);
			cell_21_5.setCellValue(((Map<String, Integer>) partType
					.get("pdm")).get("red"));  
			
			HSSFCell cell_21_6 = row21.createCell(6);
			cell_21_6.setCellValue(((Map<String, Integer>) partType
					.get("detail")).get("red"));  
			
			HSSFCell cell_21_7 = row21.createCell(7);
			cell_21_7.setCellValue(((Map<String, Integer>) partType
					.get("quality")).get("red"));  
			
			HSSFCell cell_21_8 = row21.createCell(8);
			cell_21_8.setCellValue(((Map<String, Integer>) partType
					.get("structure")).get("red")); 
			
			HSSFCell cell_21_9 = row21.createCell(9);
			cell_21_9.setCellValue(((Map<String, Integer>) partType
					.get("device")).get("red")); 
			
			HSSFCell cell_21_10 = row21.createCell(10);
			cell_21_10.setCellValue(((Map<String, Integer>) partType
					.get("change")).get("red")); 
			
			HSSFCell cell_21_11 = row21.createCell(11);
			cell_21_11.setCellValue(((Map<String, Integer>) partType
					.get("other")).get("red")); 
			
			HSSFCell cell_21_12 = row21.createCell(12);
			cell_21_12.setCellFormula("SUM(C22:L22)"); 
	
			HSSFRow row22 = sheetPage.getRow(22);
	
			HSSFCell cell_22_2 = row22.createCell(2);

			cell_22_2.setCellValue(((Map<String, Integer>) partType
					.get("partStatus")).get("yellow"));  
			
			HSSFCell cell_22_3 = row22.createCell(3);
			cell_22_3.setCellValue(((Map<String, Integer>) partType
					.get("bodySize")).get("yellow"));  
			
			HSSFCell cell_22_4 = row22.createCell(4);
			cell_22_4.setCellValue(((Map<String, Integer>) partType
					.get("partMatch")).get("yellow"));  
			
			HSSFCell cell_22_5 = row22.createCell(5);
			cell_22_5.setCellValue(((Map<String, Integer>) partType
					.get("pdm")).get("yellow"));  
			
			HSSFCell cell_22_6 = row22.createCell(6);
			cell_22_6.setCellValue(((Map<String, Integer>) partType
					.get("detail")).get("yellow"));  
			
			HSSFCell cell_22_7 = row22.createCell(7);
			cell_22_7.setCellValue(((Map<String, Integer>) partType
					.get("quality")).get("yellow"));  
			
			HSSFCell cell_22_8 = row22.createCell(8);
			cell_22_8.setCellValue(((Map<String, Integer>) partType
					.get("structure")).get("yellow")); 
			
			HSSFCell cell_22_9 = row22.createCell(9);
			cell_22_9.setCellValue(((Map<String, Integer>) partType
					.get("device")).get("yellow")); 
			
			HSSFCell cell_22_10 = row22.createCell(10);
			cell_22_10.setCellValue(((Map<String, Integer>) partType
					.get("change")).get("yellow")); 
			
			HSSFCell cell_22_11 = row22.createCell(11);
			cell_22_11.setCellValue(((Map<String, Integer>) partType
					.get("other")).get("yellow")); 
			
			HSSFCell cell_22_12 = row22.createCell(12);
			cell_22_12.setCellFormula("SUM(C23:L23)"); 
	
			HSSFRow row23 = sheetPage.getRow(23);
	
			HSSFCell cell_23_2 = row23.createCell(2);
			cell_23_2.setCellValue(((Map<String, Integer>) partType
					.get("partStatus")).get("green"));  
			
			HSSFCell cell_23_3 = row23.createCell(3);
			cell_23_3.setCellValue(((Map<String, Integer>) partType
					.get("bodySize")).get("green"));  
			
			HSSFCell cell_23_4 = row23.createCell(4);
			cell_23_4.setCellValue(((Map<String, Integer>) partType
					.get("partMatch")).get("green"));  
			
			HSSFCell cell_23_5 = row23.createCell(5);
			cell_23_5.setCellValue(((Map<String, Integer>) partType
					.get("pdm")).get("green"));  
			
			HSSFCell cell_23_6 = row23.createCell(6);
			cell_23_6.setCellValue(((Map<String, Integer>) partType
					.get("detail")).get("green"));  
			
			HSSFCell cell_23_7 = row23.createCell(7);
			cell_23_7.setCellValue(((Map<String, Integer>) partType
					.get("quality")).get("green"));  
			
			HSSFCell cell_23_8 = row23.createCell(8);
			cell_23_8.setCellValue(((Map<String, Integer>) partType
					.get("structure")).get("green"));  
			
			HSSFCell cell_23_9 = row23.createCell(9);
			cell_23_9.setCellValue(((Map<String, Integer>) partType
					.get("device")).get("green")); 
			
			HSSFCell cell_23_10 = row23.createCell(10);
			cell_23_10.setCellValue(((Map<String, Integer>) partType
					.get("change")).get("green")); 
			
			HSSFCell cell_23_11 = row23.createCell(11);
			cell_23_11.setCellValue(((Map<String, Integer>) partType
					.get("other")).get("green")); 
			
			HSSFCell cell_23_12 = row23.createCell(12);
			cell_23_12.setCellFormula("SUM(C24:L24)"); 
			
		}
	}
}
