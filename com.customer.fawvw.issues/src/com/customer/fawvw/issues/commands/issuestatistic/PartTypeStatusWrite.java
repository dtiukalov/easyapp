package com.customer.fawvw.issues.commands.issuestatistic;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class PartTypeStatusWrite {

	/**
	 *写入“按零件类型统计”页
	 */
	static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, Map<String, Object> values) {
		
		if (values.get("partType") != null) { //$NON-NLS-1$

			Map<String, Object> partType = (Map<String, Object>) values.get("partType"); //$NON-NLS-1$
	
			HSSFRow row21 = sheetPage.getRow(21);
		
			HSSFCell cell_21_2 = row21.getCell(2);
			cell_21_2.setCellValue(((Map<String, Integer>) partType
					.get("partStatus")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_3 = row21.getCell(3);
			cell_21_3.setCellValue(((Map<String, Integer>) partType
					.get("bodySize")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_4 = row21.getCell(4);
			cell_21_4.setCellValue(((Map<String, Integer>) partType
					.get("techAndEqu")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_5 = row21.getCell(5);
			cell_21_5.setCellValue(((Map<String, Integer>) partType
					.get("partMatch")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_6 = row21.getCell(6);
			cell_21_6.setCellValue(((Map<String, Integer>) partType
					.get("pdm")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_7 = row21.getCell(7);
			cell_21_7.setCellFormula("SUM(C22:G22)"); //$NON-NLS-1$
	
			HSSFRow row22 = sheetPage.getRow(22);
	
			HSSFCell cell_22_2 = row22.getCell(2);
			cell_22_2.setCellValue(((Map<String, Integer>) partType
					.get("partStatus")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_3 = row22.getCell(3);
			cell_22_3.setCellValue(((Map<String, Integer>) partType
					.get("bodySize")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_4 = row22.getCell(4);
			cell_22_4.setCellValue(((Map<String, Integer>) partType
					.get("techAndEqu")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_5 = row22.getCell(5);
			cell_22_5.setCellValue(((Map<String, Integer>) partType
					.get("partMatch")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_6 = row22.getCell(6);
			cell_22_6.setCellValue(((Map<String, Integer>) partType
					.get("pdm")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_7 = row22.getCell(7);
			cell_22_7.setCellFormula("SUM(C23:G23)"); //$NON-NLS-1$
	
			HSSFRow row23 = sheetPage.getRow(23);
	
			HSSFCell cell_23_2 = row23.getCell(2);
			cell_23_2.setCellValue(((Map<String, Integer>) partType
					.get("partStatus")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_3 = row23.getCell(3);
			cell_23_3.setCellValue(((Map<String, Integer>) partType
					.get("bodySize")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_4 = row23.getCell(4);
			cell_23_4.setCellValue(((Map<String, Integer>) partType
					.get("techAndEqu")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_5 = row23.getCell(5);
			cell_23_5.setCellValue(((Map<String, Integer>) partType
					.get("partMatch")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_6 = row23.getCell(6);
			cell_23_6.setCellValue(((Map<String, Integer>) partType
					.get("pdm")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_7 = row23.getCell(7);
			cell_23_7.setCellFormula("SUM(C24:G24)"); //$NON-NLS-1$
		}
	}
}
