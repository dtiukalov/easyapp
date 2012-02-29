package com.customer.fawvw.issues.commands.issuestatistic;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class TimeWrite {
	/*
	 * 写入“按时间统计”页
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, Map<String, Object> values) {
		
		
		if (values.get("TimeIssues") != null) { //$NON-NLS-1$
			Map<String, Object> TimeIssues =(Map<String, Object>)values.get("TimeIssues"); //$NON-NLS-1$
			
//			Map<String, Integer> weeks = (Map<String, Integer>)TimeIssues.get("weeks");
			List<Integer> submited = (List<Integer>)TimeIssues.get("submited"); //$NON-NLS-1$
			List<Integer> analysed = (List<Integer>)TimeIssues.get("analysed"); //$NON-NLS-1$
			List<Integer> apportioned = (List<Integer>)TimeIssues.get("apportioned"); //$NON-NLS-1$
			List<Integer> excogitation = (List<Integer>)TimeIssues.get("excogitation"); //$NON-NLS-1$
			List<Integer> operation = (List<Integer>)TimeIssues.get("operation"); //$NON-NLS-1$
			List<Integer> validated = (List<Integer>)TimeIssues.get("validated"); //$NON-NLS-1$
			List<Integer> closed = (List<Integer>)TimeIssues.get("closed"); //$NON-NLS-1$
			
		
			List<Map<String, Integer>> weeks = (List<Map<String, Integer>>)TimeIssues.get("weeks");	 //$NON-NLS-1$
			int i= 2;
			int j = 0;
		
			for (Iterator iterator = weeks.iterator(); iterator.hasNext();) {
				Map<String, Integer> map = (Map<String, Integer>) iterator.next();
				
				
				HSSFRow row20 = sheetPage.getRow(20);
				HSSFCell cell20_2 = row20.createCell(i);
				cell20_2.setCellValue("KW"+ map.get("week")); //$NON-NLS-1$ //$NON-NLS-2$
				
			    HSSFRow row21 = sheetPage.getRow(21);
			    HSSFCell cell21_2 = row21.createCell(i);
				cell21_2.setCellValue(submited.get(j));
				
			    HSSFRow row22 = sheetPage.getRow(22);
			    HSSFCell cell22_2 = row22.createCell(i);
				cell22_2.setCellValue(analysed.get(j));
	
			    HSSFRow row23 = sheetPage.getRow(23);
			    HSSFCell cell23_2 = row23.createCell(i);
				cell23_2.setCellValue(apportioned.get(j));
				
			    HSSFRow row24 = sheetPage.getRow(24);
			    HSSFCell cell24_2 = row24.createCell(i);
				cell24_2.setCellValue(excogitation.get(j));
				
			    HSSFRow row25 = sheetPage.getRow(25);
			    HSSFCell cell25_2 = row25.createCell(i);
				cell25_2.setCellValue(operation.get(j));
				
			    HSSFRow row26 = sheetPage.getRow(26);
			    HSSFCell cell26_2 = row26.createCell(i);
				cell26_2.setCellValue(validated.get(j));
				
			    HSSFRow row27 = sheetPage.getRow(27);
			    HSSFCell cell27_2 = row27.createCell(i);
				cell27_2.setCellValue(closed.get(j));
	
			    i++;
			    j++;
			}
		}

	}
}
