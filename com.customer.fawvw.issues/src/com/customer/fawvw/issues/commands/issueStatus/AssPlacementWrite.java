package com.customer.fawvw.issues.commands.issueStatus;

import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.customer.fawvw.issues.utils.ImageCellInfo;
import com.customer.fawvw.issues.utils.ImageUtil;

public class AssPlacementWrite {

	/**
	 * excelƒ£∞Â÷–¥Ê∑≈Õº∆¨£¨÷ª ‰»ÎæﬂÃÂ ˝÷µ
	 */
	static void importDataPage1(HSSFWorkbook workbook,
			HSSFSheet sheetPage, HashMap<String, Object> values) {
		
		if (values.get("assPlacement") != null) { 
			HashMap<String, Object> AssIssues = (HashMap<String, Object>)values.get("assPlacement"); 
			
			HSSFRow row5 = sheetPage.getRow(5);
			HSSFRow row7 = sheetPage.getRow(7);
			HSSFRow row8 = sheetPage.getRow(8);
			HSSFRow row9 = sheetPage.getRow(9);
			HSSFRow row12 = sheetPage.getRow(12);
			HSSFRow row13 = sheetPage.getRow(13);
			HSSFRow row14 = sheetPage.getRow(14);
			HSSFRow row27 = sheetPage.getRow(27);
			HSSFRow row28 = sheetPage.getRow(28);
			HSSFRow row29 = sheetPage.getRow(29);
			
			int sum = ((Map<String, Integer>) AssIssues.get("front")).get("red") +   
			((Map<String, Integer>) AssIssues.get("front")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("front")).get("green") +   
			((Map<String, Integer>) AssIssues.get("chassis")).get("red") +   
			((Map<String, Integer>) AssIssues.get("chassis")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("chassis")).get("green") +   
			((Map<String, Integer>) AssIssues.get("electronik")).get("red") +   
			((Map<String, Integer>) AssIssues.get("electronik")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("electronik")).get("green") +   
			((Map<String, Integer>) AssIssues.get("driver")).get("red") +   
			((Map<String, Integer>) AssIssues.get("driver")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("driver")).get("green") +   
			((Map<String, Integer>) AssIssues.get("door")).get("red") +   
			((Map<String, Integer>) AssIssues.get("door")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("door")).get("green") +   
			((Map<String, Integer>) AssIssues.get("inner")).get("red") +   
			((Map<String, Integer>) AssIssues.get("inner")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("inner")).get("green") +   
			((Map<String, Integer>) AssIssues.get("behind")).get("red") +   
			((Map<String, Integer>) AssIssues.get("behind")).get("yellow") +  
			((Map<String, Integer>) AssIssues.get("behind")).get("green");  
	
			//–¥»ÎŒ Ã‚◊‹ ˝Gesamt
			HSSFCell cell_5_2 = row5.getCell(2);
			if (cell_5_2 == null) {
				cell_5_2 = row5.createCell(2);
			}
			cell_5_2.setCellValue(sum);
	
			//«∞∂À
			HSSFCell cell_27_3 = row27.getCell(3);
			cell_27_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("red"));  
			
			HSSFCell cell_28_3 = row28.getCell(3);
			cell_28_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("yellow"));  
			
			HSSFCell cell_29_3 = row29.getCell(3);
			cell_29_3.setCellValue(((Map<String, Integer>) AssIssues
					.get("front")).get("green"));  
			
