package com.customer.fawvw.issues.commands.common.write;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class AssPlacement1Write {

	/*
	 * 写入"按装车位置统计"页
	 */
	public static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, Map<String, Object> values) {
		if (values.get("assPlacement") != null) { //$NON-NLS-1$
			Map<String, Object> AssIssues = (Map<String, Object>)values.get("assPlacement"); //$NON-NLS-1$

			HSSFRow row21 = sheetPage.getRow(21);

			HSSFCell cell_21_2 = row21.getCell(2);
			cell_21_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_3 = row21.getCell(3);
			cell_21_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_4 = row21.getCell(4);
			cell_21_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_5 = row21.getCell(5);
			cell_21_5.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_6 = row21.getCell(6);
			cell_21_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_7 = row21.getCell(7);
			cell_21_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_8 = row21.getCell(8);
			cell_21_8.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("red"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_21_9 = row21.getCell(9);
			cell_21_9.setCellFormula("SUM(C22:I22)");  //$NON-NLS-1$
			
			HSSFRow row22 = sheetPage.getRow(22);
			
			HSSFCell cell_22_2 = row22.getCell(2);
			cell_22_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_3 = row22.getCell(3);
			cell_22_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_4 = row22.getCell(4);
			cell_22_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_5 = row22.getCell(5);
			cell_22_5.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_6 = row22.getCell(6);
			cell_22_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_7 = row22.getCell(7);
			cell_22_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_8 = row22.getCell(8);
			cell_22_8.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("yellow"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_22_9 = row22.getCell(9);
			cell_22_9.setCellFormula("SUM(C23:I23)");  //$NON-NLS-1$
	
			HSSFRow row23 = sheetPage.getRow(23);
			
			HSSFCell cell_23_2 = row23.getCell(2);
			cell_23_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_3 = row23.getCell(3);
			cell_23_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_4 = row23.getCell(4);
			cell_23_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_5 = row23.getCell(5);
			cell_23_5.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_6 = row23.getCell(6);
			cell_23_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_7 = row23.getCell(7);
			cell_23_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_8 = row23.getCell(8);
			cell_23_8.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("green"));  //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_23_9 = row23.getCell(9);
			cell_23_9.setCellFormula("SUM(C24:I24)");  //$NON-NLS-1$
		}
	}
}
