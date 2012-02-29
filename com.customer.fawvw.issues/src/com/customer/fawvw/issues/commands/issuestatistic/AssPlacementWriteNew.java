package com.customer.fawvw.issues.commands.issuestatistic;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class AssPlacementWriteNew {

	/*
	 * 新的按装车位置统计
	 */
	static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, Map<String, Object> values) {
		if (values.get("assPlacement") != null) { //$NON-NLS-1$
			Map<String, Object> AssIssues = (Map<String, Object>)values.get("assPlacement"); //$NON-NLS-1$
			
			HSSFRow row7 = sheetPage.getRow(7);
			HSSFRow row8 = sheetPage.getRow(8);
			HSSFRow row9 = sheetPage.getRow(9);
			HSSFRow row12 = sheetPage.getRow(12);
			HSSFRow row13 = sheetPage.getRow(13);
			HSSFRow row14 = sheetPage.getRow(14);
			HSSFRow row27 = sheetPage.getRow(27);
			HSSFRow row28 = sheetPage.getRow(28);
			HSSFRow row29 = sheetPage.getRow(29);
			//前端
			HSSFCell cell_27_3 = row27.getCell(3);
			cell_27_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_28_3 = row28.getCell(3);
			cell_28_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_29_3 = row29.getCell(3);
			cell_29_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			//底盘
			HSSFCell cell_27_6 = row27.getCell(6);
			cell_27_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_28_6 = row28.getCell(6);
			cell_28_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_29_6 = row29.getCell(6);
			cell_29_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			//电器
			HSSFCell cell_27_9 = row27.getCell(9);
			cell_27_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_28_9 = row28.getCell(9);
			cell_28_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_29_9 = row29.getCell(9);
			cell_29_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			//驾驶模块
			HSSFCell cell_12_2 = row12.getCell(2);
			cell_12_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_13_2 = row13.getCell(2);
			cell_13_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$

			HSSFCell cell_14_2 = row14.getCell(2);
			cell_14_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			//车门
			HSSFCell row_7_4 = row7.getCell(4);
			row_7_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_8_4 = row8.getCell(4);
			cell_8_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell row_9_4 = row9.getCell(4);
			row_9_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			//内饰
			HSSFCell cell_7_7 = row7.getCell(7);
			cell_7_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_8_7 = row8.getCell(7);
			cell_8_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_9_7 = row9.getCell(7);
			cell_9_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
			//后部
			HSSFCell cell_7_10 = row7.getCell(10);
			cell_7_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("red")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_8_10 = row8.getCell(10);
			cell_8_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("yellow")); //$NON-NLS-1$ //$NON-NLS-2$
			
			HSSFCell cell_9_10 = row9.getCell(10);
			cell_9_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("green")); //$NON-NLS-1$ //$NON-NLS-2$
			
		
		}
	}
	
}