			//µ◊≈Ã
			HSSFCell cell_27_6 = row27.getCell(6);
			cell_27_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("red"));  
			
			HSSFCell cell_28_6 = row28.getCell(6);
			cell_28_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("yellow"));  
			
			HSSFCell cell_29_6 = row29.getCell(6);
			cell_29_6.setCellValue(((Map<String, Integer>) AssIssues
					.get("chassis")).get("green"));  
			
			//µÁ∆˜
			HSSFCell cell_27_9 = row27.getCell(9);
			cell_27_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("red"));  
			
			HSSFCell cell_28_9 = row28.getCell(9);
			cell_28_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("yellow"));  
			
			HSSFCell cell_29_9 = row29.getCell(9);
			cell_29_9.setCellValue(((Map<String, Integer>) AssIssues
					.get("electronik")).get("green"));  
			
			//º› ªƒ£øÈ
			HSSFCell cell_12_2 = row12.getCell(2);
			cell_12_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("red"));  
			
			HSSFCell cell_13_2 = row13.getCell(2);
			cell_13_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("yellow"));  

			HSSFCell cell_14_2 = row14.getCell(2);
			cell_14_2.setCellValue(((Map<String, Integer>) AssIssues
					.get("driver")).get("green"));  
			
			//≥µ√≈
			HSSFCell row_7_4 = row7.getCell(4);
			row_7_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("red"));  
			
			HSSFCell cell_8_4 = row8.getCell(4);
			cell_8_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("yellow"));  
			
			HSSFCell row_9_4 = row9.getCell(4);
			row_9_4.setCellValue(((Map<String, Integer>) AssIssues
					.get("door")).get("green"));  
			
			//ƒ⁄ Œ
			HSSFCell cell_7_7 = row7.getCell(7);
			cell_7_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("red"));  
			
			HSSFCell cell_8_7 = row8.getCell(7);
			cell_8_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("yellow"));  
			
			HSSFCell cell_9_7 = row9.getCell(7);
			cell_9_7.setCellValue(((Map<String, Integer>) AssIssues
					.get("inner")).get("green"));  
			
			//∫Û≤ø
			HSSFCell cell_7_10 = row7.getCell(10);
			cell_7_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("red"));  
			
			HSSFCell cell_8_10 = row8.getCell(10);
			cell_8_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("yellow"));  
			
			HSSFCell cell_9_10 = row9.getCell(10);
			cell_9_10.setCellValue(((Map<String, Integer>) AssIssues
					.get("behind")).get("green"));  
			
		
		}
	}
	
	/**
	 * excelƒ£∞Â÷–≤ª¥Ê‘⁄Õº∆¨£¨À˘”–Õº∆¨æ˘”…≥Ã–Ú–¥»Î
	 */
	static void importDataPage2(HSSFWorkbook workbook,
			HSSFSheet sheetPage, HashMap<String, Object> values) {
		
		if (values.get("assPlacement") != null) { 
			HSSFPatriarch patri = sheetPage.createDrawingPatriarch();
			
			HashMap<String, Object> AssIssues = (HashMap<String, Object>)values.get("assPlacement"); 
			
			int sum = ((Map<String, Integer>) AssIssues.get("front")).get("red") +   
			((Map<String, Integer>) AssIssues.get("front")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("front")).get("green") +   
			((Map<String, Integer>) AssIssues.get("chassis")).get("red") +   
			((Map<String, Integer>) AssIssues.get("chassis")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("chassis")).get("green") +   
			((Map<String, Integer>) AssIssues.get("electronik")).get("red") +   
			((Map<String, Integer>) AssIssues.get("electronik")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("electronik")).get("green") +   
			((Map<String, Integer>) AssIssues.get("driver")).get("red") +   
			((Map<String, Integer>) AssIssues.get("driver")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("driver")).get("green") +   
			((Map<String, Integer>) AssIssues.get("door")).get("red") +   
			((Map<String, Integer>) AssIssues.get("door")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("door")).get("green") +   
			((Map<String, Integer>) AssIssues.get("inner")).get("red") +   
			((Map<String, Integer>) AssIssues.get("inner")).get("yellow") +   
			((Map<String, Integer>) AssIssues.get("inner")).get("green") +   
			((Map<String, Integer>) AssIssues.get("behind")).get("red") +   
			((Map<String, Integer>) AssIssues.get("behind")).get("yellow") +  
			((Map<String, Integer>) AssIssues.get("behind")).get("green");  
	
			//–¥»ÎŒ Ã‚◊‹ ˝Gesamt
			HSSFRow row0 = sheetPage.getRow(0);
			HSSFCell gesamtCell = row0.createCell(5);
			gesamtCell.setCellValue(sum);
			
			try {
				ImageCellInfo carTopCell = new ImageCellInfo(10, 9, 13, 29);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, carTopCell, ImageUtil.getCarTop());
				System.out.println("–¥»ÎÕº∆¨£∫top.jpg"); 
				
				ImageCellInfo carBottomCell = new ImageCellInfo(14, 4, 22, 29);
				ImageUtil.GenerateImage(workbook, sheetPage, patri, carBottomCell, ImageUtil.getCarBottom());
				System.out.println("–¥»ÎÕº∆¨£∫bottom.jpg"); 
				
				HSSFRow row3 = sheetPage.getRow(3);
				HSSFRow row5 = sheetPage.getRow(5);
				HSSFRow row7 = sheetPage.getRow(7);
				HSSFRow row8 = sheetPage.getRow(8);
				HSSFRow row10 = sheetPage.getRow(10);
				HSSFRow row12 = sheetPage.getRow(12);
				HSSFRow row26 = sheetPage.getRow(26);
				HSSFRow row28 = sheetPage.getRow(28);
				HSSFRow row30 = sheetPage.getRow(30);
				
				if (((Map<String, Integer>) AssIssues.get("driver")).get("red") > 0) {
					ImageCellInfo driverRedCell = new ImageCellInfo(8, 7, 8, 7);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, driverRedCell, ImageUtil.getRed());
					System.out.println("–¥»Îº› ªƒ£øÈ∫Ïµ∆Õº∆¨£∫redSmall.jpg"); 
					
					HSSFCell cell_8_8 = row8.createCell(8);
					cell_8_8.setCellValue(((Map<String, Integer>) AssIssues.get("driver")).get("red"));
				} else {
					ImageCellInfo driverRedCell = new ImageCellInfo(8, 7, 8, 7);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, driverRedCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("driver")).get("yellow") > 0) {
					ImageCellInfo driverYellowCell = new ImageCellInfo(10, 7, 10, 7);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, driverYellowCell, ImageUtil.getYellow());
					System.out.println("–¥»Îº› ªƒ£øÈª∆µ∆Õº∆¨£∫yellowSmall.jpg"); 
					
					HSSFCell cell_10_8 = row10.createCell(8);
					cell_10_8.setCellValue(((Map<String, Integer>) AssIssues.get("driver")).get("yellow"));
				} else {
					ImageCellInfo driverYellowCell = new ImageCellInfo(10, 7, 10, 7);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, driverYellowCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("driver")).get("green") > 0) {
					ImageCellInfo driverGreenCell = new ImageCellInfo(12, 7, 12, 7);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, driverGreenCell, ImageUtil.getGreen());
					System.out.println("–¥»Îº› ªƒ£øÈ¬Ãµ∆Õº∆¨£∫greenSmall.jpg"); 
					
					HSSFCell cell_12_8 = row12.createCell(8);
					cell_12_8.setCellValue(((Map<String, Integer>) AssIssues.get("driver")).get("green"));
				} else {
					ImageCellInfo driverGreenCell = new ImageCellInfo(12, 7, 12, 7);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, driverGreenCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("door")).get("red") > 0) {
					ImageCellInfo doorRedCell = new ImageCellInfo(3, 15, 3, 15);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, doorRedCell, ImageUtil.getRed());
					System.out.println("–¥»Î≥µ√≈∫Ïµ∆Õº∆¨£∫redSmall.jpg"); 
					
					HSSFCell cell_3_16 = row3.createCell(16);
					cell_3_16.setCellValue(((Map<String, Integer>) AssIssues.get("door")).get("red"));
				} else {
					ImageCellInfo doorRedCell = new ImageCellInfo(3, 15, 3, 15);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, doorRedCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("door")).get("yellow") > 0) {
					ImageCellInfo doorYellowCell = new ImageCellInfo(5, 15, 5, 15);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, doorYellowCell, ImageUtil.getYellow());
					System.out.println("–¥»Î≥µ√≈∫Ïµ∆Õº∆¨£∫yellowSmall.jpg"); 
					
					HSSFCell cell_5_16 = row5.createCell(16);
					cell_5_16.setCellValue(((Map<String, Integer>) AssIssues.get("door")).get("yellow"));
				} else {
					ImageCellInfo doorYellowCell = new ImageCellInfo(5, 15, 5, 15);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, doorYellowCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("door")).get("green") > 0) {
					ImageCellInfo doorGreenCell = new ImageCellInfo(7, 15, 7, 15);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, doorGreenCell, ImageUtil.getGreen());
					System.out.println("–¥»Î≥µ√≈¬Ãµ∆Õº∆¨£∫greenSmall.jpg"); 
					
					HSSFCell cell_7_16 = row7.createCell(16);
					cell_7_16.setCellValue(((Map<String, Integer>) AssIssues.get("door")).get("green"));
				} else {
					ImageCellInfo doorGreenCell = new ImageCellInfo(7, 15, 7, 15);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, doorGreenCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("inner")).get("red") > 0) {
					ImageCellInfo innerRedCell = new ImageCellInfo(3, 21, 3, 21);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, innerRedCell, ImageUtil.getRed());
					System.out.println("–¥»Îƒ⁄ Œ∫Ïµ∆Õº∆¨£∫redSmall.jpg"); 
					
					HSSFCell cell_3_22 = row3.createCell(22);
					cell_3_22.setCellValue(((Map<String, Integer>) AssIssues.get("inner")).get("red"));
				} else {
					ImageCellInfo innerRedCell = new ImageCellInfo(3, 21, 3, 21);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, innerRedCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("inner")).get("yellow") > 0) {
					ImageCellInfo innerYellowCell = new ImageCellInfo(5, 21, 5, 21);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, innerYellowCell, ImageUtil.getYellow());
					System.out.println("–¥»Îƒ⁄ Œª∆µ∆Õº∆¨£∫yellowSmall.jpg"); 
					
					HSSFCell cell_5_22 = row5.createCell(22);
					cell_5_22.setCellValue(((Map<String, Integer>) AssIssues.get("inner")).get("yellow"));
				} else {
					ImageCellInfo innerYellowCell = new ImageCellInfo(5, 21, 5, 21);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, innerYellowCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("inner")).get("green") > 0) {
					ImageCellInfo innerGreenCell = new ImageCellInfo(7, 21, 7, 21);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, innerGreenCell, ImageUtil.getGreen());
					System.out.println("–¥»Îƒ⁄ Œ¬Ãµ∆Õº∆¨£∫greenSmall.jpg"); 
					
					HSSFCell cell_7_22 = row7.createCell(22);
					cell_7_22.setCellValue(((Map<String, Integer>) AssIssues.get("inner")).get("green"));
				} else {
					ImageCellInfo innerGreenCell = new ImageCellInfo(7, 21, 7, 21);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, innerGreenCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("behind")).get("red") > 0) {
					ImageCellInfo heckRedCell = new ImageCellInfo(3, 28, 3, 28);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, heckRedCell, ImageUtil.getRed());
					System.out.println("–¥»Î∫Û∂À∫Ïµ∆Õº∆¨£∫redSmall.jpg"); 
					
					HSSFCell cell_3_29 = row3.createCell(29);
					cell_3_29.setCellValue(((Map<String, Integer>) AssIssues.get("behind")).get("red"));
				} else {
					ImageCellInfo heckRedCell = new ImageCellInfo(3, 28, 3, 28);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, heckRedCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("behind")).get("yellow") > 0) {
					ImageCellInfo heckYellowCell = new ImageCellInfo(5, 28, 5, 28);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, heckYellowCell, ImageUtil.getYellow());
					System.out.println("–¥»Î∫Û∂Àª∆µ∆Õº∆¨£∫yellowSmall.jpg"); 
					
					HSSFCell cell_5_29 = row5.createCell(29);
					cell_5_29.setCellValue(((Map<String, Integer>) AssIssues.get("behind")).get("yellow"));
				} else {
					ImageCellInfo heckYellowCell = new ImageCellInfo(5, 28, 5, 28);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, heckYellowCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("behind")).get("green") > 0) {
					ImageCellInfo heckGreenCell = new ImageCellInfo(7, 28, 7, 28);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, heckGreenCell, ImageUtil.getGreen());
					System.out.println("–¥»Î∫Û∂À¬Ãµ∆Õº∆¨£∫greenSmall.jpg"); 
					
					HSSFCell cell_7_29 = row7.createCell(29);
					cell_7_29.setCellValue(((Map<String, Integer>) AssIssues.get("behind")).get("green"));
				}
				
				if (((Map<String, Integer>) AssIssues.get("front")).get("red") > 0) {
					ImageCellInfo vordRedCell = new ImageCellInfo(26, 6, 26, 6);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, vordRedCell, ImageUtil.getRed());
					System.out.println("–¥»Î«∞∂À∫Ïµ∆Õº∆¨£∫redSmall.jpg"); 
					
					HSSFCell cell_26_7 = row26.createCell(7);
					cell_26_7.setCellValue(((Map<String, Integer>) AssIssues.get("front")).get("red"));
				} else {
					ImageCellInfo vordRedCell = new ImageCellInfo(26, 6, 26, 6);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, vordRedCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("front")).get("yellow") > 0) {
					ImageCellInfo vordYellowCell = new ImageCellInfo(28, 6, 28, 6);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, vordYellowCell, ImageUtil.getYellow());
					System.out.println("–¥»Î«∞∂Àª∆µ∆Õº∆¨£∫yellowSmall.jpg"); 
					
					HSSFCell cell_28_7 = row28.createCell(7);
					cell_28_7.setCellValue(((Map<String, Integer>) AssIssues.get("front")).get("yellow"));
				} else {
					ImageCellInfo vordYellowCell = new ImageCellInfo(28, 6, 28, 6);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, vordYellowCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("front")).get("green") > 0) {
					ImageCellInfo vordGreenCell = new ImageCellInfo(30, 6, 30, 6);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, vordGreenCell, ImageUtil.getGreen());
					System.out.println("–¥»Î«∞∂À¬Ãµ∆Õº∆¨£∫greenSmall.jpg"); 
					
					HSSFCell cell_30_7 = row30.createCell(7);
					cell_30_7.setCellValue(((Map<String, Integer>) AssIssues.get("front")).get("green"));
				} else {
					ImageCellInfo vordGreenCell = new ImageCellInfo(30, 6, 30, 6);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, vordGreenCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("chassis")).get("red") > 0) {
					ImageCellInfo chassicRedCell = new ImageCellInfo(26, 17, 26, 17);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, chassicRedCell, ImageUtil.getRed());
					System.out.println("–¥»Îµ◊≈Ã∫Ïµ∆Õº∆¨£∫redSmall.jpg"); 
					
					HSSFCell cell_26_18 = row26.createCell(18);
					cell_26_18.setCellValue(((Map<String, Integer>) AssIssues.get("chassis")).get("red"));
				} else {
					ImageCellInfo chassicRedCell = new ImageCellInfo(26, 17, 26, 17);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, chassicRedCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("chassis")).get("yellow") > 0) {
					ImageCellInfo chassicYellowCell = new ImageCellInfo(28, 17, 28, 17);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, chassicYellowCell, ImageUtil.getYellow());
					System.out.println("–¥»Îµ◊≈Ãª∆µ∆Õº∆¨£∫yellowSmall.jpg"); 
					
					HSSFCell cell_28_18 = row28.createCell(18);
					cell_28_18.setCellValue(((Map<String, Integer>) AssIssues.get("chassis")).get("yellow"));
				} else {
					ImageCellInfo chassicYellowCell = new ImageCellInfo(28, 17, 28, 17);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, chassicYellowCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("chassis")).get("green") > 0) {
					ImageCellInfo chassicGreenCell = new ImageCellInfo(30, 17, 30, 17);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, chassicGreenCell, ImageUtil.getGreen());
					System.out.println("–¥»Îµ◊≈Ã¬Ãµ∆Õº∆¨£∫greenSmall.jpg"); 
					
					HSSFCell cell_30_18 = row30.createCell(18);
					cell_30_18.setCellValue(((Map<String, Integer>) AssIssues.get("chassis")).get("green"));
				} else {
					ImageCellInfo chassicGreenCell = new ImageCellInfo(30, 17, 30, 17);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, chassicGreenCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("electronik")).get("red") > 0) {
					ImageCellInfo eleckRedCell = new ImageCellInfo(26, 26, 26, 26);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, eleckRedCell, ImageUtil.getRed());
					System.out.println("–¥»ÎµÁ∆˜∫Ïµ∆Õº∆¨£∫redSmall.jpg"); 
					
					HSSFCell cell_26_27 = row26.createCell(27);
					cell_26_27.setCellValue(((Map<String, Integer>) AssIssues.get("electronik")).get("red"));
				} else {
					ImageCellInfo eleckRedCell = new ImageCellInfo(26, 26, 26, 26);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, eleckRedCell, ImageUtil.getWhite());
				}
				
				if (((Map<String, Integer>) AssIssues.get("electronik")).get("yellow") > 0) {
					ImageCellInfo eleckYellowCell = new ImageCellInfo(28, 26, 28, 26);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, eleckYellowCell, ImageUtil.getYellow());
					System.out.println("–¥»ÎµÁ∆˜ª∆µ∆Õº∆¨£∫yellowSmall.jpg"); 
					
					HSSFCell cell_28_27 = row28.createCell(27);
					cell_28_27.setCellValue(((Map<String, Integer>) AssIssues.get("electronik")).get("yellow"));
				} else {
					ImageCellInfo eleckYellowCell = new ImageCellInfo(28, 26, 28, 26);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, eleckYellowCell, ImageUtil.getWhite());
				}
				
				
				if (((Map<String, Integer>) AssIssues.get("electronik")).get("green") > 0) {
					ImageCellInfo eleckGreenCell = new ImageCellInfo(30, 26, 30, 26);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, eleckGreenCell, ImageUtil.getGreen());
					System.out.println("–¥»ÎµÁ∆˜¬Ãµ∆Õº∆¨£∫greenSmall.jpg"); 
					
					HSSFCell cell_30_27 = row30.createCell(27);
					cell_30_27.setCellValue(((Map<String, Integer>) AssIssues.get("electronik")).get("green"));
				} else {
					ImageCellInfo eleckGreenCell = new ImageCellInfo(30, 26, 30, 26);
					ImageUtil.GenerateImage(workbook, sheetPage, patri, eleckGreenCell, ImageUtil.getWhite());
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
	}
}

