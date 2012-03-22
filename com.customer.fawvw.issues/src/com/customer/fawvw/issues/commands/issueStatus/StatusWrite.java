package com.customer.fawvw.issues.commands.issueStatus;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.customer.fawvw.issues.utils.DateUtil;

public class StatusWrite {

	static void importDataPage(HSSFWorkbook workbook,
			HSSFSheet sheetPage, HashMap<String, Object> values, 
			ArrayList<IssueStatus> statusList) {
		
		int red_sum = 0; 
		int yellow_sum = 0; 
		int green_sum = 0; 
		
		red_sum = (Integer)((HashMap<String, Object>)values.get("status")).get("red");
		yellow_sum = (Integer)((HashMap<String, Object>)values.get("status")).get("yellow");
		green_sum = (Integer)((HashMap<String, Object>)values.get("status")).get("green");
		
		int n = statusList.size();
		
		HSSFRow row2 = sheetPage.getRow(2);//项目ID
		HSSFRow row3 = sheetPage.getRow(3);//周数
		HSSFRow row4 = sheetPage.getRow(4);//红
		HSSFRow row5 = sheetPage.getRow(5);//黄
		HSSFRow row6 = sheetPage.getRow(6);//绿
		HSSFRow row7 = sheetPage.getRow(7);//汇总
		HSSFRow row10 = sheetPage.getRow(10);//问题总数
		HSSFRow row15 = sheetPage.getRow(15);//红灯总数
		HSSFRow row20 = sheetPage.getRow(20);//黄灯总数
		HSSFRow row25 = sheetPage.getRow(25);//绿灯总数
		
		HSSFCell cell_2_2 = row2.getCell(2);
		cell_2_2.setCellValue((String)values.get("project_name")); 
		
		if (statusList != null && statusList.size() > 0) {
			int col = 2;
			
			for (IssueStatus issue : statusList) {
				
				row3.createCell(col).setCellValue(issue.kw); 
				row4.createCell(col).setCellValue(issue.red);
				row5.createCell(col).setCellValue(issue.yellow);
				row6.createCell(col).setCellValue(issue.green);
				row7.createCell(col).setCellValue(issue.sum); 
				col++;
			}
		}
		
		//写入本周红绿灯的总数，显示在图表右侧
		
		HSSFFont font = workbook.createFont();
		font.setBoldweight((short) 1);
		
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setWrapText(true);   
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cellStyle.setFont(font);
		
		HSSFCell cell_15_10 = row15.createCell(15);
		cell_15_10.setCellStyle(cellStyle);
		cell_15_10.setCellValue(red_sum);
		cell_15_10.setCellStyle(cellStyle);
		
		HSSFCell cell_20_10 = row20.createCell(15);
		cell_20_10.setCellValue(yellow_sum);
		cell_20_10.setCellStyle(cellStyle);
		
		HSSFCell cell_25_10 = row25.createCell(15);
		cell_25_10.setCellValue(green_sum);
		cell_25_10.setCellStyle(cellStyle);

		
		
	}
	
}
